class Question < ApplicationRecord
  belongs_to :topic

  has_many :answer_examples
  has_many :answer_regexps
end
