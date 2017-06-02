class InterestCalculatorController < ApplicationController
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend  ActiveModel::Naming

  validates :a_0, :b_0, :a_1, :b_1, numericality: { only_integer: true }


  def new
    # If accepted parameter is integer, then it shows in view as 5, when it
    # is float, it shows as 5.1  
    @first_0   = params[:a_0].to_f % 1 != 0 ? params[:a_0].to_f : params[:a_0].to_i
    @second_0  = params[:b_0].to_f % 1 != 0 ? params[:b_0].to_f : params[:b_0].to_i

    @first_1   = params[:a_1].to_f % 1 != 0 ? params[:a_1].to_f : params[:a_1].to_i
    @second_1  = params[:b_1].to_f % 1 != 0 ? params[:b_1].to_f : params[:b_1].to_i
    
    @first_2   = params[:a_2].to_f % 1 != 0 ? params[:a_2].to_f : params[:a_2].to_i         
    @second_2  = params[:b_2].to_f % 1 != 0 ? params[:b_2].to_f : params[:b_2].to_i  


    # @first_0   = params[:a_0]
    # @second_0  = params[:b_0]
    # @first_1   = params[:a_1]
    # @second_1  = params[:b_1]

    # integer_float_converter(@first_0, @second_0, @first_1, @second_1)

    # result = @first_0, @second_0, @first_1, @second_1 

    # integer_float_converter(*result)

    # @first_0, @second_0, @first_1, @second_1 = result

    number_to_number(@first_0, @second_0) 

    persent_from_number(@first_1, @second_1)

    render :index
  end

 private 

  # def integer_float_converter(*result)
  #   result = [:a_0, :b_0, :a_1, :b_1].map do |key|
  #     value = params[key].to_f
  #     value % 1 == 0 ? value.to_i : value
  #   end
  # end

   def number_to_number(a = 0, b = 0)   
    # If the first number is zero, it sends 0% answer. If the second number is zero 
    # and the first number is nonzero, it sends infinity. Otherwise simple formula calculation.
    if a.zero?
      @result_0 = 0
    elsif b.zero?
      @result_0 = "infinity"
    else
      @result_0 = a.to_f / b.to_f * 100
    end

  end

   def persent_from_number(a = 0, b = 0) 
    # If the first or second number is zero, it sends 0% answer.Otherwise simple formula calculation.
    if a.zero? || b.zero?
      @result_1 = 0
    else
      @result_1 = b.to_f / 100 * a.to_f 
    end
  end  
end

