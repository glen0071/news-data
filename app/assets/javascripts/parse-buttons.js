$(document).ready(function() {

  $('#more-data').on('click', function(e) {
    e.preventDefault();

    var search_term = $('#search-term').val();
    var begin_input = $('#begin_input').val();
    var end_input = $('#end_input').val();
    var begin_date = begin_input.replace(/-/g, '');
    var end_date = end_input.replace(/-/g, '');
    var query_params = {search_term: search_term, begin_date: begin_date, end_date: end_date}

    $.ajax({
      url: '/query',
      data: query_params
    }).done(function(response) {
      console.log(response);
    });
  });
});
