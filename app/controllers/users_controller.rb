class UsersController < ApplicationController
   before_action :authenticate_user!, except: [:show]

   def show
     @user = User.find(params[:id])
     @item = Item.new
     @items = @user.items
   end

   def update
     if current_user.update_attributes(user_params)
       flash[:notice] = "user information updated"
       redirect_to edit_user_registration_path
     else
       flash[:error] = "invalid user information"
       redirect_to edit_user_registration_path
     end
   end

   private

   def user_params
     params.require(:user).permit(:name, :avatar)
   end
 end
