$(function(){
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
}); 