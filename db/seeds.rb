require "open-uri"

require_relative 'seeds/accommodations'
require_relative 'seeds/activities'
require_relative 'seeds/sample_itinerary'
require_relative 'seeds/stops'

puts "Clearing database"
SampleItineraryTravelStyle.destroy_all
SampleItinerary.destroy_all
TravelStyle.destroy_all
Accommodation.destroy_all
Stop.destroy_all
Activity.destroy_all


# TRAVEL_STYLE = {
#                   dream_couple_active_dry: ["Walking", "Active", "Fly Camping"],
#                   getaway_couple_romantic_dry: ["Romantic", "Beach", "Gourmet"],
# }


# Travel Styles:
# "Romantic"
# "Active"
# "Walking Safari"
# "Beach"
# "Family"
# "Cultural"
# "Fly camping"
# "Cycling"
# "Gourmet"

Needs picture: sample_itinerary, travel_style, accommodation, activity 
accommodations = {}
ACCOMMODATIONS.each do |accomodation_name, information|
  puts "Creating Accommodation"
  accommodation = Accommodation.new(name: information[:name], description: information[:description])
  file = URI.open(information[:image])
  accommodation.photo.attach(io: file, filename: information[:image], content_type: 'image/png')
  accommodation.save!
  accommodations[accomodation_name] = accommodation

  puts "Adding activities to: '#{accommodation.name}'"
  ACTIVITIES[accomodation_name].each do |activity_hash|
    activity = Activity.new(name: activity_hash[:name], description: activity_hash[:description])
    activity.accommodation = accommodation
    file = URI.open(activity_hash[:image])
    activity.photo.attach(io: file, filename: activity_hash[:name], content_type: 'image/png')
    activity.save!
    puts "  -#{activity.name}"  
  end
end


# SampleItineraries and its stops & travel_style
sample_itineraries.each do |name, sample_itinerary_hash|
  sample_itinerary = SampleItinerary.new()
  puts "Adding stops to: '#{sample_itinerary.title}'"
  STOPS[name].each do |information|
    stop = Stop.new(nights: information[:nights], place: information[:place])
    stop.accommodation = accommodations[information[:accommodation]]
    stop.sample_itinerary = sample_itinerary
    stop.save!
    puts "  -#{stop.nights} nights at #{stop.accommodation.name}"
  end
 puts "Adding travel styles"
 sample_itinerary_hash[:travel_styles].each do |travel_style_title|
   travel_style = TravelStyle.find_or_create_by(title: travel_style_title)
   sample_itinerary.travel_styles << travel_style
 end
 sample_itinerary.save!

  # TRAVEL_STYLE[name].each do |title|
  #   travel_style = TravelStyle.find_or_create_by(title: title)
  #   sample_itinerary_travel_style = SampleItineraryTravelStyle.new
  #   sample_itinerary_travel_style.travel_style = travel_style
  #   sample_itinerary_travel_style.sample_itinerary = sample_itinerary
  #   sample_itinerary_travel_style.save
  #   puts "  -#{travel_style.title}"
  # end

