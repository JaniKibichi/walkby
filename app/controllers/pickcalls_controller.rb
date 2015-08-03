class PickcallsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  class Response
   attr_accessor :now
  end

  before_action :set_pickcall, only: [:show, :edit, :update, :destroy]

  # GET /pickcalls
  # GET /pickcalls.json
  def index
    @pickcalls = Pickcall.all
  end

  # GET /pickcalls/1
  # GET /pickcalls/1.json
  def show
  end

  # GET /pickcalls/new
  def new
    @pickcall = Pickcall.new
  end

  # GET /pickcalls/1/edit
  def edit
  end

  # POST /pickcalls
  # POST /pickcalls.json
  def create
   #Receive Incoming Calls 
   #First read in a couple of POST variables passed in with the request
    @pickcall = Pickcall.new(sessionId: params[:sessionId], isActive: params[:isActive], callerNumber: params[:callerNumber])
    @response = Response.new
        if @pickcall.save
        # redirect_to call_path, :notice => "Your call session was saved"
        # Reads the variables sent via POST from our gateway
                sessionId   = @pickcall.sessionId
                isActive = @pickcall.isActive
                callerNumber = @pickcall.callerNumber
        end
        if isActive == 1
          # Compose response
          text = " Please wait while we connect your call!"

          # Compose the response and make it available to read
                        response  = '<?xml version="1.0" encoding="UTF-8"?>'
                        response += '<Response>'
                        response += '<Say>'+text+'</Say>'
                        response += '<Dial phoneNumbers="+254787235065,+254708415904" ringbackTone="http://5.175.146.43/SautiFinaleMoney.mp3"/>'

                        response += '</Response>'
                        @response.now = response

                # Print the response onto the page so that our gateway can read it
                #header('Content-type: text/plain');
                render plain: @response.now
                puts "Content-Type: text/plain"
                puts @response.now
                # DONE!!!
        else
         @call = Call.new(durationInSeconds: params[:durationInSeconds], currencyCode: params[:currencyCode], amount: params[:amount])
         @call.save
         render "new"
        end
  end
    
  # PATCH/PUT /pickcalls/1
  # PATCH/PUT /pickcalls/1.json
  def update
    respond_to do |format|
      if @pickcall.update(pickcall_params)
        format.html { redirect_to @pickcall, notice: 'Pickcall was successfully updated.' }
        format.json { render :show, status: :ok, location: @pickcall }
      else
        format.html { render :edit }
        format.json { render json: @pickcall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pickcalls/1
  # DELETE /pickcalls/1.json
  def destroy
    @pickcall.destroy
    respond_to do |format|
      format.html { redirect_to pickcalls_url, notice: 'Pickcall was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pickcall
      @pickcall = Pickcall.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pickcall_params
      params.require(:pickcall).permit(:isActive, :sessionId, :direction, :callerNumber, :destinationNumber, :dtmfDigits, :recordingUrl, :durationInSeconds, :currencyCode, :amount, :username, :apikey)
    end
end
