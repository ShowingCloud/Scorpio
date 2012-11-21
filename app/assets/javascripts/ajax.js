function sendmobileno() {
	if (document.getElementById ("mobilenumber").value.length != 11) {
		alert ("请输入您的手机号码");
		return;
	}

	var xmlhttp = new XMLHttpRequest();
	var resp = {};
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {
			if (xmlhttp.status == 200) {
				resp = JSON.parse (xmlhttp.responseText);
				if (parseInt (resp.status) == 1)
					alert ("验证码已发到您的手机，请注意查收");
				else {
					if (resp.description != null)
						alert (resp.description);
					else
						alert ("请求失败，请再检查一遍您的输入并稍候再试");
				}
			} else
				alert ("请求发送失败，请稍候再试");
		}
	}
	xmlhttp.open ("POST", "/memberships/verifymobile", true);
	xmlhttp.setRequestHeader ("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.setRequestHeader ('X-CSRF-Token', $('meta[name="csrf-token"]').attr ('content'));
	xmlhttp.send ("mobile=" + document.getElementById ("mobilenumber").value);
}

function sendlogin() {
	if (document.getElementById ("username").value.length == 0) {
		alert ("请输入您的用户名");
		return;
	} else if (document.getElementById ("password").value.length == 0) {
		alert ("请输入您的密码");
		return;
	}

	var xmlhttp = new XMLHttpRequest();
	var resp = {};
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {
			if (xmlhttp.status == 200) {
				resp = JSON.parse (xmlhttp.responseText);
				if (parseInt (resp.status) == 1) {
					location.reload();

//					if (document.getElementById ("dontredirect")) {
//						var popup = document.getElementById ("popup_dialog");
//						var newdiv = document.getElementById ("popup_shadow");
//						popup.style.display = "none";
//						newdiv.style.display = "none";
//						document.body.style.overflow = "auto";
//					} else
//						location.href = "/pages/26";

				} else {
					if (resp.description != null)
						alert (resp.description);
					else
						alert ("请求失败，请再检查一遍您的输入并稍候再试");
				}
			} else
				alert ("请求发送失败，请稍候再试");
		}
	}
	xmlhttp.open ("POST", "/memberships/login", true);
	xmlhttp.setRequestHeader ("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.setRequestHeader ('X-CSRF-Token', $('meta[name="csrf-token"]').attr ('content'));
	xmlhttp.send ("username=" + document.getElementById ("username").value
			+ "&password=" + document.getElementById ("password").value);
}

function sendregister() {
	if (document.getElementById ("password").value != document.getElementById ("password_confirmation").value) {
		alert ("密码不匹配，请重新输入");
		return;
	} else if (document.getElementById ("password").value.length < 6) {
		alert ("密码太短了，为了安全起见请选择长一些的密码");
		return;
	} else if (document.getElementById ("verification").value.length != 4) {
		alert ("请输入您收到的验证码");
		return;
	} else if (document.getElementById ("mobilenumber").value.length != 11) {
		alert ("手机号码不正确，请检查并重新输入");
		return;
	} else if (document.getElementById ("username").value.length < 2) {
		alert ("请输入您的用户名");
		return;
	}

	var xmlhttp = new XMLHttpRequest();
	var resp = {};
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {
			if (xmlhttp.status == 200) {
				resp = JSON.parse (xmlhttp.responseText);
				if (parseInt (resp.status) == 1)
					location.href = "/pages/24";
				else {
					if (resp.description != null)
						alert (resp.description);
					else
						alert ("请求失败，请再检查一遍您的输入并稍候再试");
				}
			} else
				alert ("请求发送失败，请稍候再试");
		}
	}
	xmlhttp.open ("POST", "/memberships/register", true);
	xmlhttp.setRequestHeader ("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.setRequestHeader ('X-CSRF-Token', $('meta[name="csrf-token"]').attr ('content'));
	xmlhttp.send ("username=" + document.getElementById ("username").value
			+ "&password=" + document.getElementById ("password").value
			+ "&mobile=" + document.getElementById ("mobilenumber").value
			+ "&verification=" + document.getElementById ("verification").value);
}

function sendfillinfo() {
	if (document.getElementById ("fullname").value.length < 2) {
		alert ("请输入您的名字");
		return;
	} else if (document.getElementById ("email").value.length < 10) {
		alert ("请输入您的邮箱");
		return;
	} else if (document.getElementById ("telephone").value.length < 8) {
		alert ("请输入您的联系电话");
		return;
	} else if (document.getElementById ("contactaddr").value.length < 10) {
		alert ("请输入您的联系地址");
		return;
	}

	if (document.getElementById ("gender1").checked)
		var gender = 69;
	else if (document.getElementById ("gender2").checked)
		var gender = 70;
	else {
		alert ("请选择您的性别");
		return;
	}

	var age = 0;
	for (var i = 1; i < 6; i++) {
		if (document.getElementById ("age" + i).checked) {
			age = i;
			break;
		}
	}
	if (age == 0) {
		alert ("请选择您的年龄段");
		return;
	}

	var career = 0;
	for (i = 1; i < 7; i++) {
		if (document.getElementById ("career" + i).checked) {
			career = i;
			break;
		}
	}

	var income = 0;
	for (i = 1; i < 7; i++) {
		if (document.getElementById ("income" + i).checked) {
			income = i;
			break;
		}
	}

	var haveused = 0;
	for (i = 1; i < 3; i++) {
		if (document.getElementById ("haveused" + i).checked) {
			haveused = i;
			break;
		}
	}

	var source = 0;
	for (i = 1; i < 7; i++) {
		if (document.getElementById ("source" + i).checked) {
			source = i;
			break;
		}
	}

	var xmlhttp = new XMLHttpRequest();
	var resp = {};
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {
			if (xmlhttp.status == 200) {
				resp = JSON.parse (xmlhttp.responseText);
				if (parseInt (resp.status) == 1) {
					alert ("感谢您填写完成您的个人信息");
					location.href = "/pages/26";
				} else {
					if (resp.description != null)
						alert (resp.description);
					else
						alert ("请求失败，请再检查一遍您的输入并稍候再试");
				}
			} else
				alert ("请求发送失败，请稍候再试");
		}
	}
	xmlhttp.open ("POST", "/memberships/fillinfo", true);
	xmlhttp.setRequestHeader ("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.setRequestHeader ('X-CSRF-Token', $('meta[name="csrf-token"]').attr ('content'));
	xmlhttp.send ("fullname=" + document.getElementById ("fullname").value
			+ "&gender=" + gender + "&age=" + age
			+ "&email=" + document.getElementById ("email").value
			+ "&telephone=" + document.getElementById ("telephone").value
			+ "&contactaddr=" + document.getElementById ("contactaddr").value
			+ "&height=" + document.getElementById ("height").value
			+ "&weight=" + document.getElementById ("weight").value
			+ "&education=" + document.getElementById ("education").value
			+ "&career=" + career + "&income=" + income
			+ "&haveused=" + haveused + "&source=" + source);
}

function getfillinfo() {
	var xmlhttp = new XMLHttpRequest();
	var resp = {};

	var t_age = {0: "", 1: "25岁以下", 2: "26-35岁", 3: "36-45岁", 4: "45-55岁", 5: "55岁以上"};
	var t_career = {0: "", 1: "学生", 2: "教育工作者", 3: "职员", 4: "管理层/经理", 5: "自由职业者", 6: "其他"};
	var t_income = {0: "", 1: "3000以下", 2: "3001-5000", 3: "5001-7000", 4: "7001-9000", 5: "9001-11000", 6: "11001以上"};
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {
			if (xmlhttp.status == 200) {
				resp = JSON.parse (xmlhttp.responseText);
				if (parseInt (resp.status) == 1) {
					var ret = resp.return_value;

					document.getElementById ("fullname").innerHTML = (ret.nick_name == null ? "" : ret.nick_name);
					if (parseInt (ret.gender_id) == 69)
						document.getElementById ("gender").innerHTML = "男";
					else if (parseInt (ret.gender_id) == 70)
						document.getElementById ("gender").innerHTML = "女";
					document.getElementById ("age").innerHTML = t_age[parseInt (ret.column1) || 0];
					document.getElementById ("email").innerHTML = (ret.email == null ? "" : ret.email);
					document.getElementById ("telephone").innerHTML = (ret.mobile == null ? "" : ret.mobile);
					document.getElementById ("height").innerHTML = (ret.column3 == null ? "" : ret.column3);
					document.getElementById ("weight").innerHTML = (ret.column4 == null ? "" : ret.column4);
					document.getElementById ("education").innerHTML = (ret.column5 == null ? "" : ret.column5);
					document.getElementById ("career").innerHTML = t_career[parseInt (ret.column6) || 0];
					document.getElementById ("income").innerHTML = t_income[parseInt (ret.column7) || 0];
					document.getElementById ("contactaddr").innerHTML = (ret.column2 == null ? "" : ret.column2);
				} else {
					if (resp.description != null)
						alert (resp.description);
					else
						alert ("请求失败，请再检查一遍您的输入并稍候再试");
				}
			} else
				alert ("请求发送失败，请稍候再试");
		}
	}
	xmlhttp.open ("POST", "/memberships/getinfo", true);
	xmlhttp.setRequestHeader ("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.setRequestHeader ('X-CSRF-Token', $('meta[name="csrf-token"]').attr ('content'));
	xmlhttp.send();
}

function preparefillinfo() {
	var xmlhttp = new XMLHttpRequest();
	var resp = {};

	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {
			if (xmlhttp.status == 200) {
				resp = JSON.parse (xmlhttp.responseText);
				if (parseInt (resp.status) == 1) {
					var ret = resp.return_value;

					if (ret.nick_name)
						document.getElementById ("fullname").value = ret.nick_name;
					if (parseInt (ret.gender_id))
						document.getElementById ("gender" + (parseInt (ret.gender_id) - 68)).checked = true;
					if (parseInt (ret.column1))
						document.getElementById ("age" + parseInt (ret.column1)).checked = true;
					if (ret.email)
						document.getElementById ("email").value = ret.email;
					if (ret.mobile)
						document.getElementById ("telephone").value = ret.mobile;
					if (ret.column2)
						document.getElementById ("contactaddr").value = ret.column2;
					if (ret.column3)
						document.getElementById ("height").value = ret.column3;
					if (ret.column4)
						document.getElementById ("weight").value = ret.column4;
					if (ret.column5)
						document.getElementById ("education").value = ret.column5;
					if (parseInt (ret.column6))
						document.getElementById ("career" + parseInt (ret.column6)).checked = true;
					if (parseInt (ret.column7))
						document.getElementById ("income" + parseInt (ret.column7)).checked = true;
					if (parseInt (ret.column8))
						document.getElementById ("haveused" + parseInt (ret.column8)).checked = true;
					if (parseInt (ret.column9))
						document.getElementById ("source" + parseInt (ret.column9)).checked = true;
				} else {
					if (resp.description != null)
						alert (resp.description);
					else
						alert ("请求失败，请再检查一遍您的输入并稍候再试");
				}
			} else
				alert ("请求发送失败，请稍候再试");
		}
	}
	xmlhttp.open ("POST", "/memberships/getinfo", true);
	xmlhttp.setRequestHeader ("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.setRequestHeader ('X-CSRF-Token', $('meta[name="csrf-token"]').attr ('content'));
	xmlhttp.send();
}

function getpoint() {
	var xmlhttp = new XMLHttpRequest();
	var resp = {};

	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {
			if (xmlhttp.status == 200) {
				resp = JSON.parse (xmlhttp.responseText);
				if (parseInt (resp.status) == 1)
					document.getElementById ("myrecord_myrecord_right_item_title_num").innerHTML = resp.value;
				else {
					if (resp.description != null)
						alert (resp.description);
					else
						alert ("请求失败，请再检查一遍您的输入并稍候再试");
				}
			} else
				alert ("请求发送失败，请稍候再试");
		}
	}
	xmlhttp.open ("POST", "/memberships/getpoint", true);
	xmlhttp.setRequestHeader ("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.setRequestHeader ('X-CSRF-Token', $('meta[name="csrf-token"]').attr ('content'));
	xmlhttp.send();
}

function getpointlist() {
	var xmlhttp = new XMLHttpRequest();
	var resp = {};

	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {
			if (xmlhttp.status == 200) {
				resp = JSON.parse (xmlhttp.responseText);
				if (parseInt (resp.status) == 1)
					alert ("Successful.");
				else {
					if (resp.description != null)
						alert (resp.description);
					else
						alert ("请求失败，请再检查一遍您的输入并稍候再试");
				}
			} else
				alert ("请求发送失败，请稍候再试");
		}
	}
	xmlhttp.open ("POST", "/memberships/getpointlist", true);
	xmlhttp.setRequestHeader ("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.setRequestHeader ('X-CSRF-Token', $('meta[name="csrf-token"]').attr ('content'));
	xmlhttp.send();
}

function addcart() {
	var xmlhttp = new XMLHttpRequest();
	var resp = {};

	var product = document.getElementById ("productid").value

	if (document.getElementById ("amount") == null || document.getElementById ("amount").value.length == 0)
		var ordernum = "1"
	else
		var ordernum = document.getElementById ("amount").value

	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {
			if (xmlhttp.status == 200) {
				resp = JSON.parse (xmlhttp.responseText);
				if (parseInt (resp.status) == 1)
					location.href = "/pages/42";
				else
					alert ("订单提交失败，请稍候再试");
			} else
				alert ("请求发送失败，请稍候再试");
		}
	}
	xmlhttp.open ("POST", "/order/addcart.json", true);
	xmlhttp.setRequestHeader ("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.setRequestHeader ('X-CSRF-Token', $('meta[name="csrf-token"]').attr ('content'));
	xmlhttp.send("product=" + product + "&amount=" + ordernum);
}

function payment() {
	if (document.getElementById ("fullname").value.length < 2) {
		alert ("Please input the name of the receiver");
		return;
	} else if (document.getElementById ("province").value.length < 2) {
		alert ("Please input your living province");
		return;
	} else if (document.getElementById ("city").value.length < 2) {
		alert ("Please input your living city");
		return;
	} else if (document.getElementById ("district").value.length < 2) {
		alert ("Please input your living district");
		return;
	} else if (document.getElementById ("contactaddr").value.length < 10) {
		alert ("Please input your living address");
		return;
	} else if (document.getElementById ("postcode").value.length != 6) {
		alert ("Please input your postal code");
		return;
	} else if (document.getElementById ("telephone").value.length < 8) {
		alert ("Please input your mobile number");
		return;
	}

	var invoice = "";
	if (document.getElementById ("needinvoice").checked) {
		invoice += "&inv_flag=1";

		if (document.getElementById ("title").value.length > 0)
			invoice += "&inv_title=" + document.getElementById ("title").value;
	}

	var comment = "";
	if (document.getElementById ("comment").value.length > 0)
		comment += "&del_msg=" + document.getElementById ("comment").value;

	var xmlhttp = new XMLHttpRequest();
	var resp = {};

	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {
			if (xmlhttp.status == 200) {
				resp = JSON.parse (xmlhttp.responseText);
				if (parseInt (resp.status) == 1)
					location.href = resp.url;
				else
					alert ("订单提交失败，请稍候再试");
			} else
				alert ("请求发送失败，请稍候再试");
		}
	}
	xmlhttp.open ("POST", "/order/neworder.json", true);
	xmlhttp.setRequestHeader ("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.setRequestHeader ('X-CSRF-Token', $('meta[name="csrf-token"]').attr ('content'));
	xmlhttp.send("del_name=" + document.getElementById ("fullname").value
			+ "&del_post=" + document.getElementById ("postcode").value
			+ "&del_prov=" + document.getElementById ("province").value
			+ "&del_city=" + document.getElementById ("city").value
			+ "&del_dist=" + document.getElementById ("district").value
			+ "&del_addr=" + document.getElementById ("contactaddr").value
			+ "&del_mobile=" + document.getElementById ("telephone").value
			+ invoice + detail + payment + ship + comment
			+ "&ship_sched=" + document.getElementById ("expect").value);
}

function newquery() {
	if (document.getElementById ("username").value.length < 2) {
		alert ("请输入您的姓名");
		return;
	} else if (document.getElementById ("email").value.length < 10) {
		alert ("请输入您的邮箱");
		return;
	} else if (document.getElementById ("message").value.length == 0) {
		alert ("请输入您要询问的问题");
		return;
	}

	if (document.getElementById ("gender1").checked)
		var gender = "gender = male, ";
	else if (document.getElementById ("gender2").checked)
		var gender = "gender = female, ";
	else
		var gender = ""

	var age = "";
	var age_list = {1: "below 25", 2: "26 - 35", 3: "36 - 45", 4: "45 - 55", 5: "above 55"};
	for (i = 1; i < 6; i++) {
		if (document.getElementById ("age" + i).checked) {
			age = "age = " + age_list[i] + ", ";
			break;
		}
	}
	if (age == "") {
		alert ("请选择您的年龄段");
		return;
	}

	var xmlhttp = new XMLHttpRequest();
	var resp = {};

	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {
			if (xmlhttp.status == 200) {
				resp = JSON.parse (xmlhttp.responseText);
				if (parseInt (resp.status) == 1)
					alert ("您的询问已经提交，谢谢您的惠顾");
				else
					alert ("提交失败，请检查您的输入并稍候再试");
			} else
				alert ("请求发送失败，请稍候再试");
		}
	}
	xmlhttp.open ("POST", "/memberships/neworder", true);
	xmlhttp.setRequestHeader ("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.setRequestHeader ('X-CSRF-Token', $('meta[name="csrf-token"]').attr ('content'));
	xmlhttp.send("username=" + document.getElementById ("username").value
			+ "&gender=" + gender + "&age=" + age
			+ "&email=" + document.getElementById ("email").value
			+ "&phone=" + document.getElementById ("phone").value
			+ "&message=" + document.getElementById ("message").value);
}

function openpopup (islogin, canhide) {
	location.href = "#";

	var popup = document.getElementById ("popup_dialog");
	var newdiv = document.getElementById ("popup_shadow");

	newdiv.style.display = "block";
	document.body.style.overflow = "hidden";

	if (canhide)
		newdiv.onclick = function() {
			popup.style.display = "none";
			newdiv.style.display = "none";
			document.body.style.overflow = "auto";
		}

	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			popup.innerHTML = xmlhttp.responseText;
			popup.style.display = "block";

			if (canhide) {
				document.getElementById ("popup_close").onclick = function() {
					popup.style.display = "none";
					newdiv.style.display = "none";
					document.body.style.overflow = "auto";
				}
				document.body.onkeydown = function() {
					if (event.keyCode == 27) {
						popup.style.display = "none";
						newdiv.style.display = "none";
						document.body.style.overflow = "auto";
						document.body.onkeydown = "";
					}
				}
			} else
				document.getElementById ("popup_close").onclick = function() {
					location.href = "/";
				}

			document.getElementById ("popup_login").onclick = function() {
				openpopup (true, canhide);
			}

			document.getElementById ("popup_register").onclick = function() {
				openpopup (false, canhide);
			}
		}
	}

	if (islogin)
		xmlhttp.open ("GET", "/assets/login.inc.html", true);
	else
		xmlhttp.open ("GET", "/assets/register.inc.html", true);

	xmlhttp.send();
}
