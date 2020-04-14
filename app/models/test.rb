class Test < ApplicationRecord
  belongs_to :revision
  belongs_to :user

  has_many :test_questions, dependent: :destroy
  has_many :questions, through: :test_questions

  rails_admin do
    object_label_method :rails_admin_default_object_label_method

    list do
      field :id
      field :revision
      field :user
      field :user_score
      field :created_at
    end

    show do
      field :id
      field :revision
      field :user
      field :user_score
      field :questions
      field :created_at
    end
  end

  def rails_admin_default_object_label_method
    # [user.name].join(', ')
    "Test (#{user.name}) = #{user_score}"
  end

  def user_score
    ::CalculateTestScore.call(self)
  end
end
