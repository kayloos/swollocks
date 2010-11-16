class ListsController < ApplicationController
  before_filter :signed_in
  def new
    @list = List.new(params[:id])
    @lists = current_user.lists.order("created_at ASC")
    @stock = Stock.new
  end

  def create
    @list = List.new(params[:list])
    @list.user_id = current_user.id
    if @list.save
      flash[:success] = "Du har tilføjet listen #{@list.name}"
      redirect_to :action => 'new'
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
    if List.destroy(params[:id]) && Stock.delete_all(["list_id = ?", params[:id]])
      flash[:success] = "Listen er blevet smidt ud"
      redirect_to :action => 'new'
    else
      flash[:error] = "Listen blev ikke smidt ud"
      redirect_to :action => 'new'
    end
  end

  def toggle_mail
    List.find(params[:list_id]).toggle!(:deliver_mail)
    redirect_to :controller => 'lists', :action => 'new'
  end

end
