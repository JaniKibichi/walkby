class DequeuesController < ApplicationController
 skip_before_filter  :verify_authenticity_token

 class Response
  attr_accessor :now
 end

  before_action :set_dequeue, only: [:show, :edit, :update, :destroy]

  # GET /dequeues
  # GET /dequeues.json
  def index
    @dequeues = Dequeue.all
  end

  # GET /dequeues/1
  # GET /dequeues/1.json
  def show
  end

  # GET /dequeues/new
  def new
    @dequeue = Dequeue.new
  end

  # GET /dequeues/1/edit
  def edit
  end

  # POST /dequeues
  # POST /dequeues.json
  def create
    #Receive Incoming Calls 
    #First read in a couple of POST variables passed in with the request  
    @dequeue= Dequeue.new(sessionId: params[:sessionId], isActive: params[:isActive], callerNumber: params[:callerNumber], destinationNumber: params[:destinationNumber])
    @response = Response.new

   if @dequeue.save
      # redirect_to call_path, :notice => "Your call session was saved"
      # Reads the variables sent via POST from our gateway
                sessionId = @dequeue.sessionId
                isActive = @dequeue.isActive
                callerNumber = @dequeue.callerNumber
                destinationNumber = @dequeue.destinationNumber
   end

   #Check call state 
   
   if isActive == 1
   #Check to see whether this is the enqueue or dequeue Africas Talking phone number    
     if destinationNumber == +254711082450
      #Assuming this is the phone number you have advertised for people that want to
      #join the queue
      response  = '<?xml version="1.0" encoding="UTF-8"?>'
      response += '<Response>'
      response += '<Enqueue url="http://5.175.146.43/SautiFinaleMoney.mp3"/>'
      response += '</Response>'

      @response.now = response
     
     elsif
       #This must be the phone number that people call to answer these calls. Dequeue
       #by specifying the phone number that adds people to the queue
       response  = '<?xml version="1.0" encoding="UTF-8"?>'
       response += '<Response>'
       response += '<Dequeue phoneNumber="+254711082730"/>'
       response += '</Response>'

      

      # Print the response onto the page so that our gateway can read it
      #header('Content-type: text/plain');
      render plain: @response.now
      puts "Content-Type: text/plain"
      puts @response.now

      # DONE!!!
     else
      @dequeue = Dequeue.new(durationInSeconds: params[:durationInSeconds], currencyCode: params[:currencyCode], amount: params[:amount])
      @dequeue.save
       respond_to do |format|
         if @dequeue.save
           format.html { redirect_to @dequeue, notice: 'dequeue was successfully created.' }
           format.json { render :show, status: :created, location: @dequeue }
         else
           format.html { render :new }
           format.json { render json: @dequeue.errors, status: :unprocessable_entity }
         end
       end
     end
   end
  end




  # PATCH/PUT /dequeues/1
  # PATCH/PUT /dequeues/1.json
  def update
    respond_to do |format|
      if @dequeue.update(dequeue_params)
        format.html { redirect_to @dequeue, notice: 'Dequeue was successfully updated.' }
        format.json { render :show, status: :ok, location: @dequeue }
      else
        format.html { render :edit }
        format.json { render json: @dequeue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dequeues/1
  # DELETE /dequeues/1.json
  def destroy
    @dequeue.destroy
    respond_to do |format|
      format.html { redirect_to dequeues_url, notice: 'Dequeue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dequeue
      @dequeue = Dequeue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dequeue_params
      params.require(:dequeue).permit(:isActive, :sessionId, :direction, :callerNumber, :destinationNumber, :dtmfDigits, :recordingUrl, :durationInSeconds, :currencyCode, :amount, :username, :apikey)
    end
end
