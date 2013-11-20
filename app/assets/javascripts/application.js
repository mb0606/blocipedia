// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require marked

$(document).ready(function() {
  $('form .title').keyup(function(){
    var value = marked($(this).val());
    $(".preview .title").html(value);
  })
  $('form .body').keyup(function(){
    var value = marked($(this).val());
    $(".preview .body").html(value);
  })
})


// $(document).ready(function() {
//   $('form').children().keyup(function(){
//     var value = $(this).val();
//     var cls = '.' + $(this).attr('class')
//     $(".preview").find(cls).html(value);
//   })
// })
// [1:24:26 PM] Adam Louis: .eight.columns
//   = form_for wiki do |f|
//     = f.text_field :subject, class: 'title'
//     = f.text_area :description, rows: 20, class: 'body'
//     = f.submit "Save", class: 'btn'
// .eight.columns
//   .preview
//     .title
//     .body