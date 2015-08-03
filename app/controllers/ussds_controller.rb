class UssdsController < ApplicationController
 skip_before_filter  :verify_authenticity_token

 class Response
  attr_accessor :now
 end

  before_action :set_ussd, only: [:show, :edit, :update, :destroy]

  # GET /ussds
  # GET /ussds.json
  def index
    @ussds = Ussd.all
  end

  # GET /ussds/1
  # GET /ussds/1.json
  def show
  end

  # GET /ussds/new
  def new
    @ussd = Ussd.new
  end

  # POST /ussds
  # POST /ussds.json
  def create
   #Persist AT API Params
    @ussd = Ussd.new(sessionId: params[:sessionId], serviceCode: params[:serviceCode], phoneNumber: params[:phoneNumber], text: params[:text])
    @response = Response.new
    if @ussd.save
      # redirect_to ussd_path, :notice => "Your post was saved"
      # Reads the variables sent via POST from our gateway
                sessionId   = @ussd.sessionId
                serviceCode = @ussd.serviceCode
                phoneNumber = @ussd.phoneNumber
                text        = @ussd.text

                if ( text == "" )

                        # This is the first request. Note how we start the response with CON
                        response  = "CON What would you like to do? \n"
                        response += "1. is the value of happiness \n"
                        response += "2. is the formula of laughing"
                        @response.now = response

                 elsif ( text == "1" )

                        # Your business logic to determine the account number goes here
                        accountNumber  = "ACC1001"
                        # This is a terminal request. Note how we start the response with END
                        response = "END Your account number is $accountNumber"
                        @response.now = response

                 elsif ( text == "2" )

                        # Your business logic to determine the balance goes here
                        balance  = "KES 1,000"
                        # This is a terminal request. Note how we start the response with END
                        response = "END Your balance is $balance"
                        @response.now = response
                end

                # Print the response onto the page so that our gateway can read it
                #header('Content-type: text/plain');
                render plain: @response.now
                puts "Content-Type: text/plain"
                puts @response.now

                # DONE!!!
        else
         render "new"
    end
  end


  # DELETE /ussds/1
  # DELETE /ussds/1.json
  def destroy
    @ussd.destroy
    respond_to do |format|
      format.html { redirect_to ussds_url, notice: 'Ussd was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ussd
      @ussd = Ussd.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ussd_params
      params.require(:ussd).permit(:sessionId, :serviceCode, :phoneNumber)
    end
end
