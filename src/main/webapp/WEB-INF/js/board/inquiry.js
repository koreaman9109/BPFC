
function lost_send_bt(index) {
			
			var organization = $('#lost_organization').val();
			var learn = $('#lost_learn').val();
			var title = $('#lost_title').val();
			var date = $('#lost_date').val();
			var name = $('#lost_name').val();
			var contact = $('#lost_contact').val();
			var storage_site = $('#lost_storage_site').val();
			var status = $('#lost_status').val();
			var content = $('#content').val();

			if (organization == "") {
	            alert("습득장소을 입력해주세요.")
	            document.getElementById("lost_organization").focus()
	            return false;
	        }
			if (learn == "") {
	            alert("습득경위을 입력해주세요.")
	            document.getElementById("lost_learn").focus()
	            return false;
	        }
			if (title == "") {
	            alert("습득물을 입력해주세요.")
	            document.getElementById("lost_title").focus()
	            return false;
	        }
			if (date == "") {
	            alert("습득일을 입력해주세요.")
	            document.getElementById("lost_date").focus()
	            return false;
	        }
			if (name == "") {
	            alert("담당자를 입력해주세요.")
	            document.getElementById("lost_name").focus()
	            return false;
	        }
			if (contact == "") {
	            alert("연락처를 입력해주세요.")
	            document.getElementById("lost_contact").focus()
	            return false;
	        }
			if (storage_site == "") {
	            alert("보관장소를 입력해주세요.")
	            document.getElementById("lost_storage_site").focus()
	            return false;
	        }
			if (status == "") {
	            alert("처리상태를 입력해주세요.")
	            document.getElementById("lost_status").focus()
	            return false;
	        }
			if (content == "") {
	            alert("내용을 입력해주세요.")
	            document.getElementById("content").focus()
	            return false;
	        }
			
			
		if (confirm("저장하시겠습니까? ") == true) {
			if(index==1){
				// 폼에 입력한 데이터를 서버로 전송
				document.lost_insert.submit();
				return 0;
			}
			if(index==2){
				document.lostupdate.submit();
				return 0;
			}
			

		} else {
			return;
		}
}