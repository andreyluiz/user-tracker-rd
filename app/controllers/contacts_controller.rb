class ContactsController < ApplicationController
  before_action :set_contact_by_key, only: [:showbykey, :update, :addvisit]

  def index
    @contacts = Contact.all
  end

  def showbykey
  end

  def show
    @contact = Contact.find params[:id]
  end

  def create
    @contact = Contact.new contact_params
    respond_to do |format|
      if @contact.save
        format.json { render :show, status: :created, location: @contact }
      else
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contact.update contact_params
        format.json { render :show, status: :ok, location: @contact }
      else
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def addvisit
    @visit = Visit.new visit_params
    @visit.contact = @contact
    respond_to do |format|
      if (@visit.save) 
        format.json { render :showvisit, status: :created }
      else
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_contact_by_key
      @contact = Contact.find_by_key params[:key]
    end

    def contact_params
      params.permit :key, :name, :email, :message
    end

    def visit_params
      params.permit :page
    end
end
