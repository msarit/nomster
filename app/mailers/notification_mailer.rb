class NotificationMailer < ApplicationMailer
    default from: "no-reply@sscakeries.com"

  def comment_added
    mail(to: "all@thebreisagency.com",
         subject: "A comment has been added to your place")
  end
end
