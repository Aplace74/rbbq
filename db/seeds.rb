require 'faker'

puts "clearing databases ..."
Barbecue.destroy_all
User.destroy_all

puts "Cleaning OK, creating users ..."

chris = User.create!(
    first_name: "Christophe",
    last_name: "Lepretre",
    phone: "01 23 45 67 89",
    avatar: "https://ca.slack-edge.com/T02NE0241-UHJNRSJ2X-8033519bd289-48",
    email: "chris@gmail.com",
    password: "123456"
)

max = User.create!(
    first_name: "Maxime",
    last_name: "Derouet",
    phone: "01 23 45 67 89",
    avatar: "https://ca.slack-edge.com/T02NE0241-UHJNDRP50-4cbef4975b23-48",
    email: "max@gmail.com",
    password: "123456"
)

aym = User.create!(
    first_name: "Aymeric",
    last_name: "Dhalluin",
    phone: "01 23 45 67 89",
    avatar: "https://ca.slack-edge.com/T02NE0241-UHVHHPMT6-070fc749feb5-48",
    email: "aym@gmail.com",
    password: "123456"
)

anto = User.create!(
    first_name: "Antoine",
    last_name: "Place",
    phone: "01 23 45 67 89",
    avatar: "https://ca.slack-edge.com/T02NE0241-UHW3LLS4V-bbfea18ca08e-48",
    email: "anto@gmail.com",
    password: "123456"
)

users = [chris, aym, anto, max]

puts "Users created, creating Barbecues ..."

bbq1 = Barbecue.create!(
    name: "Barbecue Charbon Mendy-Alde Baïa Le Marquier",
    model: "Le Marquier",
    address: Faker::Address.full_address,
    description: "Ce barbecue robuste est encastré dans un chariot pour pouvoir le déplacer facilement. Le chariot est équipé de 2 larges roues pour faciliter le déplacement sur tout type de terrain.",
    price: rand(30..40),
    free: true,
    capacity: "12",
    types: "coal",
    rating: [0, 1, 2, 3, 4, 5].sample,
    user: users.sample
)
bbq1.remote_pictures_url = "https://www.esprit-barbecue.fr/5446-thickbox_default/barbecue-charbon-mendy-alde-le-marquier.jpg"
bbq1.save

bbq2 = Barbecue.create!(
    name: "Barbecue charbon Weber Compact Kettle 47 cm",
    model: "Weber",
    address: Faker::Address.full_address,
    description: "Barbecue léger, de petite taille, facilement mobile. L’accroche couvercle vous évite de le reposer dans votre pelouse et de la brûler.",
    price: rand(20..30),
    free: true,
    capacity: "8",
    types: "coal",
    rating: [0, 1, 2, 3, 4, 5].sample,
    user: users.sample
)
bbq2.remote_pictures_url = "https://www.esprit-barbecue.fr/96-thickbox_default/barbecue-weber-compact-kettle-47-cm.jpg"
bbq2.save

bbq3 = Barbecue.create!(
    name: "Barbecue Weber gaz Q3200",
    model: "Weber",
    address: Faker::Address.full_address,
    description: "L'espace de cuisson est large, idéal permettant de cuisiner pour un grand nombre de personnes. Equipé de deux brûleurs, vous pouvez réaliser deux types de cuisson: directe ou indirecte.",
    price: rand(30..40),
    free: true,
    capacity: "12",
    types: "gas",
    rating: [0, 1, 2, 3, 4, 5].sample,
    user: users.sample
)
bbq3.remote_pictures_url = "https://www.esprit-barbecue.fr/1751-thickbox_default/barbecue-weber-gaz-q3200.jpg"
bbq3.save



puts "seed finished !"
