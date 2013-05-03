class User < ActiveRecord::Base
  has_many :vocabularies
  has_many :words, through: :vocabularies
end
