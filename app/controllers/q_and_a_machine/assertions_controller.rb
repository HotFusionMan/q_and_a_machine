module QAndAMachine
  class AssertionsController < ApplicationController
    def index
      @assertions = QAndAMachine::Assertion.all
    end

    def new
      @assertion = QAndAMachine::Assertion.new
    end

    def create 
      @assertion = QAndAMachine::Assertion.create(params[:assertion])
      flash[:notice] = 'Assertion has been created!'
      redirect_to @assertion
    end

    def show
      @assertion = QAndAMachine::Assertion.find(params[:id])
    end
  end
end
