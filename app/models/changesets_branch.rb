class ChangesetsBranch < ActiveRecord::Base
  belongs_to :changeset

  validates_presence_of :changeset_id
  validates_presence_of :branch
end