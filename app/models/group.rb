class Group < ApplicationRecord
  has_many :group_revisions
  has_many :revisions, through: :group_revisions
  has_many :users

  rails_admin do
    include_fields \
      :name,
      :users,
      :revisions
  end
end
