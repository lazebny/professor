class User < ApplicationRecord
  belongs_to :group
  has_many :tests

  rails_admin do
    # exclude_fields :test_questions
    include_fields \
      :name,
      :email,
      # :role,
      :group,
      :tests
  end
end
