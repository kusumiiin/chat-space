$(function() {
  function buildHTML(message) {
    var html = $('.message__data').append(message__data--text);
    return html;
  }
  $('form').on('submit', function(e) {
      e.preventDefault();
      var textField = $('.type');
      var message = textField.val();
      $.ajax({
        type: 'POST',
        url: '/messages.json',
        data: {
          messages: {
            content: message
          }
        },
        dataType: 'json'
      })
      .done(function(data) {
        var html = buildHTML(data);
        $('.content__right').append(html);
        textField.val('');
      })
      .fail(function() {
        alert('error');
      });
    });
});

