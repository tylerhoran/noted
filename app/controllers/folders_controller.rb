class FoldersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_folder, except: [:new, :create]

  def create
    @folder = current_user.folders.build(folder_params)
    if @folder.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @folder = Folder.new
  end

  def update
    if @folder.update(folder_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @folder.destroy
    redirect_to root_path
  end

  private

  def set_folder
    @folder = Folder.find(params[:id])
  end

  def folder_params
    params.require(:folder).permit(:name)
  end

end
