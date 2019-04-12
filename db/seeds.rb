User.create!(name: "Example User", email: "example@railstutorial.org",
  password: "foobar", password_confirmation: "foobar", role: 1)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name, email: email, password: password,
    password_confirmation: password)
end

Category.create!(name: "Hamberger" )
Category.create!(name: "Sanwich")
Category.create!(name: "Banh My")
Category.create!(name: "Ga KFC")
Category.create!(name: "Cafe")
Category.create!(name: "Thuc uong co ga")
