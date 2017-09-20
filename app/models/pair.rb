class Pair < ApplicationRecord
  has_many :users



  def lonely_students
    @lonely_students = []
    @history = []
    @today_pairs = []
    @users = User.where(admin: false)
    @users.each do |user|
        @lonely_students.push(user.email)
        puts "Initial lonely students: #{@lonely_students}"
    end
    create_pairs(@lonely_students)
  end

  def create_pairs(lonely_student)
      @pair = Pair.create!
      while @lonely_students.length > 1
			@user1 = @lonely_students[rand(0..((@lonely_students.length) - 1))]
      puts "First user has been chosen #{@user1}"

      @pair.update(student1: @user1)

			@lonely_students.delete(@user1)
      puts "First user has been taken #{@lonely_students}"

			@user2 = @lonely_students[rand(0..((@lonely_students.length) -1))]
      puts "Second user: #{@user2}"

			@lonely_students.delete(@user2)
      puts "Second user has been token: #{@lonely_students}"

      @pair.update(student2: @user2)

      @today_pairs = []
			@today_pairs << @pair

      puts "pair: #{@pair}"
      #eval("var#{i} = #{@pair}", b)
    #  puts eval("var0", b)

    end
      #add_pair_to_history(@pair)
      #puts "history: #{@history}"
      return @today_pairs
      #add_pair_today(@pair)
      #puts "today: #{@today_pairs}"
  end

  #def add_pair_to_history(pair)
    #if @history.include? @pair || @pair.reverse
    #  @lonely_students.push(@user1, @user2)
    #else
  #    @history.push(@pair)
  #  end
  #end

#   def add_pair_today(pair)
#     if @history.include? @pair || @pair.reverse
#   		@lonely_students.push(@user1, @user2)
#   	else
#   		@today_pairs.push(@pair)
#   	end
#   end
end
