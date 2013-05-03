class Word < ActiveRecord::Base
  acts_as_taggable_on :vocabularies

  belongs_to :user
end
