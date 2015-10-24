class StoriesController < ApplicationController
  before_action :find_story, only: [:show, :edit, :update, :destroy]
  def index
    @stories = Story.all.order("created_at DESC")
  end

  def show
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    
    if @story.save
      redirect_to @story
    else 
      render :new
    end
  end

  def edit
  end

  def update
    if @story.update(story_params)
      redirect_to @story
    else
      render :edit
    end
  end

  def destroy
    @story.destroy
    redirect_to stories_path
  end

  private
    def find_story
      @story = Story.find(params[:id])
    end

    def story_params
      params.require(:story).permit(:title, :desc, :base_text, :image, :image)
    end

end
