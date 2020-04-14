class CheckAnswer
  include ::Callable

  def call(question, answer)
    return false if question.nil?
    return false if answer.nil?

    question.answer_regexps.any? { |answer_regexp| answer.body.match(answer_regexp.regexp) }
  end
end
