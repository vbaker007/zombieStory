class ChaptersController < ApplicationController
  before_action :find_chapter, only: [:show, :edit, :update, :destroy]
    def index
      @chapters = Chapter.all.order("created_at DESC")
      @reading_id.chapter = @chapters
      @story_id.chapter = @chapters
    #end
    def show
   @chapters = Listing.where(subcategory_id: params[:id]).order("created_at DESC")
   @story = Story.find(params[:title])
   @scenatios = Scenarios.find(params[:id])
  end
    def show
      
    end

    def new
      @chapter = Chapter.new
    end

    def create
      @chapter = @story.chapters.create(order_date: Time.now)
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
      @chapter.destroy
      redirect_to chapters_path
    end

  private

    def find_chapter
      @chapter = Chapter.find(params[:id])
    end

    def chapter_params
      params.require(:chapter).permit(:number, :story_id, :reading_id)
    end
  
end
  def show
   @listings = Listing.where(subcategory_id: params[:id]).order("created_at DESC")
   @category = Category.find(params[:category_id])
   @subcategory = Subcategory.find(params[:id])
  end



















