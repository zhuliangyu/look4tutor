class ConversationsController < ApplicationController
  def index
    @conversations=current_user.mailbox.conversations

  end

  def show
    @conversation=current_user.mailbox.conversations.find(params[:id])
    @receipts=@conversation.receipts_for(current_user)


  end

  def new

  end

  def create
     @recipient=User.find(params[:user_id])
    # @recipient=User.find(params[:user_id])
    @receipt=current_user.send_message(@recipient, params[:body], params[:subject])
    redirect_to tutor_path(@recipient),notice: "Thanks for your message!"


  end

end
