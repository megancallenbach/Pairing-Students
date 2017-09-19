class Pair < ApplicationRecord
  has_many :users

  def lonely_students
    @@lonely_students = []
    @@history = []
    @@pair = Pair.create!
    @@pair = []
    @@today_pairs = []

    users = User.all
    users.each do |user|
        @@lonely_students.push(user.full_name)
    end
    create_pairs(@@lonely_students)
  end

  def create_pairs(lonely_student)
    while @@lonely_students.length > 1

			@@user1 = @@lonely_students[rand(0..((@@lonely_students.length) - 1))]

			@@lonely_students.delete(@@user1)

			@@user2 = @@lonely_students[rand(0..((@@lonely_students.length) -1))]

			@@lonely_students.delete(@@user2)
			@@pair << @@user1
      @@pair << @@user2
    end
    add_pair_to_history(@@pair)
    add_pair_today(@@pair)
  end

  def add_pair_to_history(pair)
    if @@history.include? @@pair || @@pair.reverse
      @@lonely_students.push(@@user1, @@user2)
    else
      @@history.push(@@pair)
    end
  end

    def add_pair_today(pair)
      if @@history.include? @@pair || @@pair.reverse
    		@@lonely_students.push(@@user1, @@user2)
    	else
    		@@today_pairs.push(@@pair)
    	end
    end
end
