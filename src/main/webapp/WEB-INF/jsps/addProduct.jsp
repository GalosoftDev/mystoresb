<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/jsps/templates/header.jsp" %>


	<div class="container-wrapper">
		<div class="container">
			
			<div class="page-header">
				<h1>Add Producto</h1>
				<p class="leader">Please fill all the fields</p>
			</div>
			
			<div class="container-warpper">
				<form action="${pageContext.request.contextPath}/admin/productInventory/addProduct"" method="post" enctype="multipart/form-data">
				                                      
					<div class="form-group">
						<label for="name">Name</label>
						<div cssStyle="color: #ff4434;"> ${msgName}</div>
						<input type="text" name="name" id="name" class="form-control"/>
					</div>
					
					<div class="form-group">
						<label for="description">Description</label>
						<textarea id="description" name="description" id="description" class="form-control"></textarea>
					</div>
					
					<div class="form-group">
						<label for="condition">Condition</label>
						<label class="checkbox-inline"><input type="radio" name="condition" value="nuevo"/>Nuevo</label>
						<label class="checkbox-inline"><input type="radio" name="condition" value="usado"/>Usado</label>
					</div>
					
					<div class="form-group">
						<label for="status">Status</label>
						<label class="checkbox-inline"><input type="radio" name="status" value="activo"/>Activo</label>
						<label class="checkbox-inline"><input type="radio" name="status" value="no-activo"/>NoActivo</label>
					</div>
					
					<div class="form-group">
						<label for="status">Category</label>
						<label class="checkbox-inline"><input type="radio" name="category" value="calzado"/>Calzado</label>
						<label class="checkbox-inline"><input type="radio" name="category" value="utiles"/>Utiles</label>
						<label class="checkbox-inline"><input type="radio" name="category" value="Ropa"/>Ropa</label>
					</div>
					
					
					<div class="form-group">
						<label for="price">Price</label>
						<div cssStyle="color: #ff4434;"> ${msgPrice}</div>
						<input type="text" id="price" name="price"class="form-control"/>
					</div>
					
					<div class="form-group">
						<label for="units">Units</label>
						<input type="text" id="units" name="units" class="form-control"/>
					</div>
					
					<div class="form-group">
						<label for="productImage">Upload Picture</label>
						<input id="productImage" class="form-control" type="file" name="image"/>
					</div>
					
					<br>
					
					<input type="submit" value="submit" class="btn btn-primary" />
					<a href= "<c:url value="/admin/productInventory" />" class="btn btn-default">Cancel</a>
					
				</form>
			</div>
			
			
		</div>
    </div>


<%@ include file="/WEB-INF/jsps/templates/footer.jsp" %> 



