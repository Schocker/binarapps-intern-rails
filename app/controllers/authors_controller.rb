class AuthorsController < ApplicationController
  def index
    @authors = Author.all
    @author = Author.new
  end

  def show
    @author = Author.find(params[:id])
  end

  def new 
    @author = Author.new
  end

  def create 
    @author = Author.create(author_params)
    if request.format.html?
      if @author.save
        redirect_to authors_path, notice: 'Author was created'
      else
        render :new
      end
    end
  end
  
  def edit 
    @author = Author.find(params[:id])
  end

  def update 
    @author = Author.find(params[:id])
    if @author.update(author_params)
      redirect_to authors_path, notice: 'Author was updated'
    else
      render :edit
    end
  end

  def destroy
    @author = Author.find(params[:id]).destroy
    if request.format.html?
      if @author.destroy
        redirect_to authors_path, notice: 'Author was destroyed'
      else
        redirect_to authors_path, alert: 'Author could not be destroyed'
      end
    end
  end

  private
  def author_params
    params.require(:author).permit(:name, :surname, :age)
  end
end
