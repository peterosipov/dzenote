class NotesController < ApplicationController

  before_action :set_note, only: [:show, :edit, :destroy]

  def new
    @note = Note.new
  end

  def create
    @note = Note.create(note_params)
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
    @note = Note.update(note_params)
    if @note.save
      redirect_to @note
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy
    redirect_to root_path
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end

end