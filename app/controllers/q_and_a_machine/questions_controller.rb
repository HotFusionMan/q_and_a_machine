module QAndAMachine
  class QuestionsController < ApplicationController
    def index
      @questions = QAndAMachine::Question.all
    end

    def new
      @question = QAndAMachine::Question.new
    end

    def create 
      @question = QAndAMachine::Question.create(params[:question])
      flash[:notice] = 'Question has been created!'
      redirect_to @question
    end

    def show
      @question = QAndAMachine::Question.find(params[:id])
    end
  end
end
