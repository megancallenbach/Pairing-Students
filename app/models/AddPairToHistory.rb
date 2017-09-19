class AddPairToHistory < CreatePairs
  def add_pair_to_history
    if @@history.include? @@pair || @@pair.reverse
      @@lonely_students.push(@@user1, @@user2)
    else
      @@history.push(@@pair)
    end
  end
