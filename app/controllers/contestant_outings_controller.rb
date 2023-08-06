class ContestantOutingsController < ApplicationController
  def destroy
    contestant_outings = ContestantOuting.find_by(outing_id: params[:outing_id], contestant_id:  params[:id])

    contestant_outings.delete

    redirect_to outing_path(params[:outing_id])
  end
end