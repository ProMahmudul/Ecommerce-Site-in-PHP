<?php include 'inc/header.php'; ?>
<?php 
	$login = Session::get("custlogin");
	if ($login == false) {
		header("Location: login.php");
	}
?>
<style type="text/css">
.payment{
	width: 500px;
	min-height: 200px;
	text-align: center;
	border: 1px solid #ddd;
	margin: 0 auto;
	padding: 50px;
}
.payment h2{
	border-bottom: 1px solid #ddd;
	margin-bottom: 40px;
	padding-bottom: 10px;
}
.payment p{
	line-height: 25px;
	font-size: 18px;
	text-align: left;
}
</style>
 <div class="main">
    <div class="content">
    	<div class="section group">
    		<div class="payment">
    			<h2>Success</h2>
    			<?php 
    				$cmrId = Session::get("cmrId");
    				$amount = $ct->payableAmount($cmrId);
    				if ($amount) {
    					$sum = 0;
    					while ($result = $amount->fetch_assoc()) {
    						$price 	= $result['price'];
    						$sum 	= $sum + $price;
    					}
    				}
    			?>
    			<p>Total Payable Amount(Including Vat) : 
					<?php 
						$vat = $sum * 0.1;
						$total = $sum + $vat;
						echo $total;
					?>
    			</p>
    			<p style="color: red">Thanks for Purchase. Receive Your Order Successfully. We will contact you ASAP with delivery details. Here is your order details....<a href="orderdetails.php">Visit here..</a></p>
    		</div>
 		</div>
 	</div>
	</div>
   <?php include 'inc/footer.php'; ?>