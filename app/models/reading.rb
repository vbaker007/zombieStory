class Reading < ActiveRecord::Base
  belongs_to :user

def initalize(user, scenario_id)
  @scenario_id = scenario_id
  @user = user
end

def select_scenario 
  if user







end
