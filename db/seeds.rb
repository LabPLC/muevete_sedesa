require "faker"
require 'nokogiri'
require 'net/http'
require 'json'

# CLEAR DATABASE

ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  unless table == "schema_migrations"
    ActiveRecord::Base.connection.execute("DELETE FROM #{table};")
  end
end

# CREATE USERS

#User.create({
  #first_name: "Juan Carlos",
  #last_name: "Sanchez",
  #email: "jjuanchow@gmail.com",
  #password: "juancar1os",
  #password_confirmation: "juancar1os"
#})

10.times do |n|
  password = "password111"
  User.create({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "ejemplo-#{n+1}@muevete.org",
    password: password,
      password_confirmation: password
  })
end

# CREATE ACTIONS

Accion.create(name: "Accion Saludable 1", desc: "Esta es una accion saludable que puedes checar blablablab", points: 20, level: 1)

Accion.create(name: "Campaña de vacunación 1", desc: "Qué bueno que estas consciente de tu salud. Invierno es una época del año en donde la población se encuentra más propensa a enfermedades. Estamos seguros que con ésta vacuna, estarás más lejos de estar enfermo :)", points: 20, level: 1, canjeable: true, code: "AAAA-12345")

Accion.create(name: "Campaña de vacunación 2", desc: "Con la Influenza AH1N1 no se juega. Qué bueno que estas consciente de tu salud. Invierno es una época del año en donde la población se encuentra más propensa a enfermedades. Estamos seguros que con ésta vacuna, estarás más lejos de estar enfermo :)", points: 20, level: 1, code: "AAAA-12345")

Accion.create(name: "Cuídate por tu salud", desc: "Fomenta la práctica de la actividad física y contribuye al tratamiento dietetico como usuario de los servicios de salud", points: 10, level: 1)

Accion.create(name: "¿Para qué moverme?", desc: "Te permite desestresarte y darte un tiempo para mejorar la circulación sanguinea.", points: 10, level: 1)

Accion.create(name: "Participaste en el Cicloton", desc: "Bien por andar en bicicleta y cuidar más tu cuerpo.", points: 30, level: 1, canjeable: true, code: "AAAA-12345")

Accion.create(name: "Introduce tu'código de Ecobici", desc: "Ganarás 30 puntos por introducir tu tarjeta de Ecobici.", points: 30, level: 1, canjeable: true, code: 'AAAA-12345')


Accion.create(name: "Taller de Lindy Hop (Swing)", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Lunes y Miercoles", horario: "16:00 a 18:00", lugar: "Sub Deportivo, Calzada de Tlalpan esq. Circuito Interior, Rio Churubusco", recurrente: true, url: "http://talleresinjuvedf.tumblr.com/post/76026393609/lindy-hop-sub-deportivo-lunes-y-miercoles")


Accion.create(name: "Taller de Skate para Chicas", desc: "She is skate", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Martes y Jueves", horario: "15:00 a 17:00", lugar: "Centro Deportivo y Recreativo Tola, Acueducto de Guadalupe esq Axayacatl col. Santa Isabel Tola. Gusvato A. Madero", recurrente: true, url: "http://talleresinjuvedf.tumblr.com/post/77384500345/skate-para-chicas-si-estamos-en-el-centro")

Accion.create(name: "Taller de Danza Afrobrasileña", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Martes y Jueves", horario: "10:00 a 12:00", lugar: "Sub Deportivo, Calzada de Tlalpan esq. Circuito Interior, Rio Churubusco", recurrente: true)

Accion.create(name: "Taller de Danza Afroamericana", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Martes y Jueves", horario: "10:00 a 12:00", lugar: "Sub Deportivo, Calzada de Tlalpan esq. Circuito Interior, Rio Churubusco", recurrente: true, url: "http://talleresinjuvedf.tumblr.com/post/76362322670/danza-afrobrasilena-sub-deportivo-martes-y")

Accion.create(name: "Taller de Atletismo y Acondicionamiento Físico", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Sábados y Domingos", horario: "10:00 a 14:00", lugar: "Av. Ing. Eduardo Molina esq. Talismán (camellón)", recurrente: true, url: "http://talleresinjuvedf.tumblr.com/post/77385007195/inscribete-ya-taller-de-acondicionamiento-fisico")

Accion.create(name: "Taller de Atletismo ", desc: "¿Vives en Coyoacán? Ven los sábados y domingos a correr con nosotros, tenemos taller de ATLETISMO en Viveros", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Sábados y Domingos", horario: "11:00 a 13:00", lugar: "Parque viveros de Coyoacán (puerta 1)", recurrente: true, url: "http://talleresinjuvedf.tumblr.com/post/77384691168/vives-en-coyoacan-ven-los-sabados-y-domingos-a")

Accion.create(name: "Taller de Elasticidad ", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Miercoles y Viernes", horario: "16:00 a 18:00", lugar: "Sub Deportivo, Calzada de Tlalpan esq. Circuito Interior, Rio Churubusco", recurrente: true)

Accion.create(name: "Taller de Mi Cuerpo, Mi Sexualidad, Mi Libertad, Mi Responsabilidad", desc: "Aportar las herramientas prácticas en la vida diaria de los participantes respecto a temas de género, sexualidad y diversidad. Se pretende que la persona conozca más sobre sí misma, sobre su cuerpo y su entorno social en función de las necesidades y normas sexuales que le rodean y la toma de decisiones a las que se enfrenta como joven y las decisiones que deberá tomar en tanto ser libre.", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", horario: "17:00 a 19:00", lugar: "Injuve DF, México Tacuba 235, col. Un Hogar para Nosotros, 3er piso", recurrente: true, url: "http://talleresinjuvedf.tumblr.com/post/80216680497/mi-cuerpo-mi-sexualidad-mi-libertad-mi")

Accion.create(name: "Taller de Barras Urbanas ", desc: "¿Vives en Álvaro Obregón? Ya puedes inscribirte a nuestro taller de Barras Urbanas.", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Miercoles y Sábado", horario: "10:00 a 12:00", lugar: "Deportivo Santa Cruz Meyehualco, Calle 71 esq. Ermita s/n col Santa Cruz Meyehualco, Delegación Iztapalapa", recurrente: true)

Accion.create(name: "Taller de Lucha Olímpica ", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Lunes y Miercoles", horario: "10:00 a 12:00", lugar: "Sub Deportivo, Calzada de Tlalpan esq. Circuito Interior, Rio Churubusco", recurrente: true, url: "http://talleresinjuvedf.tumblr.com/post/81433951305/barras-urbanas-miercoles-y-sabado-10-00-a-12-00")

Accion.create(name: "Taller de Danza Butoh", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Lunes y Miercoles", horario: "12:00 a 14:00", lugar: "Sub Deportivo, Calzada de Tlalpan esq. Circuito Interior, Rio Churubusco", recurrente: true, url: "http://talleresinjuvedf.tumblr.com/post/78071648499")

Accion.create(name: "Taller de Lucha Judo", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Martes y Jueves", horario: "10:00 a 12:00", lugar: "Sub Deportivo, Calzada de Tlalpan esq. Circuito Interior, Rio Churubusco", recurrente: true, url: "http://talleresinjuvedf.tumblr.com/post/78522103985/judo")

Accion.create(name: "Taller de Danza Clásica", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Lunes y Martes", horario: "14:00 a 16:00", lugar: "Sub Deportivo, Calzada de Tlalpan esq. Circuito Interior, Rio Churubusco", recurrente: true, url: "http://talleresinjuvedf.tumblr.com/post/78586446210/danza-clasica")

Accion.create(name: "Taller de Karate", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Miercoles y Viernes", horario: "10:00 a 12:00", lugar: "Sub Deportivo, Calzada de Tlalpan esq. Circuito Interior, Rio Churubusco", recurrente: true, url: "http://talleresinjuvedf.tumblr.com/post/78521679081/karate")

Accion.create(name: "Taller de Hula Hula", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Martes y Jueves", horario: "12:00 a 14:00", lugar: "Sub Deportivo, Calzada de Tlalpan esq. Circuito Interior, Rio Churubusco", recurrente: true, url: "http://talleresinjuvedf.tumblr.com/post/78071362778/hula-hula")

Accion.create(name: "Taller de Tai Chi", desc: "Para que te muevas!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Lunes y Miercoles", horario: "10:00 a 12:00", lugar: "Sub Deportivo, Calzada de Tlalpan esq. Circuito Interior, Rio Churubusco", recurrente: true, url: "http://talleresinjuvedf.tumblr.com/post/78071058326/tai-chi")

Accion.create(name: "Taller de Kick Boxing", desc: "Kick Boxking para todos!", points: 10, level: 1, canjeable: true, code: "AAAA-12345", promotor: "INJUVE", fecha: "Lunes y Miercoles", horario: "12:00 a 14:00", lugar: "Sub Deportivo, Calzada de Tlalpan esq. Circuito Interior, Rio Churubusco", recurrente: true, url: "http://talleresinjuvedf.tumblr.com/post/76362534803/kick-boxing-sub-deportivo-lunes-y-miercoles" )



# SET REMOTE ACTIONS

def get_urls(events_url, dates)
  uri = URI(events_url)
  request = Net::HTTP.post_form(uri, "action" => "tribe_calendar", "eventDate" => dates, "tribe-bar-date" => dates)
  json = JSON.parse(request.body)
  html = Nokogiri::HTML(json["html"])
  html.remove_namespaces!
  html.css('a.url').each do |node|
    accion_saludable = Accion.new()
    get_event node["href"], accion_saludable
    accion_saludable.url = node['href']
    accion_saludable.code = "AAAA-BBBB"
    accion_saludable.canjeable = true
    accion_saludable.recurrente = false
    accion_saludable.points = 10
    accion_saludable.promotor = "INDEPORTE"
    accion_saludable.save!
    puts '########'
  end
end

def get_event(url, accion_saludable)
  uri = URI(url)
  request = Net::HTTP.get_response(uri)
  html = Nokogiri::HTML(request.body) if request.is_a?(Net::HTTPSuccess)
  divEvento = html.css('div#tribe-events-content')[0]
  puts "EVENTO VIEJO" if divEvento.css('div.tribe-events-notices').text.length != 0
  accion_saludable.name = divEvento.css('h2.tribe-events-single-event-title').text
  accion_saludable.fecha = divEvento.css('span.date-start').text
  divLugar = divEvento.css('div.tribe-events-meta-group-venue')
  direccion = divLugar.css('address')
   accion_saludable.lugar = direccion.css('span.street-address').text + " "+ direccion.css('span.locality').text + " " +direccion.css('span.country').text
  texto = ""
  divMoreInfo = divEvento.css('div.description')
  divMoreInfo.css('p').each do |t|
    texto += t.text + "\n"
  end
  accion_saludable.desc = texto
  puts texto
end

eventos = 'http://indeporte.mx/wp-admin/admin-ajax.php'
dates = "2014-06"
get_urls(eventos,dates)

# SET USER ASSOCIATIONS

User.first.tap do |user|

  Accion.all.sample(3).each do |action|
    user.do_action!(action)
  end

  User.all.limit(48).offset(2).tap do |following|
    following.each {|u| user.follow!(u) }
  end

  User.all.limit(37).offset(3).tap do |followers|
    followers.each {|u| u.follow!(user) }
  end

end
