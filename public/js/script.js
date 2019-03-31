$(document).ready(function() {

	$('.add_tags').submit(function(e){
		e.preventDefault();
		let input = $(this).find('input[name = "name"]');
		if (input.val() === '') return; 
		console.log(input.val);
		$.ajax({
			type: "POST",
			url: $(this).attr('action'),
			data: $(this).serialize(), // serializes the form's elements.
			success: function(d) { console.log(d); },
			error: function(d) { console.log(d); },
		});


		$(this).parents('.card').find("ul").append(
					"<li class = 'btn btn-info'>" 
						+ input.val() 
						+ "<a href = '#' data-index = '"
						+ "-1"
						+ "' class = 'remove_tag btn btn-info'>x</a>"
					+ "</li>")
		input.val('');
	});


	$('.remove_tag').on("click", function(e){
  		e.preventDefault();
  		$.ajax({
  			url: '/remove_tag/',
  			method: 'POST',
  			data: "table=" + $(this).data('table') + "&id=" + $(this).data('index'),
  			success: function(d) { console.log(d); },
  			error: function(d) { console.log(d); },
  		});
  		$(this).parent().remove();
	});

  // $('.edit_image').submit(function(e){
  //   e.preventDefault();
  //   console.log('yes');
  //   $.ajax({
  //     type: "POST",
  //     url: "/edit_image/",
  //     data: $(this).serialize(), // serializes the form's elements.
  //     success: function(d) { console.log(d); },
  //     error: function(d) { console.log(d); },
  //   });
  // });





  function getCountDayMounseData(date)
  {
    return 32 - new Date(date.getFullYear(), date.getMonth(), 32).getDate();  
  }

  function createMounseTable(date)
  {
    let count_day = getCountDayMounseData(date);
    let start = new Date(date.getFullYear(), date.getMonth(), 0).getDay();
    let str = '';
    for (let i = 0; i < start; i++) str += '<div class="card bg-light mb-3" style="max-width: 18rem;"></div>';
    for (let i = 0; i < count_day; i++)
    {
      str += '<div class="card bg-light mb-3" style="max-width: 18rem;"><div class="card-body"> <h5 class="card-title"><a href ="#" data-toggle="modal" data-target="#exampleModal' + (i + 1) + '" ' + (i + 1) + '">' + ' ' + (i + 1) + '</a></h5></div></div>';
    }
    document.getElementById('table').innerHTML = str;
    document.getElementById('mounseName').innerHTML = mounseName[ date.getMonth() ];
    document.getElementById('year').innerHTML = date.getFullYear();
    // console.log(date.getMonth() );
  }
  function nextMounse(date)
  {

    newDate = new Date(date.getFullYear(), date.getMonth() + 1, 1);
    return newDate;
  }

  function prevMounse(date)
  {
    newDate = new Date(date.getFullYear(), date.getMonth() - 1, 1);
    return newDate;
  }

  function nextTable()
  {
    theDate = nextMounse(theDate);
    createMounseTable(theDate);
  }

  function prevTable()
  {
    theDate = prevMounse(theDate);
    createMounseTable(theDate);
  }
 

  function create_table(count_day)  
  {
    let result = [];
    for(let i = 0; i < count_day; i++)
    {
      result[i] = [{"start": 0, "end": 24, "status": "busy"}];
    }
    return result 
  }

  function add_status_day(table, day, hash)
  { 
    table[day].push(hash);
    return table;
  }

  function merge_table(table_one, table_two)
  {
    let result = []
    for(let i = 0; i < count_day; i++)
    {
      result[i] = [{"start": 0, "end": 24, "status": "busy"}];
      while(true)
      {
        
      }
    }
  }

  function sum_interval(x, y)
  {
    if (x["status"] == "busy" || y["status"] == "busy") return false;
    let start = max(["start"], y["start"]);
    let end = min(["start"], y["start"]);
    return {"start": start, "end": end, "status": "fri"}
  
  }
  $('.show_edit').click(function(e)
  {
    console.log("111");
    e.preventDefault();
    $(this).parent().next().show();
    $(this).hide();
  });

  $('.edit').submit(function(e){
     e.preventDefault();
    $.ajax({
      url: '/edit_account/',
      method: 'POST',
      data: $(this).serialize(),
      success: function(d) { console.log(d); },
      error: function(d) { console.log(d); },
    });

    console.log($(this).serialize());
    $(this).prev().find("a").show();
    let input = $(this).children('input[name="name"]');
    $(this).parent().find("span").html(input.val());
    $(this).hide();

  });
 var mounseName = ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август',
    'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь']
    var now = new Date();
    var theDate = now;
    createMounseTable(theDate, true);


});