class ContactMailer < ActionMailer::Base
 default to: "info@ayavinadelmar.com"
  
  def contact_email(name, email, message)
     @name = name
      @email = email
       @message = message
        
        mail(from: email, subject: 'Aya Vinadelmar.com Contact Form Message')
         end
end
