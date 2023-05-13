class FriendInvitationsController < ApplicationController
  def create
    friend_email = params[:friend_email]

    if current_user
      FriendInvitation.invite(current_user, friend_email).deliver_now
      redirect_to root_path, notice: 'Invitation sent successfully!'
    else
      FriendInvitationMailer.invite_without_user(friend_email).deliver_now
      redirect_to root_path, notice: 'Invitation sent successfully!'
    end

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Invitation sent successfully!' }
      format.json do
        render json: { message: 'Invitation sent successfully!' },
               status: :ok
      end
    end
  end
end
