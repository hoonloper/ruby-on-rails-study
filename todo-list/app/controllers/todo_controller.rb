class TodoController < ApplicationController
  def index
    @todos = Todo.all
  end

  def detail
    @todo = Todo.find(params[:id])
  end

  def new
    todo = Todo.new
    todo.title = params[:title]
    todo.content = params[:content]
    todo.save

    redirect_to "/index"
  end
end
