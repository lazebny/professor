class RevisionTopic < ApplicationRecord
  belongs_to :revision
  belongs_to :topic

  # rails_admin do
  #   include_fields \
  #     :revision,
  #     :topic
  # end
end
