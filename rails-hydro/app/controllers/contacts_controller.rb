class ContactsController < ApplicationController
  def index
    @messages = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      @contact.save
      flash[:success] = "Message Sent"
      redirect_to contacts_path
    else
      flash.now[:danger] = "You must provide a name and email!"
      render :new
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:email, :name, :message)
  end
end
