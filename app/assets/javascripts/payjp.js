$(function() {
  if (!$('#token_submit')[0]) return false;
  
  Payjp.setPublicKey("pk_test_eb5ab5a3151e9b8ed26587a1");

  $("#token_submit").on("click", function(e) {
    e.preventDefault();
    var card = {
        number: $("#card_number").val(),
        exp_month: $("#exp_month").val(),
        exp_year: $("#exp_year").val(),
        cvc: $("#cvc").val()
    };

    Payjp.createToken(card, function(status, response) {
      if (status === 200) {
        $("#card_number").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        $("#cvc").removeAttr("name");
        var token = response.id;
        $("#card_token").append(`<input type="hidden" name="card_token" value=${token}>`)
        $("#card_form").get(0).submit();
      } else {
        alert("カード情報が正しくありません。");
        $("#token_submit").prop('disabled', false);
      }
    });
  });
});