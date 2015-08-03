class BulksController < ApplicationController
  before_action :set_bulk, only: [:show, :edit, :update, :destroy]

    # GET /bulks
    # GET /bulks.json
    def index
      @bulks = Bulk.all
    end

    # GET /bulks/1
    # GET /bulks/1.json
    def show
    end

    # GET /bulks/new
    def new
      @bulk = Bulk.new
    end

    # GET /bulks/1/edit
    def edit
    end

    # POST /bulks
    # POST /bulks.json
    def create
    # Include the helper gateway class
    require_relative 'AfricasTalkingGateway'

    # Specify your login credentials
      # Specify your login credentials
    user = params.require(:bulk).permit(:username)
    username = user['username']

    api =params.require(:bulk).permit(:apikey)
    apikey = api['apikey']

    # Specify the numbers that you want to send to in a comma-separated list

    # Please ensure you include the country code (+254 for Kenya in this case)
    to      = params.require(:bulk).permit(:number)
    tof = to[:number]

    # And of course we want our recipients to know what we really do
    message = params.require(:bulk).permit(:message)
    msg = message[:message]

    # Create a new instance of our awesome gateway class
    gateway = AfricasTalkingGateway.new(username, apikey)

    # Any gateway error will be captured by our custom Exception class below,
    # so wrap the call in a try-catch block
    begin
      # Thats it, hit send and we'll take care of the rest.
      reports = gateway.sendMessage(tof,msg)
      reports.each {|x|
        @bulk = Bulk.new(number: x.number, status: x.status, message_id: x.messageId, cost: x.cost, message: params[:message] )
      }
      respond_to do |format|
        if @bulk.save
          format.html { redirect_to @bulk, notice: 'Bulk sms was successfully created.' }
          format.json { render :show, status: :created, location: @bulk }
        else
          format.html { render :new }
          format.json { render json: @bulk.errors, status: :unprocessable_entity }
        end
      end

    rescue AfricasTalkingGatewayException => ex
      puts 'Encountered an error: ' + ex.message
    end
    end 

  # PATCH/PUT /bulks/1
  # PATCH/PUT /bulks/1.json
    def update
      respond_to do |format|
        if @bulk.update(bulk_params)
          format.html { redirect_to @bulk, notice: 'Bulk was successfully updated.' }
          format.json { render :show, status: :ok, location: @bulk }
        else
          format.html { render :edit }
          format.json { render json: @bulk.errors, status: :unprocessable_entity }
        end
      end
    end

  # DELETE /bulks/1
  # DELETE /bulks/1.json
  def destroy
    @bulk.destroy
    respond_to do |format|
      format.html { redirect_to bulks_url, notice: 'Bulk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bulk
      @bulk = Bulk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bulk_params
      params[:bulk]
    end
 end
