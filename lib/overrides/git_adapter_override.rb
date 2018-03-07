require 'redmine/scm/adapters'
require 'redmine/scm/adapters/git_adapter'

module ChangesetBranches
  module GitAdapterOverride

    def self.included(base)
      base.send(:include, InstanceMethods)
    end

    module InstanceMethods

      BRANCH_PATTERN = /^(\* |  )(.*)$/

      def revision_branches(revision)
        branches = []

        args = %w(branch --contains)
        args << revision

        git_cmd(args) do |io|
          io.each_line do |line|
            branches << $2 if (line =~ BRANCH_PATTERN) && ($2 != nil)
          end
        end

        branches
      end

    end
  end
end

Redmine::Scm::Adapters::GitAdapter.send(:include, ChangesetBranches::GitAdapterOverride)
