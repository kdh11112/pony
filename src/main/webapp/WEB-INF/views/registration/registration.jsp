<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <div class="col-md-12" >
            <div class="card card-user " style="height: 85px;">
              <div class="card-body" >
                <form>
                  <div class="row">
                    <div class="Search">
                       <div class="form-row align-items-center">
					      <div class="form-group mb-0">
					        <input type="text" class="form-control" placeholder="차대번호" style="width : 300px">
					      </div>
					      <button type="submit" class="btn btn-primary btn-round">검색</button>
					  </div>
                    </div>
                    <div class="Search">
                       <div class="form-row align-items-center">
					      <div class="form-group mb-0">
					        <input type="text" class="form-control" placeholder="차량번호">
					      </div>
					      <button type="submit" class="btn btn-primary btn-round">검색</button>
					  </div>
                    </div>
                    <div class="Search">
                       <div class="form-row align-items-center">
					      <div class="form-group mb-0">
					        <input type="text" class="form-control" placeholder="고객명">
					      </div>
					      <button type="submit" class="btn btn-primary btn-round">검색</button>
					  </div>
                    </div>
                    <div class="Search">
                       <div class="form-row align-items-center">
					      <div class="form-group mb-0">
					        <input type="text" class="form-control" placeholder="접수번호">
					      </div>
					      <button type="submit" class="btn btn-primary btn-round">차량접수/수정</button>
					  </div>
                    </div>
                    <div class="Search">
                       <div class="form-row align-items-center">
					      <button type="submit" class="btn btn-primary btn-round" style="margin-left:50px;">예약</button>
					  </div>
                    </div>
               	</div>
                </form>
              </div>
            </div>
          </div>
          <div class="col-md-12">
            <div class="card card-user">
              <div class="card-body">
                <form>
                  <div class="row">
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>차대번호</label>
                        <input type="text" class="form-control" disabled >
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>차량번호</label>
                        <input type="text" class="form-control" >
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label for="exampleInputEmail1">차종</label>
                        <input type="email" class="form-control" >
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>색상</label>
                        <input type="email" class="form-control" >
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>접수일</label>
                        <input type="email" class="form-control" >
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>기존주행거리</label>
                        <input type="text" class="form-control" disabled >
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>현재주행거리</label>
                        <input type="text" class="form-control" >
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>출고일</label>
                        <input type="text" class="form-control" >
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>생산일</label>
                        <input type="email" class="form-control" >
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>입고예정일</label>
                        <input type="text" class="form-control">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>고객명</label>
                        <input type="text" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>전화번호</label>
                        <input type="text" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>최종정비공장</label>
                        <input type="text" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>최종입고일</label>
                        <input type="text" class="form-control">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>특이사항</label>
                        <textarea class="form-control textarea"></textarea>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>고객요청내역</label>
                        <textarea class="form-control textarea"></textarea>
                      </div>
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