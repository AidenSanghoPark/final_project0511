<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.payout{
	margin:0px auto;
	padding-top:50px;
}
#pobutton{
	text-align:center;
	padding-top:100px;
}
#pobutton submit{
	background-color: blue;
}
</style>
<body>
<section>
<form name="payout" action="payoutaction.do">
	<table class="payout">
		<tr>
			<th>출금신청금액</th>
			<td><input type="text" name="w_price"></td>
		</tr>
		<tr>
			<th>은행&nbsp;</th>
			<td><select name="w_bank">
				<option>카카오</option>
				<option>KB국민</option>
				<option>우리</option>
				<option>신한</option>
				<option>BC</option>
				<option>하나</option>
				<option>SC제일</option>
				<option>한국TC</option>
				<option>농협</option>
				<option>삼성</option>
				<option>롯데</option>
				<option>농협</option>
				<option>현대</option>
				<option>케이</option>
			</select>
			</td>
		</tr>
			<tr>
			<th>예금주</th>
			<td><input type="text" name="w_name"></td>
		</tr>
		<tr>
			<th>계좌번호</th>
			<td><input type="text" name="w_number"></td>
		</tr>
	</table>
	<div id="pobutton">
	<input type="submit" value="출금신청">
	</div>
</form>
</section>
</body>
</html>