class Todo < ActiveRecord::Base

	belongs_to :plant
	after_create :send_text

	def send_text
		account_sid = 'ACf65faf505d669b82a5aebaa034e3653e'
		auth_token = 'c106235d7ce09684203ac32b74f7e14e'
		# set up a client to talk to the Twilio REST API
		@client = Twilio::REST::Client.new account_sid, auth_token

		from = "441600800043" # Your Twilio number
 		friends = {
			"07428002145" => "Curious George"
		}
		friends.each do |key, value|
  			@client.account.sms.messages.create(
    		:from => "441600800043",
   	 		:to => "07776007483",
    		:body => self.message
  			) 
  		end
	end

end
