# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "administrator", lastname: "ggg", password: "administrator", phone: 123123123, nick: "ggg", country: "Chile", city: "Santiaago", email: "g@g.g", admin: true, superadmin: false, banned: false, deleted: false, image: "nn", blacklist: false)
User.create(name: "superadministrator", lastname: "u", password: "superadministrator", phone: 123123123, nick: "uuu", country: "Chile", city: "Santiaago", email: "u@u.u", admin: true, superadmin: true, banned: false, deleted: false, image: "nn", blacklist: false)
User.create(name: "Juan", lastname: "Vas", password: "2121gg12", phone: 98123123, nick: "snow", country: "Chile", city: "Santiaago", email:"gre2@gro.com")
UserLikePost.create(user_id: 1, post_id:1, like: true)
UserLikePost.create(user_id: 2, post_id:1, like: false)
