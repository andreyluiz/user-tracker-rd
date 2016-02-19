class Admin::ContactsController < ApplicationController
  def index
    @contacts = Api::Contact.all
  end

  def show
    @contact = Api::Contact.find_by_key params[:key]
  end
end
