module QAndAMachine
  class QuestionsController < ApplicationController
    def index
      @questions = QAndAMachine::Assertion.all
    end

    def new
      @question = QAndAMachine::Assertion.new
    end

    def create 
      @question = QAndAMachine::Assertion.create(params[:question])
      flash[:notice] = 'Assertion has been created!'
      redirect_to @question
    end

    def show
      @question = QAndAMachine::Assertion.find(params[:id])
    end
  end
end
