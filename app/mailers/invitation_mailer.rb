class InvitationMailer < ActionMailer::Base
  default from: 'notifications@example.com'
 
	def invitation(invitation)
	  @invitation = invitation
	  mail(:to => @invitation.recipient_email, :subject => "Invitation")
	end

end