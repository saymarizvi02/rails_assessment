class PhonesController < ApplicationController
  before_action :set_phone, only: [:show, :update, :destroy]

  # GET /phones
  def index
    @phones = Phone.all

    render json: @phones
  end

  # GET /phones/1
  def show
    render json: @phone
  end

  # POST /phones
  def create
    if Phone.exists?
      @phone = Phone.order("created_at").last
      phone_number=(Integer(@phone.phone_number)+ 1).to_s
      @phone = Phone.new()
      @phone.phone_number=phone_number
    else 
      @phone = Phone.new()
      @phone.phone_number='1111111111'
    end    
   
    if @phone.save
      render json: @phone, status: :created, location: @phone
    else
      render json: @phone.errors, status: :unprocessable_entity
    end
  end

  def create_by_user
    if Phone.exists?(phone_number:params[:phone_number])
    else 
    end    
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phone
      @phone = Phone.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
  private
  
  def phone_params
    params.require(:phone).permit(:phone_numer)
  end
end
