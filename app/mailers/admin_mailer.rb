class AdminMailer < ApplicationMailer

  def update_email(current_admin, admin) #quem fez a ação e quem recebeu
    @current_admin = current_admin #declara quem é o que
    @admin = admin
    mail(to: @admin.email, subject: "Seus dados foram alterados!")
  end

  def send_message(current_admin, recipient, subject, message) #quem fez a ação e quem recebeu
    @current_admin = current_admin #declara quem é o que
    @recipient = recipient
    @subject = subject
    @message = message
    mail(to: @recipient.email, subject: @subject)
  end
end
