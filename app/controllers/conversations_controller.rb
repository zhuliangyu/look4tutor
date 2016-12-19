class ConversationsController < ApplicationController
  before_action :user_authentication

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

     # redirect_to tutor_path(@recipient.tutor),notice: "Thanks for your message!"
    redirect_to conversations_path


  end

end
