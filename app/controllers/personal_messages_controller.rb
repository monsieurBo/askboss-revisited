class PersonalMessagesController < ApplicationController
	before_action :find_conversation!

		def new
	    @conversation ||= Conversation.create(author_id: current_user.id,receiver_id: params[:receiver_id])
		  @receiver = @conversation.receiver
		  @personal_message = current_user.personal_messages.build

		  respond_to do |format|
		    format.js
		    format.html { render :new }
		  end
		end

	  def create                   
	    @personal_message = current_user.personal_messages.build(personal_message_params)
	    @personal_message.conversation_id = @conversation.id

	    if @personal_message.save!
		    flash[:success] = "Your message was sent!"
		    redirect_to conversation_path(@conversation)
		  end
		  
	  end

	  private

	  def personal_message_params
	    params.require(:personal_message).permit(:body)
	  end

	  def find_conversation!
	    @conversation = Conversation.find_by(id: params[:conversation_id]) || Conversation.find_by(author_id: current_user.id, receiver_id: params[:receiver_id])
	  end
end
