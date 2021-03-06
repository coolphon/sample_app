namespace :db do
  desc "Dill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!( :name => "Example User",
                  :email => "example@user.org",
                  :password => "foobar",
                  :password_confirmation => "foobar",
                  :surname => "user",
                  :postalcode => "00-000")
    admin.toggle!(:admin)
    User.create!( :name => "Example User",
              :email => "user@user.org",
              :password => "foobar",
              :password_confirmation => "foobar",
              :surname => "user",
              :postalcode => "00-000")
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@user.org"
      password = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password,
                   :surname => "user",
                   :postalcode => "00-000")
    end
  end
end

