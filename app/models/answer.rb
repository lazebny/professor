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
    "#{test_question.rails_admin_default_object_label_method} (#{correct? ? '+' : '-'})"
  end

  def correct?
    answer_regexps = test_question.question.answer_regexps
    answer_regexps.any? { |answer_regexp| body.match(answer_regexp.regexp) }
  end
end
