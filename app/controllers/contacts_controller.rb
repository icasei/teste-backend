class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show edit update destroy ]
  after_action :kafka_message, :kafka_log, only: %i[ create update destroy ]

  # GET /contacts or /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1 or /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  def search
    @name = params[:name]
    @contacts = Contact.where("name like ?",  "%#{@name}%").order(name: :desc)
    render :index
  end

  # POST /contacts or /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contact_url(@contact), notice: "Contact was successfully created." }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contact_url(@contact), notice: "Contact was successfully updated." }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_url, notice: "Contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:cpf_cnpj, :name, :birthday, :email, :mobile, :message, :advertising, :active)
    end

    def kafka_message
      message = @contact.destroyed? ? @contact.as_json.merge({destroyed: true}).to_json : @contact.as_json.to_json
      DeliveryBoy.deliver(message, topic: 'contacts_message')
    end

    def kafka_log
      log = {
        id: @contact.id,
        name: @contact.name,
        email: @contact.email,
        sysdate: Time.now
      }
      DeliveryBoy.deliver(log.to_json, topic: 'logs_message')
    end
end
