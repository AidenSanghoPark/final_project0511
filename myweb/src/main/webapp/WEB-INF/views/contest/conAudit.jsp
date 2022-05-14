<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>	
#article_cat{
	float: left;
	width: 20%;
	border: 1px;
	width:220px;
	margin: 0 32px 0 0;
	clear:both;
}

  #note-content {
  	font-size : 20px;
    display: none;
  }
  #note-toggle {
  	font-size : 30px;
    cursor: pointer;
  }
  #note-toggle:hover {
    text-decoration: underline;
  }
  #desk-content {
  	font-size : 20px;
    display: none;
  }
  #desk-toggle {
  font-size : 30px;
    cursor: pointer;
  }
  #desk-toggle:hover {
    text-decoration: underline;
  }
  #acc-content {
  font-size : 20px;
    display: none;
  }
  #acc-toggle {
  font-size : 30px;
    cursor: pointer;
  }
  #acc-toggle:hover {
    text-decoration: underline;
  }
  #etc_a{
  font-size: 30px;
  
  }
  #etc_a:hover{
  	cursor: pointer;
  	text-decoration: underline;
  }
  ol{
  list-style: none;
  }
  a{
  text-decoration-line: none;
  color: black;
  }
  a:hover{
  text-decoration: underline;
  }
</style>
<article id="article_cat">
<h2>카테고리</h2>
<div>
<span id="note-toggle" onclick="note()">노트북</span>
<ol id="note-content">
  <li><a href="/myweb/item/getItemList.jsp?item_type=laptop">전체</a></li>
  <li><a href="/myweb/item/getItemList.jsp?item_type=laptop&item_brand=apple">APPLE</a></li>
  <li><a href="/myweb/item/getItemList.jsp?item_type=laptop&item_brand=samsung">SAMSUNG</a></li>
  <li><a href="/myweb/item/getItemList.jsp?item_type=laptop&item_brand=lg">LG</a></li>
  <li><a href="/myweb/item/getItemList.jsp?item_type=laptop&item_brand=dell">DELL</a></li>
  <li><a href="/myweb/item/getItemList.jsp?item_type=laptop&item_brand=lenovo">LENOVO</a></li>
  <li><a href="/myweb/item/getItemList.jsp?item_type=laptop&item_brand=asus">ASUS</a></li>
</ol>
</div>
<hr>
<div>
<span id="desk-toggle" onclick="desk()">데스크톱</span>
<ol id="desk-content">
  <li><a href="/myweb/item/getItemList.jsp?item_type=desktop">전체</a></li>
  <li><a href="/myweb/conList.do?c_cate=인쇄">APPLE</a></li>
  <li><a href="/myweb/item/getItemList.jsp?item_type=desktop&item_brand=samsung">SAMSUNG</a></li>
  <li><a href="/myweb/item/getItemList.jsp?item_type=desktop&item_brand=lg">LG</a></li>
  <li><a href="/myweb/item/getItemList.jsp?item_type=desktop&item_brand=dell">DELL</a></li>
  <li><a href="/myweb/item/getItemList.jsp?item_type=desktop&item_brand=lenovo">LENOVO</a></li>
  <li><a href="/myweb/item/getItemList.jsp?item_type=desktop&item_brand=asus">ASUS</a></li>
</ol>
</div>
<hr>
<div>
<span id="acc-toggle" onclick="acc()">주변기기</span>
<ol id="acc-content">
  <li><a href="/myweb/item/getItemList.jsp?item_type=monitor">모니터</a></li> 
  <li><a href="/myweb/item/getItemList.jsp?item_type=keyboard">키보드</a></li>
  <li><a href="/myweb/item/getItemList.jsp?item_type=mouse">마우스</a></li>
  <li><a href="/myweb/item/getItemList.jsp?item_type=headset">헤드셋</a></li>
  <li><a href="/myweb/item/getItemList.jsp?item_type=speaker">스피커</a></li>
  <li><a href="/myweb/item/getItemList.jsp?item_type=mic">마이크</a></li>
  <li><a href="/myweb/item/getItemList.jsp?item_type=webcam">웹캠</a></li>
</ol>
</div>
<hr>
<div><a id="etc_a" href="/myweb/item/getItemList.jsp?item_type=etc">ETC</a></div>
<hr>
<div id="product_order_list">
			<p>
			<a href="javascript:recentlist();">최신순</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
			<a href="javascript:pricelist();">낮은가격</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
			<a href="javascript:pricelistdesc();">높은가격</a> </p>
		</div>
</article>

<script>
var pricelistdesc = function(url){

	$.ajax({
		type: 'get',
		url: "../PricelistDesc",
		data: "",
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			$('#product_list').html(data);
		},
		error: function(request, status, error) {
			alert(error);
		}
	});
};
  function note() {
    if(document.getElementById('note-content').style.display === 'block') {
      document.getElementById('note-content').style.display = 'none';
      document.getElementById(this.id).textContent = '';
    } else {
      document.getElementById('note-content').style.display = 'block';
      document.getElementById('desk-content').style.display = 'none';
      document.getElementById('acc-content').style.display = 'none';
      document.getElementById(this.id).textContent = '';
    }
  }
  function desk() {
    if(document.getElementById('desk-content').style.display === 'block') {
      document.getElementById('desk-content').style.display = 'none';
      document.getElementById(this.id).textContent = '';
    } else {
      document.getElementById('desk-content').style.display = 'block';
      document.getElementById('acc-content').style.display = 'none';
      document.getElementById('note-content').style.display = 'none';
      document.getElementById(this.id).textContent = '';
    }
  }
  function acc() {
    if(document.getElementById('acc-content').style.display === 'block') {
      document.getElementById('acc-content').style.display = 'none';
      document.getElementById(this.id).textContent = '';
    } else {
      document.getElementById('acc-content').style.display = 'block';
      document.getElementById('desk-content').style.display = 'none';
      document.getElementById('note-content').style.display = 'none';
      document.getElementById(this.id).textContent = '';
    }
  }
</script>

