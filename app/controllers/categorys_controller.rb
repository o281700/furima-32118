class CategorysController < ApplicationController
  def index
    @categorys = Category.where(id: 2..10)
  end
end
