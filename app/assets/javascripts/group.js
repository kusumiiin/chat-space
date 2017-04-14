$(function() {
  function searchedUserList(user) {
    var html = `<div class="chat-group-user">
                  <p class="chat-group-user__name">
                    ${user.name}
                  </p>
                    <a class="chat-group-user__btn--add" data-user-id=${user.id} data-user-name=${user.name} > 追加 </a>
                </div>`;
    $('#user-search-result').append(html);
  }

  function addedUserList(name, id) {
    var html = `<div class="chat-group-user>"
                  <input name="group[user_ids][]" value="${id}" type="hidden">
                  <p class="chat-group-user__name"> ${name} </p>
                  <a class="chat-group-user__btn--remove"> 削除 </a>
                </div>`;
    $('#chat-group-users').append(html);
  }

  $('#chat_group_user').on('keyup', function() {
    var input = $('#chat_group_user').val();
    var preInput = '';
    if(preInput !== input){
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



