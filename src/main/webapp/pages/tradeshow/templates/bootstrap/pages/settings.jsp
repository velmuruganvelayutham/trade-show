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

      <c:out value="${requestScope.message} "></c:out>
            
<div class="container">
 <div class="row spacer">
  <div class="col-xs-16 col-md-8">
    <div class="input-group">
      <span class="input-group-addon">
        URL to Scrap
      </span>
      <input type="text" class="form-control"> 
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
  <div class="col-xs-2 col-md-1">
    <div class="input-group">
     <button type="button" class="form-control" data-toggle="tooltip" data-placement="left" title="SAVE">  <span class="glyphicon glyphicon-floppy-save"></span>   </button>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-2 -->
  <div class="col-xs-2 col-md-1">
    <div class="input-group">
     <button type="button" class="form-control" data-toggle="tooltip" data-placement="left" title="SCRAP/EXTRACT"> <span class="glyphicon glyphicon-tower"></span>  </button>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-2 -->
  <div class="col-xs-2 col-md-1">
    <div class="input-group">
     <button type="button" class="form-control"data-toggle="tooltip" data-placement="left" title="EDIT" ><span class="glyphicon glyphicon-pencil"></span> </button>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-2 -->
  <div class="col-xs-2 col-md-1">
    <div class="input-group">
     <button type="button" class="form-control" data-toggle="tooltip" data-placement="left" title="REMOVE"> <span class="glyphicon glyphicon-remove"></span>  </button>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-2 -->
</div><!-- /.row -->

 <div class="row spacer">
  <div class="col-xs-16 col-md-8">
    <div class="input-group">
      <span class="input-group-addon">
        URL to Scrap
      </span>
      <input type="text" class="form-control"> 
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
  <div class="col-xs-2 col-md-1">
    <div class="input-group">
     <button type="button" class="form-control">  <span class="glyphicon glyphicon-floppy-save"></span>   </button>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-2 -->
  <div class="col-xs-2 col-md-1">
    <div class="input-group">
     <button type="button" class="form-control"> <span class="glyphicon glyphicon-tower"></span>  </button>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-2 -->
  <div class="col-xs-2 col-md-1">
    <div class="input-group">
     <button type="button" class="form-control"><span class="glyphicon glyphicon-pencil"></span> </button>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-2 -->
  <div class="col-xs-2 col-md-1">
    <div class="input-group">
     <button type="button" class="form-control"> <span class="glyphicon glyphicon-remove"></span>  </button>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-2 -->
</div><!-- /.row -->

 <div class="row spacer">
  <div class="col-xs-16 col-md-8">
    <div class="input-group">
      <span class="input-group-addon">
        URL to Scrap
      </span>
      <input type="text" class="form-control"> 
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
  <div class="col-xs-2 col-md-1">
    <div class="input-group">
     <button type="button" class="form-control">  <span class="glyphicon glyphicon-floppy-save"></span>   </button>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-2 -->
  <div class="col-xs-2 col-md-1">
    <div class="input-group">
     <button type="button" class="form-control"> <span class="glyphicon glyphicon-tower"></span>  </button>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-2 -->
  <div class="col-xs-2 col-md-1">
    <div class="input-group">
     <button type="button" class="form-control"><span class="glyphicon glyphicon-pencil"></span> </button>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-2 -->
  <div class="col-xs-2 col-md-1">
    <div class="input-group">
     <button type="button" class="form-control"> <span class="glyphicon glyphicon-remove"></span>  </button>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-2 -->
</div><!-- /.row -->


</div>
        		
    
 

    
