require 'faker'

puts "clearing databases ..."
Barbecue.detroy_all
User.destroy_all

puts "Cleaning OK, creating users ..."

10.times do
    
end

puts "Users created, creating Barbecues ..."

puts "seed finished !"
