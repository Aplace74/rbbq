require 'date'

puts "clearing databases ..."
Review.destroy_all
Booking.destroy_all
Barbecue.destroy_all
Message.destroy_all
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
chris[:id]

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
    name: "Barbecue Coal Mendy-Alde Baïa Le Marquier",
    model: "Le Marquier",
    address: "38 avenue du domaine de la vallée Bousbecque",
    description: "This sturdy barbeque is built into a trolley for easy movement. The trolley is equipped with 2 wide wheels to facilitate the movement on any type of ground.",
    price: rand(30..40),
    capacity: "12",
    types: "coal",
    rating: [0, 1, 2, 3, 4, 5].sample,
    user: chris
)
bbq1.remote_pictures_url = "https://www.esprit-barbecue.fr/5446-thickbox_default/barbecue-charbon-mendy-alde-le-marquier.jpg"
bbq1.save

bbq2 = Barbecue.create!(
    name: "Barbecue Coal Weber Compact Kettle 47 cm",
    model: "Weber",
    address: "22 boulevard bigo danel Lille",
    description: "Light barbecue, small size, easily mobile. The grip to cover you avoid sitting in your lawn and burning.",
    price: rand(20..30),
    capacity: "8",
    types: "coal",
    rating: [0, 1, 2, 3, 4, 5].sample,
    user: aym
)
bbq2.remote_pictures_url = "https://www.esprit-barbecue.fr/96-thickbox_default/barbecue-weber-compact-kettle-47-cm.jpg"
bbq2.save

bbq3 = Barbecue.create!(
    name: "Barbecue Weber Gaz Q3200",
    model: "Weber",
    address: "2632 route du col de terramont HABERE POCHE",
    description: "
    185/5000
    The cooking space is wide, ideal for cooking for a large number of people. Equipped with two burners, you can achieve two types of cooking: direct or indirect.",
    price: rand(30..40),
    capacity: "12",
    types: "gas",
    rating: [0, 1, 2, 3, 4, 5].sample,
    user: anto
)
bbq3.remote_pictures_url = "https://www.esprit-barbecue.fr/1751-thickbox_default/barbecue-weber-gaz-q3200.jpg"
bbq3.save

bbq4 = Barbecue.create!(
    name: "Electric Grill Mythic Double Krampouz",
    model: "Krampouz",
    address: Faker::Address.city,
    description: "The MYTHIC double electric barbecue allows you to precisely control the cooking of two foods at different temperatures. The MYTHIC is a perfect blend of elegance and practicality, which will make you happy in terms of outdoor cooking!",
    price: rand(30..40),
    capacity: "12",
    types: "electric",
    rating: [0, 1, 2, 3, 4, 5].sample,
    user: max
)
bbq4.remote_pictures_url = "https://www.esprit-barbecue.fr/6009-thickbox_default/gril-electrique-mythic-double-krampouz.jpg"
bbq4.save

bbq5 = Barbecue.create!(
    name: "Plancha Gaz Eno Oceane 50 avec chariot",
    model: "Eno",
    address: "301 rue de lille Roncq",
    description: "Made in France and of excellent quality, this plancha will allow you to make delicious grills very easily for 4 to 6 people.",
    price: rand(20..30),
    capacity: "6",
    types: "gas",
    rating: [0, 1, 2, 3, 4, 5].sample,
    user: chris
)
bbq5.remote_pictures_url = "https://www.esprit-barbecue.fr/8097-thickbox_default/plancha-gaz-oceane-50-eno.jpg"
bbq5.save

bbq6 = Barbecue.create!(
    name: "Electric Plancha Design 1800W",
    model: "Krampounz",
    address: "64 Rue de Bourgogne lille",
    description: "Here is the Electric 1800W, 100% stainless steel plancha providing a very comfortable cooking.",
    price: rand(20..30),
    capacity: "6",
    types: "electric",
    rating: [0, 1, 2, 3, 4, 5].sample,
    user: aym
)
bbq6.remote_pictures_url = "https://www.esprit-barbecue.fr/5761-thickbox_default/plancha-elec-design-1800w-krampouz.jpg"
bbq6.save

bbq7 = Barbecue.create!(
    name: "Barbecue Coal Tonino 1",
    model: "Barbecue Spirit",
    address: "8 Rue Creuse Blangy-sur-Ternoise",
    description: "The ideal barbecue for your meals with family or friends. Its large cooking surface (2 grids + enamelled cast iron plancha) allows you to invite up to 10 people.",
    price: rand(20..30),
    capacity: "8",
    types: "coal",
    rating: [0, 1, 2, 3, 4, 5].sample,
    user: anto
)
bbq7.remote_pictures_url = "https://www.esprit-barbecue.fr/7456-thickbox_default/barbecue-tonino-1-charbon-acier.jpg"
bbq7.save

puts "creating bookings"

start_date1 = Date.new(2019, 12, 12)
end_date1 = Date.new(2019, 12, 14)
booking1 = Booking.create!(
    start_date: start_date1,
    end_date: end_date1,
    barbecue_id: bbq1[:id],
    user_id: anto[:id],
    accepted: true
)

start_date2 = Date.new(2019, 6, 12)
end_date2 = Date.new(2019, 6, 14)
booking2 = Booking.create!(
    start_date: start_date2,
    end_date: end_date2,
    barbecue_id: bbq7[:id],
    user_id: chris[:id],
    accepted: true
)

start_date3 = Date.new(2019, 6, 12)
end_date3 = Date.new(2019, 6, 15)
booking3 = Booking.create!(
    start_date: start_date3,
    end_date: end_date3,
    barbecue_id: bbq6[:id],
    user_id: max[:id]
)

puts "creating reviews"

review1 = Review.create!(
    content: "Excellent bbq & really nice owner. I recommend!",
    rating: 5,
    user_id: anto[:id],
    barbecue_id: bbq1[:id]
)

review2 = Review.create!(
    content: "BBQ faithful to the description, but not reliable owner. He was away when I wanted to bring back the bbq and I had to go back there twice.",
    rating: 3,
    user_id: chris[:id],
    barbecue_id: bbq7[:id]
)

puts "seed finished !"

