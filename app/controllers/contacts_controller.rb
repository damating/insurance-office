class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    if @contact.deliver
      flash[:notice] = 'Dziękujemy za wiadomość. Skontaktujemy się jak najszybciej!'
      redirect_to root_path
    else
      flash.now[:error] = 'Nie można wysłać wiadomości.'
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end
