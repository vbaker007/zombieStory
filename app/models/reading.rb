class Reading < ActiveRecord::Base
  belongs_to :user

  def update(story_id, chapter_id, scenario_id, complete)
    self.readings.each do |reading|
      reading.story_id = story_id
      reading.chapter_id = chapter_id
      reading.scenario_id = scenario_id
      reading.complete = complete
      reading.save 
    end
  end

  #def select_scenario(scenario_id, complete)
    #if 





end
