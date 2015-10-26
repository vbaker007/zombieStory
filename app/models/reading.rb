class Reading < ActiveRecord::Base
  belongs_to :user

  def initalize(user, scenario_id, complete = true || false)
    @scenario_id = scenario_id
    @user = user
    @complete = complete 
  end

  def select_scenario
    puts @scenario_id == complete 
    if @scenario_id == true
      puts "You've selected #{@scenario_id}"
    else @scenario_id == false
    end
  end
 # if user







end
