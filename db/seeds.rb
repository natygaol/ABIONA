# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Clearing database"
SampleItineraryTravelStyle.destroy_all
SampleItinerary.destroy_all
TravelStyle.destroy_all
Accommodation.destroy_all
Stop.destroy_all
Activity.destroy_all


# puts "Creating Travel Styles"

# TravelStyle.create!(title: "Romantic")
# TravelStyle.create!(title: "Active")
# TravelStyle.create!(title: "Walking Safari")
# TravelStyle.create!(title: "Romantic")
# TravelStyle.create!(title: "Active")
# TravelStyle.create!(title: "Walking Safari")
# TravelStyle.create!(title: "Romantic")
# TravelStyle.create!(title: "Active")
# TravelStyle.create!(title: "Walking Safari")
# TravelStyle.create!(title: "Romantic")
# TravelStyle.create!(title: "Active")
# TravelStyle.create!(title: "Walking Safari")


# puts "Creating Accommodations"

# Accommodation.create!(
#   name: "Rivetrees Country Inn",
#   description: "A charming country estate that was once an old coffee farm, on ten acres of fertile greenery, a sanctuary for the birds and wildlife indigenous to the area."
#   )

# Accommodation.create!(
#   name: "Manyara Green Camp",
#   description: "Deep in the forest, next to a waterfall and surrounded by wildlife. A stylish camp that is visited by elephants, buffaloes and many other animals who come to the river to drink."
#   )

# Accommodation.create!(
#   name: "Serengeti Green Camp",
#   description: "Always in the heart of the Great Migration, this beautiful camp moves within the Serengeti to put you in prime locations for wildlife viewing."
#   )

# Accommodation.create!(
#   name: "Wayo Walking Camp",
#   description: "Away from the crowds in their own patch of wilderness heaven. The walking camps offer access to remote parts of the Serengeti, while maintaining high levels of comfort."
#   )

# Accommodation.create!(
#   name: "Mysigio Camp",
#   description: "A luxury highland camp with a myriad of Maasai cultural activities to immerse yourself in the ancient culture."
#   )

# Accommodation.create!(
#   name: "Sharazad Boutique Hotel",
#   description: "Enjoy beautiful Zanzibar surrounded by lush tropical vegetation as you gaze over the expansive Indian Ocean."
#   )

# puts "Creating Activites"

# Activities.create!(
#   accommodation_id: 1,
#   name: "Canoe Safari",
#   description: "You will travel to Arusha National Park and canoe in a lake teeming with wildlife, including a family of hippos!"
#   )

# Activities.create!(
#   accommodation_id: 1,
#   name: "Mountain walk",
#   description: "A two-hour walk among the giraffes, antelope and other herbivores in the mountainous Arusha National Park"
#   )

# Activities.create!(
#   accommodation_id: 2,
#   name: "Countryside biking",
#   description: "A half-day bike ride from Magara falls to Manyara National Park, exploring life in Tanzania's lush countryside."
#   )

# Activities.create!(
#   accommodation_id: 2,
#   name: "Lakeside walk",
#   description: "Explore Manyara National Park on a half-day walk as you follow animal trails by the lakeside."
#   )

# Activities.create!(
#   accommodation_id: 2,
#   name: "Treetop Walkway",
#   description: "View Manyara National Park from above as you walk for an hour on these incredible bridges that take you from one canopy to another."
#   )

# Activities.create!(
#   accommodation_id: 2,
#   name: "Village tour",
#   description: "Bike or tuk-tuk for an hour or two through the local village of Mto Wa Mbu, visiting schools, markets, and a brewery."
#   )

# Activities.create!(
#   accommodation_id: 2,
#   name: "Manyara Game-Drives",
#   description: "Spot animals in Manyara National Park with your guide. Learn about their ways from a shorter distance than on foot."
#   )

# Activities.create!(
#   accommodation_id: 3,
#   name: "Serengeti walk",
#   description: "Enjoy a half-day walk through these epic plains looking for wildlife big and small. This activity is only available when the camp is in Northern Serengeti."
#   )

# Activities.create!(
#   accommodation_id: 3,
#   name: "Serengeti Game-Drives",
#   description: "Spot animals in Serengeti with your guide. Learn about their ways from a shorter distance than on foot."
#   )

# Activities.create!(
#   accommodation_id: 4,
#   name: "Walking Safari",
#   description: "Full-day walks in the ultimate wilderness. Explore on foot an  exclusive access area of the Serengeti that is teeming with wildlife."
#   )

# Activities.create!(
#   accommodation_id: 5,
#   name: "Crater Rim Walk",
#   description: "Take in the crater views through on an afternoon walk, stoping to visit Masai villages along the way."
#   )

# Activities.create!(
#   accommodation_id: 5,
#   name: "Crater Game-Drives",
#   description: "Spot animals in the Ngorongoro crater floor with your guide. Learn about their ways from a shorter distance than on foot."
#   )

# Activities.create!(
#   accommodation_id: 6,
#   name: "Relax on the beach",
#   description: "Lay in the white sands of this tropical destination, swim in the crystal clear waters, or cool-off with a drink in your pool."
#   )


# puts "Creating First Sample Itinerary"

# sample_itinerary = SampleItinerary.create!(
#   title: "Out of Africa: Romance and Safari",
#   description: "Lose yourself in the savannah in this classic, East African journey. Enjoy the Great Migration at its best, with a wonderful combination of lesiure and activities."
#   )

# puts "Adding Travel Style to Sample Itinerary ID #{sample_itinerary.id}"

# SampleItineraryTravelStyle.create!(
#   sample_itinerary: sample_itinerary,
#   travel_style_id: 1, 
#   )

# SampleItineraryTravelStyle.create!(
#   sample_itinerary: sample_itinerary,
#   travel_style_id: 2, 
#   )


# Clean seeds
# Create seeds

puts "Creating accommodations"

accommodations = {
                  serengeti_camp: Accommodation.create!(name: "Serengeti House", description: "Description"),
                  ngorogoro_camp: Accommodation.create!(name: "Ngorongoro House", description: "Description"),
                }

ACTIVITIES = {
                serengeti_camp: [
                                  { name: "Half Day", description: "Description de serengeti_camp" },
                                  { name: "Full Day", description: "Description" },
                                ],
                ngorogoro_camp: [
                                  { name: "Half Day", description: "Description de ngorogoro_camp" },
                                  { name: "Full Day", description: "Description" },
                                ],
}

puts "Creating sample itineraries"


sample_itineraries = {
                        chill: SampleItinerary.create!(title: "Chill", description: "Description"),
                        brave: SampleItinerary.create!(title: "Brave", description: "Description"),
                   }
STOPS = {
          chill: [
                    { nights: 1, place: "Serengeti", accommodation: :serengeti_camp },
                    { nights: 1, place: "Ngorogoro", accommodation: :ngorogoro_camp }
          ],
         brave: [
                    { nights: 3, place: "Serengeti", accommodation: :serengeti_camp },
                    { nights: 4, place: "Ngorogoro", accommodation: :ngorogoro_camp }
          ],
        }

TRAVEL_STYLE = {
                  chill: ["Beach", "Waterfalls", "Lake"],
                  brave: ["Safari", "Waterfalls", "Jungle"]
}

# Acommodations and its activities
accommodations.each do |name, accommodation|
 puts "Adding activities to: '#{accommodation.name}'"
  ACTIVITIES[name].each do |information|
    activity = Activity.new(information)
    activity.accommodation = accommodation
    activity.save!
    puts "  -#{activity.name}"
  end
end

# SampleItineraries and its stops & travel_style
sample_itineraries.each do |name, sample_itinerary|
 puts "Adding stops to: '#{sample_itinerary.title}'"
  STOPS[name].each do |information|
    stop = Stop.new(nights: information[:nights], place: information[:place])
    stop.accommodation = accommodations[information[:accommodation]]
    stop.sample_itinerary = sample_itinerary
    stop.save!
    puts "  -#{stop.nights} nights at #{stop.accommodation.name}"
  end
 puts "Adding travel styles"

  TRAVEL_STYLE[name].each do |title|
    travel_style = TravelStyle.find_or_create_by(title: title)
    sample_itinerary_travel_style = SampleItineraryTravelStyle.new
    sample_itinerary_travel_style.travel_style = travel_style
    sample_itinerary_travel_style.sample_itinerary = sample_itinerary
    sample_itinerary_travel_style.save
    puts "  -#{travel_style.title}"
  end
end
