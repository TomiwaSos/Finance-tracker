class FriendshipsController < ApplicationController

    def index
    @friendships = current_user.friends
    end

    def search
        if params[:friend].present?
            @friends = User.search(params[:friend])
            @friends = current_user.except_current_user(@friends)
            if @friends
                respond_to do |format|
                    format.js { render partial: 'friendships/result' }
                end
            else
                respond_to do |format|
                    flash.now[:alert] = "please enter in a friend to search"
                    format.js { render partial: 'friendships/result' }
                end
            end
        else 
            respond_to do |format|
                flash.now[:alert] = "please enter in a friend to search"
                format.js { render partial: 'friendships/result' }
            end
        end
    end

    def create
    
    end

    def destroy
        friendship = current_user.friendships.where(friend_id: params[:id]).first
        friendship.destroy 
        flash[:notice] = "You are no longer friends"
        redirect_to friendships_path,
    
    end

end