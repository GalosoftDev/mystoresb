<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ include file="/WEB-INF/jsps/templates/header.jsp" %>

        <div class="container">
        
        	<div class="page-header">
        		<h2>Product Detail</h2>
        		<p>Check our awesome products</p>
        	</div>
	        
	        <div class="container">
	        	<div class="row">
	        		<div class="col-md-5">
	        			<td><img src="${pageContext.request.contextPath}/imgs/${product.id}.png"    
	        			             style="width:50%; height:50%"/></td>
	        		</div>
	        		
	        		<div class="col-md-5">
	        		    <h3>${product.id}</h3>
	        			<h3>${product.name}</h3>
	        			<p>${product.description}</p>
	        			<p>${product.category}</p>
	        			<p>${product.price}</p>	
	        		</div>
	        	
	        	</div>
	        </div>
	        
	        
		</div>
<%@ include file="/WEB-INF/jsps/templates/footer.jsp" %>   