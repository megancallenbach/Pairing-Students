class Pair < ApplicationRecord
  has_many :users

      if @history.include? @pair || @pair.reverse
        @lonely_students.push(@user1, @user2)
      else
        @today_pairs << @match
        @history << @match
      end
      puts "Today pairs: #{@today_pairs}"
      puts "history #{@history}"
      puts "LSA #{@lonely_students}"
    end
      #add_pair_to_history(@@pair)
      #puts "history: #{@@history}"
      return @today_pairs
      #add_pair_today(@@pair)
      #puts "today: #{@@today_pairs}"
  end

  #def add_pair_to_history(pair)
    #if @@history.include? @@pair || @@pair.reverse
    #  @@lonely_students.push(@@user1, @@user2)
    #else
  #    @@history.push(@@pair)
  #  end
  #end

#   def add_pair_today(pair)
#     if @@history.include? @@pair || @@pair.reverse
#           @@lonely_students.push(@@user1, @@user2)
#       else
#           @@today_pairs.push(@@pair)
#       end
#   end
end
