require 'date'

module Validation
  def self.valid_date(msg)
    date_format = '%d/%m/%Y'
    valid = false
    while valid != true
      print "#{msg} [DD/MM/YYYY]:"
      date = gets.chomp
      valid = begin
        Date.strptime(date, '%d/%m/%Y')
      rescue StandardError
        nil
      end
    end
    date
  end

  def self.valid_yes_no(msg)
    on_userchoice = ''
    until %w[Y N].include?(on_userchoice)
      print "#{msg}"
      on_userchoice = gets.chomp.capitalize
    end
  end
end
