# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
busports = Busport.create([
  { code: 'AHM' },
  { code: 'RJT' }
])

buses = Bus.create([
  { from_busport_id: busports.first.id, to_busport_id: busports.last.id, duration: 240, scheduled_on: "2020-12-25 07:00:00"},
  { from_busport_id: busports.first.id, to_busport_id: busports.last.id, duration: 240, scheduled_on: "2020-12-25 09:00:00"},
  { from_busport_id: busports.first.id, to_busport_id: busports.last.id, duration: 240, scheduled_on: "2020-12-25 11:00:00"},
  { from_busport_id: busports.last.id, to_busport_id: busports.first.id, duration: 240, scheduled_on: "2020-12-26 07:00:00"},
  { from_busport_id: busports.last.id, to_busport_id: busports.first.id, duration: 240, scheduled_on: "2020-12-26 09:00:00"},
  { from_busport_id: busports.last.id, to_busport_id: busports.first.id, duration: 240, scheduled_on: "2020-12-26 11:00:00"}
])