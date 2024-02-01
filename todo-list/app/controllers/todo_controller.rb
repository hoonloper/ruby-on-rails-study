class TodoController < ApplicationController
  def index
    @todos = Todo.all
    return
  end

  def detail
    @todo = Todo.find(params[:id])
  end

  def new
    todo = Todo.new
    todo.title = params[:title]
    todo.content = params[:content]
    todo.save

    redirect_to root_path
    nil
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
ㅎ    todo = Todo.find(params[:id])

    if todo.update(todo_params)
      # 업데이트가 성공한 경우
      redirect_to root_path, notice: '사용자 정보가 업데이트되었습니다.'
    else
      # 업데이트가 실패한 경우
      render "/edit/#{todo.id}"
    end
  end

  def todo_params
    params.permit(:title, :content)
  end
end
