class Pair < ApplicationRecord
  has_many :users

  def create_pair
<<<<<<< HEAD
    @lonely_students = [@user.email]

    pair = Pair.new
=======
    @lonely_students = ["Megan", "Mimi", "Bob", "Charles", "Lila", "Lola"]
    @students = @users
    user1 = @students[rand(0..((@students.length) - 1))]

    @students.delete(user1)

    user2 = @students[rand(0..((@students.length) -1))]

    @students.delete(user2)

    @pair = [user1, user2]

    return @pair
>>>>>>> 9be48f03274e14868dc9b5d0a601ab00451cd983

  end

  def create_pairs_today
		@history = []
		@lonely_students = ["Megan", "Mimi", "Bob", "Charles", "Lila", "Lola"]
		@today_pairs = []
		while @lonely_students.length > 1

			user1 = @lonely_students[rand(0..((@lonely_students.length) - 1))]

			@lonely_students.delete(user1)

			user2 = @lonely_students[rand(0..((@lonely_students.length) -1))]

			@lonely_students.delete(user2)
<<<<<<< HEAD

      @pair = Pair.create!
=======
      # @pair = Pair.create!
>>>>>>> 9be48f03274e14868dc9b5d0a601ab00451cd983
			@pair = [user1, user2]

			if @history.include? @pair || @pair.reverse
				@lonely_students.push(user1, user2)
			else
				@today_pairs.push(@pair)
				@history.push(@pair)
			end

		end
    return @today_pairs
	end
end
