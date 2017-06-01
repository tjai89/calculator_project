class InterestCalculatorController < ApplicationController
  def new
    # if accepted parameter is integer, then it shows in view as 5, when it
    # is a decimal, it shows as 5.1 
    @first  = params[:a].to_f % 1 != 0 ? params[:a].to_f : params[:a].to_i
    @second = params[:b].to_f % 1 != 0 ? params[:b].to_f : params[:b].to_i
    # if second number is zero, it sends 0% answer
    if @first.zero?
      @result = 0
    elsif @second.zero?
      @result = "infinity"
    else
      @result = @first / @second * 100
    end
    render :index
  end

end

