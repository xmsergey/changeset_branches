function filter_changesets_by_branch()
{
  var branch = $('#changeset_branch option:selected').text();

  $('#issue-changesets .changeset').each(function(index, element) {
    var e = $(element);
    e.toggle(branch == 'All' || e.data('branches').indexOf('/' + branch + '/') >= 0);
  });
}
