class NotesController < ApplicationController

  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_same_user, except: [:index, :new, :create]

  def index
    @notes = Note.all.order("created_at DESC")
  end

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.create(note_params)
    if @note.save
      redirect_to @note
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to @note
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private

  def require_same_user
    if current_user != @note.user
      redirect_to root_path
    end
  end

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end

end