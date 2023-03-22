class EmailSender
  require 'sendgrid-ruby'
  include SendGrid

  def self.send_email(to:, subject:, body:)
    from = Email.new(email: 'wesleybortolosocco@gmail.com')
    to = Email.new(email: to)
    content = Content.new(type: 'text/plain', value: body)
    mail = Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: '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')
    sg.client.mail._('send').post(request_body: mail.to_json)
  end
end
