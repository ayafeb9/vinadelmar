# using SendGrid's Ruby Library
# https://github.com/sendgrid/sendgrid-ruby
require 'sendgrid-ruby'
include SendGrid

from = Email.new(email: 'hozuay01@luther.edu')
to = Email.new(email: 'hozuay01@luther.edu')
subject = 'Sending with SendGrid is Fun'
content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
mail = Mail.new(from, subject, to, content)

sg = SendGrid::API.new(api_key: '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')
response = sg.client.mail._('send').post(request_body: mail.to_json)
puts response.status_code
puts response.body
#puts response.headers
