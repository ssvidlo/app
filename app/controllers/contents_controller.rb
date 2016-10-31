class ContentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @contents = Content.all.page(params[:page]).per(4)
  end

  def new
    @content = Content.new
  end

  def update
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
