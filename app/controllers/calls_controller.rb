class CallsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  class Response
   attr_accessor :now
  end

  before_action :set_call, only: [:show, :edit, :update, :destroy]

  # GET /calls
  # GET /calls.json
  def index
    @calls = Call.all
  end

  # GET /calls/1
  # GET /calls/1.json
  def show
  end

  # GET /calls/new
  def new
    @call = Call.new
  end

  # GET /calls/1/edit
  def edit
  end

  # POST /calls
  # POST /calls.json
  def create
    # Include the helper gateway class
    require_relative 'AfricasTalkingGateway.rb'


    # Specify your login credentials
    user = params.require(:call).permit(:username)
    username = user['username']

    api =params.require(:call).permit(:apikey)
    apikey = api['apikey']


    # Specify your Africa's Talking phone number in international format
    caller = "+254711082300"
 
    # Please ensure you include the country code (+254 for Kenya in this case)
    to      = params.require(:call).permit(:destinationNumber)
    tof     = to['destinationNumber']


    # Create a new instance of our awesome gateway class
    gateway  = AfricasTalkingGateway.new(username, apikey)

    # Any gateway errors will be captured by our custom Exception class below,
    # so wrap the call in a try-catch block
    begin
      # Make the call
      reports = gateway.call(caller, tof)
      puts reports
      puts "Calls have been initiated. Time for song and dance!\n";
      # Our API will now contact your callback URL once recipient answers the call! 
      #Receive Ingoing Calls 
      #First read in a couple of POST variables passed in with the request  
      @call = Call.new(amount: params[:amount], callerNumber: params[:callerNumber], destinationNumber: params[:destinationNumber])
      respond_to do |format|
        if @call.save
          format.html { redirect_to @call, notice: 'Call successfully initiated.' }
          format.json { render :show, status: :created, location: @call }
        else
          format.html { render :new }
          format.json { render json: @call.errors, status: :unprocessable_entity }
        end
      end
    rescue AfricasTalkingGatewayException => ex
      puts 'Encountered an error: ' + ex.message
    end

  end

  # PATCH/PUT /calls/1
  # PATCH/PUT /calls/1.json
  def update
    respond_to do |format|
      if @call.update(call_params)
        format.html { redirect_to @call, notice: 'Call was successfully updated.' }
        format.json { render :show, status: :ok, location: @call }
      else
        format.html { render :edit }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calls/1
  # DELETE /calls/1.json
  def destroy
    @call.destroy
    respond_to do |format|
      format.html { redirect_to calls_url, notice: 'Call was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call
      @call = Call.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def call_params
      params.require(:call).permit(:isActive, :sessionId, :direction, :callerNumber, :destinationNumber, :dtmfDigits, :recordingUrl, :durationInSeconds, :currencyCode, :amount)
    end
end
