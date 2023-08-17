<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
 
    <head>
        <meta charset="UTF-8">
        <title>BZshop | cartList</title>
        <!-- bzshop Icon  -->
        <link rel=" shortcut icon" href="/images/bzshopicon.ico">
        <link rel="icon" href="/images/bzshopicon.ico">
    </head>
 
    <body>
 
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>
         <!-- Header End -->
 
            <!-- Page Add Section Begin -->
        <section class="page-add cart-page-add">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="page-breadcrumb">
                            <h2>Cart<span>.</span></h2>
                        </div>
                    </div>
                    <c:if test="${not empty cartList}">
                        <div class="col-lg-5 offset-lg-1 text-left text-lg-right" style="padding-top: 34px;">
                            <div class="site-btn clear-btn" id="selectDelete_btn">선택된 리스트 삭제</div>
                            <script>
                                $("#selectDelete_btn").click(function () {
                                    var confirm_val = confirm("정말 삭제하시겠습니까?");
 
                                    if (confirm_val) {
                                        var checkArr = new Array();
 
                                        $("input[class='chkbox']:checked").each(function () {
                                            checkArr.push($(this).attr("data-cartNum"));
                                        });
 
                                        $.ajax({
                                            url: "/shop/deleteCart",
                                            type: "post",
                                            data: { chbox: checkArr },
                                            beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다 (spring boot security 설정부분)*/
                                                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                                            },
                                            success: function () {
                                                location.href = "/shop/cartList";
                                            }
                                        });
                                    }
                                });
                            </script>
                        </div>
                    </c:if>
                </div>
            </div>
        </section>
        <!-- Page Add Section End -->
        <!-- 금액 총 합계  -->
        <script>
 
            function itemSum() {
                var str = "";
                var sum = 0;
                var count = $(".chkbox").length;
                for (var i = 0; i < count; i++) {
                    if ($(".chkbox")[i].checked == true) {
                        sum += parseInt($(".chkbox")[i].value);
                    }
                }
                $("#total_sum").html(sum + " 원");
                $("#amount").val(sum);
            }
 
        </script>
        <!-- Cart Page Section Begin -->
        <div class="cart-page">
            <div class="container">
                <div class="cart-table">
                    <table>
                        <thead>
                            <tr>
                                <th><input type="checkbox" name="allCheck" id="allCheck" checked /></th>
                                <!-- 상품 전체선택  -->
                                <script>
                                    $("#allCheck").click(function () {
                                        var chk = $("#allCheck").prop("checked");
                                        if (chk) {
                                            $(".chkbox").prop("checked", true);
                                            itemSum();
                                        } else {
                                            $(".chkbox").prop("checked", false);
                                            itemSum();
                                        }
                                    });
                                </script>
                                <th class="product-h">Product</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${cartList}" var="cartList">
                                <tr>
                                    <td class="product-close"><input type="checkbox" onClick="itemSum()"
                                            class="chkbox" value="${cartList.gdsPrice * cartList.cartStock}"
                                            data-cartNum="${cartList.cartNum}" /></td>
                                    <td class="product-col">
                                        <img src="${cartList.gdsThumbImg}" alt="${cartList.gdsThumbImg}" />
                                        <div class="p-title">
                                            <h5><a
                                                    href="/shop/view?n=${cartList.gdsNum}">${cartList.gdsName}</a>
                                            </h5>
                                        </div>
                                    </td>
                                    <td class="price-col">
                                        <fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}" />
                                        원
                                    </td>
                                    <td>
                                        ${cartList.cartStock} 개
                                    </td>
                                    <td class="total">
                                        <fmt:formatNumber pattern="###,###,###"
                                            value="${cartList.gdsPrice * cartList.cartStock}" /> 원
                                    </td>
                                    <td class="product-close" id="delete_${cartList.cartNum}_btn"
                                        data-cartNum="${cartList.cartNum}">x</td>
                                    <script>
                                        $("#delete_${cartList.cartNum}_btn").click(function () {
                                            var confirm_val = confirm("정말 삭제하시겠습니까?");
 
                                            if (confirm_val) {
                                                var checkArr = new Array();
 
                                                checkArr.push($(this).attr("data-cartNum"));
 
                                                $.ajax({
                                                    url: "/shop/deleteCart",
                                                    type: "post",
                                                    data: { chbox: checkArr },
                                                    beforeSend: function (xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다 (spring boot security 설정부분)*/
                                                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                                                    },
                                                    success: function (result) {
                                                        if (result == 1) {
                                                            location.href = "/shop/cartList";
                                                        } else {
                                                            alert("삭제 실패");
                                                        }
                                                    }
                                                });
                                            }
                                        });
                                    </script>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <!-- 초기화면 상품 전체선택이지만 하나라도 체크박스 해제할 경우 이벤트  -->
                    <script>
                        $(".chkbox").click(function () {
                            $("#allCheck").prop("checked", false);
                        });
                    </script>
                    <c:if test="${empty cartList}">
                        <c:set var="cart" value="false" />
                        <div class="card border-light mb-3 text-center spad">
                            <div class="card-header">
                                <h3>카트에 상품이 없습니다.</h3>
                            </div>
                            <div class="card-body">
                                <p class="card-text">카트에 물건을 담고 이용해주세요!</p>
                            </div>
 
                        </div>
                    </c:if>
 
                </div>
            </div>
            <div class="shopping-method">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="total-info">
                                <div class="total-table">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th class="total-cart">Total Cart</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="total-cart-p" id="total_sum"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <c:if test="${not empty cartList}">
                                    <div class="row">
                                        <div class="col-lg-12 text-right">
                                            <button type="button" class="primary-btn chechout-btn"
                                                id="orderModal" data-toggle="modal" data-target="#orderOpne">주문
                                                하기</button>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Cart Page Section End -->
 

 
        <!--order Modal Begin -->
        <div class="modal fade" id="orderOpne" data-backdrop="static" tabindex="-1" role="dialog"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">주문지 작성</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="/shop/cartList" method="post" autocomplete="off" id="orderForm">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <input type="hidden" name="amount" id="amount" value="" />
                            <input type="hidden" name="chk[]" id="chk" value="" />
 
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1">수령인 성함</span>
                                </div>
                                <input type="text" name="orderRec" id="orderRec" class="form-control"
                                    required="required" />
                            </div>
 
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1">수령인 전화번호</span>
                                </div>
                                <input type="text" name="orderPhon" id="orderPhon" class="form-control"
                                    required="required" />
                            </div>
                            <label>수령 주소</label>
                            <div class="input-group mb-3">
                                <input type="text" id="sample3_postcode" class="form-control" placeholder="우편번호"
                                    readonly>
                                <div class="input-group-append">
                                    <input type="button" class="btn btn-secondary" id="button-addon2"
                                        onclick="sample3_execDaumPostcode()" value="우편번호 찾기">
                                </div>
                            </div>
                            <div class="input-group mb-3">
                                <input type="text" name="userAddr1" id="sample3_address" placeholder="주소1"
                                    style="width:50%;" readonly>
                                <input type="text" name="userAddr3" id="sample3_extraAddress" placeholder="주소2"
                                    style="width:50%;" readonly>
                                <input type="text" name="userAddr2" id="sample3_detailAddress"
                                    class="form-control" placeholder="상세주소" style="width:100%;">
 
                                <!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
                                <div id="wrap"
                                    style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
                                    <img src="//t1.daumcdn.net/postcode/resource/images/close.png"
                                        id="btnFoldWrap"
                                        style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1"
                                        onclick="foldDaumPostcode()" alt="접기 버튼">
                                </div>
                                <!-- 주소지 찾기  -->
                                <script
                                    src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                                <script>
                                    // 우편번호 찾기 찾기 화면을 넣을 element
                                    var element_wrap = document.getElementById('wrap');
 
                                    function foldDaumPostcode() {
                                        // iframe을 넣은 element를 안보이게 한다.
                                        element_wrap.style.display = 'none';
                                    }
 
                                    function sample3_execDaumPostcode() {
                                        // 현재 scroll 위치를 저장해놓는다.
                                        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
                                        new daum.Postcode({
                                            oncomplete: function (data) {
                                                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                                                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                                var addr = ''; // 주소 변수
                                                var extraAddr = ''; // 참고항목 변수
 
                                                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                                    addr = data.roadAddress;
                                                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                                    addr = data.jibunAddress;
                                                }
 
                                                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                                                if (data.userSelectedType === 'R') {
                                                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                                                        extraAddr += data.bname;
                                                    }
                                                    // 건물명이 있고, 공동주택일 경우 추가한다.
                                                    if (data.buildingName !== '' && data.apartment === 'Y') {
                                                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                                    }
                                                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                                    if (extraAddr !== '') {
                                                        extraAddr = ' (' + extraAddr + ')';
                                                    }
                                                    // 조합된 참고항목을 해당 필드에 넣는다.
                                                    document.getElementById("sample3_extraAddress").value = extraAddr;
 
                                                } else {
                                                    document.getElementById("sample3_extraAddress").value = '';
                                                }
 
                                                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                                document.getElementById('sample3_postcode').value = data.zonecode;
                                                document.getElementById("sample3_address").value = addr;
                                                // 커서를 상세주소 필드로 이동한다.
                                                document.getElementById("sample3_detailAddress").focus();
 
                                                // iframe을 넣은 element를 안보이게 한다.
                                                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                                                element_wrap.style.display = 'none';
 
                                                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                                                document.body.scrollTop = currentScroll;
                                            },
                                            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                                            onresize: function (size) {
                                                element_wrap.style.height = size.height + 'px';
                                            },
                                            width: '100%',
                                            height: '100%'
                                        }).embed(element_wrap);
 
                                        // iframe을 넣은 element를 보이게 한다.
                                        element_wrap.style.display = 'block';
                                    }
                                </script>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="orderSuccess">주문 완료</button>
                        <!-- 주문 완료 이벤트 -->
                        <script>
                            $("#orderSuccess").click(function () {
 
                                var checkArr = new Array();
 
                                $("input[class='chkbox']:checked").each(function () {
                                    checkArr.push($(this).attr("data-cartNum"));
                                });
                                console.log(checkArr);
                                $("#chk").val(checkArr);
 
                                var nickNameCheck = /^[가-힣]{2,6}$/;
                                var phonNumberCheck = /^\d{3}-\d{3,4}-\d{4}$/;
                                if (!nickNameCheck.test($("#orderRec").val())) {
                                    alert("2~6글자의 한글만 입력해주세요.");
                                    $('#orderRec').val("").focus();
                                } else if (!phonNumberCheck.test($('#orderPhon').val())) {
                                    alert("010-xxx-xxxx or 010-xxxx-xxxx");
                                    $('#orderPhon').val("").focus();
                                } else if (confirm("주문완료 하시겠습니까?")) {
                                    alert("주문 감사합니다.");
                                    $("#orderForm").submit();
                                }
 
                            });
                        </script>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--order Modal End -->
        <!-- 페이지 들어오자마자 체크박스  체크 -->
        <script>
            var tt = "${cart}";
            if (tt == 'false') {
                $("#allCheck").prop("checked", false);
            } else {
                $("#allCheck").prop("checked", true);
                $(".chkbox").prop("checked", true);
                itemSum();
            }
 
        </script>
        <!-- 주문하기 버튼 이벤트 -->
        <script>
            $("#orderModal").click(function () {
                $.ajax({
 
                    url: "/shop/orderUser/",
                    success: function (data) {
                        $("#orderRec").val(data.userName);
                        $("#orderPhon").val(data.userPhon);
                        $("#sample3_address").val(data.userAddr1);
                        $("#sample3_detailAddress").val(data.userAddr2);
                        $("#sample3_extraAddress").val(data.userAddr3);
                    }
                });
            });
        </script>
    </body>
</html>