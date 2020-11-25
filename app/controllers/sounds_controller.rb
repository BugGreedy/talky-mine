class SoundsController < ApplicationController
  before_action :set_sound, only: [:edit, :show, :update, :destroy]
  # before_action :move_to_index, except: [:index,:search], notice: 'ログインしてください'
  # before_action :authenticate_user!, except: [:index, :search]

  def index
    @sounds = Sound.includes(:user).order('created_at DESC')
  end

  def new
    @sound = Sound.new
  end

  def create
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
    if user_signed_in?
      @sound = Sound.find(params[:id])
      @comment = Comment.new
      @comments = @sound.comments.includes(:user)
      @like = Like.new
    else
      redirect_to root_path, notice: 'ログインしてからご利用下さい。'
    end
  end

  def search
    @sounds = Sound.search(params[:keyword])
  end

  # ゲストログイン機能追加時に追記
  def new_guest
    require 'faker'

    user = User.find_or_create_by(email: 'guest@example.com') do |user|
      user.password = Faker::Internet.password(max_length: 10)
      user.nickname = 'ゲストさん'
      # user.image = 'public/testimages/test_image02.jpg'
    end

    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
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
