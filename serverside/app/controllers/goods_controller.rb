# -*- encoding : utf-8 -*-
class GoodsController < ApplicationController
  def index
    @goods = Good.all[0..rand(9)]
    sleep 1
    render json: @goods, :only => [:id, :title]
  end

  def show
    @good = Good.find(params[:id])
    sleep 3
    render json: @good
  end
end
