class PagesController < ApplicationController
  def index
    @last_articles = Article.last(3).reverse()
  end

  def contact
    @contact = Contact.new
  end

  def about
  end

end
