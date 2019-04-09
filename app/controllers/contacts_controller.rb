class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.valid?
      ContactsMailer.guest_message(contact_params).deliver_now
      redirect_to root_path, notice: "Message was send"
    else
      redirect_to contacts_path, method: :post, alert: "Message wasn't send"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end
