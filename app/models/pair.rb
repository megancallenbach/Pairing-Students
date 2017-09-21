class Pair < ApplicationRecord
  has_many :users

  @@lonely_students = []
  @users = User.where(admin: false)
  @users.each do |user|
    @@lonely_students.push(user.full_name)
  end
  @@pairs_today = []

  # def self.weekly_pairs
  #   i = 0
  #   while i < 6
  #     day = Date.today - i
  #     create_pairs(day)
  #     i += 1
  #   end
  # end


  def self.create_pairs()
    i = 0

    #roundrobin array each time function is called
    special_student = @@lonely_students.shift
    @@lonely_students.rotate!
    @@lonely_students.unshift(special_student)

    while i < (@@lonely_students.length/2)
      #pick two students from array
      student1 = @@lonely_students[i]
      student2 = @@lonely_students[i + (@@lonely_students.length / 2)]

      #add students pair attribute
      @new_pair = Pair.create!
      @new_pair.update(student1: student1)
      @new_pair.update(student2: student2)
      #@new_pair.update(date: day)

      #add students to pair array
      @pair = []
      @pair << student1
      @pair << student2
      @@pairs_today << @pair

      i += 1

      #update pair_id for user1
      first_name1 = student1.split(' ')[0]
      last_name1 = student1.split(' ')[1]
      student_1 = User.find_by(first_name: first_name1, last_name: last_name1)
      student_1.update(pair_id: @new_pair.id)

      #update pair_id for user2
      first_name2 = student2.split(' ')[0]
      last_name2 = student2.split(' ')[1]
      student_2 = User.find_by(first_name: first_name2, last_name: last_name2)
      student_2.update(pair_id: @new_pair.id)

      puts "Pairs today: #{@@pairs_today}"
    end
    return @@pairs_today
  end

end
