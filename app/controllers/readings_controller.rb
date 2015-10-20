class ReadingsController < ApplicationController
  before_action :find_reading, only: [:show, :edit, :update, :destroy]
  def index
    @readings = Reading.all.order("created_at DESC")
  end

  def show
  end

  def new
    @reading = Reading.new
  end

  def create 
    @reading = Reading.new(reading_params)
    if @reading.save
      redirect_to @reading
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @reading.update(reading_params)
      redirect_to @reading
    else
      render :edit
    end
  end

  def destroy
    @reading.destroy
    redirect_to root_path
  end

  private

  def find_reading
    @reading = Reading.find(params[:id])
  end

  def reading_params
    params.require(:reading).permit(:story_id, :chapter_id, :scenario_id, :complete)
  end
end
