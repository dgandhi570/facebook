class InvitationsController < ApplicationController
    def create
      id1 = params[:ids][:id1]
      id2 = params[:ids][:id2]
      @invitation = Invitation.new(user_id: id1, friend_id: id2)
      @invitation.save
      redirect_to users_path
    end
  
    def destroy
       
      invitation = Invitation.find(params[:invitation_id])
      invitation.destroy
      redirect_to request.referrer
    end
  
    def update
      invitation = Invitation.find(params[:invitation_id])
      puts current_user
      invitation.update(confirmed: true)
      redirect_to request.referrer
  end
end