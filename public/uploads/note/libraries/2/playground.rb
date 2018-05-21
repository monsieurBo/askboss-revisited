# if you have not installed the needed gems, please do the following:
# gem install sqlite3
# gem install activerecord

require "sqlite3"
require "active_record"

# this line configures ActiveRecord to connect to a sqlite3 database in the same folder named "students.sqlite3"
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => "./students.sqlite3")

# This sets up ActiveRecord to use Ruby OOP with SQL data
class Student < ActiveRecord::Base
end

####################################
# Write your test code here

# 1. Create a new student using new and save
# a = Student.new(name: 'John Doe', email: 'john.doe@email.com', age: "30")
# a.save
# p a

# 2. Create a new student using create
# a = Student.create(name: 'Jane Doe', email: 'jane.doe@email.com', age: "22")
# p a

# 3. Select all students
# pay attention to the object that is returned to you, is it a Student object or Active Record relation object?
# p Student.all

# Why can't you do Student.name or Student.email?
# p Student.name
# p Student.where(name: "Rod Harvey")
# p Student.where(email: "myrna_bernier@leuschke.co")
# p Student.find(12)
# p Student.find_by(email: "myrna_bernier@leuschke.co")
# p Student.find_by_email("myrna_bernier@leuschke.co")
# p Student.find_by(name: "Rod Harvey")
# p Student.find_by_name("Rod Harvey")

# 4. Select the first student
# pay attention to the object that is returned to you, is it a Student object or Active Record relation object?
# p Student.first

# 5. Select the last student
# pay attention to the object that is returned to you, is it a Student object or Active Record relation object?
# p Student.last

# 6. Use each to iterate through the #<ActiveRecord::Relation> object to display the name of each student
# students = Student.all

# students.each do |student|
# 	p student.name
# 	p "~~~~~~~~~~~"
# end

# 7. Find student by the name Dr. Lois Pfeff using where.
# pay attention to the object that is returned to you, is it the Student object or Active Record relation object?
# p student = Student.where(name: "Dr. Lois Pfeff")
# What will the following return to you? (remember to comment out the code!)
# p student.id
# p student.name
# p student.email
# p student.age


# 8. Find student by name using find_by
# pay attention to the object that is returned to you, is it the Student object or Active Record relation object?
# p student = Student.find_by(name: "Dr. Lois Pfeff")
# What will the following return to you?
# p student.id
# p student.name
# p student.email
# p student.age

# Do research on the difference between "where" and "find_by".

# 9. Find the student with id = 7 using find and find_by
# pay attention to the object that is returned to you, is it the User object or Active Record relation object?
# p Student.find(7)
# p Student.find_by(id: 7)
# p Student.find_by_id(7)


# 10. Update information for student with id = 5 using student.email and save. Change the student's email to elsie@example.com
# a = Student.find(5)
# a.email = "elsie@example.com"
# a.save
# p a

# 11. Now use update to update this student's age to 21.
# p a = Student.find(6)
# a.update(age: 31)
# p a

# 12. Delete student with id 21 using delete
# a.delete
# p b = Student.find(5)

# 13. Delete student with id 22 using destroy
# Student.destroy(22)
# p Student.find(22)
# p Student.all.count
