class User < ActiveRecord::Base
  has_many :vocabularies

  acts_as_tagger
end
