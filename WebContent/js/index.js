function go_search() {

	var sel = document.getElementById("search_category");
	var val = sel.options[sel.selectedIndex].value;

	if (document.frm.key.value == "") {
		alert("검색어를 입력해 주세요.");
		document.frm.key.focus();
	} else if (val == "선택") {
		alert("카테고리를 선택해 주세요.");
		document.frm.category.focus();
	} else if (val == "기부"){
		document.frm.action = "/give/search_give_donation";
		document.frm.submit();
	} else {
		document.frm.action = "/give/search_give_exchange";
		document.frm.submit();
	}
}

function menu_list(searchType) {
	if (searchType >= 1 && searchType <= 6) {
		document.frmm.category.value = "기부";
		if (searchType == 2) {
			document.frmm.key.value = "언어";
		} else if (searchType == 3) {
			document.frmm.key.value = "예술";
		} else if (searchType == 4) {
			document.frmm.key.value = "스포츠";
		} else if (searchType == 5) {
			document.frmm.key.value = "컴퓨터";
		} else if (searchType == 6) {
			document.frmm.key.value = "그외";
		}
		document.frmm.submit();
	} else {
		$("#headerForm").attr("action", "/give/search_give_exchange");
		document.frmm.category.value = "교환";
		if (searchType == 8) {
			document.frmm.key.value = "언어";
		} else if (searchType == 9) {
			document.frmm.key.value = "예술";
		} else if (searchType == 10) {
			document.frmm.key.value = "스포츠";
		} else if (searchType == 11) {
			document.frmm.key.value = "컴퓨터";
		} else if (searchType == 12) {
			document.frmm.key.value = "그외";
		}
		document.frmm.submit();
	}
}

function alarm() {
	location.href="/message/inbox";
}

function go_d_detail(no){
	location.href="/give/donationDetail&"+no;
}

function go_e_detail(no){
	location.href="/give/exchangeDetail&"+no;
}
