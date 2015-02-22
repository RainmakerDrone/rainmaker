class TwilioController < ApplicationController
  include Webhookable
  require 'twilio-ruby'
 
  after_filter :set_header
 
  skip_before_action :verify_authenticity_token
 

  def voice
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Sup Fools. Cash Money Drone team is for real.', :voice => 'alice'
         r.Play 'http://linode.rabasa.com/cantina.mp3'
    end
 
    render_twiml response
  end

  def text 
    # let's pretend that we've mapped this action to 
    # http://localhost:3000/sms in the routes.rb file
    
    message_body = params["Body"].downcase
    from_number = params["From"]
 
    @vote = Vote.new(:name => from_number, :description => message_body)

    if message_body == 'l' or message_body == 'r' or message_body == "b" or message_body == "f"
      @vote.save
    end

    #response = 'Thanks for your vote! Vote again and get $$$$$'
    #render_twiml response
  end
end