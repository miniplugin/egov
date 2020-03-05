	var cnt=0;
 	var wnum=0;
	var wwslidingAuto=null;
	function play_w(directw) {
			/* 슬라이드 갯수 제한 변수 처리 */
			cnt=0;
			cnt=($(".rollingbtn").find('li.seq a').length)-1;

			if(directw=="right"){
				wnum++;
				if(wnum>cnt)wnum=0;
			}else if(directw=="left"){
				wnum--;
				if(wnum<0)wnum=cnt;
			}else {
				wnum = directw;
			}

			$(".rollingbtn").find('li.seq a').each(function(){
				$(".rollingbtn li.seq a img").attr('src',$(".rollingbtn li.seq a img").attr('src').replace('_on.png','_off.png'));
			});
						
			$(".rollingbtn li.butt"+wnum+ " a img").attr('src',$(".rollingbtn li.butt"+wnum+ " a img").attr('src').replace('_off.png','_on.png'));

			for(var i=0; i<=cnt; i++) {
				if(wnum==i){
					for(var j=0; j<=cnt; j++) {
						if(j==i){
							$(".viewImgList li.imglist"+j).animate({'opacity' : 1 },1000);
							$(".viewImgList li.imglist"+j).css({'z-index' : '50' });
						}else{
							$(".viewImgList li.imglist"+j).animate({'opacity' : 0 },1000);
							$(".viewImgList li.imglist"+j).css({'z-index' : '10' });
						}
					}
				}
			}
			/* 기존 하드 코딩에서 위 for문으로 단순화 처리.
			if(wnum==0) {
				$(".viewImgList li.imglist1").animate({'opacity' : 0 },1000);
				$(".viewImgList li.imglist2").animate({'opacity' : 0 },1000);
				$(".viewImgList li.imglist0").animate({'opacity' : 1 },1000);
				$(".viewImgList li.imglist1").css({'z-index' : '10' });
				$(".viewImgList li.imglist2").css({'z-index' : '10' });
				$(".viewImgList li.imglist0").css({'z-index' : '50' });
			}else if (wnum==1){
				$(".viewImgList li.imglist0").animate({'opacity' : 0 },1000);
				$(".viewImgList li.imglist2").animate({'opacity' : 0 },1000);
				$(".viewImgList li.imglist1").animate({'opacity' : 1 },1000);
				$(".viewImgList li.imglist0").css({'z-index' : '10' });
				$(".viewImgList li.imglist2").css({'z-index' : '10' });
				$(".viewImgList li.imglist1").css({'z-index' : '50' });
			}else if (wnum==2){
				$(".viewImgList li.imglist0").animate({'opacity' : 0 },1000);
				$(".viewImgList li.imglist1").animate({'opacity' : 0 },1000);
				$(".viewImgList li.imglist2").animate({'opacity' : 1 },1000);
				$(".viewImgList li.imglist0").css({'z-index' : '10' });
				$(".viewImgList li.imglist1").css({'z-index' : '10' });
				$(".viewImgList li.imglist2").css({'z-index' : '50' });
			}
			*/
			if(wwslidingAuto)clearTimeout(wwslidingAuto);
			wwslidingAuto=setTimeout("play_w('right')",3000);
	}
	var wwslidingAuto=setTimeout("play_w('right')",3000);

$(document).ready(function(){

	/* 속도 때문에 css에서 0-9개까지 적용. 10개보다 더 많을때 처리 - 주석해제 필요함.
	var cnt=($(".rollingbtn").find('li.seq a').length)-1;
	for(var j=10; j<=cnt; j++) {
		if(j==0){$(".viewImgList li.imglist"+j).css({'position':'relative' });}else{
		$(".viewImgList li.imglist"+j).css({'position':'absolute','width':'100%','left':'0','top':'0' });
		}
	}
	*/
	//초기 1번 슬라이드 네비 버튼 활성화
	$(".rollingbtn li.butt0 a img").attr('src',$(".rollingbtn li.butt0 a img").attr('src').replace('_off.png','_on.png'));
	
	$(".rollstop a").click(function(){
		$(this).parent().hide();
		$(".rollplay").css('display','inline-block');
		if(wwslidingAuto)clearTimeout(wwslidingAuto);	
	});

	$(".rollplay a").click(function(){
		$(this).parent().hide();
		$(".rollstop").css('display','inline-block');
		play_w('right');
	});

	$(".rollingbtn li.seq a").each(function(index){
		$(this).click(function(){
			$(".rollplay").hide();
			$(".rollstop").css('display','inline-block');
			if(wwslidingAuto)clearTimeout(wwslidingAuto);	
			play_w(index);
		});
	});

});