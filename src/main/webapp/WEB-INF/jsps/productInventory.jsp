<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ include file="/WEB-INF/jsps/templates/header.jsp" %>

        
        <div class="container">
        
        	<div class="page-header">
        		<h2>Product Inventory</h2>
        		<p>This is the product inventory page</p>
        	</div>
	        <table class="table table-stripped table-hover">
				<tr>
					<th>Photo thumb</th>
					<th>Product Name</th>
					<th>Category</th>
					<th>Price</th>
					<th></th>
				</tr>
				
				<c:forEach items="${products}" var="product">
				<tr>
					<td><img src="${pageContext.request.contextPath}/imgs/${product.id}.png" style="width:80px; height:120px"/></td>
					<td>${product.name}</td>
					<td>${product.category}</td>
					<td>${product.price}</td>
					<td><a href="<spring:url value="/productList/viewProduct/${product.id}"/>">
					       <span class="glyphicon glyphicon-zoom-in"></span></a>
					    <a href= "<spring:url value="/admin/productInventory/deleteProduct/${product.id}" />" >
                           <span class="glyphicon glyphicon-remove" /></a> 
                        <a href= "<spring:url value="/admin/productInventory/editProduct/${product.id}" />" >
                           <span class="glyphicon glyphicon-pencil" /></a>   
					</td>       
				</tr>
				</c:forEach>
		    </table>
		    
			<a href="<c:url value="/admin/productInventory/addProduct"/>" class="btn btn-primary" >Add Product</a>		    
		    
		</div>
<%@ include file="/WEB-INF/jsps/templates/footer.jsp" %>    










