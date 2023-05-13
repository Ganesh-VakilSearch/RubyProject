class FriendInvitationMailer < ApplicationMailer
  def invite(user, friend_email)
    @user = user
    mail(to: friend_email, subject: "#{user.name} wants you to join our app!")
  end

  def invite_without_user(friend_email)
    @message = 'Hello, please join our app!'
    mail(to: friend_email, subject: 'Join our app!')
  end
end
