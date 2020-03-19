$(function(){
  //DataTransferオブジェクトで、データを格納する箱を作る
  var dataBox = new DataTransfer();
  //querySelectorでfile_fieldを取得
  var file_field = document.querySelector('input[type=file]')
  //fileが選択された時に発火するイベント
  $('#img-files').change(function(){
    //選択したfileのオブジェクトをpropで取得
    var files = $('input[type="file"]').prop('files')[0];
    $.each(this.files, function(i, file){
      //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
      var fileReader = new FileReader();

      //DataTransferオブジェクトに対して、fileを追加
      dataBox.items.add(file)
      //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に代入
      file_field.files = dataBox.files
      var num = $('.item-image').length + 1 + i
      fileReader.readAsDataURL(file);
      //読み込みが完了すると、srcにfileのURLを格納
      fileReader.onloadend = function() {
        var src = fileReader.result
         var html= `<div class='img-file'>
                      <div id='img-file' data-image="${file.name}">                                                                   
                        <img src=${src} width="124" height="123" >                           
                          <div class= 'aaa'> </div>                                                    
                            <div class='t_input-file'></div>
                        </div>
                    </div>`
        //image_box__container要素の前にhtmlを差し込む
        $('#0').replaceWith(html);
        // $('.aaa1').replaceWith(html);
        // $('.aaa3').replaceWith(html);
        // $('.aaa5').replaceWith(html);
        // $('.aaa7').replaceWith(html);
        // $('.aaa9').replaceWith(html);
        return html;
      };    
    });
  });

// //-------------------------------------------------------------------
//   $('.aaa2').change(function(){
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
//          var html= `<div class='img-file'>
//                       <div id='img-file' data-image="${file.name}">                                                                   
//                         <img src=${src} width="124" height="123" >                           
//                           <div class= 'aaa'> </div>                                                    
//                             <div class='t_input-file'></div>
//                         </div>
//                     </div>`
//         //image_box__container要素の前にhtmlを差し込む
//         $('.aaa1').replaceWith(html);
//         return html;
//       };    
//     });
//   });

  //------------------------------------------------------------------------------

  //削除ボタンをクリックすると発火するイベント
  $('#previews').on('click', '#0.delete', function() {
    $(this).remove();
    $('#0').remove();
    $('.aaa1').remove();
    $('.aaa2').remove();
  });

  $('#previews').on('click', '#1.delete', function() {
    $(this).remove();
    $('#1').remove();   
    $('.aaa3').remove();
    $('.aaa4').remove();
  });


  $('#previews').on('click', '#2.delete', function() {
    $(this).remove();
    $('#2').remove();
    $('.aaa5').remove();
    $('.aaa6').remove();
  });

  $('#previews').on('click', '#3.delete', function() {
    $(this).remove();
    $('#3').remove();
    $('.aaa7').remove();
    $('.aaa8').remove();
  });

  $('#previews').on('click', '#4.delete', function() {
    $(this).remove();
    $('#4').remove();
    $('.aaa9').remove();
    $('.aaa10').remove();
  });

//編集要素の削除機能
  

  //img-fileにID番号を付与
    $('.aaa').each(function(index, element) {
      $(element).attr('class','aaa' + (index + 1).toString().padStart(1, '0'));
      });

  // $('#previews').on('click', '#4.delete', function() {
  //   $(this).remove();
  //   $('img').remove();
  // });
}); 