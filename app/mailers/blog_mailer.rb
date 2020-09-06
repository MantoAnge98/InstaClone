class BlogMailer < ApplicationMailer
  def contact_mail(blog)
    @blog = blog
    mail to: "koutikaangemarie@gmail", subject: "Image Posted"
  end
end
