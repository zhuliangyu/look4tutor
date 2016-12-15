class Api::V1::TutorsController < ApplicationController

  def index
    @tutors = Tutor.order("created_at DESC")
    render json: @tutors
  end

  def show
    @tutor = Tutor.find_by(id:params[:id] )
    render json:@tutor
  end
end
