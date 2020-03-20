// $(function(){
//   //DataTransferオブジェクトで、データを格納する箱を作る
//   var dataBox = new DataTransfer();
//   //querySelectorでfile_fieldを取得
//   var file_field = document.querySelector('input[type=file]')
//   //fileが選択された時に発火するイベント
//   $('#img-files').change(function(){
//     //選択したfileのオブジェクトをpropで取得
//     var files = $('input[type="file"]').prop('files')[0];
//     $.each(this.files, function(i, file){
//       //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
//       var fileReader = new FileReader();

//       //DataTransferオブジェクトに対して、fileを追加
//       dataBox.items.add(file)
//       //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に代入
//       file_field.files = dataBox.files
//       var num = $('.item-image').length + 1 + i
//       fileReader.readAsDataURL(file);
//       //読み込みが完了すると、srcにfileのURLを格納
//       fileReader.onloadend = function() {
//         var src = fileReader.result
//       //inputを生成する関数
//       var html= `<div data-index="${num}" class="img-file">                                                                                          
//                    <input class = "img-files" type="file"'
//                      name="item[images_attributes][${num}][image]"
//                      style: "display: none"><br>                  
//                  </div>`

//          var html= `<div class='img-file'>
//                       <div id='img-file' data-image="${file.name}">                                                                   
//                         <img src=${src} width="124" height="123" >                           
//                           <div class= 'aaa'>                                                    
//                             <input class = "img-files" type="file"'
//                             name="item[images_attributes][${num}][image]>                          
//                             </div>
//                           </div>
//                         </div>
//                     </div>`
//         //image_box__container要素の前にhtmlを差し込む
//         $('#0').replaceWith(html);
//         // $('.aaa3').replaceWith(html);
//         // $('.aaa5').replaceWith(html);
//         // $('.aaa7').replaceWith(html);
//         // $('.aaa9').replaceWith(html);
//         return html;        
//       };    
//     });
//   });

  //削除ボタンをクリックすると発火するイベント
  // $('#previews').on('click', '#0.delete', function() {
  //   $(this).remove();
  //   $('#0').remove();
  //   $('.aaa1').remove();
  //   $('.aaa2').remove();
  // });

  // $('#previews').on('click', '#1.delete', function() {
  //   $(this).remove();
  //   $('#1').remove();   
  //   $('.aaa3').remove();
  //   $('.aaa4').remove();
  // });


  // $('#previews').on('click', '#2.delete', function() {
  //   $(this).remove();
  //   $('#2').remove();
  //   $('.aaa5').remove();
  //   $('.aaa6').remove();
  // });

  // $('#previews').on('click', '#3.delete', function() {
  //   $(this).remove();
  //   $('#3').remove();
  //   $('.aaa7').remove();
  //   $('.aaa8').remove();
  // });

  // $('#previews').on('click', '#4.delete', function() {
  //   $(this).remove();
  //   $('#4').remove();
  //   $('.aaa9').remove();
  //   $('.aaa10').remove();
  // });

// //編集要素の削除機能
  

  // //img-fileにID番号を付与
  //   $('.aaa').each(function(index, element) {
  //     $(element).attr('class','aaa' + (index + 1).toString().padStart(1, '0'));
  //     });

  //   $('#previews').on('click', '#4.delete', function() {
  //     $(this).remove();
  //     $('img').remove();
  //   });
// }); 

// ---------------------------------------------------------------------------

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

  $('#img0').on('click', function(e){
    Index = "#0";
    console.log(Index);
  })
  $('#img1').on('click', function(e){
    Index = "#1";
    console.log(Index);
  })
  $('#img2').on('click', function(e){
    Index = "#2";
    console.log(Index);
  })
  $('#img3').on('click', function(e){
    Index = "#3";
    console.log(Index);
  })
  $('#img4').on('click', function(e){
    Index = "#4";
    console.log(Index);
  })

  $('#previews').on('change', '.js-file', function(e) {
    const targetIndex = $('.aaa').parent().find(Index).data('index');
    console.log(targetIndex);
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

  // //img-fileにID番号を付与
  // $('.aaa').each(function(index, element) {
  //   $(element).attr('class','aaa' + (index + 1).toString().padStart(1, '0'));
  //   });

    $('#previews').on('click', '#0.delete', function() {
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