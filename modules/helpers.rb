module Helpers
  def continue?
    print "\nDo you wish to continue? [Y/N]: "
    answer = gets.chomp

    if answer.downcase == 'y' || answer.downcase == 'yes' || answer == ''
      clear
      prompt_user
    else
      exit
    end
  end

  def invalid_prompt
    clear
    puts 'Incorrect selection, please try again!'
    sleep 1
  end

  def clear
    print "\e[2J\e[f"
  end

  def exit
    clear
    puts "\nGood Bye (:......\n\n"
    nil
  end
end
