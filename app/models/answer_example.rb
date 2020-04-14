class AnswerExample < ApplicationRecord
  belongs_to :question

  rails_admin do
    object_label_method :rails_admin_default_object_label_method

    include_fields \
      :body,
      :question
  end

  def correct?
    ::CheckAnswer.call(question, self)
  end

  def rails_admin_default_object_label_method
    "#{body} (#{correct? ? '+' : '-'})"
  end
end
