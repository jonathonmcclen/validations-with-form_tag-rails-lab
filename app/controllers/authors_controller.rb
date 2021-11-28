class AuthorsController < ApplicationController

  def show
    @author = Author.find(params[:id])
    render "/authors/show"
  end

  def new
    @author = Author.new
    render "/authors/new"
  end

  def create
    @author = Author.new(author_params)
    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  def edit
    @author = Author.find(params[:id])
    render "/authors/edit"
  end

  def update
    @author = Author.find(params[:id])
    
    if @author.update(author_params)
      redirect_to author_path(@author)
    else
      render edit_author_path(@author)
    end
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
