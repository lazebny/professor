class Test < ApplicationRecord
  belongs_to :revision
  belongs_to :user

  has_many :test_questions, dependent: :destroy
  has_many :questions, through: :test_questions

  rails_admin do
    object_label_method :rails_admin_default_object_label_method

    # exclude_fields :test_questions
    include_fields \
      :id,
      :revision,
      :user,
      :questions
  end

  def rails_admin_default_object_label_method
    # [user.name].join(', ')
    "Test (#{user.name})"
  end
end
