class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @user = current_user
    @item = Item.new(item_params)
    @item.user = current_user
    # @user = User.find(params[:user_id])
    # @item = @user.items.create(items_params)
    # @item = Item.new(item_params)
    # @item.user = current_user

    if @item.save
      flash[:notice] = "New item has been saved!"
      redirect_to current_user
    else
      flash[:error] = "There was an error creating your item. Please try again."
      render :new
    end
  end

  def destroy
    @item = current_user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item was deleted successfully."
    else
      flash[:alert] = "Item couldn't be deleted. Try again."
    end

    respond_to do |format|
      # format.html { render :partial => 'item' }
      format.js { render 'destroy' }
    end
  end

  private

  def item_params
    params.require(:item).permit(:user)
  end
end
