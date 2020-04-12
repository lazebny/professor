class Question < ApplicationRecord
  belongs_to :topic

  has_many :answer_examples
  has_many :answer_regexps
  has_many :test_questions

  rails_admin do
    object_label_method :body

    include_fields \
      :topic,
      :body,
      :answer_regexps,
      :answer_examples
  end
end
