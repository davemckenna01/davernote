class Note < ActiveRecord::Base
  validates :name, presence: true
end
