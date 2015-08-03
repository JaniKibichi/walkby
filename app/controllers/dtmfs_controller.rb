class DtmfsController < ApplicationController
 skip_before_filter  :verify_authenticity_token

 class Response
  attr_accessor :now
 end

  before_action :set_dtmf, only: [:show, :edit, :update, :destroy]

  # GET /dtmfs
  # GET /dtmfs.json
  def index
    @dtmfs = Dtmf.all
  end

  # GET /dtmfs/1
  # GET /dtmfs/1.json
  def show
  end

  # GET /dtmfs/new
  def new
    @dtmf = Dtmf.new
  end

  # GET /dtmfs/1/edit
  def edit
  end

  # POST /dtmfs
  # POST /dtmfs.json
  def create
    #Receive Incoming Calls 
    #First read in a couple of POST variables passed in with the request  
    @dtmf = Dtmf.new(sessionId: params[:sessionId], isActive: params[:isActive], callerNumber: params[:callerNumber])
    @response = Response.new

   if @dtmf.save
      # redirect_to call_path, :notice => "Your call session was saved"
      # Reads the variables sent via POST from our gateway
                sessionId = @dtmf.sessionId
                isActive = @dtmf.isActive
                callerNumber = @dtmf.callerNumber
   end

   #For this example, we will assume that you persist the call state 
   #The state goes from: None => PromptSent => Done
    currentCallState = 'None'
    session[:currentCallState] = currentCallState

   if isActive == 1  
    #The call is active
     if  currentCallState == 'None'  
      # This is the First request we are receiving. Prompt for number
      # Compose the response
      response  = '<?xml version="1.0" encoding="UTF-8"?>'
      response += '<Response>'
      response += '<GetDigits timeout="30" finishOnKey="#" callbackUrl="http://5.175.146.43/dtmf2s">';
      response += '<Say>Thank you for calling. Please press 0 followed by the hash sign to talk to sales, 1 followed by the hash sign to talk to support or 2 followed by the hash sign to hear this message again.</Say>';
      response += '</GetDigits>';
      response += '<Say>Thank you for calling. Good bye!</Say>';
      response += '</Response>';
                        
      @response.now = response

      # Print the response onto the page so that our gateway can read it
      #header('Content-type: text/plain');
      render plain: @response.now
      puts "Content-Type: text/plain"
      puts @response.now

      # DONE!!!
      #Be sure to change the call state
      session[:currentCallState] = 'PromptSent'
     else
      @dtmf = Dtmf.new(durationInSeconds: params[:durationInSeconds], currencyCode: params[:currencyCode], amount: params[:amount])
      @dtmf.save
       respond_to do |format|
         if @dtmf.save
           format.html { redirect_to @dtmf, notice: 'Dtmf was successfully created.' }
           format.json { render :show, status: :created, location: @dtmf }
         else
           format.html { render :new }
           format.json { render json: @dtmf.errors, status: :unprocessable_entity }
         end
       end
     end
   end
  end

  # PATCH/PUT /dtmfs/1
  # PATCH/PUT /dtmfs/1.json
  def update
    respond_to do |format|
      if @dtmf.update(dtmf_params)
        format.html { redirect_to @dtmf, notice: 'Dtmf was successfully updated.' }
        format.json { render :show, status: :ok, location: @dtmf }
      else
        format.html { render :edit }
        format.json { render json: @dtmf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dtmfs/1
  # DELETE /dtmfs/1.json
  def destroy
    @dtmf.destroy
    respond_to do |format|
      format.html { redirect_to dtmfs_url, notice: 'Dtmf was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dtmf
      @dtmf = Dtmf.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dtmf_params
      params.require(:dtmf).permit(:isActive, :sessionId, :direction, :callerNumber, :destinationNumber, :dtmfDigits, :recordingUrl, :durationInSeconds, :currencyCode, :amount)
    end
end
