<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <link href="css/themes/green/pace-theme-center-simple.css" rel="stylesheet" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


  <title>Stock Price Graph</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
          rel="stylesheet">
  <link href="css/font-awesome.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
  <link href="css/dashboard.css" rel="stylesheet">
  
   <script src="js/jquery-2.1.4.min.js"></script> 
  <script src="js/bootstrap.min.js"></script>
   <script src="js/predict.js"></script> 
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>


  <!-- Load c3.css -->
  <link href="css/c3.css" rel="stylesheet" type="text/css">
  
  <!-- Load d3.js and c3.js -->
  <script src="js/d3.min.js" charset="utf-8"></script>
  <script src="js/c3.js"></script>

  <script src="js/jquery-1.7.2.min.js"></script> 
    <script src="js/predict.js"></script> 
  
</head>

<body>
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
      <div class="container">
       <a class="brand" href="index.html">Karsha - Price Pattern </a>
      </div>
    </div>
  </div>
 
 
    
<div class="container">
<div class="row"><button id="add">ADD</button></div>

	<div class="row" id="parent"></div>
			  
</div>
 
 
 
 <script>
 $('#add').on('click', function() {
 var c;
 for(c=0;c<10;c++){
	  $('#parent').append('<div class="col-md-4"><div id="demo'+ c +'"></div></div>');
	  }
 

 var arr;
 $.ajax({
	    url:  '/Price_Pattern/getDetails/maximaLogic/'+ 38703,
	    type: "GET",
	    dataType: 'html',
	    //contentType: "application/json; charset=utf-8",
	    async: false,
         cache: false,
	    success: function (data) {
	           arr=data;
	    }
	            });
 

arr = JSON.parse( arr); // Do not need to pass to a array; 


//document.write(arr);
console.log(arr[0][1]['Date']);
var i;
 for(i=0;i<10;i++){
var chart=c3.generate({
	bindto: document.getElementById('demo'+i),
	    data: {                
	        
	        json: arr[i],
	        keys: {
	            x: 'Date',
	            value: ['PRC','Pseudo_PRC']
	        }
	    },
	    
	    axis: {
	        x: {
	        	 type: 'timeseries',
              	tick: {format: '%Y-%m-%d'},
				    label: {
				        text: 'Dates',
				        position: 'Right',
				     }
	        }
	    },
	    grid: {
	        x: {
	            lines: [
	                {value: arr[i][9]['Date'], text: 'Maxima',position: 'middle'}
	               
	            ]
	        }
	    },
	    size:{
	    	 width:300
	    },
	    bar: {
	        width: {
	            ratio: 0.5
	        }
	    }
	    
	});
 }
 });
 /*setTimeout(function () {
        chart = c3.generate({
        
            data: {
                url: '/Price_Pattern/getDetails/CompanyPriceController/'+ 38703,
            

                mimeType: 'json',
                keys: {
                    x: 'Date', // it's possible to specify 'x' when category axis
                    value: ['PRC', 'Pseudo_PRC'],
                }
            },
            axis: {
                x: {
                    type: 'timeseries',
                    tick: {format: '%Y-%m-%d'}
                }
            }
        });
    }, 500); */
 </script>
  <script src="js/pace.js"></script>
</body>

</html>