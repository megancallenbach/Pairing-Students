class Pair < ApplicationRecord
  has_many :users

  def create_pairs_today
		@history = []
		@lonely_students = ["Megan", "Mimi", "Bob", "Charles", "Lila", "Lola"]
		@today_pairs = []
		while @lonely_students.length > 1

			user1 = @lonely_students[rand(0..((@lonely_students.length) - 1))]

			@lonely_students.delete(user1)

			user2 = @lonely_students[rand(0..((@lonely_students.length) -1))]

			@lonely_students.delete(user2)

			pair1 = [user1, user2]

			if @history.include? pair1 || pair1.reverse
				@lonely_students.push(user1, user2)
			else
				@today_pairs.push(pair1)
				@history.push(pair1)
			end

		end
    return @today_pairs
	end
end
