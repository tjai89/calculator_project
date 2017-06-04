class InterestCalculatorController < ApplicationController
  include ActiveModel::Validations

  validates :a_0, :b_0, :a_1, :b_1, :a_2, :b_2, :a_3, :b_3, numericality: { only_integer: true }



  def index
    @result_0 = 0
    @result_1 = 0    
  end

  def new

    respond_to do |format|
      format.html { render 'index.html.erb' }
      format.js
    end 

    # If accepted parameter is integer, then it shows in view as 5, when it
    # is float, it shows as 5.1  
    @first_0   = params[:a_0].to_f % 1 != 0 ? params[:a_0].to_f : params[:a_0].to_i
    @second_0  = params[:b_0].to_f % 1 != 0 ? params[:b_0].to_f : params[:b_0].to_i

    @first_1   = params[:a_1].to_f % 1 != 0 ? params[:a_1].to_f : params[:a_1].to_i
    @second_1  = params[:b_1].to_f % 1 != 0 ? params[:b_1].to_f : params[:b_1].to_i

    @first_2   = params[:a_2].to_f % 1 != 0 ? params[:a_2].to_f : params[:a_2].to_i         
    @second_2  = params[:b_2].to_f % 1 != 0 ? params[:b_2].to_f : params[:b_2].to_i

    @first_3   = params[:a_3].to_f % 1 != 0 ? params[:a_3].to_f : params[:a_3].to_i         
    @second_3  = params[:b_3].to_f % 1 != 0 ? params[:b_3].to_f : params[:b_3].to_i  

    # How many percent is number from the number 
    number_to_number(@first_0, @second_0) 

    # Which number corresponds to % of the number
    persent_from_number(@first_1, @second_1)

    # Add % to the number
    add_persent_to_number(@first_2, @second_2)

    # Subtract % out of number
    substract_persent_from_number(@first_3, @second_3)
  end

 private 

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


    def add_persent_to_number(a = 0, b = 0) 
    # If the first or second number is zero, it sends second number answer. If the second 
    # number is zer, it sends zero answer. Otherwise simple formula calculation.
      if a.zero? 
        @result_2 = b
      elsif b.zero? 
        @result_2 = 0
      else 
        @result_2 = b.to_f / 100 * a.to_f + b.to_f 
      end
    end

    def substract_persent_from_number(a = 0, b = 0)
      @result_3 = b.to_f - b.to_f / 100 * a.to_f
    end
  end  
end

