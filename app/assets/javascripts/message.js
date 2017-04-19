$(function() {

  function autoReload() {

      var latest_message_id = $('.message__data').last().attr('data-id');

      $.ajax({
        type: 'get',
        url: 'messages.json',
        data: { latest_message_id: latest_message_id },
        datatype: 'json'
      })
      .done(function(data) {
        $.each(data.messages, function(i, message) {
          var html = buildHTML(message);
          $('#list').append(html);
          var height = $('#list').height();
          $("#message_wrapper").animate({scrollTop: height});
        })
      })
      .fail(function() {
        console.error;
      });
  }

  function buildHTML(message) {
    var html = $(`<div class="message__data" data-id="${message.id}">
                     <div class="message__data--name">
                       ${message.user_name}
                     </div>
                     <div class="message__data--date">
                       ${message.created_at}
                     </div>
                     <div class="message__data--content">
                       ${message.body}
                     </div>
                  </div>`);
    if (message.image.url) {
      html.find('.message__data--content').append(`<div class="message__data--content--image">
                                                     <img src="${message.image.url}">
                                                   </div>`);
    }
    return html;
  }

  function buildFLASH(flash) {
    var flash_message;
    $.each(flash, function(key, value){
      flash_message = `<div class="${key}">
                          ${value}
                       </div>`;
    });
    return flash_message;
  }

  setInterval(autoReload, 5000);

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var form = $('#new_message').get()[0];
    var formData = new FormData(form);
    $.ajax({
      type: 'post',
      url: 'messages.json',
      data: formData,
      datatype: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var flash_message = buildFLASH(data.flash);
      $('#body').prepend(flash_message);
      var html = buildHTML(data.message);
      $('#list').append(html);
      var height = $('#list').height();
      $("#message_wrapper").animate({scrollTop: height});
      form.reset();
      $('#input').prop('disabled', false);
    })
    .fail(function() {
      alert('error');
      $('#input').prop('disabled', false);
    });
    return false;
  });
});
