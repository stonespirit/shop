# -*- encoding : utf-8 -*-
class AddGoods < ActiveRecord::Migration
  def up
    10.times do |i|
      Good.create!(:title => "title_#{i}", :description => "description_#{i}", :price => i.to_f)
    end
  end

  def down
    Good.delete_all
  end
end
