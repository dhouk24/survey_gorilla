$(document).ready(function(){

  $('form').on('click','#add_o',function(event) {
    event.preventDefault();
    var num = $(this).parent().find('li').length + 1;
    var q_num = $('div.question').length;
    $(this).parent().find('li:last').after(newOption(num, q_num));
  });


  $('#add_q').click(function(event){
    event.preventDefault();
    var num = $('div.question').length +1;
    $('div.question:last').after(newQuestion(num));
  });

  var totalQuestions = $('.question').length;
  for (var x = 1; x <= totalQuestions; x++) {
    var table = 'table:nth-of-type('+x+')'
    $(table).hide();
    $(table).after('<div id="survey_question' + x + '"></div>');
    var options = {
      chart: {
        renderTo: 'survey_question' + x,
        type: 'column'
      },
      title: {
        text: $(table+' td').first().html()
      },
      xAxis: {
        categories: [$(table+' td').first().html()],
        labels: {
          enabled: false
        }
      },
      yAxis: {
        title: {
          text: 'Votes'
        }
      },
      plotOptions: {
        column: {
          dataLabels: {
            enabled: true
          }
        }
      },
      series: []
    };

    for (var y = 1; y < $(table+' tr').length; y++) {
      var tr = 'tr:nth-of-type('+(y+1)+')'; 
      options.series.push({
        name: $(table+' '+tr+' td').first().html(),
        data: [parseInt($(table+' '+tr+' td').last().html())]
      });
    }
    new Highcharts.Chart(options);
  }

});



function newOption(num, q_num) {
  string = "<li><input type = 'text' name = 'option"+q_num+"["+num+"]' placeholder = 'Place Option "+num+" answer here'></li>"
  return string;
};

function newQuestion(num) {
  string =     "<div class = 'question'>\
  <label for='question'>Question: </label><input type = 'text' name = 'question["+num+"]' placeholder = 'Write Question "+num+" here'>\
<ul>\
   <li><input type = 'text' name = 'option"+num+"[1]'  placeholder = 'Place Option 1 answer here'></li>\
   <li><input type = 'text' name = 'option"+num+"[2]'  placeholder = 'Place Option 2 answer here'></li>\
</ul>\
<a id='add_o' href='#'>Add Option</a>\
</div>"
return string;
};

