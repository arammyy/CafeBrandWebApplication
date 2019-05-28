function openPage(pageName,elmnt,color,fontcolor) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].style.backgroundColor = "";
    tablinks[i].style.color = "";
  }
  document.getElementById(pageName).style.display = "block";
  elmnt.style.backgroundColor = color;
  elmnt.style.color = fontcolor;
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();

function member(){
	   location.href="/admin/member/list.jsp";
	}
function product(){
	location.href="/admin/product.jsp";
}
function franchisee(){
	location.href="/admin/franchisee.jsp";

	
}