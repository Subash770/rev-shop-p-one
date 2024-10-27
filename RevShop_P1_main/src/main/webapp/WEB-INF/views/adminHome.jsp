<%@include file="./base.jsp" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<!--extrenal cdn for owl carousel-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw==" crossorigin="anonymous" referrerpolicy="no-referrer" />	
</head>
  <body>
	
	
	
	<div class="container ">
		<h1 class="display-3 text-center fw-bold mt-4">Dashboard</h1>
		<div class="row">
			
			<div class="owl-carousel owl-theme">
		
				<div class="item">
					<div class="card">
						<a href="/admin/products" class="text-decoration-none">
						                        <div class="card-body">
						                            <img src="/img/Images/prod.png" class="img-fluid" alt="View Product">
						                            <h4 class="card-title">View Product</h4>
						                        </div>
						                    </a>		
					</div>
				</div>
				
				<div class="item">
					<div class="card">
						<a href="/admin/add-admin" class="text-decoration-none">
						                       <div class="card-body">
						                           <img src="/img/Images/admini.png" class="img-fluid" alt="Add Admin">
						                           <h4 class="card-title">Add Admin</h4>
						                       </div>
						                   </a>		
					</div>				
				</div>	
				
				<div class="item">
					<div class="card">
						<a href="/admin/users?type=2" class="text-decoration-none">
				                  <div class="card-body">
		           		            <img src="/img/Images/admin.png" class="img-fluid" alt="Admin">
				                      <h4 class="card-title">Admin</h4>
				                  </div>
		            </a>
					</div>				
				</div>	
								
				<div class="item">
						<div class="card">
							<a href="/admin/loadAddProduct" class="text-decoration-none">
					                 <div class="card-body">
					                        <img src="/img/Images/Productsi.png" class="img-fluid" alt="Product">
					                        <h4 class="card-title">Add Product</h4>
					                 </div>
					   </a>		
						</div>				
				</div>	
				
				
				<div class="item">
						<div class="card">
							<a href="/admin/category" class="text-decoration-none">
							           <div class="card-body">
							              <img src="/img/Images/cat.png" class="img-fluid" alt="Add Category">
							                   <h4 class="card-title">Add Category</h4>
						           </div>
			              </a>		
						</div>				
				</div>	
				
				<div class="item">
						<div class="card">
							<a href="/admin/orders" class="text-decoration-none">
							                       <div class="card-body">
							                           <img src="/img/Images/orderi.png" class="img-fluid" alt="Orders">
							                           <h4 class="card-title">Orders</h4>
							                       </div>
							                   </a>
						</div>				
				</div>	
				
				
				<div class="item">
						<div class="card">
							<a href="/admin/users?type=1" class="text-decoration-none">
							    <div class="card-body">
							                <img src="/img/Images/useri.png" class="img-fluid" alt="Users">
							                <h4 class="card-title">Users</h4>
							    </div>
				           </a>
						</div>				
				</div>	
				
							
			</div>	
		</div>
	</div>
	
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-JobWAqYk5CSjWuVV3mxgS+MmccJqkrBaDhk8SKS1BW+71dJ9gzascwzW85UwGhxiSyR7Pxhu50k+Nl3+o5I49A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<!--extrenal js cdn owl carousel-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	 <script>
	$('.owl-carousel').owlCarousel({
	    loop:true,
	    margin:10,
	    nav:true,
	    responsive:{
	        0:{
	            items:1
	        },
	        600:{
	            items:3
	        },
	        1000:{
	            items:3
	        }
	    }
	})
	</script>
 </body>
</html>

