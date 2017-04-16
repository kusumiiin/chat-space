$(function() {
  function buildHTML(message) {
    var html = `<div class="message__data">
                     <div class="message__data--name">
                       ${message.user_name}
                     </div>
                     <div class="message__data--date">
                       ${message.created_at}
                     </div>
                     <div class="message__data--text">
                       ${message.body}
                     </div>
                     <div class="message__data--image">
                     </div>
                </div>`;
    return html
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
      if (data.message.image.url) {
        var semiHtml = buildHTML(data.message);
        var imageHtml = $(semiHtml).find('.message__data--image').append(`<img src="${data.message.image.url}">`);
        var html =$(semiHtml).append($(imageHtml));
      }
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
