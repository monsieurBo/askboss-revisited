# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

user = {}
user['password'] = '1234'

ActiveRecord::Base.transaction do
  10.times do 
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email
    user['role'] = rand(1..2)
    user['qualification'] = Faker::Educator.course

    User.create(user)
  end
end 

# Seed followers
Follow.create(follower_id: 1, following_id: 2)
Follow.create(follower_id: 1, following_id: 3)
Follow.create(follower_id: 3, following_id: 1)

# Seed Question
question = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    question['title'] = Faker::HowIMetYourMother.quote
    question['description'] = Faker::ChuckNorris.fact

    question['user_id'] = uids.sample

    Question.create(question)
  end
end

# Seed Answer
answer = {}
qids = []
Question.all.each { |q| qids << q.id }


ActiveRecord::Base.transaction do
  100.times do 
    answer['answer'] = Faker::FamilyGuy.quote
    answer['anonymous'] = rand(0..1)

    answer['user_id'] = uids.sample
    answer['question_id'] = qids.sample

    Answer.create(answer)
  end
end

# Seed Vote
vote = {}
aids = []
Answer.all.each { |a| aids << a.id }

ActiveRecord::Base.transaction do
  500.times do 
    vote['vote'] = rand(0..1)

    vote['user_id'] = uids.sample

    r_vote = rand(0..1)
    if r_vote == 0
    	vote['question_id'] = qids.sample
    else
    	vote['answer_id'] = aids.sample
    end

    Vote.create(vote)
  end
end

# Seed quizzes
quiz = {}

ActiveRecord::Base.transaction do
  10.times do 
    quiz['name'] = Faker::Book.title

    quiz['user_id'] = uids.sample

    Quiz.create(quiz)
  end
end

# Seed problems
problem = {}
qzids = []
Quiz.all.each { |qz| qzids << qz.id }

ActiveRecord::Base.transaction do

  50.times do 
    problem['question'] = Faker::NewGirl.quote

    Problem.create(problem)
  end

  qzids.each do |i|
    if !Problem.where(quiz_id: nil).empty?
      while Quiz.find(i).problems.count < 5
        pids = []
        Problem.where(quiz_id: nil).each { |p| pids << p }
        pids.sample.update!(quiz_id: i)
      end
    end
  end

end

# Seed solutions
solution = {}
pids = []
Problem.all.each { |p| pids << p.id }

ActiveRecord::Base.transaction do

  200.times do
    r_sol = rand(0..1)
    if r_sol == 0
      solution['answer'] = Faker::Science.scientist
    else
      solution['answer'] = Faker::LordOfTheRings.character
    end

    solution['correct'] = rand(0..1)

    Solution.create(solution)
  end

  pids.each do |i|
    if !Solution.where(problem_id: nil).empty?
      while Problem.find(i).solutions.count < 4
        sids = []
        Solution.where(problem_id: nil).each { |s| sids << s }
        sids.sample.update!(problem_id: i)
      end
    end
  end

end

# Seed flashcards
fcards = {}

ActiveRecord::Base.transaction do
  10.times do 
    fcards['name'] = Faker::Science.element

    fcards['user_id'] = uids.sample

    FlashCard.create(fcards)
  end
end

# Seed cards
card = {}
fids = []
FlashCard.all.each { |fc| fids << fc.id }

ActiveRecord::Base.transaction do
  100.times do 
    card['question'] = Faker::GameOfThrones.city
    card['answer'] = Faker::HarryPotter.character

    card['flash_card_id'] = fids.sample

    Card.create(card)
  end

  # fids.each do |i|
  #   if !Card.where(flash_card_id: nil).empty?
  #     while FlashCard.find(i).solutions.count < 10
  #   byebug
  #       cids = []
  #       Card.where(flash_card_id: nil).each { |c| cids << c }
  #       cids.sample.update!(flash_card_id: i)
  #     end
  #   end
  # end

end