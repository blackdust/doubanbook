
class ClassifybooksController < ApplicationController
  before_action :set_classifybook, only: [:show, :edit, :update, :destroy]

  # GET /classifybooks
  # GET /classifybooks.json
  def index

    @classifybooks = Classifybook.all
    #p Classifybook.class
  end


  
  # GET /classifybooks/1
  # GET /classifybooks/1.json
  def show
   #@classifybook=Classifybook.find(params[:id])
   string1 = @classifybook.condition
   
   page = params[:page]||0
   pages=page.to_s
   string='https://api.douban.com/v2/book/search?tag='+string1+'&count=50&start='+pages+'&fields=image,title,author,price' 

    uri = URI.escape string  
    html_response = nil  
    open(uri) do |http|  
    html_response = http.read  
    end 
    @reasults=JSON.parse(html_response) 
    @list=@reasults['books']#从返回的哈希值里取出‘book’里的value
    #@list = @listx.paginate :page=> params[:page], :per_page => 5 

    #length = @list.length-1  
      #for i in 0..length do  
      #     @list[i]
     # end
  end  



  # GET /classifybooks/new
  def new
    @classifybook = Classifybook.new
  end

  # GET /classifybooks/1/edit
  def edit
  end

  # POST /classifybooks
  # POST /classifybooks.json
  def create
    @classifybook = Classifybook.new(classifybook_params)

    respond_to do |format|
      if @classifybook.save
        format.html { redirect_to @classifybook, notice: 'Classifybook was successfully created.' }
        format.json { render :show, status: :created, location: @classifybook }
      else
        format.html { render :new }
        format.json { render json: @classifybook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classifybooks/1
  # PATCH/PUT /classifybooks/1.json
  def update
    respond_to do |format|
      if @classifybook.update(classifybook_params)
        format.html { redirect_to @classifybook, notice: 'Classifybook was successfully updated.' }
        format.json { render :show, status: :ok, location: @classifybook }
      else
        format.html { render :edit }
        format.json { render json: @classifybook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classifybooks/1
  # DELETE /classifybooks/1.json
  def destroy
    @classifybook.destroy
    respond_to do |format|
      format.html { redirect_to classifybooks_url, notice: 'Classifybook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classifybook
      @classifybook = Classifybook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classifybook_params
      params.require(:classifybook).permit(:condition, :user_id)
    end
end


