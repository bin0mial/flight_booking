# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if Rails.env.development?
  AdminUser.first_or_create(email: 'admin@example.com', confirmed_at: Time.current,
                            password: 'password', password_confirmation: 'password')
end

["First Class", "Business Class", "Economy Class"].each do |aeroplane_class_name|
  AeroplaneClass.find_or_create_by(name: aeroplane_class_name)
end
