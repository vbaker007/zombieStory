class ChaptersController < ApplicationController
  before_action :find_chapter, only: [:show, :edit, :update, :destroy]
  def index
    @chapters = Chapter.all.order("created_at DESC")
  end

  def show
  end

  def new
    @chapter = Chapter.new
  end

  def create
    @chapter = Chapter.new(chapter_params)
    if @chapter.save 
      redirect_to @chapter
    else 
      render 'new'
    end
  end

  def edit
  end

  def update 
    if @chapter.update(chapter_params)
      redirect_to @chapter
    else
      render 'edit' 
    end
  end

  def destroy
  end

  private

  def find_chapter
    @chapter = Chapter.find(params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:number)
  end
end


















end
