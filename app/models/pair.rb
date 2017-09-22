class Pair < ApplicationRecord
  has_many :users

  #create lonely students array


  def self.create_pairs
    @@lonely_students = []
    @users = User.where(admin: false)

    @users.each do |user|
      @@lonely_students.push(user.full_name)
    end
    i = 0
    @@pairs_today = []

    #take care of odd number of students
    if @@lonely_students.length % 2 != 0
      $lonely = @@lonely_students.pop
      @@lonely_students.insert((@@lonely_students.length/2 -1), $lonely)
    end

    #Roundrobin
    special_student = @@lonely_students.shift
    @@lonely_students.rotate!(-1)
    @@lonely_students.unshift(special_student)


    while i < (@@lonely_students.length/2)

      # pick two students
      student1 = @@lonely_students[i]
      student2 = @@lonely_students[(@@lonely_students.length - 1) - i]

      # create new instance of pair
      @new_pair = Pair.create!
      @new_pair.update(student1: student1)
      @new_pair.update(student2: student2)
      @new_pair.update(date: Date.today)

      # Pair array which will show in views
      @pair = []
      puts "Lonely: #{@@lonely_students}"
      @pair << student1
      @pair << student2
      @@pairs_today << @pair

      i += 1
      # Connect student1 to user1
      first_name1 = student1.split(' ')[0]
      last_name1 = student1.split(' ')[1]
      student_1 = User.find_by(first_name: first_name1, last_name: last_name1)
      student_1.update(pair_id: @new_pair.id)

      # Connect student2 to user2
      first_name2 = student2.split(' ')[0]
      last_name2 = student2.split(' ')[1]
      student_2 = User.find_by(first_name: first_name2, last_name: last_name2)
      student_2.update(pair_id: @new_pair.id)

      puts "Pairs today: #{@@pairs_today}"
    end
    return @@pairs_today
  end

end
