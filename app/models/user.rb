class User < ActiveRecord::Base
  has_many :words

  acts_as_tagger
end
