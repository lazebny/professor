class GroupRevision < ApplicationRecord
  belongs_to :revision
  belongs_to :group
end
