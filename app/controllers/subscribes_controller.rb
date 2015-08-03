class SubscribesController < ApplicationController
skip_before_action :verify_authenticity_token
  before_action :set_subscribe, only: [:show, :edit, :update, :destroy]

  # GET /subscribes
  # GET /subscribes.json
  def index
    @subscribes = Subscribe.all
  end

  # GET /subscribes/1
  # GET /subscribes/1.json
  def show
  end

  # GET /subscribes/new
  def new
    @subscribe = Subscribe.new
  end

  # GET /subscribes/1/edit
  def edit
  end

  # POST /subscribes
  # POST /subscribes.json
  def create
  # Include the helper gateway class
  require_relative 'AfricasTalkingGateway'

  # Specify your login credentials
  user = params.require(:subscribe).permit(:username)
  username = user['username']
  puts username 
  api = params.require(:subscribe).permit(:apikey)
  apikey = api['apikey']
  puts apikey
  #Specify the number that you want to subscribe
  #Please ensure you include the country code (+254 for Kenya in this case)
  no   = params.require(:subscribe).permit(:number)
  phoneNumber = no['number']
	
  #Specify your Africa's Talking short code and keyword
  short = params.require(:subscribe).permit(:shortcode)
  shortcode = short['shortcode']
  key  = params.require(:subscribe).permit(:keyword)
  keyword = key['keyword']

  # Create a new instance of our awesome gateway class
  gateway = AfricasTalkingGateway.new(username, apikey)

  # Any gateway error will be captured by our custom Exception class below,
  # so wrap the call in a try-catch block
  begin
    results = gateway.createSubscription(phoneNumber, shortcode, keyword)
      results.each {|result|
       @subscribe = Subscribe.new(number: params[:phoneNumber], shortcode: params[:shortCode], keyword: params[:keyword], updatetype: params[:updateType])
      }
  
     respond_to do |format|
         if @subscribe.save
           format.html { redirect_to @subscribe, notice: 'Subscribe was successfully created.' }
           format.json { render :show, status: :created, location: @subscribe }
         else
           format.html { render :new }
           format.json { render json: @subscribe.errors, status: :unprocessable_entity }
         end
     end
  rescue AfricasTalkingGatewayException => ex
  puts 'Encountered an error: ' + ex.message
  end
  end

  # PATCH/PUT /subscribes/1
  # PATCH/PUT /subscribes/1.json
  def update
    respond_to do |format|
      if @subscribe.update(subscribe_params)
        format.html { redirect_to @subscribe, notice: 'Subscribe was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscribe }
      else
        format.html { render :edit }
        format.json { render json: @subscribe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscribes/1
  # DELETE /subscribes/1.json
  def destroy
    @subscribe.destroy
    respond_to do |format|
      format.html { redirect_to subscribes_url, notice: 'Subscribe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscribe
      @subscribe = Subscribe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscribe_params
      params.require(:subscribe).permit(:status, :description)
    end
end
