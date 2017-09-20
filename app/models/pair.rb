class Pair < ApplicationRecord
  has_many :users

  @@lonely_students = []
  @users = User.where(admin: false)
  @users.each do |user|
    @@lonely_students.push(user.full_name)
  end
  @@pairs_today = []

  def create_pairs
    i = 0

    puts "Lonely: #{@@lonely_students}"
    special_student = @@lonely_students.shift
    puts "Special student #{special_student}"
    @@lonely_students.rotate!
    puts "Lonely: #{@@lonely_students}"
    @@lonely_students.unshift(special_student)
    while i < (@@lonely_students.length/2)
      @new_pair = Pair.create!
      student1 = @@lonely_students[i]
      student2 = @@lonely_students[i + (@@lonely_students.length / 2)]
      @pair = []
      puts "Lonely: #{@@lonely_students}"
      @pair << student1
      @pair << student2
      @@pairs_today << @pair
      i += 1

      first_name1 = student1.split(' ')[0]
      last_name1 = student1.split(' ')[1]
      student_1 = User.find_by(first_name: first_name1, last_name: last_name1)
      student_1.update(pair_id: @new_pair.id)
      first_name2 = student2.split(' ')[0]
      last_name2 = student2.split(' ')[1]
      student_2 = User.find_by(first_name: first_name2, last_name: last_name2)
      student_2.update(pair_id: @new_pair.id)

      puts "Pairs today: #{@@pairs_today}"
    end
    return @@pairs_today
  end
end
