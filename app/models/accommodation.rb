class Accommodation < ApplicationRecord
  enum category: [ :romantic, :active, :walking ]
end
