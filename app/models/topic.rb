class Topic < ApplicationRecord
  has_many :questions

  rails_admin do
    # exclude_fields :test_questions
    include_fields \
      :name,
      :questions
  end
end
