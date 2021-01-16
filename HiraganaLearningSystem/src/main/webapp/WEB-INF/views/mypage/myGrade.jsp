<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);
	
      function drawChart() {
    	var jsonData;
        $.ajax({
        	type: 'GET',
    		headers: {
    			Accept: "application/json; charset=UTF-8",
    			"Content-type": "application/json; charset=UTF-8"
    		},
        	url: "gradeGraph",
        	data : { memberId : '${memberId}'},
        	async: false,
        	success: function(result) {
        		jsonData = result;
        		console.log(jsonData);
    		},
    		error: function() {
    			alert("failed to data receive!");
    		}
        });

        var data = new google.visualization.DataTable(jsonData);
        
        var options = {
          legend: {
        	  position: 'none',
        	  },
          bars: 'vertical',
          vAxis: {
              viewWindowMode:'explicit',
              viewWindow: {
                max: 100,
                min:0
              },
          },
          colors: ['#1b9e77', '#d95f02', '#7570b3']
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
</script>
<h1>각 퀴즈 최신 10번의 평균</h1>
<div style="margin: 0 0 0 auto; text-align: left;">
	<span style="color: #1b9e77">■</span> 연상법 그림 퀴즈
	<span style="color: #d95f02; margin-left: 0.2rem;">■</span> 히라가나 1글자 퀴즈
	<span style="color: #7570b3; margin-left: 0.2rem;">■</span> 단어형 퀴즈
</div>
<div style="margin-top: 0.3rem;">
   	<div id="columnchart_material" style="width: auto; height: 4rem;"></div>
</div>
<div class="spOnly" style="margin-top: 0.5rem;">
잘 못하는 행을 공부합시다!
	<form action="hiraganaSelectMethods" method="get">
		<select name="hiraganaLine" id="hiraganaSelectBox" class="button" style="font-size: 0.3rem; border: 1px solid lime;">
			<option value="あ행">① あ행</option>
			<option value="か행">② か행</option>
			<option value="さ행">③ さ행</option>
			<option value="た행">④ た행</option>
			<option value="な행">⑤ な행</option>
			<option value="は행">⑥ は행</option>
			<option value="ま행">⑦ ま행</option>
			<option value="や행">⑧ や행</option>
			<option value="ら행">⑨ ら행</option>
			<option value="わ행">⑩ わ행 + ん</option>
		</select>
		<input type="submit" class="button pinkButton" value="시작!" style="font-size: 0.18rem; margin-left: 0.1rem;">
	</form>
</div>
<%@ include file="../footer.jsp" %>