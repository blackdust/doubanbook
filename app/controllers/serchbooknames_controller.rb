class SerchbooknamesController < ApplicationController
  before_action :set_serchbookname, only: [:show, :edit, :update, :destroy]

  # GET /serchbooknames
  # GET /serchbooknames.json
  def index
    @serchbooknames = Serchbookname.all
  end

  # GET /serchbooknames/1
  # GET /serchbooknames/1.json
  def show
   
   string1=@serchbookname.word
   page= params[:page]||0
   pages=page.to_s
   string='https://api.douban.com/v2/book/search?q='+string1+'&count=50&start='+pages+'&fields=image,title,author,price'
   
   uri = URI.escape string  
    html_response = nil  
    open(uri) do |http|  
    html_response = http.read  
    end 
    @reasults=JSON.parse(html_response) 
    @list=@reasults['books']
  end

  # GET /serchbooknames/new
  def new
    @serchbookname = Serchbookname.new
     
  end

  # GET /serchbooknames/1/edit
  def edit
  end

  # POST /serchbooknames
  # POST /serchbooknames.json
  def create
    p "~~~~~~~~~~~~~~~~~~"
    p params[:serchbookname]
    p "~~~~~~~~~~~~~~~~~~"

    @serchbookname = Serchbookname.new(serchbookname_params)

    respond_to do |format|
      if @serchbookname.save
        format.html { redirect_to @serchbookname, notice: 'ok.' }
        format.json { render :show, status: :created, location: @serchbookname }
      else
        format.html { render :new }
        format.json { render json: @serchbookname.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /serchbooknames/1
  # PATCH/PUT /serchbooknames/1.json
  def update
    respond_to do |format|
      if @serchbookname.update(serchbookname_params)
        format.html { redirect_to @serchbookname, notice: 'Serchbookname was successfully updated.' }
        format.json { render :show, status: :ok, location: @serchbookname }
      else
        format.html { render :edit }
        format.json { render json: @serchbookname.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /serchbooknames/1
  # DELETE /serchbooknames/1.json
  def destroy
    @serchbookname.destroy
    respond_to do |format|
      format.html { redirect_to serchbooknames_url, notice: 'Serchbookname was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_serchbookname
      @serchbookname = Serchbookname.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def serchbookname_params
      params.require(:serchbookname).permit(:word, :user_id)
    end
end





