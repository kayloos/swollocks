class ListsController < ApplicationController
  before_filter :signed_in
  def new
    @list = List.new(params[:id])
  end

  def create
    @list = List.new(params[:list])
    @list.user_id = current_user.id
    if @list.save
      flash[:success] = "Du har tilføjet listen #{@list.name}"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
    if List.destroy(params[:id])
      flash[:success] = "Listen er blevet smidt ud"
      redirect_to current_user
    else
      flash[:error] = "Listen blev ikke smidt ud"
      redirect_to current_user
    end
  end

end
