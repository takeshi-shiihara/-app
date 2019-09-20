class EnglishController < ApplicationController

  def index
    @englishs = English.where('word LIKE(?)', "%%#{params[:keyword]}")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
  end

  def create
    @english = English.create(word: english_params[:word], meaning: english_params[:meaning])
    if @english.save
      redirect_to root_path, notice: '创建的单词!'
    else
      flash.now[:alert] = '単語が空です'
    end
  end

  private
  def english_params
    params.permit(:word, :meaning)
  end

end
