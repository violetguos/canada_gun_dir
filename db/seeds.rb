# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

ActiveRecord::Base.transaction do
  User.destroy_all

  @users = []

  clubs = []
  cities = []
  provinces = []
  greater_regions = []
  4.times do |_i|
    clubs << Faker::Company.name
    cities << Faker::Address.city
    provinces << Faker::Address.state
    greater_regions << Faker::Address.community
  end

  10.times do |i|
    note = Faker::Quote.matz

    # a random combo of the arrays above
    indices = []
    4.times { |_j| indices << Faker::Number.between(from: 0, to: 3) }

    @users[i] =
      User.create(
        reddit_username: Faker::Twitter.screen_name,
        club: clubs[indices[0]],
        specific_city: cities[indices[1]],
        province: provinces[indices[2]],
        greater_region: greater_regions[indices[3]],
        notes: note
      )
  end
end
