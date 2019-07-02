class DiariesController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:show,:edit,:update,:destroy]}

  def day
    @diaries = Diary.where(user_id: @current_user.id).where(purchase_date: params[:purchase_date])
    @purchase_date = Date.parse(params[:purchase_date]).strftime('%Y年%m月%d日')
  end

  def month
    year = params[:purchase_date][:"#{Date.today}(1i)"]
    month = "%#02d" %  params[:purchase_date][:"#{Date.today}(2i)"]
    date = year + "-" + month
    #@diaries = Diary.search(1000)
    @purchase_date = year + "年" + month + "月"
  end
#['purchase_date LIKE ?', "#{date}%"]
  def year
    year = params[:purchase_date][:"#{Date.today}(1i)"]
    @diaries = Diary.where(user_id: @current_user.id).where(purchase_date: "params[:purchase_date]")
    @purchase_date = year + "年"
  end

  def search
    @diaries = Diary.where(user_id: @current_user.id).where(item: params[:item])
    @search_item = params[:item]
  end

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
      price: params[:price],
      purchase_date: params[:purchase_date]
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
    @diary.price = params[:price]
    @diary.purchase_date = params[:purchase_date]
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
