$('.edit-locale-link').click(function(){
  window.open($(this).data('href'), '_blank').focus();
});

$('.edit-locale-link').parent().addClass('edit-locale-link-wrapper')
