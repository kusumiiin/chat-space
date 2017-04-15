$(function() {

  function searchedUserList(user) {
    var html = `<div class="chat-group-user searched">
                  <p class="chat-group-user__name"> ${user.name} </p>
                    <a class="chat-group-user__btn chat-group-user__btn--add" data-user-id=${user.id} data-user-name=${user.name} > 追加 </a>
                </div>`;
    $('#user-search-result').append(html);
  }

  function addedUserList(name, id) {
    var html = `<div class="chat-group-user added">
                  <input name="group[user_ids][]" value="${id}" type="hidden">
                  <p class="chat-group-user__name"> ${name} </p>
                    <a class="chat-group-user__btn chat-group-user__btn--remove"> 削除 </a>
                </div>`;
    $('#chat-group-users').append(html);
  }

  var preInput = '';

  $('#search').on('keyup', function() {
    var input = $.trim($('#search').val());
    if(preInput !== input){
      $('.searched').remove();
      $.ajax({
        type: 'get',
        url: '/users.json',
        data: {
          keyword: input
        },
        datatype: 'json'
      })
      .done(function(data) {
        $.each(data, function(i, user) {
          searchedUserList(user);
        });
      })
     .fail(function() {
       alert('error');
     });
     preInput = input;
    }
  });

  $(document).on('click', '.chat-group-user__btn--add', function() {
    var user = $(this);
    var id = user.data('user-id');
    var name = user.data('user-name');
    addedUserList(name, id);
    user.parent().remove();
  });

  $(document).on('click', '.chat-group-user__btn--remove', function() {
    $(this).parent().remove();
  })
});




