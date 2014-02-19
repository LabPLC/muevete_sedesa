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

    Action.create!(name: "Accion Saludable 1", desc: "Esta es una accion saludable que puedes checar blablablab", points: 20, level: 1)
    30.times do |n|
      name = Faker::Lorem.sentence(1)
      desc = Faker::Lorem.sentence(6)
      points = n + 10
      level = 1
      if n >= 10 && n < 20
        level = 2
      elsif n >= 20
        level = 3
      else 
        level = 1
      end
      canj = true
      if n > 20
        canj = false
      end 
      Action.create!(name: name,
                     desc: desc,
                     points: points,
                     level: level,
                     canjeable: canj)

    end
  end
end