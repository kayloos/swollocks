class NotesController < ApplicationController
  def index
    @title = "Notes"
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @title = "Add note"
    if params[:trade_id]
      @note = Note.new(:trade_id => params[:trade_id])
    else
      @note = Note.new
    end
    respond_to do |format|
      format.html { render :layout => true }
      format.js { render :layout => false }
    end
  end

  def create
    @note = Note.new(params[:note])
    if @note.save
      flash[:success] = "Note saved!"
      redirect_to notes_path
    else
      flash[:error] = "Note wasn't saved."
      redirect_to new_note_path
    end
  end

  def edit
    @note = Note.find(params[:id])
    render 'new'
  end

  def update
    @note = Note.find(params[:id])
    if @note.update_attributes(params[:note])
      flash[:success] = "Note upated!"
      redirect_to notes_path
    else
      flash[:error] = "Note wasn't updated."
      render 'new'
    end
  end

  def destroy
    @note = Note.find(params[:id])
    if @note.destroy
      flash[:success] = "Note destroyed"
      redirect_to notes_path
    else
      flash[:error] = "Unable to destroy note"
      redirect_to notes_path
    end
  end

end
