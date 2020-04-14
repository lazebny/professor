class Answer < ApplicationRecord
  belongs_to :test_question

  rails_admin do
    object_label_method :rails_admin_default_object_label_method

    configure :correct, :boolean do
      def value
        bindings[:object].correct?
      end
    end

    include_fields \
      :test_question,
      :body,
      :correct
  end

  def rails_admin_default_object_label_method
    "#{body} (#{correct? ? '+' : '-'})"
  end

  def correct?
    ::CheckAnswer.call(test_question.question, self)
  end
end
