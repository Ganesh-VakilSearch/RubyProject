class CrudNotificationMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.crud_notification_mailer.create_not.subject
  #
  def create_not(object)
    @object = object
    @object_count = object.class.count
    mail to: 'admin@example.com', subject: "A new entry for #{object.class} has been created"
  end

  def update_not(object)
    @object = object
    @object_count = object.class.count
    mail to: 'admin@example.com', subject: "A new entry for #{object.class} has been updated"
  end

  def delete_not(object)
    @object = object
    @object_count = object.class.count
    mail to: 'admin@example.com', subject: "A new entry for #{object.class} has been deleted"
  end
end
