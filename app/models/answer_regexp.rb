class AnswerRegexp < ApplicationRecord
  belongs_to :question

  has_many :answer_examples, through: :question
  has_many :test_questions, through: :question
  has_many :answers, through: :test_questions

  validates :regexp, presence: true
  validate :validate_if_regexp_valid, if: :regexp

  rails_admin do
    object_label_method :regexp

    list do
      field :regexp
      field :question
      field :answer_examples
      field :answers
    end

    show do
      field :regexp
      field :question
    end

    edit do
      field :regexp
      field :question
    end
  end

  def validate_if_regexp_valid
    ''.match(regexp)
  rescue RegexpError => e
    errors.add(:regexp, e.message)
  end
end
