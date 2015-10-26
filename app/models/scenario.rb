class Scenario < ActiveRecord::Base
  belongs_to :chapter


  

  def create_scenario
     puts @scenario_id 
     @scenario_id = @content 
  end


end
