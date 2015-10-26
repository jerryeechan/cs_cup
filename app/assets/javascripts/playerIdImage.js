var printer;
var PlayerIDCardPrinter = function()
{
	this.imgurl = 'test';
	var logoImg;
	var logo_x = 62;
	var logo_y;

	var fieldImg;
	var field_x;
	var field_y;

	var name_x = 0;
	var name_y = 0;

	var department_x = 0;
	var department_y = 0;

	var content_x = 557;
	var school_x = content_x;
	var school_y = 100;

	var sport_x = content_x;
	var sport_y = 0;

	var photo_x = 137;
	var photo_y = 0;


	var margin_width = 22;
	var imgHeight = 302;
	var img_y = 78;
	var totalWidth = 0;
	var current_film_x = 0;
	var current_image_x = margin_width;
	var canvas_width;
	var film_editor;
	var ctx;
	var temp_img;
	var canvas;
	var filmImg;

	//canvas = $('#canvas').get(0);
	var canvas = document.createElement('canvas');
	
    /*
    var img = new Image();
    img.src = 'IMG_0026.jpg';
    resizeImageWithHeight(img,imgHeight);
    addPhoto(img);
	*/
	/*
	$('#add-image-button').click(function()
	{
		console.log('click');
		addPhoto(img);
	});*/


	var a4_height = 3508;
	var a4_width = 2480;
	var offsetX = new Array(10);
	var offsetY = new Array(10);
	function initConstant()
	{
		console.log('initConstant');
		offsetX[0] = 0;
		offsetX[1] = (a4_width-200)/2;
		for(var i=0;i<5;i++)
		{
			offsetY[i] = i * (a4_height-200)/5;
		}
	}

	this.assemble = function()
	{
		initConstant();
		logoImg = $('#title').get(0);
		canvas.width = 2480;
		canvas.height = 3508;
		ctx = canvas.getContext('2d');
		
		var photoData = this.photoData;
		
			
			//one page 0~7
		var pageIndex = 0;
		var photoCnt = 0;

		/*
		for (var i = 0; i < teams.length ; i++)
		{
			var team = teams[i];
			console.log(team);
			for (var j = 0; j < team.members.length;j++)
			{
				var member = team.members[j];

				patchMemberToCanvas(team,member,photoData[photoCnt],pageIndex);
				pageIndex++;
				photoCnt++;
				if(pageIndex == 10)
				{
					pageIndex = 0;
					//print out the result for download
					exportImage();
					//clean the context
				}
			}
		}
		*/
		
		//exportImage();
		console.log(teams.length);
		getOnePage();
		
	}

	var team_i = 0;
	var member_i = 0;
	var end = false;
	var photoCnt = 0;
	var pageCnt = 0;
	function getOnePage()
	{
		console.log('page:'+pageCnt);
		pageCnt++;

		var photoData = printer.photoData;
		for(var i=0;i<10;i++)
		{
			var team = teams[team_i];
			var member = team.members[member_i];	
			console.log(member_i);
			console.log(member);
			patchMemberToCanvas(team,member,photoData[photoCnt],i);

			member_i++;
			photoCnt++;
			while(member_i==teams[team_i].members.length)
			{
				member_i = 0;
				team_i++;
				console.log(team_i);
				if(team_i==teams.length)
				{
					console.log('break');
					end = true;
					break;
				}
			}
			if(end == true)
				break;
		}

		exportImage();

		if(end == false)
		{
			console.log('end:'+end);
			setTimeout(getOnePage, 3);
		}
		
	}
	function patchMemberToCanvas(team,member,photo,index)
	{
		// To DO ...
		var offset_x = 100+offsetX[index%2];
		var offset_y = 100+offsetY[Math.floor(index/2)];
		ctx.lineWidth="3";
		ctx.rect(offset_x,offset_y,offsetX[1],offsetY[1]);
		
		ctx.stroke();
		ctx.drawImage(logoImg,offset_x+100,offset_y+50);


		ctx.font = "100px Microsoft JhengHei";
		ctx.fillText(member.name,content_x+offset_x,302+offset_y);
		ctx.font = "48px Microsoft JhengHei";
		//var img = new Image();
		
		ctx.fillText("學校："+team.school,content_x + offset_x,422+offset_y);
		ctx.fillText("系所："+team.department,content_x+offset_x,513+offset_y);
		ctx.fillText("項目："+team.sport,content_x+offset_x,602+offset_y);

		var photoHeight = 400;
		var photoWidth =  photo.width/photo.height*photoHeight;

		if(photoWidth>content_x)
		{
			photoHeight =  photo.height/photo.width*content_x;
			photoWidth = content_x;
		}

		if(photoWidth>457)
			ctx.drawImage(photo,offset_x,222+offset_y,photoWidth,photoHeight);
		else
			ctx.drawImage(photo,100+offset_x,222+offset_y,photoWidth,photoHeight);
		/*
		img.onload = function()
		{
			console.log(img);
			ctx.drawImage(img,offset_x,352+offset_y)
		};
		*/
		//console.log(member.image);
		
	}



	function resizeImageWithHeight(img,height)
	{
		img.width = img.width/img.height*height;
		img.height = height;
	}


	this.readURL = function(input) {
		this.imgurl = 'test';
      if (input.files && input.files[0]) {
      	//create reader
          var reader = new FileReader();

          function readFile(index)
          {

          	if( index >= input.files.length ) return;

           	reader.onload = function (e) {
          	  temp_img =new Image();
              temp_img.src = e.target.result;
              resizeImageWithHeight(temp_img,imgHeight);
              addPhoto(temp_img);
              readFile(index+1);
          	}
          	reader.readAsDataURL(input.files[index]);
          }
          readFile(0);
      }
	}
	
	var exportImage = function()
	{

		console.log('Exporting image and download');
		var url = canvas.toDataURL('image/png');
		$('#result').get(0).src = url;
		var new_url = url.replace(/^data:image\/[^;]/, 'data:application/octet-stream');
		window.open(new_url,'_blank');
		ctx.clearRect(0,0,a4_width,a4_height);

		//console.log(this);
	}
	
}


function loadData(teams)
{	

	var photos = $('img.photo').get();
	
	
	var photoData = new Array();
	for(var photo in photos)
	{
		var newImg = new Image();
		newImg.src = photo.src;
		photoData.push(newImg);
	}

	printer = new PlayerIDCardPrinter();
	printer.teams = teams;
	printer.photoData = photos;
	
	printer.assemble();
	console.log('assemble done');
}
var openImage = function()
{
	loadData(teams);
	//window.open(imgurl,'_blank');
}


var sportString = ["??","男籃","女籃", "男排", "女排", "壘球", "羽球" ,"桌球"];


$(window).bind('page:change', function(){
  jQuery(".best_in_place").best_in_place();
});

