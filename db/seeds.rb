User.create!(user_name:  "ngoc1",
             email: "ngoc1@email.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

10.times do |n|
  name  = Faker::Name.name
  email = "User0#{n+1}@email.com"
  password = "123456"
  User.create!(user_name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

10.times do |n|
  name = Faker::Educator.subject
  Category.create!(tag: name)
end

20.times do |n|
  name = Faker::Educator.course_name
  description = Faker::Lorem.sentence(5)
  tag = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample
  price = [100000, 300000, 500000, 700000, 900000].sample
  Course.create!(name: name,
                 description: description,
                 category_id: tag,
                 price: price)
end

courses = Course.order(:created_at).take(8)
15.times do
  lesson_title = Faker::Educator.course_name
  courses.each {|course| course.lessons.create!(lesson_title: lesson_title)}
end

10.times do |n|
  courses.each {|course| 
    course.update_attributes buy_times: rand(20..50),
                             created_at: n.days.ago}
end

room = ["Toán", "Lý", "Hóa", "Anh", "Văn"]
5.times do |n|
  name = room[n]
  Chatroom.create!(name: name, support: true)
end
