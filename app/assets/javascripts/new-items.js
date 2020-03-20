

//以下開発に必要となる可能性があり、保留のため一旦コメントアウトしている。
// $(function(){
//   $('.t_number_form').on('input',function(){
//     var aaa = $(this).val();
//     console.log(aaa);
//   })
// });

// $(function(){
//   // file_fieldのnameに動的なindexをつける為の配列
//   // 画像用のinputを生成する関数
//   const buildFileField = (index)=> {
//     const html = `<div data-index="${index}" class="js-file_group">
//                     <input class="js-file" type="file"
//                     name="product[images_attributes][${index}][src]"
//                     id="product_images_attributes_${index}_image"><br>
//                     <div class="js-remove">削除</div>
//                   </div>`;
//     return html;
//   }

//   // プレビュー用のimgタグを生成する関数
//   const buildImg = (index, url)=> {
//     const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
//     return html;
//   }
  
//   let fileIndex = [1,2,3,4,5,6,7,8,9,10];
//   lastIndex = $('.js-file_group:last').data('index');
//   fileIndex.splice(0, lastIndex);


//   // $('.t_sell_uploader__form').on('change', '.js-file', function(e) {
//   //   // fileIndexの先頭の数字を使ってinputを作る
//   //   $('.t_image_field').append(buildFileField(fileIndex[0]));
//   //   fileIndex.shift();
//   //   // 末尾の数に1足した数を追加する
//   //   fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
//   // });
//   // $('.js-file').on('change',function(e){  
//   //   var reader = new FileReader();
//   //   reader.onload = function (e) {
//   //       $("#preview").attr('src', e.target.result);
//   //   }
//   //   reader.readAsDataURL(e.target.files[0]);
//   // })

//   $('.hidden-destroy').hide();

//   $('.t_image_field').on('change', '.js-file', function(e) {
//     const targetIndex = $(this).parent().data('index');
//     // ファイルのブラウザ上でのURLを取得する
//     const file = e.target.files[0];
//     const blobUrl = window.URL.createObjectURL(file);

//     // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
//     if (img = $(`img[data-index="${targetIndex}"]`)[0]) {1
//       img.setAttribute('src', blobUrl);
//     } else {  // 新規画像追加の処理
//       $('#previews').append(buildImg(targetIndex, blobUrl));
//       // fileIndexの先頭の数字を使ってinputを作る
//       $('.t_image_field').append(buildFileField(fileIndex[0]));
//       fileIndex.shift();
//       // 末尾の数に1足した数を追加する
//       fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
//     }
//   });

//   // $('.t_sell_uploader__form').on('click', '.js-remove', function() {
//   //   $(this).parent().remove();
//   //   // 画像入力欄が0個にならないようにしておく
//   //   if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
//   // });

//   $('.t_sell_uploader__form').on('click', '.js-remove', function() {
//     const targetIndex = $(this).parent().data('index');
//     // 該当indexを振られているチェックボックスを取得する
//     const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
//     // もしチェックボックスが存在すればチェックを入れる
//     if (hiddenCheck) hiddenCheck.prop('checked', true);
//     $(this).parent().remove();
//     $(`img[data-index="${targetIndex}"]`).remove();
//     // 画像入力欄が0個にならないようにしておく
//     if ($('.js-file').length == 0) $('.t_sell_uploader__form').append(buildFileField(fileIndex[0]));
//   });

// })

//-----------------------------------------------------
// $(function(){
//   // 画像用のinputを生成する関数
//   const buildFileField = (num)=> {
//     const html = `<div data-index="${num}" class="js-file_group">
//                     <input class="js-file" type="file"
//                     name="product[images_attributes][${num}][src]"
//                     id="product_images_attributes_${num}_src"><br>
//                     <div class="js-remove">削除</div>
//                   </div>`;
//     return html;
//   }
//   // プレビュー用のimgタグを生成する関数
//   const buildImg = (index, url)=> {
//     const html = `<img data-index="${index}" class= "t_aaa" src="${url}" width="100px" height="100px"> `;
//     return html;
//   }


//   // file_fieldのnameに動的なindexをつける為の配列
//   let fileIndex = [1,2,3,4,5,6,7,8,9,10];
//   // 既に使われているindexを除外
//   lastIndex = $('.js-file_group:last').data('index');
//   fileIndex.splice(0, lastIndex);



//   $('.hidden-destroy').hide();

//   $('.t_image_field').on('change', '.js-file', function(e) {
//     const targetIndex = $(this).parent().data('index');
//     // ファイルのブラウザ上でのURLを取得する
//     const file = e.target.files[0];
//     const blobUrl = window.URL.createObjectURL(file);

//     // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
//     if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
//       img.setAttribute('src', blobUrl);
//     } else {  // 新規画像追加の処理
//       $('#previews').append(buildImg(targetIndex, blobUrl));
//       // fileIndexの先頭の数字を使ってinputを作る
//       $('.t_js-file_group').append(buildFileField(fileIndex[0]));
//       fileIndex.shift();
//       // 末尾の数に1足した数を追加する
//       fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
//     }
//   });

//   $('.t_image_field').on('click', '.js-remove', function() {
//     const targetIndex = $(this).parent().data('index');
//     // 該当indexを振られているチェックボックスを取得する
//     const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
//     // もしチェックボックスが存在すればチェックを入れる
//     if (hiddenCheck) hiddenCheck.prop('checked', true);

//     $(this).parent().remove();
//     $(`img[data-index="${targetIndex}"]`).remove();

//     // 画像入力欄が0個にならないようにしておく
//     if ($('.js-file').length == 0) $('.t_image_field').append(buildFileField(fileIndex[0]));
//   });
// });

//-----------------------------------------


// $(function(){
//   //DataTransferオブジェクトで、データを格納する箱を作る
//   var dataBox = new DataTransfer();
//   //querySelectorでfile_fieldを取得
//   var file_field = document.querySelector('input[type=file]')
//   //fileが選択された時に発火するイベント
//   $('#img-file').change(function(){
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
//        //画像が5枚になったら超えたらドロップボックスを削除する
//       if (num == 5){
//         $('#image-box__container').css('display', 'none')   
//       }
//       //読み込みが完了すると、srcにfileのURLを格納
//       fileReader.onloadend = function() {
//         var src = fileReader.result
//         // var html= `<div class='item-image' data-image="${file.name}">
//         //             <div class=' item-image__content'>
//         //               <div class='item-image__content--icon'>
//         //                  <img src=${src} width="124" height="123" > 
//         //               </div>
//         //             </div>
//         //             <div class='item-image__operetion'>
//         //               <div class='item-image__operetion--delete'>削除</div>
//         //             </div>
//         //           </div>`

//         //  var html= `<div class='item-num-0'>
//         //               <div id='img-file' data-image="${file.name}">                                                                   
//         //                 <img src=${src} width="124" height="123" > 
//         //                   <div class='item-image__operetion--delete'>削除</div>
//         //                 </div>
//         //             </div>`

//         var html= `<div item-image="${num} class='img-file'>
//                     <div class='item-image' data-image="${file.name}">
//                     <div class=' item-image__content'>
//                       <div class='item-image__content--icon'>
//                          <img src=${src} width="124" height="123" > 
//                       </div>
//                     </div>
//                     <div class='item-image__operetion'>
//                       <div class='item-image__operetion--delete'>削除</div>                      
//                     </div>
//                   </div>`
//         //image_box__container要素の前にhtmlを差し込む
//         $('#image-box__container').before(html);
//         return html;
//       };
//       //image-box__containerのクラスを変更し、CSSでドロップボックスの大きさを変えてやる。
//       $('#image-box__container').attr('class', `item-num-${num}`)
//     });
//   });

//   // プレビュー用のimgタグを生成する関数
//   const buildImg = (index, url)=> {
//     const html = `<img data-index="${index}" image="${url}" width="100px" height="100px">`;  
//     var t_index = $('image').index(this);  
//     return html;
//   }
//   // file_fieldのnameに動的なindexをつける為の配列
//   let fileIndex = [1,2,3,4,5,6,7,8,9,10];
//   // 既に使われているindexを除外
//   lastIndex = $('.img-file:last').data('index');
//   fileIndex.splice(0, lastIndex);

//   //削除ボタンをクリックすると発火するイベント
//   $(document).on("click", '.item-image__operetion--delete', function(){
//     //削除を押されたプレビュー要素を取得
//     var target_image = $(this).parent().parent()
//     //削除を押されたプレビューimageのfile名を取得
//     var target_name = $(target_image).data('image')
//     //プレビューがひとつだけの場合、file_fieldをクリア
//     if(file_field.files.length==1){
//       //inputタグに入ったファイルを削除
//       $('input[type=file]').val(null)
//       dataBox.clearData();
//       console.log(dataBox)
//     }else{
//       //プレビューが複数の場合
//       $.each(file_field.files, function(i,input){
//         //削除を押された要素と一致した時、index番号に基づいてdataBoxに格納された要素を削除する
//         if(input.name==target_name){
//           dataBox.items.remove(i) 
//         }
//       })
//       //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に再度代入
//       file_field.files = dataBox.files
//     }
//     //プレビューを削除
//     target_image.remove()
//     //image-box__containerクラスをもつdivタグのクラスを削除のたびに変更
//     var num = $('.item-image').length
//     $('#image-box__container').show()
//     $('#image-box__container').attr('class', `item-num-${num}`)
//   })
// });