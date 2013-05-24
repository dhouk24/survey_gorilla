








//
  $("#add-player").click(function(event){
    event.preventDefault();
    var num = $('form div').length + 1;
    $('form div:last').append( newForm(num) );
    $('form div:last').hide().slideDown('medium');
  });

function newForm(num) {
  string = "<div>\
      <input type='text' name='players["+num+"][name]' placeholder=\"Enter Player "+num+"'s initials\"> \
      <input class='keyboard' type='text' name='players["+num+"][code]' placeholder='key'>\
      </div>";
  return string;
};
