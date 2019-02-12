class CalcController < ApplicationController
   def flex_square
    #the paratmeters look like this: {"the_num"=>"42"}
    # Rails put that has in a variable called params
    # params = {"the_num" => "42"}
    
    @num = params.fetch("the_num").to_f
    @square = @num * @num
    
    
   render("calc_templates/flexible_square.html.erb")
   end
   
   def flex_square_root
   
    @num = params.fetch("the_num").to_f
    @square_root = @num**(0.5)
    
     render("calc_templates/flexible_square_root.html.erb")
   end
   
   def flex_payment
   
    @interest = params.fetch("the_interest").to_f/100 
    @monthly_interest = @interest/ 12 / 100
    @principle = params.fetch("the_principle").to_f
    @term = params.fetch("the_term").to_f
    @number_payments = @term * 12
    @payment = ((@principle * @monthly_interest) / (1 - (1+@monthly_interest)**(@number_payments*-1))).round(2)
    
    
    render("calc_templates/flexible_payment.html.erb")
   end
   
    def flex_random
   @small = params.fetch("small_number").to_i
   @big = params.fetch("big_number").to_i
   @random = rand(@big-@small)
   
    
    render("calc_templates/flexible_random.html.erb")
    end
   
   def square_form_results
       @the_input_number = params.fetch("user_number").to_f
       @the_answer = @the_input_number ** 2
       
       render("calc_templates/square_results.html.erb")
   
   end
   
   def blank_square_form
   
   render("calc_templates/square_form.html.erb")
   end
   
   def blank_root_form
   
   render("calc_templates/root_form.html.erb")
   end
   
   def root_form_results
       @the_input_number = params.fetch("user_number").to_f
       @the_answer = @the_input_number ** (0.5)
       
       render("calc_templates/square_results.html.erb")
   
   end
   
    def blank_square_form
   
   render("calc_templates/square_form.html.erb")
    end
   
   def blank_payment_form
   
   render("calc_templates/payment_form.html.erb")
   end
   
   def payment_form_results
       @apr = params.fetch("user_apr").to_f
       @principal = params.fetch("user_principal").to_f
       @term = params.fetch("user_term").to_f
      @monthly_interest = @apr / 12 / 100
      @number_payments = @term * 12
      @payment = ((@principal * @monthly_interest) / (1 - (1+@monthly_interest)**(@number_payments*-1))).round(2)
       
       render("calc_templates/payment_results.html.erb")
   
   end
   
end