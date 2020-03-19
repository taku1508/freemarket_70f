$(function(){
  //DataTransferオブジェクトで、データを格納する箱を作る
  var dataBox = new DataTransfer();
  //querySelectorでfile_fieldを取得
  var file_field = document.querySelector('input[type=file]')
  //fileが選択された時に発火するイベント
  $('#img-file').change(function(){
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
        // var html= `<div class='item-image' data-image="${file.name}">
        //             <div class=' item-image__content'>
        //               <div class='item-image__content--icon'>
        //                  <img src=${src} width="124" height="123" > 
        //               </div>
        //             </div>
        //             <div class='item-image__operetion'>
        //               <div class='item-image__operetion--delete'>削除</div>
        //             </div>
        //           </div>`

         var html= `<div class='img-file'>
                      <div id='img-file' data-image="${file.name}">                                                                   
                        <img src=${src} width="124" height="123" > 
                          <div class='delete'>削除</div>
                          <div class='t_input-file'</div>
                        </div>
                    </div>`
        // var html= `<div class='img-file'>
        //             <div class='item-image' data-image="${file.name}">
        //             <div class=' item-image__content'>
        //               <div class='item-image__content--icon'>
        //                  <img src=${src} width="124" height="123" > 
        //               </div>
        //             </div>
        //             <div class='item-image__operetion'>
        //               <div class='item-image__operetion--delete'>削除</div>                      
        //             </div>
        //           </div>`
        //image_box__container要素の前にhtmlを差し込む
        $('#0').replaceWith(html);
        $('#1').replaceWith(html);
        $('#2').replaceWith(html);
        $('#3').replaceWith(html);
        $('#4').replaceWith(html);
        return html;
      };
      //image-box__containerのクラスを変更し、CSSでドロップボックスの大きさを変えてやる。
      $('#image-box__container').attr('class', `item-num-${num}`)
    });
  });

  //削除ボタンをクリックすると発火するイベント
  $('#previews').on('click', '#0.delete', function() {
    $(this).remove();
    $('#0').remove();
  });

  $('#previews').on('click', '#1.delete', function() {
    $(this).remove();
    $('#1').remove();   
  });


  $('#previews').on('click', '#2.delete', function() {
    $(this).remove();
    $('#2').remove();
  });

  $('#previews').on('click', '#3.delete', function() {
    $(this).remove();
    $('#3').remove();
  });

  $('#previews').on('click', '#4.delete', function() {
    $(this).remove();
    $('#4').remove();
  });

  // $('#previews').on('click', '#4.delete', function() {
  //   $(this).remove();
  //   $('img').remove();
  // });
}); 