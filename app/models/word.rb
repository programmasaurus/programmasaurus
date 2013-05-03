class Word < ActiveRecord::Base
  acts_as_taggable_on :vocabularies
end
