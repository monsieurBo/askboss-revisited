require 'csv'

class Person
  attr_reader :first_name, :last_name, :email, :phone, :created_at
  def intialize
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone = phone
    @created_at = created_at
  # Look at the CSV file
  # What attributes should a Person object have?
end

class PersonParser
  attr_reader :file
  attr_accessor: people

  def initialize(file)
    @file = file  
    @people = nil
  end

  def people
    # If we've already parsed the CSV file, don't parse it again.
    # Remember: @people is +nil+ by default.
    return @people if @people
    @people = []

    CSV.foreach(@people) do |row|
      @people << Person.new(row[1], row[2], row[3], row[4], row[5])
    # We've never called people before, now parse the CSV file
    # and return an Array of Person objects here.  Save the
    # Array in the @people instance variable.
  end
end

parser = PersonParser.new('people.csv')
people

puts "There are #{parser.people.size} people in the file '#{parser.file}'."
