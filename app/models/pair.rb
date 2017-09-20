class Pair < ApplicationRecord
  has_many :users


    # create_pairs(@lonely_students)

  def create_pairs
    @lonely_students = []
    @users = User.where(admin: false)
    @users.each do |user|
      @lonely_students.push(user.full_name)
    end


    while @lonely_students.length > 1
      @history = []
      @today_pairs = []
      @pair = Pair.create!
      user1 = @lonely_students[rand(0..((@lonely_students.length) - 1))]
      puts "First user has been chosen #{user1}"

      first_name1 = user1.split(' ')[0]
      last_name1 = user1.split(' ')[1]
      # User.find_by(User.full_name: user1)


      user_1 = User.find_by(first_name: first_name1, last_name: last_name1)
      user_1.update(pair_id: @pair.id)
      # User.find_by(User.full_name: user1)

      @pair.update(student1: user1)


            @lonely_students.delete(user1)
      puts "First user has been taken #{@lonely_students}"

            user2 = @lonely_students[rand(0..((@lonely_students.length) -1))]
      puts "Second user: #{user2}"
      @pair.update(student2: user2)

      first_name2 = user2.split(' ')[0]
      last_name2 = user2.split(' ')[1]
      # User.find_by(User.full_name: user1)

      user_2 = User.find_by(first_name: first_name2, last_name: last_name2)
      user_2.update(pair_id: @pair.id)

            @lonely_students.delete(user2)
      puts "Second user has been token: #{@lonely_students}"

      puts "pair: #{@pair}"
      @today_pairs << @pair
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
