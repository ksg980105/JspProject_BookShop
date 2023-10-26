/**
 * 
 */

var pwcheck;
var isCheck = false;
var use;


function registermem(){
	
	if($('input[name="name"]').val()==""){
		alert('이름을 입력하세요.');
		$('input[name="name"]').focus();
		return false;
	}
	
	if($('input[name="id"]').val()==""){
		alert('아이디를 입력하세요.');
		$('input[name="id"]').focus();
		return false;
	}else if(isCheck == false){
		alert("중복체크를 먼저 하세요.");
		return false;
	}else if(use == "impossible"){
		alert('중복된 아이디입니다.');
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
	
	var email = $('input[name="email"]').val();
	if(!email || !email.includes("@")){
		alert('이메일 형식이 아닙니다.');
		$('input[name="email"]').focus();
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
		$('#pwmessage').html("<font color=red>비번이 일치하지 않습니다.</font>");
		pwcheck = "nosame";
	}
}

function duplicate(){
	isCheck = true;
	
	if($("input[name=id]").val()==""){
		alert("아이디를 입력하세요");
		$("input[name=id]").focus();
		isBlank = true;
		return;
	}
	
	$.ajax({
			url : "id_check_proc.jsp",
			data : ({
				userid : $("input[name=id]").val()
			}),
			success : function(data){
				if($.trim(data) == "YES"){
					$("#idmessage").html("<font color=blue>사용 가능한 아이디입니다.</font>")
					$("#idmessage").show();
					use = "possible";
				}else{
					$("#idmessage").html("<font color=red>중복된 아이디입니다.</font>")
					$("#idmessage").show();
					use = "impossible";
				}
			}
		});	
}























