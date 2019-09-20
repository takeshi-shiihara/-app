$(function() {

search_list = $("#search_result");

function appendEnglish(english) {
  var html = `<div class="meaning">
                <p class="meaning__number">
                  ・${ english.meaning }
                </p>
              </div>`;
  search_list.append(html);
}

  function appendErrMsgToHTML(msg) {
    var html = `<div class="meaning">
                  <p class="meaning__number">
                    ${msg}
                  </p>
                </div>`;
    search_list.append(html);
  }


  $("#english-search-field").on("keyup", function() {
    var textarea = $("#english-search-field").val();
    $.ajax({
      type: 'GET',
      url: '/',
      data: { keyword: textarea },
      dataType: 'json',
    })

    .done(function(english) {
      $('#search_result').empty();{
        if (textarea.length === 0 ) {
          $('#search_result').empty();
        }
        else if (english.length !== 0 ) {
          english.forEach(function(english){
            appendEnglish(english);
          });
        }
        else {
          appendErrMsgToHTML("単語がないので登録してね");
        }
      }
    })
    .fail(function(){
      alert('検索に失敗しました');
    })
  });
});