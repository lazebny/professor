find_or_create_by = lambda do |model, (attrs, assoc)|
  record = model.find_or_create_by(attrs)
  record.update(assoc) if assoc.present?
  record
end.curry

# ----- Topic ---->

topic1,
topic2,
_ = [
  [{ name: 'Topic 1' }],
  [{ name: 'Topic 2' }],
].map(&find_or_create_by[Topic])

# <---- Topic ----- Revision ---->

revision1,
revision2,
_ = [
  [{ name: 'Revision 1' }, { topics: [topic1] }],
  [{ name: 'Revision 2' }, { topics: [topic1, topic2] }],
].map(&find_or_create_by[Revision])

# <---- Revision ----- Question ---->

question1,
question2,
question3,
_ = [
  [{ body: 'Почем нынче чай в столице?', topic: topic1 }],
  [{ body: 'Сегодня хорошая погода, не так ли?', topic: topic2 }],
  [{ body: 'Королева сейчас дома?', topic: topic2 }],
].map(&find_or_create_by[Question])

# <---- Question ----- AnswerExample ---->

answer_example1,
answer_example2,
answer_example3,
_ = [
  [{ body: 'What is the cost of tea in the capital?', question: question1 }],
  [{ body: "The weather is good today, isn't it?", question: question2 }],
  [{ body: 'Is the queen at home now?', question: question3 }],
].map(&find_or_create_by[AnswerExample])

# <---- AnswerExample ----- AnswerRegexp ---->

answer_regexp1,
answer_regexp2,
answer_regexp3,
_ = [
  [{ regexp: 'cost of tea', question: question1 }],
  [{ regexp: 'weather is good', question: question2 }],
  [{ regexp: 'the queen at home now', question: question3 }],
].map(&find_or_create_by[AnswerRegexp])

# <---- AnswerRegexp ----- Group ---->

group1,
group2,
_ = [
  [{ name: 'Group 1' }, { revisions: [revision1]}],
  [{ name: 'Group 2' }, { revisions: [revision1, revision2]}],
].map(&find_or_create_by[Group])

# ----- Group ----- User ---->

user1,
user2,
user3,
_ = [
  [{ name: 'User 1', email: 'user1@gmail.com', group: group1 }],
  [{ name: 'User 2', email: 'user2@gmail.com', group: group2 }],
  [{ name: 'User 3', email: 'user3@gmail.com', group: group2 }],
].map(&find_or_create_by[User])

# <---- User ----- Test ----->

test1,
test2,
test3,
_ = [
  [{ revision: revision1, user: user1 }, { questions: [question1, question2] }],
  [{ revision: revision2, user: user1 }, { questions: [question1] }],
  [{ revision: revision2, user: user2 }, { questions: [question1, question2, question3] }],
].map(&find_or_create_by[Test])

# <---- Test ----- TestQuestion ----->

test_question_1_1,
test_question_1_2,
test_question_2_1,
test_question_3_1,
test_question_3_2,
test_question_3_3,
_ = [
  { test: test1, question: question1 },
  { test: test1, question: question2 },
  { test: test2, question: question1 },
  { test: test3, question: question1 },
  { test: test3, question: question2 },
  { test: test3, question: question3 },
].map(&find_or_create_by[TestQuestion])

# <---- Test ----- AnswerQuestion ---->

answer_1_1,
answer_1_2,
answer_2_1,
answer_3_1,
answer_3_2,
answer_3_3,
_ = [
  [{ body: 'What is the cost of tea in the capital?', test_question: test_question_1_1 }],
  [{ body: "The weather is good today, isn't it?", test_question: test_question_1_2}],
  [{ body: 'What is the cost of tea?', test_question: test_question_2_1 }],
  [{ body: 'What is the cost of tea in the capital?', test_question: test_question_3_1 }],
  [{ body: "The weather is good today, isn't it?", test_question: test_question_3_2 }],
  [{ body: 'Is the queen at home?', test_question: test_question_3_3 }],
].map(&find_or_create_by[Answer])

# <---- Answer -----

