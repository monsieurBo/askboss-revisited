class NotesController < ApplicationController
 	def index
 		@notes = Note.all
	end

	def new
		@note = Note.new
	end

	def create
		@note = Note.new
		@note.name = params[:note][:name]
		@note.user_id = current_user.id
		@note.save
		# redirect_to :back
	end
end