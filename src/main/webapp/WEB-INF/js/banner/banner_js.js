function bt() {
	location.href = "banner_c.do";
};

function banner_add_bt() {
	document.banner_add.submit();
};

function banner_add_bt1() {
	document.banner_add1.submit();
};

function del_bt(no) {
	location.href = "banner_delete.do?banner_no="+no+"";
}