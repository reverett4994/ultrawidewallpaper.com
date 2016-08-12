class WallpapersController < ApplicationController
  before_action :set_wallpaper, only: [:show, :edit, :update, :destroy]
  WillPaginate.per_page = 12
  # GET /wallpapers
  # GET /wallpapers.json
  def index
    @wallpapers = Wallpaper.order('cat ASC')
  end

  # GET /wallpapers/1
  # GET /wallpapers/1.json
  def show

     @picture= @wallpaper.picture_id 
     @picture=@picture.to_s
     @jpg='.jpg'
     @picture_id=@picture+@jpg
  end

  # GET /wallpapers/new
  def new
    @wallpaper = Wallpaper.new
  end

  # GET /wallpapers/1/edit
  def edit
  end

  # POST /wallpapers
  # POST /wallpapers.json
  def create
    @wallpaper = Wallpaper.new(wallpaper_params)

    respond_to do |format|
      if @wallpaper.save
        format.html { redirect_to @wallpaper, notice: 'Wallpaper was successfully created.' }
        format.json { render :show, status: :created, location: @wallpaper }
      else
        format.html { render :new }
        format.json { render json: @wallpaper.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def gallery
    @wallpapers = Wallpaper.paginate(:page=>params[:page])
  end

  def fullsize
     @wallpaper = Wallpaper.find(params[:id])
     @picture= @wallpaper.picture_id 
     @picture=@picture.to_s
     @jpg='.jpg'
     @picture_id=@picture+@jpg
  end

  def category_sort
    @cat=params[:cat]
    @category=@cat
    @cat='%'+@cat+'%'
    @wallpapers=Wallpaper.where('cat LIKE ?',@cat)
    @wallpapers=@wallpapers.paginate(:page=>params[:page])
  end

  def color_sort
    @color=params[:color]
    @showing_color=@color
    @color='%'+@color+'%'
    @wallpapers=Wallpaper.where('color LIKE ?',@color)
    @wallpapers=@wallpapers.paginate(:page=>params[:page])
  end

  # PATCH/PUT /wallpapers/1
  # PATCH/PUT /wallpapers/1.json
  def update
    respond_to do |format|
      if @wallpaper.update(wallpaper_params)
        format.html { redirect_to @wallpaper, notice: 'Wallpaper was successfully updated.' }
        format.json { render :show, status: :ok, location: @wallpaper }
      else
        format.html { render :edit }
        format.json { render json: @wallpaper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wallpapers/1
  # DELETE /wallpapers/1.json
  def destroy
    @wallpaper.destroy
    respond_to do |format|
      format.html { redirect_to wallpapers_url, notice: 'Wallpaper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wallpaper
      @wallpaper = Wallpaper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wallpaper_params
      params.require(:wallpaper).permit(:cat, :color, :picture_id)
    end
end


Wallpaper.create(:title=>"Old Bridge",:cat=>"Architecture",:color=>"",:picture_id=>370)