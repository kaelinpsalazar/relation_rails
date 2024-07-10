class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
    
    @books = @author.books
  end

  def new 

  end

  def create
      @authors= Author.create(author_params)
      @authors.save
      
      redirect_to "/authors"
  end

  def author_params
    params.permit(:name, :deceased, :age)
  end
end