<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
.main-panel {
  min-height: 100vh;
  
}
.Search{
	margin-left: 50px;
	display: flex;
	align-items: center;
	justify-content: center;

}
</style>
<!-- JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#techId").on("click",function(){
		
		asy();
		$("#technologyNumberId").val("");
	})
	
	function asy(){
		fetch('/reg/registration/modal/technology')
		  .then(response => response.json())
		  .then(data => {
		    console.log(data);
		    
		    
		  })
		  .catch(error => {
		    console.error('Error:', error);
		  });
	}

})
</script>
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
            <div class="card">
              <div class="card-header">
                <h4 class="card-title">기술</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table" id="table" data-toggle="modal" data-target="#techModal" data-whatever="@mdo">
                    <thead class=" text-primary">
                   		<tr>
	                      <th>
	                        기술번호
	                      </th>
	                      <th>
	                        기술내용
	                      </th>
	                      <th class="text-center">
	                        기술비용
	                      </th>
	                      <th class="text-right">
	                        기술수량
	                      </th>
                      	</tr>
                    </thead>
                    <tbody data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
                      <tr data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
                        <td data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
                          Dakota Rice
                        </td>
                        <td>
                          Niger
                        </td>
                        <td class="text-center">
                          Oud-Turnhout
                        </td>
                        <td class="text-right">
                          $36,738
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
            <div class="modal fade" id="techModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">조회</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="col-md-12">
					  <div class="modal-body">
					    <form name="frmtechnology" id="frmtechnologyId" >
					      <div class="row">
							<div class="Search">
			                      <div class="form-row align-items-center">
							      <div class="form-group mb-0">
							        <input type="text" class="form-control" placeholder="품번" name="technologyNumberModal" id="technologyNumberId">
							      </div>
							      <button type="button" class="btn btn-primary btn-round" id="techId">검색</button>
							  </div>
			                   </div>
							<div class="Search">
			                      <div class="form-row align-items-center">
							      <div class="form-group mb-0">
							        <input type="text" class="form-control" placeholder="이름" name="technologyDetailModal" id="technologyDetailId">
							      </div>
							      <button type="button" class="btn btn-primary btn-round" id="techName">검색</button>
							  </div>
			                   </div>
					      </div>
					    </form>
					    <table class="table table-hover">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">기술내용</th>
						      <th scope="col">기술비용</th>
						    </tr>
						  </thead>
						  <tbody id="mcTable">
						  </tbody>
						</table>
					  </div>
					</div>
			      <div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal" id="mm">취소</button>
			      </div>
			    </div>
			  </div>
			</div>
          <div class="col-md-12">
            <div class="card card-plain">
              <div class="card-header">
                <h4 class="card-title">부품</h4>
                <p class="card-category"></p>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table">
                    <thead class=" text-primary">
                    <tr>
                      <th>
                        부품번호
                      </th>
                      <th>
                        부품명
                      </th>
                      <th class="text-center">
                        부품비용
                      </th>
                      <th class="text-right">
                        부품수량
                      </th>
                     </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          Dakota Rice
                        </td>
                        <td>
                          Niger
                        </td>
                        <td class="text-center">
                          Oud-Turnhout
                        </td>
                        <td class="text-right">
                          $36,738
                        </td>
                      </tr>       
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

</html>