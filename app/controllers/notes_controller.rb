class NotesController < ApplicationController
 	def index
 		@notes = Note.all
	end

	def new
		@note = Note.new
	end

	def create
		# byebug
		@note = Note.new
		@note.name = params[:note][:name]
		@note.user_id = current_user.id
		@note.libraries=params[:note][:libraries]
		@note.save
		# redirect_to :back
	end

	def edit
		# byebug
		@note = Note.find(params[:id])
	end

	def show
		@note = Note.find(params[:id])
	end

	def update
		# byebug
		@note = Note.find(params[:id])
		@note.name = params[:note][:name]

		if @note.libraries?
			@note.libraries += params[:note][:libraries]		
		end
		@note.save
		redirect_to note_path#, notice :"Note was successfully updated"
	end

end