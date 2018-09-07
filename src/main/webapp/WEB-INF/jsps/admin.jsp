<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ include file="/WEB-INF/jsps/templates/header.jsp" %>

        
        <div class="container">
        
        	<div class="page-header">
        		<h2>Admin</h2>
        		<p>Here you ca admin the site</p>
        	</div>
        	
        	<h3><a href="<c:url value="/admin/productInventory"/>">Product Inventory</a></h3>
        	<p>Here you can admin the product inventory</p>
	        
		</div>
<%@ include file="/WEB-INF/jsps/templates/footer.jsp" %>    