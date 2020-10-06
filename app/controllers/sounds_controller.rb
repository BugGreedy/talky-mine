class SoundsController < ApplicationController
  before_action :set_sound, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @sounds = Sound.includes(:user).order('created_at DESC')
  end

  def new
    @sound = Sound.new
  end

  def create # 保存
    @sound = Sound.new(sound_params)
    if @sound.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @sound.update(sound_params)
      redirect_to root_path
    else
      rendar :edit
    end
  end

  def destroy
    if @sound.destroy
      redirect_to root_path
    else
      rendar :edit
    end
  end

  def show
    @sound = Sound.find(params[:id])
    @comment = Comment.new
    @comments = @sound.comments.includes(:user)
    @like = Like.new
  end

  def search
    @sounds = Sound.search(params[:keyword])
  end

  private

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def sound_params
    params.require(:sound).permit(:file, :title, :text, :genre_id).merge(user_id: current_user.id)
  end

  def set_sound
    @sound = Sound.find(params[:id])
  end
end
