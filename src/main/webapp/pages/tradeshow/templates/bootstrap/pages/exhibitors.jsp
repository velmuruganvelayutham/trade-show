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
<div class="container"> 
<c:if test="${message == 'import'}">
	<form id="importCSV" role="form" method="post" action="import/csv" enctype=”multipart/form-data >
		<div class="form-group"> 
		<label for="csvInputFile">CSV File</label>
		    <input type="file" id="csvInputFile" name="file">
		    <p class="help-block"> Upload the CSV file from your computer.</p>
		</div>
		<div  class="form-group" id="progress" style="display: none"> 
		<img alt="progress image " src="<c:url value="/resources/image/progress.gif"></c:url>">
		</div>
		<div  class="form-group" id="message"> </div>
		 <button type="submit" class="btn btn-default">Submit</button>
	</form>
	
</c:if>
<c:if test="${message == 'list'}">
<div class="container">
<div class="row">
<div class="col-xs-2">
    <input id="filter" type="text" class="form-control" placeholder="Search ">
 </div>
</div>
<table class="table table-responsive" data-filter="#filter" data-sort="true" data-page-size="5" >
      <thead>
        <tr>
          <th>Show</th>
          <th  data-type="numeric" data-sort-initial="true" >Show Date</th>
          <th>Vendor Name</th>
           <th>Booth No</th>
          <th data-toggle="true">Address</th>
          <th data-hide="all">Website</th>
          <th data-hide="all">Phone</th>
          <th data-hide="all">Fax</th>
          <th data-hide="all">Email</th>
          <th data-hide="all">Product Lines</th>
          <th data-hide="all">Category</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach var="vendor" items="${vendors}">
      
       <tr>
          <td><c:out value="${vendor.showName}"/></td>
          <td><c:out value="${vendor.showStartDate}"/></td>
          <td><c:out value="${vendor.vendorName}"/></td>
          <td><c:out value="${vendor.boothNo}"/></td>
          <td><c:out value="${vendor.address}"/></td>
          <td><c:out value="${vendor.phone}"/></td>
          <td><c:out value="${vendor.website}"/></td>
          <td><c:out value="${vendor.fax}"/></td>
          <td><c:out value="${vendor.email}"/></td>
          <td><c:out value=""/></td>
          <td><c:out value=""/></td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
    </div> <!-- table container ends here -->
  <div class="container">
  <c:url var="firstUrl" value="/exhibitors" />
<c:url var="lastUrl" value="/exhibitors?page=${page.totalNoOfPages} & size=${page.pageSize}" />
<c:url var="prevUrl" value="/exhibitors?page=${currentIndex - 1} & size=${page.pageSize}" />
<c:url var="nextUrl" value="/exhibitors?page=${currentIndex + 1} & size=${page.pageSize}" />

<div class="pager">
    <ul>
        <c:choose>
            <c:when test="${currentIndex == 1}">
                <li class="disabled"><a href="#">&lt;&lt;</a></li>
                <li class="disabled"><a href="#">&lt;</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="${firstUrl}">&lt;&lt;</a></li>
                <li><a href="${prevUrl}">&lt;</a></li>
            </c:otherwise>
        </c:choose>
        <c:forEach var="i" begin="${beginIndex}" end="${endIndex}">
            <c:url var="pageUrl" value="/exhibitors?page=${i}& size=${page.pageSize}" />
            <c:choose>
                <c:when test="${i == currentIndex}">
                    <li class="active" ><a style="color:black;background-color:blue" href="${pageUrl}"><c:out value="${i}" /></a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${pageUrl}"><c:out value="${i}" /></a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:choose>
            <c:when test="${currentIndex == page.totalNoOfPages}">
                <li class="disabled"><a href="#">&gt;</a></li>
                <li class="disabled"><a href="#">&gt;&gt;</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="${nextUrl}">&gt;</a></li>
                <li><a href="${lastUrl}">&gt;&gt;</a></li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>
</div> <!-- Pagination container ends here,. -->
</c:if>
<c:if test="${message == 'export'}">
<c:out value="${requestScope.message} "></c:out>
</c:if>
</div> 

  

