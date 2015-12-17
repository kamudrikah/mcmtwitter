<?php
require_once('db_conn.php');

$tweet = $_POST['tweet'];

preg_match_all("/#(\\w+)/", $tweet, $matches);

$sql_tweet = "INSERT INTO tweets (tweet_content, timestamp) VALUES ('$tweet', '".time()."')";

if ($conn->query($sql_tweet) === TRUE) {
	if(count($matches)>0){
		$last_tweet_id = $conn->insert_id;
		foreach ($matches[0] as $key => $value) {
			$sql_find_h = "SELECT * FROM hashtags WHERE word = '$value'";
			$result = $conn->query($sql_find_h);

			if ($result->num_rows > 0) {
				while($row = $result->fetch_assoc()) {
					$h_id = $row["h_id"];
					$count = $row["count"];
					$count=$count+1;
					$sql_update_count = "UPDATE hashtags SET count='$count' WHERE h_id='$h_id'";
					$conn->query($sql_update_count);
					
					$sql_insert_th = "INSERT INTO tweets_hashtags (t_id, h_id) VALUES ('$last_tweet_id', '$h_id')";
					$conn->query($sql_insert_th);
				}
			} else {
				$sql_insert_h = "INSERT INTO hashtags (word, count) VALUES ('$value', '1')";
				$conn->query($sql_insert_h);
				$h_id = $conn->insert_id;

				$sql_insert_th = "INSERT INTO tweets_hashtags (t_id, h_id) VALUES ('$last_tweet_id', '$h_id')";
				$conn->query($sql_insert_th);
			}
		}
	}
	echo "Successfully tweeted! <a href='./index.php'>Home</a>";
} else {
	echo "Error: " . $sql . "<br>" . $conn->error;
}
?>