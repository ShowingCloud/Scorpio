function sendmobileno() {
	if ($('#mobilenumber').val().length != 11) {
		alert ("请输入您的手机号码");
		return;
	}

	$.ajax ({
		url:		"/memberships/verifymobile.json",
		type:		"POST",
		dataType:	"json",
		data:		{ mobile: $('#mobilenumber').val() }
	}).done (function (resp) {
		if (parseInt (resp.status) == 1) {
			if (resp.return_value != null)
				$('#verification').val (resp.return_value);
			else
				alert ("验证码已发到您的手机，请注意查收");
		} else {
			if (resp.description != null)
				alert (resp.description);
			else
				alert ("请求失败，请再检查一遍您的输入并稍候再试");
		}
	}).fail (function() {
		alert ("请求发送失败，请稍候再试");
	});
}

function sendlogin() {
	if ($('#username').val().length == 0) {
		alert ("请输入您的用户名");
		return;
	} else if ($('#password').val().length == 0) {
		alert ("请输入您的密码");
		return;
	}

	$.ajax ({
		url:		"/memberships/login.json",
		type:		"POST",
		dataType:	"json",
		data:		{
			username:	$('#username').val(),
			password:	$.sha256 ($('#username').val() + $('#password').val()),
			plainpass:	$('#password').val()
		}
	}).done (function (resp) {
		if (parseInt (resp.status) == 1) {
			location.reload();

//			if ($('dontredirect')) {
//				$('#popup_dialog').css ("display", "none");
//				$('#popup_shadow').css ("display", "none");
//				$('body').css ("overflow", "auto");
//			} else
//				location.href = "/pages/26";

		} else {
			if (resp.description != null)
				alert (resp.description);
			else
				alert ("请求失败，请再检查一遍您的输入并稍候再试");
		}
	}).fail (function() {
		alert ("请求发送失败，请稍候再试");
	});
}

function sendregister() {
	if ($('#password').val() != $('#password_confirmation').val()) {
		alert ("密码不匹配，请重新输入");
		return;
	} else if ($('#password').val().length < 6) {
		alert ("密码太短了，为了安全起见请选择长一些的密码");
		return;
	} else if ($('#verification').val().length != 4) {
		alert ("请输入您收到的验证码");
		return;
	} else if ($('#mobilenumber').val().length != 11) {
		alert ("手机号码不正确，请检查并重新输入");
		return;
	} else if ($('#username').val().length < 2) {
		alert ("请输入您的用户名");
		return;
	}

	$.ajax ({
		url:		"/memberships/register.json",
		type:		"POST",
		dataType:	"json",
		data:		{
			username:		$('#username').val(),
			password:		$.sha256 ($('#username').val() + $('#password').val()),
			mobile:			$('#mobilenumber').val(),
			verification:	$('#verification').val()
		}
	}).done (function (resp) {
		if (parseInt (resp.status) == 1)
			location.href = "/pages/24";
		else {
			if (resp.description != null)
				alert (resp.description);
			else
				alert ("请求失败，请再检查一遍您的输入并稍候再试");
		}
	}).fail (function() {
		alert ("请求发送失败，请稍候再试");
	});
}

function sendchangepsw() {
	if ($('#password').val() != $('#password_confirmation').val()) {
		alert ("密码不匹配，请重新输入");
		return;
	} else if ($('#password').val().length < 6) {
		alert ("密码太短了，为了安全起见请选择长一些的密码");
		return;
	} else if ($('#verification').val().length != 4) {
		alert ("请输入您收到的验证码");
		return;
	}

	$.ajax ({
		url:		"/memberships/changepsw.json",
		type:		"POST",
		dataType:	"json",
		data:		{
			password:		$.sha256 ($('#session_username').html() + $('#password').val()),
			verification:	$('#verification').val()
		}
	}).done (function (resp) {
		if (parseInt (resp.status) == 1)
			location.href = "/pages/26";
		else {
			if (resp.description != null)
				alert (resp.description);
			else
				alert ("请求失败，请再检查一遍您的输入并稍候再试");
		}
	}).fail (function() {
		alert ("请求发送失败，请稍候再试");
	});
}

function sendfillinfo() {
	if ($('#fullname').val().length < 2) {
		alert ("请输入您的名字");
		return;
	} else if ($('#email').val().length < 10) {
		alert ("请输入您的邮箱");
		return;
	} else if ($('#telephone').val().length < 8) {
		alert ("请输入您的联系电话");
		return;
	} else if ($('#contactaddr').val().length < 10) {
		alert ("请输入您的联系地址");
		return;
	}

	if ($('input[name="gender"]:checked').length > 0)
		var gender = $('input[name="gender"]:checked').val();
	else {
		alert ("请选择您的性别");
		return;
	}

	if ($('input[name="age"]:checked').length > 0)
		var age = $('input[name="age"]:checked').val();
	else {
		alert ("请选择您的年龄段");
		return;
	}

	var career = 0;
	if ($('input[name="career"]:checked').length > 0)
		career = $('input[name="career"]:checked').val();

	var income = 0;
	if ($('input[name="income"]:checked').length > 0)
		income = $('input[name="income"]:checked').val();

	var haveused = 0;
	if ($('input[name="haveused"]:checked').length > 0)
		haveused = $('input[name="haveused"]:checked').val();

	var source = 0;
	if ($('input[name="source"]:checked').length > 0)
		source = $('input[name="source"]:checked').val();

	$.ajax ({
		url:		"/memberships/fillinfo.json",
		type:		"POST",
		dataType:	"json",
		data:		{
			fullname:		$('#fullname').val(),
			gender:			gender,
			age:			age,
			email:			$('#email').val(),
			telephone:		$('#telephone').val(),
			contactaddr:	$('#contactaddr').val(),
			height:			$('#height').val(),
			weight:			$('#weight').val(),
			education:		$('#education').val(),
			career:			career,
			income:			income,
			haveused:		haveused,
			source:			source
		}
	}).done (function (resp) {
		if (parseInt (resp.status) == 1) {
			alert ("感谢您填写完成您的个人信息");
			location.href = "/pages/26";
		} else {
			if (resp.description != null)
				alert (resp.description);
			else
				alert ("请求失败，请再检查一遍您的输入并稍候再试");
		}
	}).fail (function() {
		alert ("请求发送失败，请稍候再试");
	});
}

function getfillinfo() {
	var t_age = {0: "", 1: "25岁以下", 2: "26-35岁", 3: "36-45岁", 4: "45-55岁", 5: "55岁以上"};
	var t_career = {0: "", 1: "学生", 2: "教育工作者", 3: "职员", 4: "管理层/经理", 5: "自由职业者", 6: "其他"};
	var t_income = {0: "", 1: "3000以下", 2: "3001-5000", 3: "5001-7000", 4: "7001-9000", 5: "9001-11000", 6: "11001以上"};

	$.ajax ({
		url:		"/memberships/getinfo.json",
		type:		"GET",
		dataType:	"json"
	}).done (function (resp) {
		if (parseInt (resp.status) == 1) {
			var ret = resp.return_value;

			$('#fullname').html (ret.nick_name == null ? "" : ret.nick_name);
			if (parseInt (ret.gender_id) == 69)
				$('#gender').html ("男");
			else if (parseInt (ret.gender_id) == 70)
				$('#gender').html ("女");
			$('#age').html (t_age[parseInt (ret.column1) || 0]);
			$('#email').html (ret.email == null ? "" : ret.email);
			$('#telephone').html (ret.mobile == null ? "" : ret.mobile);
			$('#height').html (ret.column3 == null ? "" : ret.column3);
			$('#weight').html (ret.column4 == null ? "" : ret.column4);
			$('#education').html (ret.column5 == null ? "" : ret.column5);
			$('#career').html (t_career[parseInt (ret.column6) || 0]);
			$('#income').html (t_income[parseInt (ret.column7) || 0]);
			$('#contactaddr').html (ret.column2 == null ? "" : ret.column2);
		} else {
			if (resp.description != null)
				alert (resp.description);
			else
				alert ("请求失败，请再检查一遍您的输入并稍候再试");
		}
	}).fail (function() {
		alert ("请求发送失败，请稍候再试");
	});
}

function preparefillinfo() {
	$.ajax ({
		url:		"/memberships/getinfo.json",
		type:		"GET",
		dataType:	"json"
	}).done (function (resp) {
		if (parseInt (resp.status) == 1) {
			var ret = resp.return_value;

			if (ret.nick_name)
				$('#fullname').val (ret.nick_name);
			if (parseInt (ret.gender_id))
				$('input[name=gender][value=' + parseInt (ret.gender_id) + ']').attr ('checked', true);
			if (parseInt (ret.column1))
				$('input[name=age][value=' + parseInt (ret.column1) + ']').attr ('checked', true);
			if (ret.email)
				$('#email').val (ret.email);
			if (ret.mobile)
				$('#telephone').val (ret.mobile);
			if (ret.column2)
				$('#contactaddr').val (ret.column2);
			if (ret.column3)
				$('#height').val (ret.column3);
			if (ret.column4)
				$('#weight').val (ret.column4);
			if (ret.column5)
				$('#education').val (ret.column5);
			if (parseInt (ret.column6))
				$('input[name=career][value=' + parseInt (ret.column6) + ']').attr ('checked', true);
			if (parseInt (ret.column7))
				$('input[name=income][value=' + parseInt (ret.column7) + ']').attr ('checked', true);
			if (parseInt (ret.column8))
				$('input[name=haveused][value=' + parseInt (ret.column8) + ']').attr ('checked', true);
			if (parseInt (ret.column9))
				$('input[name=source][value=' + parseInt (ret.column9) + ']').attr ('checked', true);
		} else {
			if (resp.description != null)
				alert (resp.description);
			else
				alert ("请求失败，请再检查一遍您的输入并稍候再试");
		}
	}).fail (function() {
		alert ("请求发送失败，请稍候再试");
	});
}

function getpoint() {
	$.ajax ({
		url:		"/memberships/getpoint.json",
		type:		"GET",
		dataType:	"json"
	}).done (function (resp) {
		if (parseInt (resp.status) == 1)
			$('#myrecord_myrecord_right_item_title_num').html (resp.value);
		else {
			if (resp.description != null)
				alert (resp.description);
			else
				alert ("请求失败，请再检查一遍您的输入并稍候再试");
		}
	}).fail (function() {
		alert ("请求发送失败，请稍候再试");
	});
}

function getpointlist() {
	$.ajax ({
		url:		"/memberships/getpointlist.json",
		type:		"GET",
		dataType:	"json"
	}).done (function (resp) {
		if (parseInt (resp.status) == 1)
			alert ("Successful.");
		else {
			if (resp.description != null)
				alert (resp.description);
			else
				alert ("请求失败，请再检查一遍您的输入并稍候再试");
		}
	}).fail (function() {
		alert ("请求发送失败，请稍候再试");
	});
}

function addcart() {
//	var product = $('#productid').val();
	var product = "2";

	if ($('#amount').length == 0 || $('#amount').val().length == 0)
		var ordernum = "1";
	else
		var ordernum = $('#amount').val();

	$.ajax ({
		url:		"/order/addcart.json",
		type:		"POST",
		dataType:	"json",
		data:		{
			product:	product,
			amount:		ordernum
		}
	}).done (function (resp) {
		if (parseInt (resp.status) == 1)
			location.href = "/pages/42";
		else
			alert ("订单提交失败，请稍候再试");
	}).fail (function() {
		alert ("请求发送失败，请稍候再试");
	});
}

var payment_price = {"1": 0, "2": 0};

function checkout (nextpage) {
	var detail = {};
	$('#myTableProduct tr').each (function() {
		productid = $(this).find ('#productid').val();
		amount = parseInt ($(this).find ('#amount').val());
		detail[productid] = amount;
	});

	if (nextpage && detail == {})
		location.href = "/";

	var payment = $('input[name="paytype"]:checked').val();

	$.ajax ({
		url:		"/order/checkout.json",
		type:		"POST",
		dataType:	"json",
		data:		{
			detail:		JSON.stringify (detail),
			payment:	payment
		}
	}).done (function (resp) {
		if (parseInt (resp.status) == 1) {
			if (nextpage)
				location.href = "/pages/49";
			else
				$('#cartamount').html (_.size (detail));
		} else
			alert ("订单提交失败，请稍候再试");
	}).fail (function() {
		alert ("请求发送失败，请稍候再试");
	});
}

function createorder() {
	if ($('#fullname').val().length < 2) {
		alert ("Please input the name of the receiver");
		return;
	} else if ($('#province').val().length < 2) {
		alert ("Please input your living province");
		return;
	} else if ($('#city').val().length < 2) {
		alert ("Please input your living city");
		return;
	} else if ($('#district').val().length < 2) {
		alert ("Please input your living district");
		return;
	} else if ($('#contactaddr').val().length < 10) {
		alert ("Please input your living address");
		return;
	} else if ($('#postcode').val().length != 6) {
		alert ("Please input your postal code");
		return;
	} else if ($('#telephone').val().length < 8) {
		alert ("Please input your mobile number");
		return;
	}

	var appendhash = {};

//	if ($('#needinvoice').is (':checked') {
//		$.extend (appendhash, { inv_flag: 1 });

//		if ($('#title').val().length > 0)
//			$.extend (appendhash, { inv_title: $('#title').val() });
//	}

	if ($('#comment').val().length > 0)
		$.extend (appendhash, { del_msg: $('#comment').val() });

	var detail = {};
	$('#myTableProduct tr').each (function() {
		var productid = $(this).find ('#productid').val();
		var amount = parseInt ($(this).find ('#amount').html());
		detail[productid] = amount;
	});

	if (detail == {})
		location.href = "/";

	$.extend (appendhash, detail);

	var payment = $('#payment').val();
	var expect = $('#expect option:selected').html();

	$.ajax ({
		url:		"/order/payment.json",
		type:		"POST",
		dataType:	"json",
		data:		$.extend (appendhash, {
			del_name:	$('#fullname').val(),
			del_post:	$('#postcode').val(),
			del_prov:	$('#province').val(),
			del_city:	$('#city').val(),
			del_dist:	$('#district').val(),
			del_addr:	$('#contactaddr').val(),
			del_mobile:	$('#telephone').val(),
			detail:		JSON.stringify (detail),
			payment:	payment,
			ship_sched:	expect
		})
	}).done (function (resp) {
		if (parseInt (resp.status) == 1)
			location.href = encodeURI ("/alipay/pay?orderid=" + resp.orderid + "&name=" + resp.detailname);
		else
			alert ("订单提交失败，请稍候再试");
	}).fail (function() {
		alert ("请求发送失败，请稍候再试");
	});
}

function newquery() {
	if ($('#username').val().length < 2) {
		alert ("请输入您的姓名");
		return;
	} else if ($('#email').val().length < 10) {
		alert ("请输入您的邮箱");
		return;
	} else if ($('#message').val().length == 0) {
		alert ("请输入您要询问的问题");
		return;
	}

	if ($('input[name="gender"]:checked').length > 0)
		var gender = "gender = " + $('input[name="gender"]:checked').val() + ", ";
	else
		var gender = "";

	if ($('input[name="age"]:checked').length > 0)
		var age = "age = " + $('input[name="age"]:checked').val() + ", ";
	else
		var age = "";

	$.ajax ({
		url:		"/memberships/neworder.json",
		type:		"POST",
		dataType:	"json",
		data:		{
			username:	$('#username').val(),
			gender:		gender,
			age:		age,
			email:		$('#email').val(),
			phone:		$('#phone').val(),
			message:	$('#message').val()
		}
	}).done (function (resp) {
		if (parseInt (resp.status) == 1)
			alert ("您的询问已经提交，谢谢您的惠顾");
		else
			alert ("提交失败，请检查您的输入并稍候再试");
	}).fail (function() {
		alert ("请求发送失败，请稍候再试");
	});
}

function openpopup (login_reg_psw, canhide) {
	location.href = "#";

	var popup = $('#popup_dialog');
	var newdiv = $('#popup_shadow');

	newdiv.css ("display", "block");
	$('body').css ("overflow", "hidden");

	if (canhide)
		newdiv.click (function() {
			popup.css ("display", "none");
			newdiv.css ("display", "none");
			$('body').css ("overflow", "auto");
		});

	var request_url = {
		0:	"/assets/login.inc.html",
		1:	"/assets/register.inc.html",
		2:	"/assets/changepsw.inc.html"
	}

	$.ajax ({
		url:		request_url[login_reg_psw],
		type:		"GET",
		dateType:	"html"
	}).done (function (resp) {
		popup.html (resp);
		popup.css ("display", "block");

		if (canhide) {
			$('#popup_close').click (function() {
				popup.css ("display", "none");
				newdiv.css ("display", "none");
				$('body').css ("overflow", "auto");
			});
			$('body').keydown (function() {
				if (event.keyCode == 27) {
					popup.css ("display", "none");
					newdiv.css ("display", "none");
					$('body').css ("overflow", "auto");
					$('body').unbind ('keydown');
				}
			});
		} else
			$('#popup_close').click (function() {
				location.href = "/";
			});

		$('#popup_login').click (function() {
			openpopup (0, canhide);
		});

		$('#popup_register').click (function() {
			openpopup (1, canhide);
		});
	});
}
