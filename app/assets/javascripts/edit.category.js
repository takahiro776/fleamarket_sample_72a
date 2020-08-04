$(function(){
  $('.form-group__category-edit').on('change','select',function(){
    $(this).nextAll('select').remove()
    let id = $(this).get(0).value
    console.log(id)
    if (id == ""){
      return
    }else{
      $.ajax({
        type: 'GET',
        url: '/categories',
        data: {
          id: id
        },
        dataType: 'json'
      })
      .done(function(categories) {
        if (categories == ""){
          return
        } else{
        $('.form-group__category-edit').append(`<select name="item[category_id]"></select>`)
        $('.form-group__category-edit > select:last').append(`<option value="">選択してください</option>`);
        categories.forEach(function(category){
          let html = `<option value=${category.id}>${category.name}</option>`
          $('.form-group__category-edit > select:last').append(html);
        });
        }
      })
      .fail(function(){
        alert('error');
      })
    }
  })
})