require 'faker'

puts "clearing databases ..."
Barbecue.detroy_all
User.destroy_all

puts "Cleaning OK, creating users ..."

chris = User.create(
    username: "chris"
    first_name: "Christophe"
    last_name: "Lepretre"
    phone: "01 23 45 67 89"
    picture: "https://ca.slack-edge.com/T02NE0241-UHJNRSJ2X-8033519bd289-48"
    email: "chris@gmail.com"
    password: "123456"
)

max = User.create(
    username: "max"
    first_name: "Maxime"
    last_name: "Derouet"
    phone: "01 23 45 67 89"
    picture: "https://ca.slack-edge.com/T02NE0241-UHJNDRP50-4cbef4975b23-48"
    email: "max@gmail.com"
    password: "123456"
)

aym = User.create(
    username: "aym"
    first_name: "Aymeric"
    last_name: "Dhaluin"
    phone: "01 23 45 67 89"
    picture: "https://ca.slack-edge.com/T02NE0241-UHVHHPMT6-070fc749feb5-48"
    email: "aym@gmail.com"
    password: "123456"
)

anto = User.create(
    username: "anto"
    first_name: "Antoine"
    last_name: "Place"
    phone: "01 23 45 67 89"
    picture: "https://ca.slack-edge.com/T02NE0241-UHW3LLS4V-bbfea18ca08e-48"
    email: "anto@gmail.com"
    password: "123456"
)

[chris, maxime].sample

puts "Users created, creating Barbecues ..."
bbq1 = Barbecue.create!(
    name: "Barbecue Charbon Mendy-Alde Baïa Le Marquier"
    model: "Le Marquier"
    address: Faker::Address.full_address
    description: "Ce barbecue robuste est encastré dans un chariot pour pouvoir le déplacer facilement. Le chariot est équipé de 2 larges roues pour faciliter le déplacement sur tout type de terrain."
    model: 
    price: (30..40).sample
    free: true
    capacity: "12+"
    types: "coal"
    rating: [0, 1, 2, 3, 4, 5].sample
)
bbq1.remote_photo_url = "https://www.esprit-barbecue.fr/5446-thickbox_default/barbecue-charbon-mendy-alde-le-marquier.jpg"
bbq1.save



puts "seed finished !"
