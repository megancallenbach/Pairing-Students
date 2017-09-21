class Pair < ApplicationRecord
  has_many :users

  @@lonely_students = []
  @@pairs_today = []

  #create lonely student array
  @users = User.where(admin: false)
  @users.each do |user|
    @@lonely_students.push(user.full_name)
  end



  def create_pairs
    i = 0

    #roundrobin each time method is called
    special_student = @@lonely_students.shift
    @@lonely_students.rotate!
    @@lonely_students.unshift(special_student)

    while i < (@@lonely_students.length/2)
      #pick two students
      @new_pair = Pair.create!
      student1 = @@lonely_students[i]
      student2 = @@lonely_students[i + (@@lonely_students.length / 2)]

      #add students to pair array
      @pair = []
      @pair << student1
      @pair << student2
      @@pairs_today << @pair

      i += 1

      #add pair_id to user (student 1)
      first_name1 = student1.split(' ')[0]
      last_name1 = student1.split(' ')[1]
      student_1 = User.find_by(first_name: first_name1, last_name: last_name1)
      student_1.update(pair_id: @new_pair.id)

      #add pair_id to user (student 2)
      first_name2 = student2.split(' ')[0]
      last_name2 = student2.split(' ')[1]
      student_2 = User.find_by(first_name: first_name2, last_name: last_name2)
      student_2.update(pair_id: @new_pair.id)

    end
    return @@pairs_today
  end
end
