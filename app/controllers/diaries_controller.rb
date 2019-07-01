class DiariesController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:show,:edit,:update,:destroy]}

  def index
    @diaries = Diary.where(user_id: @current_user.id)
  end

  def show
    @diary = Diary.find_by(id: params[:id])
    @user = @diary.user
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(
      item: params[:item],
      user_id: @current_user.id,
      item_number: params[:item_number],
    )
    if @diary.save
      flash[:notice]="投稿を作成しました"
      redirect_to("/diaries/index")
    else
      render("diaries/new")
    end
  end

  def edit
    @diary = Diary.find_by(id: params[:id])
  end

  def update
    @diary = Diary.find_by(id: params[:id])
    @diary.item = params[:item]
    @diary.item_number = params[:item_number]
    if @diary.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/diaries/index")
    else
      render("diaries/edit")
    end
  end

  def destroy
    @diary = Diary.find_by(id: params[:id])
    @diary.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/diaries/index")
  end

  def ensure_correct_user
    @diary = Diary.find_by(id: params[:id])
    if @current_user.id != @diary.user_id
      flash[:notice] = "権限がありません"
      redirect_to("/diaries/index")
    end
  end
end
