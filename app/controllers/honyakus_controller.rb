class HonyakusController < ApplicationController

  def index
    @englishs = English.where('word LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @honyaku = Honyaku.new
  end

  def create
    @honyaku = English.new
  end

  def search
  end
end
