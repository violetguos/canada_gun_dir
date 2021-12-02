# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
  Club.destroy_all
  License.destroy_all
end
Club.create(
  [
    {
      name: 'Spruce Grove Gun Club'
    },
    {
      name: 'Silver Willow Sporting Clays'
    },
    {
      name: 'The Shooting Edge'
    }

  ]
)

RESTRICTED_PAL = License.create(restricted: true)
NON_RESTRCITED_PAL = License.create(restricted: false)