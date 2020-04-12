class AnswerRegexp < ApplicationRecord
  belongs_to :question

  has_many :answer_examples, through: :question
  has_many :test_questions, through: :question
  has_many :answers, through: :test_questions

  rails_admin do
    object_label_method :regexp

    include_fields \
      :regexp,
      :question,
      :answer_examples,
      :answers
  end
end
