# -*- encoding : utf-8 -*-
class Good < ActiveRecord::Base
  attr_accessible :title, :description, :price
end
