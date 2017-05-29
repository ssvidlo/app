class ContentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

  def index
    @contents = Content.all.page(params[:page]).per(4)
  end

  def new
    @content = Content.new
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    @content = Content.find(params[:id])
    @content.update_attributes(content_params)

    redirect_to contents_path
  end

  def destroy
    @content = Content.find(params[:id])
    @content.destroy

    redirect_to contents_path
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      flash[:success] = 'Content saved!'
      redirect_to contents_path
    else
      render 'new'
    end
  end

  private

  def content_params
    params.require(:content).permit(:image, :name)
  end
end
