class TestQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :test
  has_one :answer

  rails_admin do
    object_label_method :rails_admin_default_object_label_method

    configure :test do
      def value
        bindings[:object].test
      end
    end

    configure :correct, :boolean do
      def value
        bindings[:object].answer.correct?
      end
    end

    include_fields \
      :test,
      :question,
      :answer,
      :correct
  end

  def rails_admin_default_object_label_method
    # [user.name].join(', ')
    "#{test.revision.name} (#{question.body})"
  end
end
