<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
.stars {
	display: flex;
	flex-direction: row-reverse;
	margin: 10px;
}

.stars>i:hover:before, .stars>i:hover ~ i:before {
	color: gold;
	cursor: pointer;
}

.star-input>output {
	display: inline-block;
	width: 60px;
	font-size: 18px;
	text-align: right;
	vertical-align: middle;
}

.panel-shadow {
	box-shadow: rgba(0, 0, 0, 0.3) 7px 7px 7px;
}

.panel-white {
	border: 1px solid #dddddd;
}

.panel-white  .panel-heading {
	color: #333;
	background-color: #fff;
	border-color: #ddd;
}

.panel-white  .panel-footer {
	background-color: #fff;
	border-color: #ddd;
}

.post .post-heading {
	height: 95px;
	padding: 20px 15px;
}

.post .post-heading .avatar {
	width: 60px;
	height: 60px;
	display: block;
	margin-right: 15px;
}

.post .post-heading .meta .title {
	margin-bottom: 0;
}

.post .post-heading .meta .title a {
	color: black;
}

.post .post-heading .meta .title a:hover {
	color: #aaaaaa;
}

.post .post-heading .meta .time {
	margin-top: 8px;
	color: #999;
}

.post .post-image .image {
	width: 100%;
	height: auto;
}

.post .post-description {
	padding: 15px;
}

.post .post-description p {
	font-size: 14px;
}

.post .post-description .stats {
	margin-top: 20px;
}

.post .post-description .stats .stat-item {
	display: inline-block;
	margin-right: 15px;
}

.post .post-description .stats .stat-item .icon {
	margin-right: 8px;
}

.post .post-footer {
	border-top: 1px solid #ddd;
	padding: 15px;
}

.post .post-footer .input-group-addon a {
	color: #454545;
}

.post .post-footer .comments-list {
	padding: 0;
	margin-top: 20px;
	list-style-type: none;
}

.post .post-footer .comments-list .comment {
	display: block;
	width: 100%;
	margin: 20px 0;
}

.post .post-footer .comments-list .comment .avatar {
	width: 35px;
	height: 35px;
}

.post .post-footer .comments-list .comment .comment-heading {
	display: block;
	width: 100%;
}

.post .post-footer .comments-list .comment .comment-heading .user {
	font-size: 14px;
	font-weight: bold;
	display: inline;
	margin-top: 0;
	margin-right: 10px;
}

.post .post-footer .comments-list .comment .comment-heading .time {
	font-size: 12px;
	color: #aaa;
	margin-top: 0;
	display: inline;
}

.post .post-footer .comments-list .comment .comment-body {
	margin-left: 50px;
}

.post .post-footer .comments-list .comment>.comments-list {
	margin-left: 50px;
}

</style>
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">

<script src="resources/js/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="//tinymce.cachefly.net/4.0/tinymce.min.js"></script>
<script>
          tinymce.init({
              selector: "textarea",
              plugins: [
                  "advlist autolink lists link image charmap print preview anchor",
                  "searchreplace visualblocks code fullscreen",
                  "insertdatetime media table contextmenu paste"
              ],
              toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
          });
  </script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">

<script>
	

		
</script>

<c:if test="${u_id == null}">
	<script>
      alert("로그인 후 이용하실 수 있습니다.");
      location.href = "/contest/home";
   </script>
</c:if>

<script>
	
	// Starrr plugin (https://github.com/dobtco/starrr)
	var __slice = [].slice;

	(function($, window) {
	  var Starrr;

	  Starrr = (function() {
	    Starrr.prototype.defaults = {
	      rating: void 0,
	      numStars: 5,
	      change: function(e, value) {}
	    };

	    function Starrr($el, options) {
	      var i, _, _ref,
	        _this = this;

	      this.options = $.extend({}, this.defaults, options);
	      this.$el = $el;
	      _ref = this.defaults;
	      for (i in _ref) {
	        _ = _ref[i];
	        if (this.$el.data(i) != null) {
	          this.options[i] = this.$el.data(i);
	        }
	      }
	      this.createStars();
	      this.syncRating();
	      this.$el.on('mouseover.starrr', 'span', function(e) {
	        return _this.syncRating(_this.$el.find('span').index(e.currentTarget) + 1);
	      });
	      this.$el.on('mouseout.starrr', function() {
	        return _this.syncRating();
	      });
	      this.$el.on('click.starrr', 'span', function(e) {
	        return _this.setRating(_this.$el.find('span').index(e.currentTarget) + 1);
	      });
	      this.$el.on('starrr:change', this.options.change);
	    }

	    Starrr.prototype.createStars = function() {
	      var _i, _ref, _results;

	      _results = [];
	      for (_i = 1, _ref = this.options.numStars; 1 <= _ref ? _i <= _ref : _i >= _ref; 1 <= _ref ? _i++ : _i--) {
	        _results.push(this.$el.append("<span class='glyphicon .glyphicon-star-empty'></span>"));
	      }
	      return _results;
	    };

	    Starrr.prototype.setRating = function(rating) {
	      if (this.options.rating === rating) {
	        rating = void 0;
	      }
	      this.options.rating = rating;
	      this.syncRating();
	      return this.$el.trigger('starrr:change', rating);
	    };

	    Starrr.prototype.syncRating = function(rating) {
	      var i, _i, _j, _ref;

	      rating || (rating = this.options.rating);
	      if (rating) {
	        for (i = _i = 0, _ref = rating - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
	          this.$el.find('span').eq(i).removeClass('glyphicon-star-empty').addClass('glyphicon-star');
	        }
	      }
	      if (rating && rating < 5) {
	        for (i = _j = rating; rating <= 4 ? _j <= 4 : _j >= 4; i = rating <= 4 ? ++_j : --_j) {
	          this.$el.find('span').eq(i).removeClass('glyphicon-star').addClass('glyphicon-star-empty');
	        }
	      }
	      if (!rating) {
	        return this.$el.find('span').removeClass('glyphicon-star').addClass('glyphicon-star-empty');
	      }
	    };

	    return Starrr;

	  })();
	  return $.fn.extend({
	    starrr: function() {
	      var args, option;

	      option = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
	      return this.each(function() {
	        var data;

	        data = $(this).data('star-rating');
	        if (!data) {
	          $(this).data('star-rating', (data = new Starrr($(this), option)));
	        }
	        if (typeof option === 'string') {
	          return data[option].apply(data, args);
	        }
	      });
	    }
	  });
	})(window.jQuery, window);

	$(function() {
	  return $(".starrr").starrr();
	});

	$( document ).ready(function() {
	      
	  $('#stars').on('starrr:change', function(e, value){
	    $('#count').html(value);
	  });
	  
	  $('#stars-existing').on('starrr:change', function(e, value){
	    $('#count-existing').html(value);
	  });
	});
	function initMap() {
		
		
		var lat=document.getElementById("p_lat").innerHTML;
		var lng=document.getElementById("p_lng").innerHTML;
		
		
	  var myLatLng = {lat:parseFloat(lat), lng:parseFloat(lng)};
	
	  var map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 20,
	    center: myLatLng
	  });
	
	  var marker = new google.maps.Marker({
	    position: myLatLng,
	    map: map,
	    title: 'Hello World!'
	  });
	}
	</script>





<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정</title>
</head>
<body>
	<table class="board_view">
		<colgroup>
			<col width="15%">
			<col width="*" />
		</colgroup>
		<div class="modal-header" style="padding: 5px 20px;" />
		<hr>
		<h2 style="margin-left: 10px">
			<b class="glyphicon glyphicon-check" style="margin-right: 5px"></b>상세보기
		</h2>
		<hr>
		<div class="col-sm-10">
			<div class="form-group">
				<label class="col-sm-3 control-label"><b
					class="glyphicon glyphicon-ok" style="margin-right: 5px"></b>작성자</label>
				<div class="col-sm-7">
					<input class="form-control" class="form-control"
						value=${placeInfo.u_id } readonly="readonly">
				</div>
			</div>
			<br> <br>

			<div class="form-group">
				<label class="col-sm-3 control-label"><b
					class="glyphicon glyphicon-ok" style="margin-right: 5px"></b>제목</label>
				<div class="col-sm-7">
					<input class="form-control" class="form-control"
						value="${placeInfo.p_name}" readonly="readonly">
				</div>
			</div>
			<br> <br>





			<div class="form-group">
				<label class="col-sm-3 control-label"><b
					class="glyphicon glyphicon-ok" style="margin-right: 5px"></b>종류</label>
				<div class="col-sm-7">
					${placeInfo.p_Kind}
				
				
					
				</div>
			</div>
			<br> <br>

			<div class="form-group">
				<label class="col-sm-3 control-label"><b
					class="glyphicon glyphicon-ok" style="margin-right: 5px"></b>옵션</label>
				<div class="col-sm-7">
					${placeInfo.p_option}
					
				</div>
			</div>
			<br> <br>
			<div class="form-group">
				<label class="col-sm-3 control-label"><b
					class="glyphicon glyphicon-ok" style="margin-right: 5px"></b>주소</label>
				<div class="col-sm-7">
					<span style="width: 2000px">${placeInfo.p_address}</span>
				</div>
			</div>
			<br> <br>
			<div class="form-group">
				<label class="col-sm-3 control-label"><b
					class="glyphicon glyphicon-ok" style="margin-right: 5px"></b>가격</label>
				<div class="col-sm-7">
					<span style="width: 2000px">${placeInfo.p_cost }원</span>
				</div>
			</div>
			<br> <br>
			<div class="form-group">
				<label class="col-sm-3 control-label"><b
					class="glyphicon glyphicon-ok" style="margin-right: 5px"></b>상세내용</label>
				<div class="col-sm-7">
					<span style="width: 2000px">${placeInfo.p_Content }</span>
				</div>
			</div>
			<br> <br>

		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label"><b
				class="glyphicon glyphicon-ok"></b>위치</label>
			<div class="col-sm-7">
				<div>


					<span id="p_lat" style="color: white">${placeInfo.p_lat }</span>
				</div>
				<div>

					<span id="p_lng" style="color: white">${placeInfo.p_lng}</span>
				</div>
				<div id="map" style="width: 100%; height: 500px"></div>
				<script type="text/javascript"
					src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDLOBQVtSKaOFA3azizG1X-lU5QolxGnLU&callback=initMap"></script>

				<c:if test="${sessionScope.u_id =='admin'}">
					<div class="container" style="margin-left: 200px;">
						<a href="eventPlace?p_id=${placeInfo.p_id }"> <input
							type="button" class="btn btn-success" value="수정"></a> <a
							href="deletePlace?p_id=${placeInfo.p_id }" class="btn btn-danger">
							<!-- <input type="button"
			value="삭제"> -->삭제
						</a> <a href="PlaceList"><input type="button"
							class="btn btn-warning" value="돌아가기"></a>
					</div>
				</c:if>


				</tbody>
				<c:if test="${sessionScope.u_id !='admin'}">
					<br />
					<a
						href="reservationForm?p_id=${placeInfo.p_id} &u_id=${sessionScope.u_id}"><input
						type="button" class="btn btn-success" value="예약"></a>
					<a href="PlaceList"><input type="button"
						class="btn btn-warning" value="돌아가기"></a>
				</c:if>


			</div>
		</div>








	</table>





</body>
</html>