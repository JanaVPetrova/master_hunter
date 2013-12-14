class Post < ActiveRecord::Base
  validates :description, presence: true
  validates :place, presence: true
  validates :date, presence: true
end
