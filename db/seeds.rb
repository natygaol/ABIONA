require "open-uri"

require_relative 'seeds/accommodations'
require_relative 'seeds/activities'
require_relative 'seeds/sample_itineraries'
require_relative 'seeds/stops'
require_relative 'seeds/travel_styles'

puts "Clearing database"
TripStyle.destroy_all
SampleItineraryTravelStyle.destroy_all
SampleItinerary.destroy_all
Accommodation.destroy_all
Stop.destroy_all
Activity.destroy_all
User.destroy_all
#revisar los destroy.all


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

# Needs picture: sample_itinerary, travel_style, accommodation, activity 
accommodations = {}
ACCOMMODATIONS.each do |accomodation_name, accommodation_hash|
  puts "Creating Accommodation"
  accommodation = Accommodation.new(name: accommodation_hash[:name], description: accommodation_hash[:description])
  file = URI.open(accommodation_hash[:image])
  accommodation.photo.attach(io: file, filename: accommodation_hash[:name], content_type: 'image/png')
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

SAMPLE_ITINERARIES.each do |name, sample_itinerary_hash|
  sample_itinerary = SampleItinerary.new(title: sample_itinerary_hash[:title], description: sample_itinerary_hash[:description], children_price_per_night: sample_itinerary_hash[:children_price_per_night], adult_price_per_night: sample_itinerary_hash[:adult_price_per_night])
  file = URI.open(sample_itinerary_hash[:image])
  sample_itinerary.photo.attach(io: file, filename: sample_itinerary_hash[:title], content_type: 'image/png')
  puts "Adding stops to: '#{sample_itinerary.title}'"
  STOPS[name].each do |stop_hash|
    stop = Stop.new(nights: stop_hash[:nights], place: stop_hash[:place])
    stop.accommodation = accommodations[stop_hash[:accommodation]]
    stop.sample_itinerary = sample_itinerary
    stop.save!
    puts "  -#{stop.nights} nights at #{stop.accommodation.name}"
  end
 puts "Adding travel styles"
 sample_itinerary.save!
 sample_itinerary_hash[:travel_styles].each do |travel_style_title|
    travel_style = TravelStyle.find_or_initialize_by(title: travel_style_title)
    unless travel_style.id
      file = URI.open(TRAVEL_STYLES[travel_style_title])
      travel_style.photo.attach(io: file, filename: travel_style_title, content_type: 'image/png')
      travel_style.save
    end
    sample_itinerary_travel_style = SampleItineraryTravelStyle.new
    sample_itinerary_travel_style.travel_style = travel_style
    sample_itinerary_travel_style.sample_itinerary = sample_itinerary
    sample_itinerary_travel_style.save!
    puts "  -#{travel_style.title}"
 end
end

puts "Creado usuario Pepito Flores"
User.create(email: "PepitoFLores@email.com", password: "123123", first_name: "Pepito", last_name: "Flores")
# # SampleItineraries and its stops & travel_style
# SAMPLE_ITINERARIES.each do |name, sample_itinerary_hash|
#   sample_itinerary = SampleItinerary.new(title: sample_itinerary_hash[:title], description: sample_itinerary_hash[:description])
#   file = URI.open(sample_itinerary_hash[:image])
#   sample_itinerary.photo.attach(io: file, filename: sample_itinerary_hash[:title], content_type: 'image/png')
#   puts "Adding stops to: '#{sample_itinerary.title}'"
#   STOPS[name].each do |stop_hash|
#     stop = Stop.new(nights: stop_hash[:nights], place: stop_hash[:place])
#     stop.accommodation = accommodations[stop_hash[:accommodation]]
#     stop.sample_itinerary = sample_itinerary
#     stop.save!
#     puts "  -#{stop.nights} nights at #{stop.accommodation.name}"
#   end
#  puts "Adding travel styles"
#  sample_itinerary_hash[:travel_styles].each do |travel_style_title|
#    travel_style = TravelStyle.find_or_create_by(title: travel_style_title)
#    sample_itinerary.travel_styles << travel_style
#  end
#  sample_itinerary.save!
# end

# TRAVEL_STYLES.each do |name, travel_style_hash|
#   travel_style = TravelStyle.find_or_create_by(title: travel_style_hash[:title])
#   file = URI.open(travel_style_hash[:image])
#   travel_style.photo.attach(io: file, filename: travel_style_hash[:title], content_type: 'image/png')
#   sample_itinerary_travel_style = SampleItineraryTravelStyle.new
#   sample_itinerary_travel_style.travel_style = travel_style
#   sample_itinerary_travel_style.sample_itinerary = sample_itinerary
#   sample_itinerary_travel_style.save
#   puts "  -#{travel_style.title}"
# end


  # TRAVEL_STYLE[name].each do |title|
  #   travel_style = TravelStyle.find_or_create_by(title: title)
  #   sample_itinerary_travel_style = SampleItineraryTravelStyle.new
  #   sample_itinerary_travel_style.travel_style = travel_style
  #   sample_itinerary_travel_style.sample_itinerary = sample_itinerary
  #   sample_itinerary_travel_style.save
  #   puts "  -#{travel_style.title}"
  # end


