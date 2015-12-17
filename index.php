<!DOCTYPE html>
<html>
<head>
	<title>Tweet</title>
</head>
<body>
	<p>Tweet here! less than 160 character!</p>
	<form action="./process_tweet.php" method="POST">
		<input type="text" name="tweet">
		<button type="submit">Tweet</button>
	</form>
	<p><b>Top 10 Trending #</b></p>
	<?php 
	require_once('db_conn.php');
	$sql_trending = "SELECT * FROM hashtags ORDER BY count DESC LIMIT 10";
	$result = $conn->query($sql_trending);

	if ($result->num_rows > 0) {
		echo "<ol>";
		while($row = $result->fetch_assoc()) {
			echo "<ul>".$row["word"]."</ul>";
		}
		echo "</ol>";
	}
	?>
</body>
</html>