class User < ActiveRecord::Base
  has_many :vocabularies
end
