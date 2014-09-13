namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		admin = User.create!(name:"test",
								email:"test@test.jp",
								password:"foobar",
								password_confirmation:"foobar")
								admin: true)

		19.times do|n|
			name = Faker::Name.name
			p name
			email = "test-#{n+1}@test.jp"
			password = "password"
			User.create!(name:name,
									email:email,
									password:password,
									password_confirmation:password)
		end
	end
end
