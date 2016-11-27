class MessagesController < ApplicationController
  before_action :ser_conversation

  def index

  end

  def create

    receipt=current_user.reply_to_conversation(@conversation,params[:body])
    if receipt
      redirect_to conversation_path(@conversation)
    end

  end


  private
  def ser_conversation
    @conversation=current_user.mailbox.conversations.find(params[:conversation_id])


  end


end
