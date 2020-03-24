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

  var num = $('.img_count').length + 1
      //画像が5枚になったら超えたらドロップボックスを削除する
    if (num == 5){
      $('.img_count').css('display', 'none')
    }


  $('#previews_edit').on('change', '.js-file', function(e) {
    const targetIndex = $(this).data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    console.log(file)
    
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

  $('#previews_edit').on('click', '.delete', function() {
    const targetIndex = $(this).data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });   
   // //img-fileにID番号を付与
  $('.bbb').each(function(index, element) {
    $(element).attr('class','bbb' + (index + 1).toString().padStart(1, '0'));
  });


     
  //--------------------------------------------------------プレビュー機能
  $(function(){
    //DataTransferオブジェクトで、データを格納する箱を作る
     var dataBox = new DataTransfer();
     //querySelectorでfile_fieldを取得
     var file_field = document.querySelector('input[type=file]')
     //fileが選択された時に発火するイベント
     $('.img_count').change(function(){
       console.log(this)       
       //選択したfileのオブジェクトをpropで取得
       var files = $('input[type="file"]').prop('files')[0];
       $.each(this.files, function(i, file){
         //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
         var fileReader = new FileReader();
   
         //DataTransferオブジェクトに対して、fileを追加
         dataBox.items.add(file)
         //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に代入
         file_field.files = dataBox.files
   
         var num = $('.bbb').length + 1 + i
         fileReader.readAsDataURL(file);
          //画像が5枚になったら超えたらドロップボックスを削除する
         if (num == 5){
           $('.bbb').css('display', 'none')
         }
         fileReader.onloadend = function() {
           var src = fileReader.result          
          num = $('.js-file_group:last').data("index");
          
            var html= `<ul class='bbb${num+2}'>
                        <li>
                          <img data-index="${num+1}" width="124" height="123" id="${num+1}" class="js-file_group" src="${src}">
                        </li>
                        <li class='botton_edit'>
                          <input type="file" value="" data-index="${num+1}" style="display:none" class="js-file" name="item[images_attributes][${num+1}][image]", id="item_images_attributes_${num+1}_image">                  
                          <label class="t_bbb_edit" for="item_images_attributes_${num+1}_image">
                            <span class="t_input-file">編集</span>
                          </label>
                        <div class="delete" data-index="${num+1}" id="${num+1}">削除</div>
                        <div class="t_input-file" id="${num+1}" style="display:none"></div>
                        </li>                        
                      </ul>`                   
           //image_box__container要素の前にhtmlを差し込む
           $('.t_input_edit').before(html);
           return html;
         };
         //image-box__containerのクラスを変更し、CSSでドロップボックスの大きさを変えてやる。
        //  $('.bbb').attr('class', `item-num-${num}`)
       });
     });
   })
});