/**
 * 
 */

var pwcheck;
function registermem(){
	
	if($('input[name="name"]').val()==""){
		alert('이름을 입력하세요.');
		$('input[name="name"]').focus();
		return false;
	}
	
	if($('input[name="id"]').val()==""){
		alert('이름을 입력하세요.');
		$('input[name="id"]').focus();
		return false;
	}
	
	if($('input[name="password"]').val()==""){
		alert('비밀번호를 입력하세요.');
		$('input[name="password"]').focus();
		return false;
	}
	
	if($('input[name="repassword"]').val()==""){
		alert('비밀번호 확인을 입력하세요.');
		$('input[name="repassword"]').focus();
		return false;
	}
	
	if($('input[name="ssn1"]').val()=="" || $('input[name="ssn2"]').val()==""){
		alert('주민등록번호를 입력하세요.');
		if($('input[name="ssn1"]').val()==""){
			$('input[name="ssn1"]').focus();			
		}else{
			$('input[name="ssn2"]').focus();
		}
		return false;
	}
	
	if($('input[name="email"]').val()==""){
		alert('이메일을 입력하세요.');
		$('input[name="email"]').focus();
		return false;
	}
	
	if(!$('input[name="email"]').val().contains("@")){
		alert('이메일 형식이 아닙니다.');
		$('input[name="email"]').val().focus();
		return false;
	}
	
	if(pwcheck == "nosame"){
		alert('비밀번호가 서로 다릅니다.');
		$('input[name="repassword"]').focus();
		return false;
	}
}

function repasswordCheck(){
	if($('input[name="password"]').val() == $('input[name="repassword"]').val()){
		$('#pwmessage').html("<font color=blue>비번이 일치합니다.</font");
		pwcheck = "same";
	}else{
		$('#pwmessage').html("<font color=red>비번 다릅니다.</font>");
		pwcheck = "nosame";
	}
}





















