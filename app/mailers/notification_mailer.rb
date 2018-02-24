class NotificationMailer < ApplicationMailer
    default from: "no-reply@sscakeries.com"

  def comment_added(comment)
    @place = comment.place
    @place_owner = @place.user
    mail(to: @place_owner.email,
         subject: "A comment has been added to your place")
  end
end
