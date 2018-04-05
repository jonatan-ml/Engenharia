class Ad < ActiveRecord::Base

  # Constatns
  QTT_PER_PAGE = 6

  # RatyRate gem
  ratyrate_rateable 'quality' #avalia a qualidade do anúnvio

  # RatyRate gem
  ratyrate_rateable 'quality'
  
  # Callbacks
  before_save :md_to_html
  
  # Associações
  belongs_to :member
  belongs_to :category, counter_cache: true
  has_many :comments

  # Validates
  validates :title, :description_md, :description_short, :category, presence: true
  validates :picture, :finish_date, presence: true
  validates :price, numericality: { greater_than: 0 } # permite anúncios com preço maior que 0
  
  # Scopes
  scope :descending_order, ->(page = 1) {
    order(created_at: :desc).page(page).per(QTT_PER_PAGE) 
  } #se não tiver nenhum anúncio puxa os 6 últimos com a gem kaminari
  scope :to_the, ->(member) { where(member: member)}
  scope :search, ->(q, page = 1) { 
    where("lower(title) LIKE ?", "%#{q.downcase}%").page(page).per(QTT_PER_PAGE) 
  }
  scope :by_category, ->(id, page) { where(category: id).page(page).per(QTT_PER_PAGE)}

  scope :random, ->(quantity) { limit(quantity).order("RANDOM()") }


  # paperclip
  has_attached_file :picture, styles: { large: "900x400#", medium: "320x150#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/ #validação para verificar se é imagem/pdf
  
  def second
    self[1]
    
  end

  def third
    self[2]
  end

  #gem money rails
  monetize :price_cents

    private

      def md_to_html
      options = {
      filter_html: true,
      link_attributes: {
        rel: "nofollow",
        target: "_blank"
      }
    }

    extensions = {
    space_after_headers: true,
    autolink: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    self.description = markdown.render(self.description_md) #converte a descrição feita no anúncio para HTML
      
    end
    end
