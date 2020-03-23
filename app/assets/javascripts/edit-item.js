// 画像用のinputを生成する関数
$(function(){
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="product[images_attributes][${num}][src]"
                    id="product_images_attributes_${num}_src"><br>
                    <div class="js-remove">削除</div>
                  </div>`   
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="124px" height="123px">`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();



  $('#previews_edit').on('change', '.js-file', function(e) {
    const targetIndex = $(this).data('index');
    console.log(this);
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    
    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('.bbb').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('.bbb').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });

  //img-fileにID番号を付与
  $('.aaa').each(function(index, element) {
    $(element).attr('class','aaa' + (index + 1).toString().padStart(1, '0'));
  });

    $('#previews_edit').on('click', '#0.delete', function() {
      $(this).remove();
      $('#0').remove();
      $('#img0').remove();
      $('.aaa1').remove();
      $('.aaa2').remove();
    });
  
    $('#previews').on('click', '#1.delete', function() {
      $(this).remove();
      $('#1').remove();   
      $('#img1').remove();
      $('.aaa3').remove();
      $('.aaa4').remove();
    });
  
  
    $('#previews').on('click', '#2.delete', function() {
      $(this).remove();
      $('#2').remove();
      $('#img2').remove();
      $('.aaa5').remove();
      $('.aaa6').remove();
    });
  
    $('#previews').on('click', '#3.delete', function() {
      $(this).remove();
      $('#3').remove();
      $('#img3').remove();
      $('.aaa7').remove();
      $('.aaa8').remove();
    });
  
    $('#previews').on('click', '#4.delete', function() {
      $(this).remove();
      $('#4').remove();
      $('#img4').remove();
      $('.aaa9').remove();
      $('.aaa10').remove();
    });
});