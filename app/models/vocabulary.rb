class Vocabulary < ActiveRecord::Base
  belongs_to :user
  has_many :words
end
