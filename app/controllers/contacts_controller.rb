class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    if @contact.deliver
      flash[:notice] = 'Dziękujemy za wiadomość. Skontaktujemy się jak najszybciej!'
    else
      flash[:error] = 'Nie można wysłać wiadomości.'
    end
    redirect_to root_path
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end
