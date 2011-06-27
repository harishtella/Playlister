class Mp3sController < ApplicationController
  def index
    @mp3s = Mp3.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @mp3 = Mp3.find(params[:id])
    
    @rating = Rating.new

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def create_rating 
    @mp3 = Mp3.find(params[:id])
    @rating = Rating.new(params[:rating])

    @mp3.ratings << @rating
    @mp3.save

    redirect_to(@mp3)
  end

  def new
    @mp3 = Mp3.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @mp3 = Mp3.find(params[:id])
  end

  def create
    @mp3 = Mp3.new(params[:mp3])

    respond_to do |format|
      if @mp3.save
        format.html { redirect_to(@mp3, :notice => 'Mp3 was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @mp3 = Mp3.find(params[:id])

    respond_to do |format|
      if @mp3.update_attributes(params[:mp3])
        format.html { redirect_to(@mp3, :notice => 'Mp3 was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @mp3 = Mp3.find(params[:id])
    @mp3.destroy

    respond_to do |format|
      format.html { redirect_to(mp3s_url) }
    end
  end
end
