class AnswerExample < ApplicationRecord
  belongs_to :question

  rails_admin do
    object_label_method :body

    include_fields \
      :body,
      :question
  end
end
