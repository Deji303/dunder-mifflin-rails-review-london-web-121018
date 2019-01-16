class DogsController < ApplicationController
  def index
    @dogs = Dog.all
    @scooby = @dogs.each.sort_by{|d| d.employees.count}

  end

  def show
    @dog = Dog.find(params[:id])
    # byebug
  end
end
