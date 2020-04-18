class PagesController < ApplicationController
  def index
    @last_articles = Article.last(3)
  end

  def contact
  end

  def about
  end

end
