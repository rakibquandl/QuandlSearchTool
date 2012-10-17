class SearchItemsController < ApplicationController
  # GET /search_items
  # GET /search_items.json


  def download


     data=[]
     @search_items=SearchItem.where(classification_id: params[:status])
     @search_items.each do |search_item|
       data << search_item.name
     end

   send_data data.join("\n"), type: "text", filename: "#{Classification.find_by_id(params[:status]).value}.txt"
    #
     #file = "search_items.txt"
     #File.open(file, "a"){ |f| f << data}
     ##f=File.new("out", "w")
     #
     ##(1..data.size).each do |i|
     ##  f.puts (data[i])
     ##  #file.write "\n"
     ## end
     #
     #send_file( file )
     ##send_file( f )
     ##send_data data, :filename => 'download.txt',:disposition => 'inline'

  end

  def index
    if params[:status].blank?
      @search_items = SearchItem.all
      @classifications = Classification.all


    else
      @search_items = SearchItem.where(classification_id: params[:status]).page(params[:page]).per(10)
      @classifications = Classification.all
    end

    @title = Classification.find(params[:status]).value


    #redirect_to search_items_path
    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @search_items }
    #end
  end

  # GET /search_items/1
  # GET /search_items/1.json
  def show
    @search_item = SearchItem.find(params[:id])
    #@search_items = SearchItem.paginate(:page=>params[:page], :per_page => 5, :order => 'created_at DESC')

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @search_item }
    end
  end

  ## Show All Rows in the Database

  def show_all
    @search_item = SearchItem.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @search_item }
    end
  end

  def show_good
    @search_item = SearchItem.where(classification_id: 15)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @search_item }
    end
  end

  # GET /search_items/new
  # GET /search_items/new.json
  def new
    @search_item = SearchItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @search_item }
    end
  end

  # GET /search_items/1/edit
  def edit
    @search_item = SearchItem.find(params[:id])
  end

  # POST /search_items
  # POST /search_items.json


  # @param [Object] str
  def exist_check (str)
    temp_search_items=SearchItem.all
    temp_search_items.each do  |t|
      if t.name == str
        return true
      end
    end
    return false
  end

  def create

    uploaded_file = params[:search_item][:file]
    file_content = uploaded_file.read.split("\n")

    file_content.each do |line|

      if ! exist_check (line.strip)
        @search_item = SearchItem.new(params[:search_item])
        @search_item.name = line.strip
        @search_item.classification_id=Classification.find_by_value("Unclassified").id
        @search_item.save
      end

    end
    respond_to do |format|

      #format.html { redirect_to @search_item, notice: 'Search items were successfully created.' }
      format.html { redirect_to search_items_path(:status=> Classification.find_by_value("Unclassified").id), notice: 'Search items were successfully created.' }
      format.json { render json: @search_item, status: :created, location: @search_item }
    #  #else
    #  #  format.html { render action: "new" }
    #  #  format.json { render json: @search_item.errors, status: :unprocessable_entity }
    #  #end
    end
  end

  # PUT /search_items/:id
  def update
    @search_item = SearchItem.find(params[:id])
    @search_item.classification_id = params[:search_item][:classification_id]
    @search_item.save


    redirect_to search_items_path(:status=>params[:search_item][:status])

    #redirect_to search_items_path

    #if(@search_item.classification_id ==15)

    #elsif (@search_item.classification_id ==16)
    #  redirect_to search_items_path(:status=>16)
    #else
    #  redirect_to search_items_path(:status=>17)
    #end


    #respond_to do |format|
    #  if @search_item.update_attributes(params[:search_item])
    #    format.html { redirect_to @search_item, notice: 'Search item was successfully updated.' }
    #    format.json { head :no_content }
    #  else
    #    format.html { render action: "edit" }
    #    format.json { render json: @search_item.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # DELETE /search_items/1
  # DELETE /search_items/1.json
  def destroy
    @search_item = SearchItem.find(params[:id])
    temp=@search_item
    @search_item.destroy

    respond_to do |format|
      format.html { redirect_to search_items_path(:status=> Classification.find_by_value(temp.classification.value).id) }
      format.json { head :no_content }
    end
  end
end
