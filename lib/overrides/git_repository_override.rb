require 'repository/git'

module ChangesetBranches
  module GitRepositoryOverride

    def self.included(base)
      base.send(:include, InstanceMethods)
      base.class_eval do
        alias_method_chain :save_revision, :branch
      end
    end

    module InstanceMethods

      ISSUE_PATTERN = /^[^0-9]*([0-9]+)[^0-9]*$/

      def save_revision_with_branch(revision)
        changeset = save_revision_without_branch(revision)
        scan_for_branches(changeset) unless changeset.new_record?
        changeset
      end

      def scan_for_branches(changeset)
        branches = scm.revision_branches(changeset.revision)

        branches.each do |branch|
          issue_id = branch =~ ISSUE_PATTERN ? $1.to_i : nil
          next if issue_id && !changeset.issues.detect {|issue| issue.id == issue_id }

          ChangesetsBranch.create(
            changeset_id: changeset.id,
            branch: branch
          )
        end
      end

    end
  end
end

Repository::Git.send(:include, ChangesetBranches::GitRepositoryOverride)
