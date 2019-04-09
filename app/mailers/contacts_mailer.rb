class ContactsMailer < ApplicationMailer
  default from: 'site@technodoctor.heroku.com'

  def guest_message(params)
    @guest_name = params[:name]
    @guest_email  = params[:email]
    @guest_subject = params[:subject]
    @guest_message = params[:message]
    mail(to: 'abuse@headoffice.test' , subject: @guest_subject.to_s )
  end
end
