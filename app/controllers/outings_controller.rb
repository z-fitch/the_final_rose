class OutingsController < ApplicationController
  def show 
    @outing = Outing.find(params[:id])
  end

  def destroy
    
  end
end