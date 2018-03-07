require 'redmine'
require 'changeset_branches'

Redmine::Plugin.register :changeset_branches do
  name 'Changeset Branches'
  author 'BelTech'
  description 'Adds branches for Associated revisions section on Issue page'
  version '0.0.1'
  url 'https://redmine.plansource.com/plugins/changeset_branches'
end
