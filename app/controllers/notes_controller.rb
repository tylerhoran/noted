class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, except: [:index, :create, :new]

  def index
    @q = Note.ransack(params[:q])
    @q.sorts = 'created_at desc' if @q.sorts.empty?
    @notes = @q.result.includes(folder: :user).where(folders: { user_id: current_user.id }).page(params[:page])
  end

  def show
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      redirect_to note_path(@note)
    else
      render :new
    end
  end

  def new
    @note = current_user.notes.new
  end

  def update
  end

  def destroy
  end

  private

  def set_note
    @note = current_user.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:text, :entities, :folder_id)
  end

end
