class Pair < ApplicationRecord
  has_many :users


  def lonely_students

  end

  def create_pairs_today
		@history = []
		@today_pairs = []
    users = User.all
    @lonely_students = []

    users.each do |user|
      if user.profile.nil?
        @lonely_students.push(user.email)
      else
        @lonely_students.push(user.full_name)
      end
    end

		while @lonely_students.length > 1

			user1 = @lonely_students[rand(0..((@lonely_students.length) - 1))]

			@lonely_students.delete(user1)

			user2 = @lonely_students[rand(0..((@lonely_students.length) -1))]

			@lonely_students.delete(user2)
      @pair = Pair.create!
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
