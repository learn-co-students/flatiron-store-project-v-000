class CategoriesController < ApplicationController
  extend FriendlyId
  friendly_id :title, use: :slugged

  before_filter :set_category, only: [:show]

  def index
    @categories = Category.all
  end

  def show
  end

  private
  def set_category
    @category = Category.friendly.find(params[:id])
  end
end
