class BlogMailer < ApplicationMailer
  def contact_mail(blog)
    @blog = blog
    mail to: "koutikaange@gmail.com", subject: "Image Posted"
  end
end
