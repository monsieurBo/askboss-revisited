class VotesController < ApplicationController
	before_action :set_vote

  def vote
  	byebug
  	if @votes.nil?
  		Vote.create(vote_from_params)
    else
	    if @votes.vote.nil?
	      @votes.vote = true
	    elsif @votes.vote?
	      @votes.vote = false
	    else
	      @votes.vote = true
	    end 
	  end  
	  render :question     
  end

    def vote_from_params
	  vote_params = params[:vote] || Hash.new
	  answer_id = vote_params.delete(:answer_id)
	  question_id = vote_params.delete(:question_id)
	  user_id = vote_params.delete(:user_id)
	  vote = vote_params.delete(:vote)
	end

  private 

  def set_vote
  	@votes = Vote.find_by(answer_id: params[:answer_id], user_id: current_user.id) || Vote.find_by(question_id: params[:question_id], user_id: current_user.id)
  end

  def vote_params
      params.require(:vote).permit(:answer_id, :user_id, :question_id, :vote)
    end

end