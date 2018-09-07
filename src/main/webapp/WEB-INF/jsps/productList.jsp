<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ include file="/WEB-INF/jsps/templates/header.jsp" %>

        
        <div class="container">
        
        	<div class="page-header">
        		<h2>Product List</h2>
        		<p>Check our awesome products</p>
        	</div>
	        <table class="table table-stripped table-hover">
				<tr>
					<th>Photo thumb</th>
					<th>Product Name</th>
					<th>Category</th>
					<th>Condition</th>
					<th>Price</th>
					<th></th>
				</tr>
				
				<c:forEach items="${products}" var="product">
				<tr>
					<td><img src="<spring:url value="imgs/${product.id}.png" />" style="width:100px; height:120px"/></td>
					                           
                                          
					<td>${product.name}</td>
					<td>${product.category}</td>
					<td>${product.condition}</td>
					<td>${product.price}</td>
					<td><a href="<spring:url value="/productList/viewProduct/${product.id}"/>">
					       <span class="glyphicon glyphicon-zoom-in"></span></a>
				</tr>
				</c:forEach>
		    </table>
		</div>
<%@ include file="/WEB-INF/jsps/templates/footer.jsp" %> 


     