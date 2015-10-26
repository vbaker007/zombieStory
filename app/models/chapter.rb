class Chapter < ActiveRecord::Base
  has_many :scenarios



  def add_scenario( scenario_id, complete = true || false)
    self.scenarios.each do |scenario|
    
      chapter.scenario_id = scenario_id
      chapter.scenario = scenario_id
     
      scenaio.save
  end

   

  def scenarios_in_chapter
    size > 2 ? self[2] : nil
  end

  list_of_scenarios = [scenario_id, scenario_id, scenario_id]

  puts scenarios_in_chapter.list_of_scenarios
  end
end