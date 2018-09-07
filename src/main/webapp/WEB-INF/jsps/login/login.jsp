<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ include file="/WEB-INF/jsps/templates/header.jsp" %>

        
        <div class="container">
        
        	<div class="page-header">
        		<h2>Login</h2>
        		<p>Please fill all fields</p>
        	</div>
        	
        	<div class="container-warpper">
	        	<form action="login" method="post">
	        		
					<div class="form-group">
						<label for="name">User</label>
						<input type="text" name="email" id="email" class="form-control"/>
					</div>
					<div class="form-group">
						<label for="name">Password</label>
						<input type="text" name="password" id="password" class="form-control"/>
					</div>
					
					<input type="submit" value="submit" class="btn btn-primary" />
	        	
	        	</form>
	        	${msg}
	        </div>
		</div>
<%@ include file="/WEB-INF/jsps/templates/footer.jsp" %>  