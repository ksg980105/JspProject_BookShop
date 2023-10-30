/**
 * 
 */
 
function inputcheck(){
	if($('input[name="pname"]').val()==""){
		alert('상품명을 입력하세요.');
		$('input[name="pname"]').focus();
		return false;
	}
	if($('input[name="publisher"]').val()==""){
		alert('출판사를 입력하세요.');
		$('input[name="publisher"]').focus();
		return false;
	}
	if($('input[name="pqty"]').val()==""){
		alert('갯수를 입력하세요.');
		$('input[name="pqty"]').focus();
		return false;
	}
	if(isNaN($('input[name="pqty"]').val())){
		alert('숫자만 입력하세요.');
		$('input[name="pqty"]').focus();
		return false;
	}
	if($('input[name="price"]').val()==""){
		alert('가격을 입력하세요.');
		$('input[name="price"]').focus();
		return false;
	}
	if(isNaN($('input[name="price"]').val())){
		alert('숫자만 입력하세요.');
		$('input[name="price"]').focus();
		return false;
	}
}
