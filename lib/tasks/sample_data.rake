namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		make_users
		make_microposts
	end
end

def make_users
	admin = User.create!(name:"test",
							email:"test@test.jp",
							password:"foobar",
							password_confirmation:"foobar",
							admin:true)

	99.times do|n|
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

def make_microposts
	users = User.all.limit(6)
	50.times do
		content = Faker::Lorem.sentence(5)
			users.each {|user| user.microposts.create!(content:content)}
	end
end

def make_relationships
	users = User.all
	user = users.first
	followed_users = users[2..50]
	followers = users[3..40]
	followed_users.each{ |followed| user.follow!(followed)}
	followers.each { |follower| follwer.follow!(user)}
end
