$(function() {
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${index}][image_url]"
                    id="item_images_attributes_${index}_image_url"><br>
                  </div>`;
    return html;
  }

  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div class="preview-box">
                    <div class="upper-box">
                      <img data-index="${index}" src="${url}" width="100px" height="100px">
                    </div>
                    <div class="lower-box">
                      <div class="js-update">
                        <span>編集</span>
                      </div>
                      <div class="js-remove" data-index="${index}">
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box__container').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('.form-group__image-box').before(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      // $('#image-box__container').append(buildFileField(fileIndex[0]));
      $('#previews').append(buildFileField(fileIndex[0]));
      $(".form-group__image-box").attr("for", `item_images_attributes_${fileIndex[0]}_image_url`)
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });

  $('#image-box__container').on('click', '.js-remove', function() {
    const targetIndex = $(this).data('index');
    // 該当Indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(`#item_images_attributes_${targetIndex}_image_url`).remove();
    $(this).parent().parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box__container').append(buildFileField(fileIndex[0]));
  });
});