require 'faker'

namespace :db do
  desc "Llenar base de datos con ejemplo"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(first_name: "Juan Carlos",
                 last_name: "Sanchez",
                 email: "jjuanchow@gmail.com",
                 password: "juancar1os",
                 password_confirmation: "juancar1os")
    99.times do |n|
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      email = "ejemplo-#{n+1}@muevete.org"
      password = "password111"
      User.create!(first_name: first_name,
                   last_name: last_name,
                   email: email,
                   password: password, 
                   password_confirmation: password)
    end
  end
end