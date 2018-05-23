class FlashCardsController < ApplicationController

	def new
		@flashcard = FlashCard.new
    @flashcard.cards.build
	end

	def index
		if params[:action] == "dashboard"
			@flashcards == FlashCard.where(user_id: current_user.id)
		else
			@flashcards = FlashCard.all
		end
		respond_to do |format|
		  format.js
		  format.html { render :index }
		end
	end

	def list
	  @questions = Question.where(user_id: current_user.id)
	  @answers = Answer.where(user_id: current_user.id)
	  @notes = Note.where(user_id: current_user.id)
	  @flashcards = FlashCard.where(user_id: current_user.id)
	  @quizzes = Quiz.where(user_id: current_user.id)
	end

	def create
		# byebug
		@flashcard = FlashCard.new
		@flashcard.user_id = current_user.id
		@flashcard.name = params[:flash_card][:name]

		respond_to do |format|
	      if @flashcard.save
	        format.html { redirect_to @flashcard, notice: 'Flashcard was successfully created.' }
	        # format.json { render :show, status: :created, location: @flashcard }
	      else
	        format.html { render :new }
	        # format.json { render json: @flashcard.errors, status: :unprocessable_entity }
	      end
    	end
 	end

 	def show
 		@flashcard = FlashCard.find(params[:id])
 	end

 	def destroy
 		@flashcard = FlashCard.find(params[:id])
 		@flashcard.destroy
 		redirect_to flash_cards_path
 	end
	

end
