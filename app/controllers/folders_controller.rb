class FoldersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_folder

  def show
  end

  def update
  end

  def destroy
  end

  private

  def set_folder
    @folder = Folder.find(params[:folder_id])
  end

  def note_params
    params.require(:note).permit(:text, :annotations)
  end

end
