class TodolistsController < ApplicationController

  def new
    @list = List.new
  end

  def create
    list = List.new(list_params)
    #データを新規登録するためのインスタンス作成
    list.save
    #データをデータベースに保存する
    redirect_to todolist_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end

  private
    #ストロングパラメータ コントローラの中でしか呼び出せないようにする
  def list_params
    params.require(:list).permit(:title,:body)
  end

end
