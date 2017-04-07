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
               </div>`;
     return html;
  }
  function buildFLASH(flash) {
    $.each(flash, function(key, value){
    var flash_message = `<div class="${key}">
                         ${flash.value}
                         </div>`;
    });
    return `<div class="success">
             ${flash.success}
            </div>`;
  }
  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var form = this;
    var textField = $('#text_field');
    var message = textField.val();
    $.ajax({
      type: 'post',
      url: 'messages.json',
      data: {
        message: {
          body: message
        }
      },
      datatype: 'json'
    })
    .done(function(data) {
      console.log(data)
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
  });
});
