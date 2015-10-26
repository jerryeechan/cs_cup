var PlayerIDCardPrinter = function()
{
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

	var content_x = 457;
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
	var offsetX = new Array(8);
	var offsetY = new Array(8);
	function initConstant()
	{
		offsetX[0] = 0;
		offsetX[1] = a4_width/2;
		for(var i=0;i<4;i++)
		{
			offsetY[i] = i * a4_height/4;
		}
	}

	this.assemble = function()
	{
		initConstant();
		logoImg = $('#title').get(0);
		canvas.width = 2123;
		canvas.height = 3460;
		ctx = canvas.getContext('2d');

		logoImg.onload = function()
		{
			//one page 0~7
			var pageIndex = 0;
			
			for (var i = 0; i < teams.length ; i++)
			{
				var team = teams[i];
				console.log(team);
				for (var j = 0; j < team.members.length;j++)
				{
					var member = team.members[j];
					console.log(member);
					patchMemberToCanvas(team,member,pageIndex);
					pageIndex++;
					if(pageIndex == 8)
					{
						pageIndex = 0;
						//print out the result for download
						exportImage();
						//clean the context
					}
				}
			}
			if(pageIndex!=0)
				exportImage();
		}
	}
	function patchMemberToCanvas(team,member,index)
	{
		// To DO ...
		var offset_x = offsetX[index%2];
		var offset_y = offsetY[Math.floor(index/2)];

		ctx.drawImage(logoImg,offset_x,offset_y);


		ctx.font = "100px Microsoft JhengHei";
		ctx.fillText(member.name,content_x+offset_x,352+offset_y);
		ctx.font = "60px Microsoft JhengHei";
		

		ctx.fillText("學校："+team.school,content_x + offset_x,482+offset_y);
		ctx.fillText("系所："+team.department,content_x+offset_x,573+offset_y);
		ctx.fillText("項目："+team.sport,content_x+offset_x,662+offset_y);
	
	}



	function resizeImageWithHeight(img,height)
	{
		img.width = img.width/img.height*height;
		img.height = height;
	}


	this.readURL = function(input) {
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

		console.log('Please wait');
		var url = canvas.toDataURL('image/png');
		console.log($('#title').get(0));
		$('#result').get(0).src = url;
		var new_url = $('#result').get(0).src.replace(/^data:image\/[^;]/, 'data:application/octet-stream');
		imgurl = new_url;
		//window.open(new_url);
		
	}
	var imgurl;
}


function loadData(teams)
{	
	printer = new PlayerIDCardPrinter();
	printer.teams = teams;
	console.log(printer.teams);
	printer.assemble();
	
}
var openImage = function()
{
	window.open(printer.imgurl,'_blank');
}


var sportString = ["??","男籃","女籃", "男排", "女排", "壘球", "羽球" ,"桌球"];

//$(document).ready(init);
//$(window).bind('page:change', init);

$(window).bind('page:change', function(){
  jQuery(".best_in_place").best_in_place();
});

