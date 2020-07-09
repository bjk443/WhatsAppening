class MessagesController < ApplicationController

  def create
    @venue = Venue.find(params[:venue_id])
    @chatroom = @venue.chatroom
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    # @message.save
    if @message.content != ""
      @message.save
      ChatroomChannel.broadcast_to(@chatroom, render_to_string(partial: "message", locals: { message: @message }))
      redirect_to venue_path(@venue, anchor: "message-#{@message.id}")
    else
      render "venues/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
