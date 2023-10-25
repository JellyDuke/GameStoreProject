<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style> 
	.banner {position: relative; width: 1400px; height: 460px; top: 50px;  margin:0 auto; padding:0; overflow: hidden;}
	.banner ul {position: absolute; margin: 0px; padding:0; list-style: none; }
	.banner ul li {float: left; width: 800px; height: 460px; margin:0; padding:0;}
	
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var $banner = $(".banner").find("ul");

	var $bannerWidth = $banner.children().outerWidth();//이미지의 폭
	var $bannerHeight = $banner.children().outerHeight(); // 높이
	var $length = $banner.children().length;//이미지의 갯수
	var rollingId;

	$banner.css("width", $bannerWidth * $length + "px");
	$banner.css("height", $bannerHeight + "px");
	
	//정해진 초마다 함수 실행
	rollingId = setInterval(function() { rollingStart(); }, 3000);//다음 이미지로 롤링 애니메이션 할 시간차
	
	function rollingStart() {
		$banner.css("width", $bannerWidth * $length + "px");
		$banner.css("height", $bannerHeight + "px");
		//alert(bannerHeight);
		//배너의 좌측 위치를 옮겨 준다.
		$banner.animate({left: - $bannerWidth + "px"}, 1500, function() { //숫자는 롤링 진행되는 시간이다.
			//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
			$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
			//뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
			$(this).find("li:first").remove();
			//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
			$(this).css("left", 0);
			//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
		});
	}
}); 
</script>
	 <div>
		<div class="banner">
			<ul style="">
				<li><img src="https://cdn.cloudflare.steamstatic.com/steam/apps/1245620/ss_e80a907c2c43337e53316c71555c3c3035a1343e.600x338.jpg?t=1683618443" width="800px" height= "460px"></li>
				<li><img src="https://cdn.cloudflare.steamstatic.com/steam/apps/835570/ss_fce2123725e54fddfac8a043ff665ffc6a5f717a.600x338.jpg?t=1694677375" width="800px" height= "460px"></li>
				<li><img src="https://cdn.cloudflare.steamstatic.com/steam/apps/1172470/ss_e7ba0c5706f1a96bd2936e51ae8a3efb05708d17.600x338.jpg?t=1695930392" width="800px" height= "460px"></li>
				<li><img src="https://cdn.cloudflare.steamstatic.com/steam/apps/1085660/ss_a9642404e586be28f856e8f02d038828f691a5ba.600x338.jpg?t=1696977153" width="800px" height= "460px"></li>
				<li><img src="https://cdn.cloudflare.steamstatic.com/steam/apps/2195250/ss_5320cc6b6c7fd39b41defe0570c3182df7065fd5.600x338.jpg?t=1697451731" width="800px" height= "460px"></li>
				<li><img src="https://cdn.cloudflare.steamstatic.com/steam/apps/1203220/ss_c5cbb4fb8fcd71b6fd64f86b3f18dd9f00f11787.600x338.jpg?t=1697677967" width="800px" height= "460px"></li>
				<li><img src="https://cdn.cloudflare.steamstatic.com/steam/apps/1091500/ss_4bda6f67580d94832ed2d5814e41ebe018ba1d9e.600x338.jpg?t=1697461008" width="800px" height= "460px"></li>
				<li><img src="https://cdn.cloudflare.steamstatic.com/steam/apps/949230/ss_1d6b8ebcad1972b57efc4fe5eacb6e934fd940c5.600x338.jpg?t=1697641200" width="800px" height= "460px"></li>
			</ul>
 		</div>
	 </div>
		