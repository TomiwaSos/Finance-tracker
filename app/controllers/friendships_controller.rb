class FriendshipsController < ApplicationController

    def index
    @friendships = current_user.friends
    end

    def search
        if params[:friend].present?
            @friend = params[:friend]
            if @friend
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

end