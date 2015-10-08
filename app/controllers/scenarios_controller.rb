class ScenariosController < ApplicationController
  before_action :find_scenario, only: [:show, :edit, :update, :destroy]

  def index
    @scenarios = Scenario.all.order("created_at DESC")
  end

  def show
  end

  def new
    @scenario = Scenario.new
  end

  def create
    @scenario = Scenario.new(scenario_params)
    if @scenario.save
      redirect_to @scenario
    else
      render 'new'
    end
  end

  def edit 
  end

  def update 
    if @scenario.update(scenario_params)
      redirect_to @scenario
    else
      render 'edit'
    end
  end

  def destroy
    @scenario.destroy
    redirect_to root_path
  end

  private

  def find_scenario
    @scenario = Scenario.find(params[:id])
  end

  def scenario_params
    params.require(:scenario).permit(:content)
  end
end
