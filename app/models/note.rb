class Note < ActiveRecord::Base
  validates :name, presence: true
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags
end
