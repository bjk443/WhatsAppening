class MessagesController < ApplicationController

  def create
    @venue = Venue.find(params[:venue_id])
    @chatroom = @venue.chatroom
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    # @message.save
    unless @message.content == "" && !@message.photo.attached?
      @message.save
      ChatroomChannel.broadcast_to(@chatroom, render_to_string(partial: "message", locals: { message: @message }))
      redirect_to venue_path(@venue, anchor: "message-#{@message.id}")
    else
      render "venues/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :photo)
  end

end
