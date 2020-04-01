$(function(){
  // $('')はHTMLlの記述,
  function buildHTML(comment){
    var html = `<p>
                  <strong>
                    <a href=/users/${comment.user_id}>${comment.user_name}</a>
                    :
                  </strong>
                  ${comment.text}
                </p>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    // form_で設定したid[new_comment]
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    // ここの[this]は[new_comment]を指す
  // attr('action')でイベントが発生した要素のactionの種類を取得
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html);
      $('.textbox').val('');
      $('.form__submit').prop('disabled', false);
    })

    .fail(function(){
      alert('error');
    })
  })
})