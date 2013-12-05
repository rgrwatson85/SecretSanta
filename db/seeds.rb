# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

people = [
    {first_name: 'Morgan', last_name: 'Watson', is_selected: false, person: nil},
    {first_name: 'Sebastian', last_name: 'Guerra', is_selected: false, person: nil},
    {first_name: 'Alan', last_name: 'Hensley', is_selected: false, person: nil},
    {first_name: 'Denis', last_name: 'Maldonado', is_selected: false, person: nil},
    {first_name: 'Josh', last_name: 'Klentzman', is_selected: false, person: nil},
    {first_name: 'Santiago', last_name: 'Cortez', is_selected: false, person: nil},
    {first_name: 'Anh', last_name: 'Vu', is_selected: false, person: nil},
    {first_name: 'Priscilla', last_name: 'Maldonado', is_selected: false, person: nil}
]

until people.empty?
  person = people.delete_at(rand(people.length))
  Person.create(person)
end