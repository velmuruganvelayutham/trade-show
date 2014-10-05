<%
response.setCharacterEncoding("UTF-8");
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

     <!-- <c:out value="${requestScope.message} "></c:out> --> 
            
<div id="settingsContainer" class="container">

<!-- Nav tabs -->
<ul class="nav nav-tabs" role="tablist">
  <li class="active"><a href="#scrap" role="tab" data-toggle="tab">Scrap</a></li>
  <li><a href="#websites" role="tab" data-toggle="tab">Websites</a></li>
  <li><a href="#history" role="tab" data-toggle="tab">History</a></li>
</ul>


<!-- Tab panes -->
<div class="tab-content">
  <div class="tab-pane active" id="scrap">
  		<div class="row spacer">
  			 <div class="col-xs-8 col-md-4">
				<div class="input-group">
					 <span class="input-group-addon">
				        Name:
				     </span>
					 <select class="form-control">
					 <c:forEach var="option" items="${settings}">
					 <c:set var="id" value="${option.settings_id}" > </c:set>
					  <option><c:out value="${option.websiteName}"></c:out></option>
					 </c:forEach>
					</select>
				</div>
			</div>
			 <div class="col-xs-4 col-md-2">
				<button type="button" onclick='submit("/settings/extract","${id}")' class="btn btn-default" data-dismiss="modal">Execute</button>
			 </div>
		</div>
  </div>
  <div class="tab-pane" id="websites">
				  <c:forEach var="setting" items="${settings}" varStatus="status">
				<div class="row spacer">
				  <div class="col-xs-4 col-md-2">
				    <div class="input-group">
				      <span class="input-group-addon">
				        Name:
				      </span>
				      <input id="name" type="text" class="form-control" value="${setting.websiteName}" placeholder="Enter Name here ! "> 
				    </div><!-- /input-group -->
				  </div><!-- /.col-lg-6 -->
				  <div class="col-xs-16 col-md-8">
				    <div class="input-group">
				      <span class="input-group-addon">
				        URL:
				      </span>
				      <input id="${setting.settings_id}" type="text" class="form-control" value="${setting.url}"> 
				    </div><!-- /input-group -->
				  </div><!-- /.col-lg-6 -->
<!-- 				  <div class="col-xs-2 col-md-1"> -->
<!-- 				    <div class="input-group"> -->
<%-- 				     <button onclick='submit("/settings/edit","${setting.settings_id}")' type= "button" class="form-control" data-toggle="tooltip" data-placement="left" title="SAVE">  <span class="glyphicon glyphicon-floppy-save"></span>   </button> --%>
<!-- 				    </div>/input-group -->
<!-- 				  </div>/.col-lg-2 -->
<!-- 				  <div class="col-xs-2 col-md-1"> -->
<!-- 				    <div class="input-group"> -->
<%-- 				     <button onclick='submit("/settings/extract","${setting.settings_id}")' type="button" class="form-control" data-toggle="tooltip" data-placement="left" title="SCRAP/EXTRACT"> <span class="glyphicon glyphicon-tower"></span>  </button> --%>
<!-- 				    </div>/input-group -->
<!-- 				  </div>/.col-lg-2 -->
				  <div class="col-xs-2 col-md-1">
				    <div class="input-group">
				     <button onclick='submit("/settings/edit","${setting.settings_id}")' type="button" class="form-control"data-toggle="tooltip" data-placement="left" title="EDIT" ><span class="glyphicon glyphicon-pencil"></span> </button>
				    </div><!-- /input-group -->
				  </div><!-- /.col-lg-2 -->
				  <div class="col-xs-2 col-md-1">
				    <div class="input-group">
				     <button onclick='submit("/settings/delete","${setting.settings_id}")' type="button" class="form-control" data-toggle="tooltip" data-placement="left" title="REMOVE"> <span class="glyphicon glyphicon-remove"></span>  </button>
				    </div><!-- /input-group -->
				  </div><!-- /.col-lg-2 -->
				</div><!-- /.row -->
				</c:forEach>
				
				<div class="row spacer">
				
				  <div class="col-xs-4 col-md-2">
				    <div class="input-group">
				      <span class="input-group-addon">
				        Name:
				      </span>
				      <input id="name" type="text" class="form-control" value="${setting.websiteName}" placeholder="Enter Name here ! "> 
				    </div><!-- /input-group -->
				  </div><!-- /.col-lg-6 -->
				  <div class="col-xs-16 col-md-8">
				    <div class="input-group">
				      <span class="input-group-addon">
				        URL:
				      </span>
				      <input id="newURLText" type="text" class="form-control" value="${setting.url}" placeholder="Enter new URL here ! "> 
				    </div><!-- /input-group -->
				  </div><!-- /.col-lg-6 -->
<!-- 				  <div class="col-xs-2 col-md-1"> -->
<!-- 				    <div class="input-group"> -->
<%-- 				     <button id="newURLSave" type="button" class="form-control" data-toggle="tooltip" data-placement="left" title="SAVE">  <span class="glyphicon glyphicon-floppy-save"></span>   </button> --%>
<!-- 				    </div>/input-group -->
<!-- 				  </div>/.col-lg-2 -->
<!-- 				  <div class="col-xs-2 col-md-1"> -->
<!-- 				    <div class="input-group"> -->
<%-- 				     <button type="button" class="form-control" data-toggle="tooltip" data-placement="left" title="SCRAP/EXTRACT"> <span class="glyphicon glyphicon-tower"></span>  </button> --%>
<!-- 				    </div>/input-group -->
<!-- 				  </div>/.col-lg-2 -->
				  <div class="col-xs-2 col-md-1">
				    <div class="input-group">
				     <button id="newURLSave" type="button" class="form-control"data-toggle="tooltip" data-placement="left" title="EDIT" ><span class="glyphicon glyphicon-pencil"></span> </button>
				    </div><!-- /input-group -->
				  </div><!-- /.col-lg-2 -->
				  <div class="col-xs-2 col-md-1">
				    <div class="input-group">
				     <button type="button" class="form-control" data-toggle="tooltip" data-placement="left" title="REMOVE"> <span class="glyphicon glyphicon-remove"></span>  </button>
				    </div><!-- /input-group -->
				  </div><!-- /.col-lg-2 -->
				</div><!-- /.row -->
				  </div>
	  <div class="tab-pane" id="history">This table will hold the status of the scraping process !. </div>
	  </div>



<!-- <button class="btn btn-primary" data-toggle="modal" data-target="#myModal"> -->
<!--   Add New  -->
<!-- </button> -->

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Extracting vendor details ...</h4>
      </div>
      <div class="modal-body">
			<div  class="form-group" id="progress"> 
				<img alt="progress image " align="middle" src="<c:url value="/resources/image/progress.gif"></c:url>">
			</div>	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
<!--    <button type="button" class="btn btn-primary">Save</button> -->
      </div>
    </div>
  </div>
</div>
</div>
        		
    
 

    
