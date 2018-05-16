class VotesController < ApplicationController
	before_action :set_vote

  def vote
  	if @vote.nil?
  		if params[:question_id].nil?
  		 Vote.create(answer_id: params[:answer_id], user_id: current_user.id)
  		 redirect_to question_path(@vote.answer.question.id)
  		elsif params[:answer_id].nil?
  		 Vote.create(question_id: params[:question_id], user_id: current_user.id)
  		 redirect_to question_path(@vote.question_id)
  		end
    else
    	@question = @vote.question || @vote.answer.question
	    if @vote.vote.nil?
	      @vote.update(vote: true)
	    elsif @vote.vote?
	      @vote.update(vote: false)
	    else
	      @vote.update(vote: true)
	    end 
	  end  
	  redirect_to question_path(@question.id)
  end

  private 

  def set_vote
  	@vote = Vote.find_by(answer_id: params[:answer_id], user_id: current_user.id) || Vote.find_by(question_id: params[:question_id], user_id: current_user.id)
  end

end