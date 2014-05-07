# ¡Cuídate!

[![Build Status](https://travis-ci.org/LabPLC/muevete_sedesa.svg?branch=master)](https://travis-ci.org/LabPLC/muevete_sedesa)
[![Dependency Status](https://gemnasium.com/LabPLC/muevete_sedesa.svg)](https://gemnasium.com/LabPLC/muevete_sedesa)
[![Code Climate](https://codeclimate.com/github/LabPLC/muevete_sedesa.png)](https://codeclimate.com/github/LabPLC/muevete_sedesa)
[![Coverage Status](https://coveralls.io/repos/LabPLC/muevete_sedesa/badge.png)](https://coveralls.io/r/LabPLC/muevete_sedesa)

Busca formas de mejorar la calidad de vida y sallud de la ciudadanía mediante gamificación así como mostrar información sobre el estado de salud de la Ciudad de México

## Instalación

Ésta aplicación requiere **Postgres** para poder ser instalada.

```
git clone https://github.com/LabPLC/muevete_sedesa/
cd muevete_sedesa
bundle install
```


## Uso en desarrollo

Esta aplicación utiliza integración con Facebook, Twitter y Google Plus las cuales se declaran como variables de entorno. Puedes revisar un ejemplo en el archivo **application.yml.sample** para declararlas ya sea estableciendolas en tu archivo **.bashrc** como variables de entorno o utilizando [Figaro](https://github.com/laserlemon/figaro) renombrando ese archivo a **application.yml**

Después realiza las migraciones y activa el servidor

```
rake db:migrate

rails server
```

## "¿Cuídate?"

¡Cuídate! es una plataforma que busca transformar el cuidar tu salud en un juego. Mediante integración con redes sociales, "Cuídate" te permite conocer los eventos de salud de distintas organizaciones de la Ciudad de México enfocadas en disminuir la obesidad y sobrepeso de la gente.

![Imgur](http://i.imgur.com/IDSopRW.png)

![Imgur](http://i.imgur.com/0sI3esC.png)

![Imgur](http://i.imgur.com/GDHCJXK.png)

![Imgur](http://i.imgur.com/jIrPwkr.png)

## Contribuye

La salud pública es de vital importancia para todos. Siguiendo el espíritu del [Software Libre](https://www.google.com.mx/search?q=espiritu&oq=espiritu&aqs=chrome..69i57j0l3.2953j0j1&sourceid=chrome&ie=UTF-8) todos están invitados a seguir mejorando éste proyecto. Aquí hay algunas formas en las que tu puedes participar

- Reportando bugs y errores que encuentres
- Sugiriendo nuevas características
- Mejorando el diseño del sitio para que más gente pueda acceder a él
- Sugiriendo nuevas formas de mejorar la perticipación de la gente
- Escribiendo código (arreglar errores, falta de comentarios, etc)


## Preguntas, dudas, comentarios

Puedes utilizar [Github Issue](https://github.com/LabPLC/muevete_sedesa/issues) tracker para cualquier bug o problema que encuentres con la aplicación. Para mayor información puedes contactar al [Laboratorio para la Ciudad](http://labplc.mx).  Así mismo puedes contactar a @juancar1os.

