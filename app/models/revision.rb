class Revision < ApplicationRecord
  has_many :revision_topics
  has_many :topics, through: :revision_topics
end
