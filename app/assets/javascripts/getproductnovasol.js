// JavaScript Document
function getproductnovasol() {
	$.ajax ({
		url:		"/products/" + $('#productid').val() + ".json",
		type:		"GET",
		dataType:	"json"
	}).done (function (resp) {
		if (resp != null) {
			if (resp.product_name)
				$('#product_name').html (resp.product_name);
			if (resp.product_pic) {
				$('#pic1').attr ('src', resp.product_pic);
				$('#pic2').attr ('src', resp.product_pic);
			}
			if (resp.gallery)
				$('#gallery').html (resp.gallery);
			if (resp.price_desc)
				$('#price_desc').html (resp.price_desc);
			if (resp.spec)
				$('#spec').html (resp.spec);
			if (resp.desc)
				$('#detail').html (resp.desc);
			if (resp.adv)
				$('#sale').html (resp.adv);
			if (resp.comp)
				$('#comp').html (resp.comp);
			if (resp.usage)
				$('#usage').html (resp.usage);
			if (resp.orig)
				$('#orig').html (resp.orig);
		} else {
			if (resp.description != null)
				alert (resp.description);
			else
				alert("请求失败，请再检查一遍您的输入并稍候再试");
		}
	}).fail (function() {
		alert("请求发送失败，请稍候再试");
	});
}
