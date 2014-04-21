namespace :db do
  desc "Llenar base de datos con ejemplo"
  task :populate => :environment do
    require 'faker'
    make_users
    make_actions
    make_user_actions
    make_user_relationships

  end

  def make_users
    User.create!(first_name: "Juan Carlos",
                 last_name: "Sanchez",
                 email: "jjuanchow@gmail.com",
                 password: "juancar1os",
                 password_confirmation: "juancar1os")
    10.times do |n|
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

  def make_actions
    Action.create!(name: "Accion Saludable 1", desc: "Esta es una accion saludable que puedes checar blablablab", points: 20, level: 1)
    Action.create!(name: "Campaña de vacunación 1", desc: "Qué bueno que estas consciente de tu salud.
                                                            Invierno es una época del año en donde la población
                                                            se encuentra más propensa a enfermedades. Estamos seguros que
                                                            con ésta vacuna, estarás más lejos de estar enfermo :)", points: 20, level: 1, canjeable: true, code: 'AAAA-12345')
    Action.create!(name: "Campaña de vacunación 2", desc: "Con la Influenza AH1N1 no se juega. Qué bueno que estas consciente de tu salud.
                                                            Invierno es una época del año en donde la población
                                                            se encuentra más propensa a enfermedades. Estamos seguros que
                                                            con ésta vacuna, estarás más lejos de estar enfermo :)", points: 20, level: 1, canjeable: true, code: 'AAAA-12345')
    Action.create!(name: "Cuídate por tu salud", desc: "Fomenta la práctica de la actividad física y contribuye al
                                                        tratamiento dietetico como usuario de los servicios de salud", points: 10, level: 1)
    Action.create!(name: "¿Para qué moverme?", desc: "Te permite desestresarte y darte un tiempo para mejorar la circulación
                                                        sanguinea.", points: 10, level: 1)
    Action.create!(name: "Participaste en el Cicloton", desc: "Bien por andar en bicicleta y cuidar más tu cuerpo. ", points: 30, level: 1, canjeable: true, code: 'AAAA-12345')
    Action.create!(name: "Introduce tu'código de Ecobici", desc: "Ganarás 30 puntos por introducir tu tarjeta de Ecobici.", points: 30, level: 1, canjeable: true, code: 'AAAA-12345')

    Action.create!(name: "Taller de Lindy Hop (Swing)", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Lunes y Miercoles", horario: "16:00 a 18:00", lugar: "Sub Deportivo, Calzada de Tlalpan esq. Circuito Interior, Rio Churubusco", recurrente: true)
    Action.create!(name: "Taller de Skate para Chicas", desc: "She is skate", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Martes y Jueves", horario: "15:00 a 17:00", lugar: "Centro Deportivo y Recreativo Tola, Acueducto de Guadalupe esq Axayacatl col. Santa Isabel Tola. Gusvato A. Madero", recurrente: true)
    Action.create!(name: "Taller de Danza Afrobrasileña", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Martes y Jueves", horario: "10:00 a 12:00", lugar: "Sub Deportivo, Calzada de Tlalpan esq. Circuito Interior, Rio Churubusco", recurrente: true)
    Action.create!(name: "Taller de Danza Afroamericana", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Martes y Jueves", horario: "10:00 a 12:00", lugar: "Sub Deportivo, Calzada de Tlalpan esq. Circuito Interior, Rio Churubusco", recurrente: true)
    Action.create!(name: "Taller de Atletismo y Acondicionamiento Físico", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Sábados y Domingos", horario: "10:00 a 14:00", lugar: "Av. Ing. Eduardo Molina esq. Talismán (camellón)", recurrente: true)
    Action.create!(name: "Taller de Atletismo ", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Sábados y Domingos", horario: "11:00 a 13:00", lugar: "Parque viveros de Coyoacán (puerta 1)", recurrente: true)
    Action.create!(name: "Taller de Elasticidad ", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Miercoles y Viernes", horario: "16:00 a 18:00", lugar: "Sub Deportivo, Calzada de Tlalpan esq. Circuito Interior, Rio Churubusco", recurrente: true)
    Action.create!(name: "Taller de Mi Cuerpo, Mi Sexualidad, Mi Libertad, Mi Responsabilidad", desc: "Aportar las herramientas prácticas en la vida diaria de los participantes respecto a temas de género, sexualidad y diversidad. Se pretende que la persona conozca más sobre sí misma, sobre su cuerpo y su entorno social en función de las necesidades y normas sexuales que le rodean y la toma de decisiones a las que se enfrenta como joven y las decisiones que deberá tomar en tanto ser libre.", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", horario: "17:00 a 19:00", lugar: "Injuve DF, México Tacuba 235, col. Un Hogar para Nosotros, 3er piso", recurrente: true)
    Action.create!(name: "Taller de Barras Urbanas ", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Miercoles y Sábado", horario: "10:00 a 12:00", lugar: "Deportivo Santa Cruz Meyehualco, Calle 71 esq. Ermita s/n col Santa Cruz Meyehualco, Delegación Iztapalapa", recurrente: true)
    Action.create!(name: "Taller de Lucha Olímpica ", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Lunes y Miercoles", horario: "10:00 a 12:00", lugar: "Sub Deportivo, Calzada de Tlalpan esq. Circuito Interior, Rio Churubusco", recurrente: true)
    Action.create!(name: "Taller de Lucha Judo", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Martes y Jueves", horario: "10:00 a 12:00", lugar: "Sub Deportivo, Calzada de Tlalpan esq. Circuito Interior, Rio Churubusco", recurrente: true)
    Action.create!(name: "Taller de Danza Clásica", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Lunes y Martes", horario: "14:00 a 16:00", lugar: "Sub Deportivo, Calzada de Tlalpan esq. Circuito Interior, Rio Churubusco", recurrente: true)
    Action.create!(name: "Taller de Karate", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Miercoles y Viernes", horario: "10:00 a 12:00", lugar: "Sub Deportivo, Calzada de Tlalpan esq. Circuito Interior, Rio Churubusco", recurrente: true)
    Action.create!(name: "Taller de Hula Hula", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Martes y Jueves", horario: "12:00 a 14:00", lugar: "Sub Deportivo, Calzada de Tlalpan esq. Circuito Interior, Rio Churubusco", recurrente: true)




  end

  def make_user_actions
    users = User.all
    user = users.first
    acciones = Action.all.sample(3)
    acciones.each { | accion | user.do_action!(accion)}
  end

  def make_user_relationships
    users = User.all
    user = User.first
    followed_users = users[2..50]
    followers      = users[3..40]
    followed_users.each { |followed| user.follow!(followed) }
    followers.each { |follower| follower.follow!(user) }
  end


end
