<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

$(function() {
	
	
	$('#searchEmp').keyup(function(){
		
		SearchListBanner = [];

		var keyword = $(this).val();
	      
		console.log(keyword)
	      
		if (keyword != ''){
			$.ajax({
				url : "/mail/autocomplete",
	            data : {keyword : keyword},
	            method : "GET",
	            success : function(res){
	               SearchListBanner = [];
	               for (var i = 0 ; i < res.length; i++){
	                  SearchListBanner.push(res[i].empId);
	                  console.log(SearchListBanner)
	               }
	               autoComplete(SearchListBanner);
	            }
	         })
	      }
	   })
	   
// 	   function autoComplete(SearchListBanner){
// 	      $('#searchEmp').autocomplete({
// 	         source : SearchListBanner,
// 	         select : function(event, ui){
// 	            console.log(ui.item);
// 	         },
// 	         minLength : 2,
// 	         focus: function(event, ui) {
// 	               return false;
// 	           }
// 	      })
// 	   }


	   
	   
	   
//     var availableCity = ["서울","부산","대구","광주","울산"];

	function autoComplete(){
	    $("#city").autocomplete({
	        source: availableCity,
	        select: function(event, ui) {
	            console.log(ui.item);
	        },
	        focus: function(event, ui) {
	            return false;
	            //event.preventDefault();
	        }
	    });
	}
});

</script>
</head>
<body>

<div class="ui-widget">

  <label for="searchEmp">아이디: </label>
  <input id="searchEmp">

</div>

<div class="ui-widget">

  <label for="city">도시: </label>

  <input id="city">

</div>




</body>
</html>