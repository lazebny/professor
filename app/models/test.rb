class Test < ApplicationRecord
  belongs_to :revision
  belongs_to :user

  # has_many :test_questions
  # has_many :questions, through: :test_questions
  #
  # rails_admin do
  #   exclude_fields :test_questions
  # end
end
