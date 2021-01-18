<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
      $(function() {    //화면 다 뜨면 시작
    	  
        $("#receiver").autocomplete({
            source : function( request, response ) {
            	var keyword = $('#receiver').val()
            	
                 $.ajax({
                        type: 'get',
                        url: "/mail/autocomplete",
                        dataType: "json",
                        data: {"keyword":keyword},
                        success: function(data) {
                            response(
                                $.map(data, function(item) { 
                                    return {
                                        label: item.empId + " / " + item.empNm + " / " + item.deptId,    //UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
                                        value: item.empId+"@sendbox.com"   
                                    }
                                })
                            );
                        }
                   });
                },   
            select : function(event, ui) {    
                console.log(ui);
                console.log(ui.item.label);   
                console.log(ui.item.value);    
            },
            focus : function(event, ui) {
                return false;
            },
            minLength: 1,
            autoFocus: true, 
            classes: {    
                "ui-autocomplete": "highlight"
            },
            delay: 500,    
            position: { my : "right top", at: "right bottom" },   
            close : function(event){   
                console.log(event);
            }
        });
        
    });

</script>

<style>
	#receiver{
		width : 300px;
	}


</style>
<body>
	<!-- body 부분 -->
	<input id="receiver" type="text">
</body>
</html>