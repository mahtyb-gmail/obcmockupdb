namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    20.times do |n|
      puts "[DEBUG] creating user #{n+1} of 20"
      email = "user-#{n+1}@example.com"
      password = "password"
      user = User.create!( email: email,
                    password: password,
                    password_confirmation: password)
      user_id = user.id

      puts "[DEBUG] creating profile for user with id =  #{user_id} "

      name = Faker::Name.name
      location = %w("Los Angeles, CA" "New York, NY" "London, UK" "Paris, France" "Vancouver, B.C." "San Francisco, CA" "Miami, FL").sample
      title = Faker::Name.title
      about_me = Faker::Lorem.paragraph
	
      profile = Profile.create!( name: name, 
			location: location, 
			title: title, 
			about_me: about_me, 
			user_id: user_id )

      profile_id = profile.id

      puts "[DEBUG] creating bio for user with profile_id = #{profile_id}"
	skillset = (1..29).to_a
	fourand = skillset.sort{ rand() - 0.5}[ 0..3]
	4.times do |x|
		skill_id = fourand[x]
      		bio = Bio.create!( profile_id: profile_id, skill_id: skill_id )
	end
    end

    30.times do |n|
	puts "[DEBUG] creating sample project #{n+1} of 30"

	# Generate random project name such as "Cool action-documentary"
	desc = %w(Cool Awesome Crazy Exciting Incredible Scary).sample
	type1 = %w(action drama comedy biopic documentary adventure crime horror sci-fi western ).sample
	type2 = %w(action drama comedy biopic documentary adventure crime horror sci-fi western ).sample
	project_name = desc + " " +  type1 + "-" + type2

	# Give it a valid length and type
	length = ["Feature", "TV Pilot", "Episode", "Short", "Spot"].sample
	project_type = [ "Fiction", "Nonfiction", "Art/Experimental"].sample

	# Give it a location
        hometown = ["Los Angeles, CA", "New York, NY", "London, UK", "Paris, France", 
			"Vancouver, B.C.", "San Francisco, CA", "Miami, FL"].sample

	# Fill in the details and schedule info with random Lorem Ispum text
        details = Faker::Lorem.paragraph
        schedule_info = Faker::Lorem.paragraph

	# Have all the random projects start today
	startdate = Date.today

	# Assign project to random user from above
	# First step, pick a number between 1 and 20

 	sid = (1..20).to_a.sample

	#
	# Second step find user-(RANDOM NUMBER)@example.com in database
	# 	user = User.find_by_email("user-#{sid}@example.com")
	#	
	
	user = User.find_by_email("user-#{sid}@example.com")

	# Need user id for that user

	user_id = user.id


	# All random data generated, create project
	
	project = Project.create( name: project_name, length: length, project_type: project_type, hometown: hometown, 
		details: details, startdate: startdate, schedule_info: schedule_info, user_id: user_id )

	fourand = (1..29).to_a.sort{ rand() - 0.5}[0..3]
	4.times do |x|
		skill_id = fourand[x]
      		requirement = Requirement.create!( project_id: project.id, skill_id: skill_id )
      end
    end
  end
end
