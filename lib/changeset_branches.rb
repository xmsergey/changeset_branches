require 'overrides/git_adapter_override'
require 'overrides/git_repository_override'

class ChangesetBranchesHookListener < Redmine::Hook::ViewListener
  def view_layouts_base_html_head(context={})
    javascript_include_tag('changeset_branches', plugin: 'changeset_branches') +
      stylesheet_link_tag('changeset_branches', plugin: 'changeset_branches')
  end
end
