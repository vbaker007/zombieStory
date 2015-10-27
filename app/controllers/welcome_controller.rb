class WelcomeController < ApplicationController
  
  def index
    @stories = Story.all.order("created_at DESC")
    @readings = Reading.all.order("created_at DESC")
    @chapters = Chapter.all.order("created_at DESC")
    @scenarios = Scenario.all.order("created_at DESC")
  end


   def find_chapter
      @chapter = Chapter.find(params[:id])
    end
  def find_reading
    @reading = Reading.find(params[:id])
  end

  def find_story
      @story = Story.find(params[:id])
  end

  def find_scenario
    @scenario = Scenario.find(params[:id])
  end
end
