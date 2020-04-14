class Revision < ApplicationRecord
  has_many :revision_topics
  has_many :topics, through: :revision_topics, dependent: :destroy
  has_many :tests
  has_many :group_revisions
  has_many :groups, through: :group_revisions, dependent: :destroy

  rails_admin do
    include_fields \
      :name,
      :topics,
      :groups

    list do
      field :name
      field :topics
      field :groups
    end

    show do
      field :name
      field :topics
      field :groups
      field :tests
    end

    edit do
      field :name
      field :topics
      field :groups
    end
  end
end
