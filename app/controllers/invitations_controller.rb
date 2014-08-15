class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
    @title = "Invite a friend"
  end

  def create
    @invitation = Invitation.new(params[:invitation])
    @invitation.sender = current_user
    if @invitation.save
        if user_signed_in?
            Mailer.invitation(@invitation, new_user_registration_path(@invitation.token)).deliver
            redirect_to root_url, :notice => "Thank you, your friend will receive their invitation soon."
        else
            redirect_to root_url, :notice => "Thank you, we'll let you know when the next batch of invites are availale."
        end
    end
  end
end