# -*- encoding : utf-8 -*-
class CustomizeGoods < ActiveRecord::Migration
  def change
    add_column :goods, :title, :string
    add_column :goods, :description, :text
    add_column :goods, :price, :float
  end
end
