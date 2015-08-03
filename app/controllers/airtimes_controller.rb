class AirtimesController < ApplicationController
  before_action :set_airtime, only: [:show, :edit, :update, :destroy]

  # GET /airtimes
  # GET /airtimes.json
  def index
    @airtimes = Airtime.all
  end

  # GET /airtimes/1
  # GET /airtimes/1.json
  def show
  end

  # GET /airtimes/new
  def new
    @airtime = Airtime.new
  end

  # GET /airtimes/1/edit
  def edit
  end

  # POST /airtimes
  # POST /airtimes.json
  def create
   # Include the helper gateway class
   require_relative 'Africas1TalkingGateway'

    # Specify your login credentials
    user = params.require(:airtime).permit(:username)
    username = user['username']
    puts username
    api =params.require(:airtime).permit(:apikey)
    apikey = api['apikey']

   #Create an array to hold all the recipients
   recipients = Array.new

   #Grab the list of phone numbers and amount
       rcvs     = params.require(:airtime).permit(:phoneNumber)
       cev = rcvs['phoneNumber']

       amount  = params.require(:airtime).permit(:amount)
       amt = amount['amount']
  
   #Split the list of phone numbers
       if cev.length > 13
        #Separate at the commas
         cevs=cev.split(",")  
        #Assemple recipients
         cevs.each do |cevr|
          recipients << {"phoneNumber" => cevr.strip, "amount" => 'KES '+amt}
         end
       else
         recipients << {"phoneNumber" => cev, "amount" => 'KES '+amt}
       end 
       puts recipients
   
   # Create a new instance of our awesome gateway class
   gateway = AfricasTalkingGateway.new(username, apikey)

   # Any gateway errors will be captured by our custom Exception class below,
   # so wrap the call in a try-catch block
   begin
     # Thats it, hit send and we'll take care of the rest.
     results = gateway.sendAirtime(recipients)
     results.each {|x|
        @airtime = Airtime.new(status: x.status, amount: x.amount, phoneNumber: x.phoneNumber, discount: x.discount, requestId: x.requestId)
       	#incase the status is not equal to success, it is important to list the error message
     	puts 'ErrorMessage='+x.errorMessage
     }
     respond_to do |format|
      if @airtime.save
        format.html { redirect_to @airtime, notice: 'Airtime was successfully created.' }
        format.json { render :show, status: :created, location: @airtime }
      else
        format.html { render :new }
        format.json { render json: @airtime.errors, status: :unprocessable_entity }
      end
     end   

   rescue AfricasTalkingGatewayException => ex
      puts 'Encountered an error: '+ ex.message
   end
   # DONE!
  end

  # PATCH/PUT /airtimes/1
  # PATCH/PUT /airtimes/1.json
  def update
    respond_to do |format|
      if @airtime.update(airtime_params)
        format.html { redirect_to @airtime, notice: 'Airtime was successfully updated.' }
        format.json { render :show, status: :ok, location: @airtime }
      else
        format.html { render :edit }
        format.json { render json: @airtime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /airtimes/1
  # DELETE /airtimes/1.json
  def destroy
    @airtime.destroy
    respond_to do |format|
      format.html { redirect_to airtimes_url, notice: 'Airtime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_airtime
      @airtime = Airtime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def airtime_params
      params.require(:airtime).permit(:status, :amount, :phoneNumber, :discount, :requestId)
    end
end
