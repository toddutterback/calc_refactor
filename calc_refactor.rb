#variables
Calc_intro = "----Welcome to the Ruby Calculator----\n--Enter equation below. Please use spaces--"
Which_operator = "Choose your operator (+ - * /)"
Second_number = "Second number?"
@operator_array = ["+", "-", "*", "/"]

#==========Main Page=================
def main_calc
  while true do 
    puts Calc_intro
    input = gets.chomp
    values = input.split(" ")
      @first_num = values[0]
      @operator_in = values[1]
      @second_num = values[2]
    calc_answer
  end 
end

#==========Calculator Answer Function==============
def calc_answer
  operator_hash = { "+" => @first_num.to_f + @second_num.to_f, "-" => @first_num.to_f - @second_num.to_f, "*" => @first_num.to_f * @second_num.to_f,"/" => @first_num.to_f / @second_num.to_f}
    case @operator_in
      when @operator_in == "/" && @second_num.to_i == 0
        puts "LOLzzz nice try Champ"
        main_calc
      else 
       formula = operator_hash.values
       puts "#{formula}"
    end   
    continue    
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
    main_calc
  when 3
    puts "Thank you, come again"
    exit(0)
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

main_calc
