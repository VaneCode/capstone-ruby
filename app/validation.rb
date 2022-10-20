require 'date'

module Validation
  def self.validation_date(msg)
    valid = false
    while valid != true
      begin
        print "#{msg} [DD/MM/YYYY]:"
        date = gets.chomp
        Date.strptime(date, '%d/%m/%Y')
      rescue ArgumentError
        puts 'You have input an invalid format date.'
      else
        valid = true
        return date
      end
    end
  end

  def self.valid_yes_no(msg)
    on_userchoice = ''
    until %w[Y N].include?(on_userchoice)
      print msg.to_s
      on_userchoice = gets.chomp.capitalize
    end
    on_userchoice
  end
end
