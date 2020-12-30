class CategorysController < ApplicationController
  def index
    @categorys = Category.where(id: 2..11)
  end
end
