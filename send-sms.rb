# frozen_string_literal: true

require 'dotenv/load'
require 'twilio-ruby'

account_sid = ENV.fetch("TWILIO_ACCOUNT_SID")
auth_token = ENV.fetch("TWILIO_AUTH_TOKEN")
messaging_service_sid = ENV.fetch("MESSAGING_SERVICE_SID")

to = ARGV.first

client = Twilio::REST::Client.new(account_sid, auth_token)
message = client.messages.create(
  to: to,
  messaging_service_sid: messaging_service_sid,
  body: "Hello from your Alpha Sender"
)
puts "Message sent! Message sid is: #{message.sid}"