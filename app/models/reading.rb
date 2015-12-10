class Reading < ActiveRecord::Base
  belongs_to :user

  

  def add_scenario(scenario_id)

    scenarios = [scenario_id, scenario_id]
    puts scenarios[0]
    puts scenario[1]
  end

  def select_scenario(scenario_id)
   @scenario_id == @complete 
    if @scenario_id == true
      puts "You've selected #{@scenario_id}"
    else @scenario_id == false
    end
  end
end
#add_scenario(scenarios[0])
#add_scenario(scenarios[1])





