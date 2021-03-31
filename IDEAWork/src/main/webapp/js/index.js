function chgstunum(){
	var snum=document.getElementById("stunum");
	if(snum.value.length >= 10){
		document.getElementById("dstuphone").style.display="block";
	}else{
		document.getElementById("dstuphone").style.display="none";
	}
}


function chgstuphone(){
	var sphone=document.getElementById("stuphone");
	if(sphone.value.length >= 11){
		document.getElementById("dstupwd").style.display="block";
	}else{
		document.getElementById("dstupwd").style.display="none";
	}
}

function chgstupwd(){
	var spwd=document.getElementById("stupwd");
	if(spwd.value.length >= 6){
		document.getElementById("dsubmit").style.display="block";
	}else{
		document.getElementById("dsubmit").style.display="none";
	}
}


function chgvalueshowhide(elemid,felemid,n){
	var spwd=document.getElementById(elemid);
	if(spwd.value.length >= n){
		document.getElementById(felemid).style.display="block";
	}else{
		document.getElementById(felemid).style.display="none";
	}
}
 var login = document.getElementById('login');
     login.onclick = function () {
       var sum = localStorage.length;
       for (var i = 0; i < sum; i++) {
         var key = localStorage.key(i);
         var value = localStorage.getItem(key);
         var user1 = document.getElementById('user1').value;
         var password2 = document.getElementById('password2').value;
        if (user1 == key || password2 == value) {
          $('#login').html('成功');
           $('#login').css({"background": "green"});
           window.open("https://www.baidu.com/");
         } else {
           $('#login').css({"background": "red"});
           $('#login').html('失败');
         }
       }
     }
  