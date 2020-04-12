class AnswerExample < ApplicationRecord
  belongs_to :question

  rails_admin do
    object_label_method :rails_admin_default_object_label_method

    include_fields \
      :body,
      :question
  end

  def correct?
    answer_regexps = question.answer_regexps
    answer_regexps.any? { |answer_regexp| body.match(answer_regexp.regexp) }
  end

  def rails_admin_default_object_label_method
    "#{body} (#{correct? ? '+' : '-'})"
  end
end
