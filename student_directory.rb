old_sync = $stdout.sync
$stdout.sync = true

@students = [] # list

def input_data
  @students.each do |student|
  File.open("students_directory.csv", "a") { |file| file.puts "#{obj[:user_name_input]}, #{obj[:user_age_input]}, #{obj[:user_gender_input]}" }
  prompt_entry
  end
end

def print_menu
  puts "\n1 - Add student names to the list."
  puts "2 - Show list of students."
  puts "3 - Edit student details."
  puts "4 - Clear student list."
  puts "5 - Exit program.\n\n"
end

def student_name
  puts "Please enter Student's Full Name:"
  user_name_input = gets.chomp
end

def student_age
  puts "Please enter Student's Age:"
  user_age_input = gets.chomp.to_i
  puts "#{user_age_input} years."
end

def student_gender
  puts "Please enter Student's Gender:"
  puts "Press F for Female."
  puts "Press M for Male."
  user_gender_input = gets.chomp
end


def add_list
  @students << {name: user_name_input, age: user_age_input, gender: user_gender_input}
  puts "We have #{@students.count} students in the list."
end


def prompt_entry
  puts "Do you wish to add more student"
  puts "Press Y for Yes."
  puts "Press N for No."

  answer = gets.chomp
  if answer.upcase == "Y"
    student_name
    student_age
    student_gender
    add_list
    prompt_entry
  else
    exit
  end
end



print_menu
student_name
student_age
student_gender
prompt_entry
add_list
input_data
print(@students)
