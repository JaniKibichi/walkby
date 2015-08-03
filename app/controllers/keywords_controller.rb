class KeywordsController < ApplicationController
skip_before_action :verify_authenticity_token

  # GET /keywords
  # GET /keywords.json
  def index
    @keywords = Keyword.all
  end

  # POST /keywords
  # POST /keywords.json
  def create
    @keyword = Keyword.new(from: params[:from], to: params[:to], text: params[:text], date: params[:date], smsId: params[:id], linkId: params[:linkId])

    respond_to do |format|
      if @keyword.save
        format.html { redirect_to @keyword, notice: 'Keyword was successfully created.' }
        format.json { render :show, status: :created, location: @keyword }
      else
        format.html { render :new }
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
  end


    # Never trust parameters from the scary internet, only allow the white list through.
    def keyword_params
      params.require(:keyword).permit(:from, :to, :text, :date, :smsId, :linkId)
    end
end
