module V1
  class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :update, :destroy]

    # GET /todos
    def index
      # get current user todos
      @todos = current_user.todos.paginate(page: params[:page], per_page: 20)
      # @todos = Todo.all
      json_response(@todos)
    end

    # POST /todos
    def create
      # create todos beloging to current user
      @todo = current_user.todos.create!(todo_params)
      # @todo = Todo.create!(todo_params)
      json_response(@todo, :created)
    end

    # GET /todos/:id
    def show
      json_response(@todo)
    end

    # PUT /todos/:id
    def update
      @todo.update(todo_params)
      head :no_content
    end

    # DELETE /todos/:id
    def destroy
      @todo.destroy
      head :no_content
    end

    private
    def todo_params
      # whitelist params
      # remove 'created_by' from list of permitted parameters
      params.permit(:title)
      # params.permit(:title, :created_by)
    end

    def set_todo
      @todo = Todo.find(params[:id])
    end
  end
end
