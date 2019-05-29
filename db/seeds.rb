require 'faker'

puts "clearing databases ..."
Barbecue.destroy_all
User.destroy_all

puts "Cleaning OK, creating users ..."

chris = User.create!(
    first_name: "Christophe",
    last_name: "Lepretre",
    phone: "01 23 45 67 89",
    email: "chris@gmail.com",
    password: "123456"
)
chris.remote_avatar_url = "https://ca.slack-edge.com/T02NE0241-UHJNRSJ2X-8033519bd289-48"
chris.save

max = User.create!(
    first_name: "Maxime",
    last_name: "Derouet",
    phone: "01 23 45 67 89",
    email: "max@gmail.com",
    password: "123456"
)
max.remote_avatar_url = "https://ca.slack-edge.com/T02NE0241-UHJNDRP50-4cbef4975b23-48"
max.save

aym = User.create!(
    first_name: "Aymeric",
    last_name: "Dhalluin",
    phone: "01 23 45 67 89",
    email: "aym@gmail.com",
    password: "123456"
)
aym.remote_avatar_url = "https://ca.slack-edge.com/T02NE0241-UHVHHPMT6-070fc749feb5-48"
aym.save

anto = User.create!(
    first_name: "Antoine",
    last_name: "Place",
    phone: "01 23 45 67 89",
    email: "anto@gmail.com",
    password: "123456"
)
anto.remote_avatar_url = "https://ca.slack-edge.com/T02NE0241-UHW3LLS4V-bbfea18ca08e-48"
anto.save

users = [chris, aym, anto, max]

puts "Users created, creating Barbecues ..."

bbq1 = Barbecue.create!(
    name: "Barbecue Charbon Mendy-Alde Baïa Le Marquier",
    model: "Le Marquier",
    address: "38 avenue du domaine de la vallée Bousbecque",
    description: "Ce barbecue robuste est encastré dans un chariot pour pouvoir le déplacer facilement. Le chariot est équipé de 2 larges roues pour faciliter le déplacement sur tout type de terrain.",
    price: rand(30..40),
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
    address: "22 boulevard bigo danel Lille",
    description: "Barbecue léger, de petite taille, facilement mobile. L’accroche couvercle vous évite de le reposer dans votre pelouse et de la brûler.",
    price: rand(20..30),
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
    address: "2632 route du col de terramont HABERE POCHE",
    description: "L'espace de cuisson est large, idéal permettant de cuisiner pour un grand nombre de personnes. Equipé de deux brûleurs, vous pouvez réaliser deux types de cuisson: directe ou indirecte.",
    price: rand(30..40),
    capacity: "12",
    types: "gas",
    rating: [0, 1, 2, 3, 4, 5].sample,
    user: users.sample
)
bbq3.remote_pictures_url = "https://www.esprit-barbecue.fr/1751-thickbox_default/barbecue-weber-gaz-q3200.jpg"
bbq3.save

bbq4 = Barbecue.create!(
    name: "Grill électrique Mythic Double Krampouz",
    model: "Krampouz",
    address: Faker::Address.city,
    description: "Le barbecue électrique MYTHIC double vous permet de maîtriser avec précision la cuisson de deux aliments à des températures différentes. Le MYTHIC est un parfait mélange d'élégance et de praticité, qui feront votre bonheur en terme de cuisine d'extérieure ! ",
    price: rand(30..40),
    capacity: "12",
    types: "electric",
    rating: [0, 1, 2, 3, 4, 5].sample,
    user: users.sample
)
bbq4.remote_pictures_url = "https://www.esprit-barbecue.fr/6009-thickbox_default/gril-electrique-mythic-double-krampouz.jpg"
bbq4.save

bbq5 = Barbecue.create!(
    name: "Plancha gaz Eno Oceane 50 avec chariot",
    model: "Eno",
    address: "301 rue de lille Roncq",
    description: "Fabriquée en France et d’excellente qualité, cette plancha vous permettra de réaliser de délicieuses grillades très facilement pour 4 à 6 personnes.",
    price: rand(20..30),
    capacity: "6",
    types: "gas",
    rating: [0, 1, 2, 3, 4, 5].sample,
    user: users.sample
)
bbq5.remote_pictures_url = "https://www.esprit-barbecue.fr/8097-thickbox_default/plancha-gaz-oceane-50-eno.jpg"
bbq5.save

bbq6 = Barbecue.create!(
    name: "Plancha électrique Design 1800W",
    model: "Krampounz",
    address: "64 Rue de Bourgogne lille",
    description: "Voici la plancha électrique Design 1800W, 100% inox procurant ainsi un très grand confort de cuisson.",
    price: rand(20..30),
    capacity: "6",
    types: "electric",
    rating: [0, 1, 2, 3, 4, 5].sample,
    user: users.sample
)
bbq6.remote_pictures_url = "https://www.esprit-barbecue.fr/5761-thickbox_default/plancha-elec-design-1800w-krampouz.jpg"
bbq6.save

bbq7 = Barbecue.create!(
    name: "Barbecue charbon Tonino 1",
    model: "Esprit Barbecue",
    address: "8 Rue Creuse Blangy-sur-Ternoise",
    description: "Le barbecue idéal pour vos repas en famille ou entre amis. Sa large surface de cuisson (2 grilles + une plancha en fonte émaillée) vous permet de convier jusqu'à 10 personnes.",
    price: rand(20..30),
    capacity: "8",
    types: "coal",
    rating: [0, 1, 2, 3, 4, 5].sample,
    user: users.sample
)
bbq7.remote_pictures_url = "https://www.esprit-barbecue.fr/7456-thickbox_default/barbecue-tonino-1-charbon-acier.jpg"
bbq7.save

puts "seed finished !"
