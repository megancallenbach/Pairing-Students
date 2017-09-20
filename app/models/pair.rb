class Pair < ApplicationRecord
  has_many :users

  def create_history_array
    @history = []
    create_pairs = (@history, @lonely_students)
  end

  def lonely_students_array

    @lonely_students = []
    @users = User.where(admin: false)

    @users.each {|user| @lonely_students.push(user.full_name)}
    create_pairs = (@history, @lonely_students)

  end


def create_pairs(history, lonely_students)
    while @lonely_students.length > 1
      @today_pairs = []
      @pair = Pair.create!

      #pick a user, store as user 1
      user1 = @lonely_students[rand(0..((@lonely_students.length) - 1))]
      puts "First user has been chosen #{user1}"

      #connect user1 to actual user
      first_name1 = user1.split(' ')[0]
      last_name1 = user1.split(' ')[1]
      user_1 = User.find_by(first_name: first_name1, last_name: last_name1)
      user_1.update(pair_id: @pair.id)

      #add user1 to pair as student1
      @pair.update(student1: user1)

      #delete user 1 from lonely student1
      @lonely_students.delete(user1)
      puts "First user has been taken #{@lonely_students}"



      #pick a user, store as user 2
      user2 = @lonely_students[rand(0..((@lonely_students.length) -1))]
      puts "Second user: #{user2}"

      #connect user2 to actual user
      first_name2 = user2.split(' ')[0]
      last_name2 = user2.split(' ')[1]
      user_2 = User.find_by(first_name: first_name2, last_name: last_name2)
      user_2.update(pair_id: @pair.id)

      #delete user2 from lonely students
      @lonely_students.delete(user2)
      puts "Second user has been token: #{@lonely_students}"

      #dadd user2 to pair as student2
      @pair.update(student2: user2)






      #create variable that can be stored in arrays
      @match = [user1, user2]
      puts "match: #{@match}"

      #only add to array if match is not included in history array
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
