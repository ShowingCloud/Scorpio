// JavaScript Document
function getproductcombination() {
	var xmlhttp = new XMLHttpRequest();
	var resp = {};

	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {
			if (xmlhttp.status == 200) {
				resp = JSON.parse (xmlhttp.responseText);
				if (resp.length > 0) {
					var ret = resp[0];

					if (ret.name_desc)
						document.getElementById ("product_name").innerHTML = ret.name_desc;
					if (ret.product_pic) {
						document.getElementById ("pic1").src = ret.product_pic;
						document.getElementById ("pic2").src = ret.product_pic;
					}											
					if (ret.price_desc)
						document.getElementById ("price_desc").innerHTML = ret.price_desc;
					if (ret.spec)
						document.getElementById ("spec").innerHTML = ret.spec;
					if (ret.desc)
						document.getElementById ("desc").innerHTML = ret.desc;									
						
				} else {
					if (resp.description != null)
						alert (resp.description);
					else
						alert("请求失败，请再检查一遍您的输入并稍候再试");
				}
			} else
				alert("请求发送失败，请稍候再试");
		}
	}
	xmlhttp.open ("GET", "/product/2.json", true);
	xmlhttp.setRequestHeader ("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.setRequestHeader ('X-CSRF-Token', $('meta[name="csrf-token"]').attr ('content'));
	xmlhttp.send();
}
