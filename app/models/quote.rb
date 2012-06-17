class Quote < ActiveRecord::Base
  validates :permalink, uniqueness: true
end
