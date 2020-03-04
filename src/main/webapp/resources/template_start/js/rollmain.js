	var cnt=0;
 	var wnum=0;
	var wwslidingAuto=null;
	function play_w(directw) {
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
			
			if(wwslidingAuto)clearTimeout(wwslidingAuto);
			wwslidingAuto=setTimeout("play_w('right')",3000);
	}
	var wwslidingAuto=setTimeout("play_w('right')",3000);

$(document).ready(function(){

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