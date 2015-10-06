class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirm.subject
  #
  def confirm(params)
    @greeting = ""
    @messages = params[:content]
    mail(:to =>params[:email],:subject=>"中資盃報名通知")
  end

end
