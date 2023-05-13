# Preview all emails at http://localhost:3000/rails/mailers/crud_notification_mailer
class CrudNotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/crud_notification_mailer/create_not
  def create_not
    CrudNotificationMailer.create_not
  end

  # Preview this email at http://localhost:3000/rails/mailers/crud_notification_mailer/update_not
  def update_not
    CrudNotificationMailer.update_not
  end

  # Preview this email at http://localhost:3000/rails/mailers/crud_notification_mailer/delete_not
  def delete_not
    CrudNotificationMailer.delete_not
  end

end
