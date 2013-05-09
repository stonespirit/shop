# -*- encoding : utf-8 -*-
class GoodsController < ApplicationController
  def index
    @goods = Good.all
    render json: @goods, :only => [:id, :title, :price]
  end

  def show
    @good = Good.find(params[:id])
    render json: @good
  end
end
