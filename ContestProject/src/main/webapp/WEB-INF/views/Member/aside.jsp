<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>



/********* SIDE NAV BAR ***********/
a {
color:#000;
}

li {
list-style:none;
} 

.panel-default>.panel-heading {
    color: #fff;
    background-color: #00436a;
    border-color: #ddd;
}

.panel-group .panel+.panel {
    margin-top: 0px;
}
.panel-group {
	margin-top: 35px;
}
.panel-collapse {
	background-color:rgba(220, 213, 172, 0.5);
}

.glyphicon { 
margin-right:10px; 
}


ul.list-group {
	margin:0px;
}

ul.bulletlist li {
	list-style:disc;
}


ul.list-group  li a {
 display:block;
 padding:5px 0px 5px 15px;
 text-decoration:none;
}

ul.list-group li {
	border-bottom: 1px dotted rgba(0,0,0,0.2);
}
	

ul.list-group  li a:hover, ul li a:focus {
 color:#fff;
 background-color: #00436a;
}

.panel-title a:hover,
.panel-title a:active,
.panel-title a:focus,
.panel-title .open a:hover,
.panel-title .open a:active,
.panel-title .open a:focus
 {
	text-decoration:none;
	color:#fff;
}

.panel-title>.small, .panel-title>.small>a, .panel-title>a, .panel-title>small, .panel-title>small>a {
        display: block;
}

@media (min-width: 768px){
.navbar-collapse.collapse 
	{
    display: block!important;
    height: auto!important;
    padding-bottom: 0;
    overflow: visible!important;
	padding-left:0px; 
}
}

@media (min-width: 992px){
.menu-hide {
    display: none;
}

}
.menu-hide .panel-default>.panel-heading {
    color: #fff;
    background-color: #8e8c8c;
    border-color: #ddd;
}

/********** END SIDEBAR *************/

/********** NAVBAR TOGGLE *************/

.navbar-toggle .icon-bar {
    background-color: #fff;
}
.navbar-toggle {
    padding: 11px 10px;
    margin-top: 8px;
    margin-right: 15px;
    margin-bottom: 8px;
    background-color: #a32638;
    border-radius: 0px;
}

/********** END NAVBAR TOGGLE *************/


/********** END NAVBAR TOGGLE *************/
 
</style>
</head>
<body>

		<div style="position:fixed; bottom:-120px; left:10px; widt:1000px; height:300px; z-index:999;">
  <!-- I was motivated to create this after seeing BhaumikPatel's http://bootsnipp.com/snippets/featured/accordion-menu; I adapted it to a list format rather than a table so that it would be easy to create a nav toggle button when viewed on mobile devices -->
  <div class="col-md-3">
  <div id="sidenav1">
    <div class="navbar-header">
     
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-book"> </span>Research<span class="caret"></span></a> </h4>
          </div>
          <!-- Note: By adding "in" after "collapse", it starts with that particular panel open by default; remove if you want them all collapsed by default --> 
          <div id="collapseOne" class="panel-collapse collapse in">
            <ul class="list-group">
              <li class="navlink2"><a href=""><span class="glyphicon glyphicon-book"></span>Overview</a></li>
              <li><a href="" class="navlink">Link 1</a></li>
              <li><a href="" class="navlink">Link 2</a></li>
              <li><a href="" class="navlink">Link 3</a></li>
              <li><a href="" class="navlink">Link 4</a></li>
            </ul>
          </div>
        </div>
        <div class="panel panel-default">
        
        <!-- end hidden Menu items --> 
      </div>
    </div>
  </div>
</div>


		<script>
		$.fn.extend({
		    treed: function (o) {
		      
		      var openedClass = 'glyphicon-minus-sign';
		      var closedClass = 'glyphicon-plus-sign';
		      
		      if (typeof o != 'undefined'){
		        if (typeof o.openedClass != 'undefined'){
		        openedClass = o.openedClass;
		        }
		        if (typeof o.closedClass != 'undefined'){
		        closedClass = o.closedClass;
		        }
		      };
		      
		        //initialize each of the top levels
		        var tree = $(this);
		        tree.addClass("tree");
		        tree.find('li').has("ul").each(function () {
		            var branch = $(this); //li with children ul
		            branch.prepend("<i class='indicator glyphicon " + closedClass + "'></i>");
		            branch.addClass('branch');
		            branch.on('click', function (e) {
		                if (this == e.target) {
		                    var icon = $(this).children('i:first');
		                    icon.toggleClass(openedClass + " " + closedClass);
		                    $(this).children().children().toggle();
		                }
		            })
		            branch.children().children().toggle();
		        });
		        //fire event from the dynamically added icon
		      tree.find('.branch .indicator').each(function(){
		        $(this).on('click', function () {
		            $(this).closest('li').click();
		        });
		      });
		        //fire event to open branch if the li contains an anchor instead of text
		        tree.find('.branch>a').each(function () {
		            $(this).on('click', function (e) {
		                $(this).closest('li').click();
		                e.preventDefault();
		            });
		        });
		        //fire event to open branch if the li contains a button instead of text
		        tree.find('.branch>button').each(function () {
		            $(this).on('click', function (e) {
		                $(this).closest('li').click();
		                e.preventDefault();
		            });
		        });
		    }
		});

		//Initialization of treeviews

		$('#tree1').treed();

		$('#tree2').treed({openedClass:'glyphicon-folder-open', closedClass:'glyphicon-folder-close'});

		$('#tree3').treed({openedClass:'glyphicon-chevron-right', closedClass:'glyphicon-chevron-down'});

</script>

</body>
</html>