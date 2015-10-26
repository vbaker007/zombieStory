class Scenario < ActiveRecord::Base
  belongs_to :chapter

  def initialize(scenario_id, content)
    @scenario_id = scenario_id
    @content = content
  end

  def create_scenario
     @scenario_id
     @content
  end


end
