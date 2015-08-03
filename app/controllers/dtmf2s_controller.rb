class Dtmf2sController < ApplicationController
 skip_before_filter  :verify_authenticity_token

 class Response
  attr_accessor :now
 end


  before_action :set_dtmf2, only: [:show, :edit, :update, :destroy]

  # GET /dtmf2s
  # GET /dtmf2s.json
  def index
    @dtmf2s = Dtmf2.all
  end

  # GET /dtmf2s/1
  # GET /dtmf2s/1.json
  def show
  end

  # GET /dtmf2s/new
  def new
    @dtmf2 = Dtmf2.new
  end

  # GET /dtmf2s/1/edit
  def edit
  end

  # POST /dtmf2s
  # POST /dtmf2s.json

  def create
    #Receive Incoming Calls 
    #First read in a couple of POST variables passed in with the request  
    @dtmf2 = Dtmf2.new(sessionId: params[:sessionId], isActive: params[:isActive], callerNumber: params[:callerNumber], dtmfDigits: params[:dtmfDigits])
    @response = Response.new

   if @dtmf2.save
      # redirect_to call_path, :notice => "Your call session was saved"
      # Reads the variables sent via POST from our gateway
                sessionId = @dtmf2.sessionId
                isActive = @dtmf2.isActive
                callerNumber = @dtmf2.callerNumber
                dtmfDigits = @dtmf2.dtmfDigits
   end

    if isActive  == 1
#     if session[:currentCallState] == 'PromptSent'
      if dtmfDigits == "0" 
          #Talk to Sales
          #Talk to Support
          # Compose the response
          response  = '<?xml version="1.0" encoding="UTF-8"?>'
          response += '<Response>'
          response += '<Say>Please hold while we connect you to Sales.</Say>';
          response += '<Dial sequential="false" phoneNumbers="+254722780824,+254789413044,+254728784303" ringbackTone="http://5.175.146.43/SautiFinaleMoney.mp3"/>'
          response += '</Response>';
                         
          @response.now = response
          # Print the response onto the page so that our gateway can read it
          #header('Content-type: text/plain');
          render plain: @response.now
          puts "Content-Type: text/plain"
          puts @response.now
 
          # DONE!!!
          #Be sure to change the call state
          session[:currentCallState] = 'Done' 
    
      elsif dtmfDigits == "1"  
          #Talk to Support
          # Compose the response
          response  = '<?xml version="1.0" encoding="UTF-8"?>'
          response += '<Response>'
          response += '<Say>Please hold while we connect you to Support.</Say>';
          response += '<Dial phoneNumbers="+254787235065" ringbackTone="http://5.175.146.43/SautiFinaleMoney.mp3"/>'
          response += '<Redirect>http://5.175.146.43/Dtmf</Redirect>'
          response += '</Response>';
                         
          @response.now = response
          # Print the response onto the page so that our gateway can read it
          #header('Content-type: text/plain');
          render plain: @response.now
          puts "Content-Type: text/plain"
          puts @response.now

          # DONE!!!
          #Be sure to change the call state
          session[:currentCallState] = 'Done' 

      elsif dtmfDigits == "2"  
          #Redirect
          # Compose the response
          response  = '<?xml version="1.0" encoding="UTF-8"?>'
          response += '<Response>'
          response += '<Redirect>http://5.175.146.43/Dtmf</Redirect>'
          response += '</Response>';
                        
          @response.now = response
          # Print the response onto the page so that our gateway can read it
          #header('Content-type: text/plain');
          render plain: @response.now
          puts "Content-Type: text/plain"
          puts @response.now

          # DONE!!!
          #Be sure to change the call state
          session[:currentCallState] = 'Done' 
      end
     #end
    else
      @dtmf2= Dtmf2.new(durationInSeconds: params[:durationInSeconds], currencyCode: params[:currencyCode], amount: params[:amount])
      @dtmf2.save
        respond_to do |format|
          if @dtmf2.save
            format.html { redirect_to @dtmf2, notice: 'Dtmf2 was successfully created.' }
            format.json { render :show, status: :created, location: @dtmf2 }
          else
            format.html { render :new }
            format.json { render json: @dtmf2.errors, status: :unprocessable_entity }
          end
        end  
    end
  end

  # PATCH/PUT /dtmf2s/1
  # PATCH/PUT /dtmf2s/1.json
  def update
    respond_to do |format|
      if @dtmf2.update(dtmf2_params)
        format.html { redirect_to @dtmf2, notice: 'Dtmf2 was successfully updated.' }
        format.json { render :show, status: :ok, location: @dtmf2 }
      else
        format.html { render :edit }
        format.json { render json: @dtmf2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dtmf2s/1
  # DELETE /dtmf2s/1.json
  def destroy
    @dtmf2.destroy
    respond_to do |format|
      format.html { redirect_to dtmf2s_url, notice: 'Dtmf2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dtmf2
      @dtmf2 = Dtmf2.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dtmf2_params
      params.require(:dtmf2).permit(:isActive, :sessionId, :direction, :callerNumber, :destinationNumber, :dtmfDigits, :recordingUrl, :durationInSeconds, :currencyCode, :amount)
    end
end
