<?php
//
// ls.php
// List all of the files in a directory.
// by Jordan Saints, www.jordansaints.com
//
// Usage: "/ls.php?d=<DIRECTORY>" with your target directory.
// Optionally append "&l=<1 OR 0>" to also list directories.
//
// By default:
//   - list files in current directory = "."
//   - list directories = TRUE
//

// DIRECTORY TO LIST
if(isset($_GET['d'])) {
    $theDirectory = htmlentities($_GET['d']);
}
else {
    die("This is not a directory!");
}

// LIST DIRECTORIES ???
if(isset($_GET['l'])) {
    if ($_GET['l'] == 1 || $_GET['l'] == 0)
        $listDirectories = $_GET['l'];
    else
        $listDirectories = false; //not a boolean value passed in? false
}
else {
    $listDirectories = false; //set to false by default
}

//LISTING !!!
if(is_dir($theDirectory)) {
    echo "<table border=\"1\" style=\"border-collapse:collapse;\"><tr><th>Name</th><th>Type</th><th>Size</th></tr>";
    $dir = opendir($theDirectory);

    $count = 0;
    $color = '#DCDCDC'; //white
    while(false !== ($file = readdir($dir))) {
        $type = filetype($theDirectory ."/". $file);

        if($listDirectories || $type != "dir") {
            $color = ($count%2 == 0 ? '#DCDCDC' : '#FFFFFF'); //gray bg on even rows, white otherwise

            echo "<tr style=\"background-color:{$color};\"><td>" . $file . "</td>";
            echo "<td>" . $type . "</td>";
            echo "<td>";
            if($type === "file") {
                echo filesize($file);
            }
            echo "</td></tr>";
            $count++;
        }
    }

    closedir($dir);
    echo "</table>";
}
else {
    echo $theDirectory . " is not a directory";
}

?>