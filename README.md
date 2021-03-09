# README

Esta es una aplicación simple creada utilizando RoR, consta de un sistema de creación de usuario, 
inicio/cierre de sesión y creación de personaje que con ciertas características.

* Versiones: 
  - Ruby 2.6.5
  - Rails 6.0.3.5 

* Gestor de Base de datos utilizado
  - sqlite3

* Pasos para levantar la aplicación:
  - instalar dependencias: `bundle install`
  - Crear la base de datos: `rails db:create`
  - Ejecutar migraciones: `rails db:migrate`
  - Crear data para colores y clases de personaje: `rails db:seed`
  - Levantar aplicación: `rails s`
