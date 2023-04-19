	 $(function() {
    $('#updatebtn123').on('click', function() {
        let password1 = $("#account-pass").val();
        let password2 = $("#account-confirm-pass").val();
        let text = "회원수정 완료";
        let text2 = "비밀번호가 일치하지 않습니다.";
        if (password1 !== "" || password2 !== "") {
            if (password1 === password2) {
                $(".toast-header").removeClass("bg-warning").removeClass("text-white");
                $(".toast-header").addClass("bg-success").addClass("text-white");
                $(".font-weight-semibold").text("");
                $(".font-weight-semibold").append("success");
                $("#toast-body").text("");
                $("#toast-body").append(text);
                $("#successPwdToast").show();
                return false;
            } else {
                $(".toast-header").removeClass("bg-success").removeClass("text-white");
                $(".toast-header").addClass("bg-warning").addClass("text-white");
                $(".font-weight-semibold").text("");
                $(".font-weight-semibold").append("failed");
                $("#toast-body").text("");
                $("#toast-body").append(text2);
                $("#failPwdToast").show();
                return false;
            }
        }
    });
});

$(function() {
    $('#Change_Profile').click(function() {
        console.log('fileadd');
        $("input[name='fileProfile']").click();
    });

    $("input[name='fileProfile']").on('change', function(e){
        var frm = document.getElementById('profile_file_add');
        frm.method = 'POST';
        frm.enctype = 'multipart/form-data';
        var fileData = new FormData(frm);

        var reader = new FileReader();
        reader.onload = function(event){
            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            img.setAttribute("class", "col-lg-6");
            document.querySelector("img[src='" + currentImageSrc + "']").remove();
            document.querySelector("div#image_container").appendChild(img);
            currentImageSrc = event.target.result;
        };
        reader.readAsDataURL(event.target.files[0]);
    });
});

var currentImageSrc = "${empty dto.getMember_image() ? 'main_img/basic_thumnail.png' : dto.getMember_image()}";
