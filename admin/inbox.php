﻿<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php 
	$filepath = realpath(dirname(__FILE__));
	include_once ($filepath.'/../classes/Cart.php');
	$ct = new Cart();
	$fm = new Format();
?>
<?php 
	if (isset($_GET['shiftid']) && isset($_GET['time']) && isset($_GET['price']) && isset($_GET['prodId'])) {
		$id 	= $_GET['shiftid'];
		$time 	= $_GET['time'];
		$price 	= $_GET['price'];
		$prodId = $_GET['prodId'];
		$shift 	= $ct->productShifted($id, $time, $price, $prodId);
	}

	if (isset($_GET['delproId']) && isset($_GET['time']) && isset($_GET['price']) && isset($_GET['prodId'])) {
		$id 	= $_GET['delproId'];
		$time 	= $_GET['time'];
		$price 	= $_GET['price'];
		$prodId = $_GET['prodId'];
		$delOrder 	= $ct->delProductShifted($id, $time, $price, $prodId);
	}


?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Inbox</h2>
                <?php 
                	if (isset($shift)) {
                		echo $shift;
                	}
                	if (isset($delOrder)) {
                		echo $delOrder;
                	}
                ?>
                <div class="block">        
                    <table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>ID</th>
							<th>Order Time</th>
							<th>Product</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Customer ID</th>
							<th>Address</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<?php 
							$getOrder = $ct->getAllOrderProduct();
							if ($getOrder) {
								while ($result = $getOrder->fetch_assoc()) {
						?>
						<tr class="odd gradeX">
							<td><?php echo $result['id']; ?></td>
							<td><?php echo $fm->formatDate($result['date']); ?></td>
							<td><?php echo $result['productName']; ?></td>
							<td><?php echo $result['quantity']; ?></td>
							<td>$<?php echo $result['price']; ?></td>
							<td><?php echo $result['cmrId']; ?></td>
							<td><a href="customer.php?custId=<?php echo $result['cmrId']; ?>">View Details</a></td>
							<?php if ($result['status'] == 0) { ?>
								<td><a href="?shiftid=<?php echo $result['cmrId']; ?>&price=<?php echo $result['price']; ?>&time=<?php echo $result['date']; ?>&prodId=<?php echo $result['productId']; ?>">Shifted</a></td>
							<?php } elseif ($result['status'] == 1) { ?>
								<td>Pending</td>
							<?php } else { ?>
								<td><a href="?delproId=<?php echo $result['cmrId']; ?>&price=<?php echo $result['price']; ?>&time=<?php echo $result['date']; ?>&prodId=<?php echo $result['productId']; ?>">Remove</a></td>
							<?php } ?>
						</tr>
						<?php } } ?>
					</tbody>
				</table>
               </div>
            </div>
        </div>
<script type="text/javascript">
    $(document).ready(function () {
        setupLeftMenu();

        $('.datatable').dataTable();
        setSidebarHeight();
    });
</script>
<?php include 'inc/footer.php';?>