<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="css/admin/assets/invi.png" />
<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="css/admin/assets/invi.png" />
<title>PONY MOTORS</title>
<style>
.main-panel {
  min-height: 100vh;
}
.Search{
	margin-left: 60px;
}
</style>

<body class="">
  <div class="wrapper ">
	<%@ include file="./side.jsp" %>
    <div class="main-panel">
      <!-- Navbar -->
	<%@ include file="./navi.jsp" %>
	  <!-- End Navbar -->
    
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card card-user">
              <div class="card-body">
                <form action="/reg/carRegister" method="post">
                  <div class="row">
                    <div class="col-md-3 pr-1">
                      <div class="form-group">
                        <label>차대번호</label>
                        <input type="text" class="form-control" name="clientVin">
                      </div>
                    </div>
                    <div class="col-md-3 pr-1">
                      <div class="form-group">
                        <label>차량번호</label>
                        <input type="text" class="form-control" name="clientCarNumber">
                      </div>
                    </div>
                    <div class="col-md-3 pr-1">
                      <div class="form-group">
                        <label">차종</label>
                        <input type="text" class="form-control" name="clientCarType">
                      </div>
                    </div>
                    <div class="col-md-3 pr-1">
                      <div class="form-group">
                        <label>색상</label>
                        <input type="text" class="form-control" name="clientColor">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-3 pr-1">
                      <div class="form-group">
                        <label>주행거리</label>
                        <input type="text" class="form-control"  name="clientDistanceDriven">
                      </div>
                    </div>
					<div class="col-md-3 pr-1">
                      <div class="form-group">
                        <label>고객명</label>
                        <input type="text" class="form-control" name="memberName">
                      </div>
                    </div>
                    <div class="col-md-3 pr-1">
                      <div class="form-group">
                        <label>전화번호</label>
                        <input type="text" class="form-control" name="memberPhone">
                      </div>
                    </div>
                    <div class="col-md-3 pr-1">
                      <div class="form-group">
                        <label>이메일</label>
                        <input type="email" class="form-control" name="memberEmail">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                   <div class="col-md-3 pr-1">
                      <div class="form-group">
                        <label>출고일</label>
                        <input type="date" class="form-control" name="clientShipDate">
                      </div>
                    </div>
                    <div class="col-md-3 pr-1">
                      <div class="form-group">
                        <label></label>
                        <input type="hidden" class="form-control" name="">
                      </div>
                    </div>
                    <div class="col-md-3 pr-1">
                      <div class="form-group">
                        <label></label>
                        <input type="hidden" class="form-control" name="">
                      </div>
                    </div>
                    <div class="col-md-3 pr-1">
                      <div class="form-group">
                        <label>생산일</label>
                        <input type="date" class="form-control" name="clientProductionDate">
                      </div>
                    </div>
                   </div>
                   <div class="row">
                    <div class="update ml-auto mr-auto">
                      <button type="submit" class="btn btn-primary btn-round">차량 등록</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

</html>