class ApplicationMailer < ActionMailer::Base
  default from: "noreply@example.com" #quem vai enviar os emails
  layout 'mailer'
end