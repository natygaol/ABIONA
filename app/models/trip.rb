class Trip < ApplicationRecord
  belongs_to :user, required: false
end
