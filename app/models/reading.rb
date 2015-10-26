class Reading < ActiveRecord::Base
  belongs_to :user

  @@scenarios = [scenario_id, scenario_id]

  def add_scenario(scenario_id)
    add scenario_id
  end
  
  def select_scenario(scenario_id)
    puts @scenario_id == @complete 
    if @scenario_id == true
      puts "You've selected #{@scenario_id}"
    else @scenario_id == false
    end
  end
 # if user







end
