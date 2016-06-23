class UsersController < ApplicationController
  def show
    if !current_user.nil?
      @user = current_user
      @item = Item.new
      @items = @user.items
    else
      redirect_to new_user_registration_path
    end

    def destroy
      
    end
  end
end
