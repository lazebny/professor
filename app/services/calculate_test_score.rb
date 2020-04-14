class CalculateTestScore
  include ::Callable

  def call(test)
    return 0 if test.test_questions.empty?

    correct_answers_count = test.test_questions.count { |test_question| test_question.answer.correct? }
    (correct_answers_count.fdiv(test.test_questions.count) * 100).round
  end
end
