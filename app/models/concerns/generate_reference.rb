module GenerateReference
  extend ActiveSupport::Concern

  def generateReference(author, year)
    # Empty reference string
    ref = ""

    # Split authors to a hash with each name
    # "Kostet Juho, Pirttinen Nea" => ["Kostet Juho", " Pirttinen Nea"]
    a = author.split(",")

    # For each author, take the first letter from the first word
    # Author(s) listed as "Surname, FirstName", so this will take
    # the 'S' from 'Surname'
    a.each do |name|
      # Add the first letter of the authors surname to the reference string
      ref += name.split.first.first
    end

    # "Kostet Juho, Pirttinen Nea" becomes "KP"
    # Add the year. Year is an integer, so use .to_s to make it a string
    ref += year.to_s

    # Reference string is now something like 'KP2016'

    self.reference = ref

    byebug
    # Validate uniqueness of the generated reference
    # If the generated reference already exists, add a lowercase 'a'
    if (!self.valid?) #WIP, check error hash for related error
      ref += "a"
    end

    self.reference = ref

    # Validate uniqueness again
    while (!self.valid?) #WIP, check error hash for related error
      # If still not unique, change 'a' to 'b' etc.
      # "z".next will become "aa", thanks Ruby
      ref = ref.chomp(ref.last.last) + ref.last.last.next
      self.reference = ref
    end

    # Return the reference string
    ref

  end

end