#variables
Calc_intro = "----Welcome to the Ruby Calculator----\n-enter equation, Please use spaces"
Which_operator = 'which operator would you like to use? (+ - * /)'
Second_number = "What is the second number you would like to use?"
@operator_array = ["+", "-", "*", "/"]

#==========Calculator Answer Function==============
def calc_answer
  if @operator_in == "/" && @second_num.to_i == 0
    puts "you cant divide by 0!!"
    main_page
  else
    case @operator_in
      when "+"
        @answer = @first_num.to_f + @second_num.to_f
      when "-"
        @answer = @first_num.to_f - @second_num.to_f
      when "*"
        @answer = @first_num.to_f * @second_num.to_f
      when "/"
        @answer = @first_num.to_f / @second_num.to_f
      else
        puts "Try Again"
    end
  end
end

#========MAIN PAGE===========
def main_page
    puts Calc_intro
    input = gets.chomp
    values = input.split(" ")
      @first_num = values[0]
      @operator_in = values[1]
      @second_num = values[2]
    calculator
end

#========WHICH OPERATOR==========
def operator
  puts Which_operator
  @operator_in = gets.strip
  if_operator(@operator_in)
end

def if_operator(operator_input)
  if @operator_array.include? operator_input
    second
  else
    puts 'not a valid operator (+ - * /)'
    operator
  end
end

#==========SECOND NUMBER===========
def second
  puts Second_number
  @second_num = gets.strip.to_f
    if @operator_in == "/" && @second_num == 0
      puts "you cant divide by 0 choose new second number"
      second
    else
    calculator
  end
end

#========Continue calculation with answer as @first_num===================
def continue
  puts "1. Continue\n2. Reset Calculator\n3. Exit"
  continue_var = gets.strip.to_i
  case continue_var
  when 1
    print"choose again "
    operator
  when 2
    main_page
  when 3
    puts "Thank you, come again"
  end
end

#============prints out calculator answer===============
def calculator
  puts "Calculating..."
  calc_answer
  puts "the result of #{@first_num} #{@operator_in} #{@second_num} is #{@answer}"
  @first_num = @answer
  continue
end

main_page
