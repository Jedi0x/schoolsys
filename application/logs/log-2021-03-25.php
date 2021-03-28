<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2021-03-25 00:50:06 --> Query error: Table 'school.name' doesn't exist - Invalid query: SELECT *
FROM `name`
WHERE `branch_id` = '1'
ERROR - 2021-03-25 00:50:06 --> Severity: error --> Exception: Call to a member function row_array() on boolean C:\xampp\htdocs\schoolsys\application\views\fees\allocation.php 54
ERROR - 2021-03-25 00:50:24 --> Query error: Table 'school.name' doesn't exist - Invalid query: SELECT *
FROM `name`
WHERE `branch_id` = '1'
ERROR - 2021-03-25 00:50:24 --> Severity: error --> Exception: Call to a member function row_array() on boolean C:\xampp\htdocs\schoolsys\application\views\fees\allocation.php 54
ERROR - 2021-03-25 00:51:28 --> Query error: Table 'school.name' doesn't exist - Invalid query: SELECT *
FROM `name`
WHERE `branch_id` = '1'
ERROR - 2021-03-25 00:51:28 --> Severity: error --> Exception: Call to a member function row_array() on boolean C:\xampp\htdocs\schoolsys\application\views\fees\allocation.php 54
ERROR - 2021-03-25 00:52:20 --> Severity: error --> Exception: Call to undefined method CI_DB_mysqli_driver::row_array() C:\xampp\htdocs\schoolsys\application\views\fees\allocation.php 54
ERROR - 2021-03-25 00:55:28 --> Query error: Table 'school.name' doesn't exist - Invalid query: SELECT *
FROM `name`
WHERE `branch_id` = '1'
ERROR - 2021-03-25 00:55:28 --> Severity: error --> Exception: Call to a member function row_array() on boolean C:\xampp\htdocs\schoolsys\application\views\fees\allocation.php 55
ERROR - 2021-03-25 01:51:58 --> Query error: Unknown column 'class.name' in 'field list' - Invalid query: SELECT `branch`.`id`, `class`.`name`, `section`.`name`
FROM `branch`
JOIN `section` ON `section`.`branch_id` = `branch`.`id`
ERROR - 2021-03-25 01:51:58 --> Severity: error --> Exception: Call to a member function result_array() on boolean C:\xampp\htdocs\schoolsys\application\models\Fees_model.php 186
ERROR - 2021-03-25 01:52:01 --> Query error: Unknown column 'class.name' in 'field list' - Invalid query: SELECT `branch`.`id`, `class`.`name`, `section`.`name`
FROM `branch`
JOIN `section` ON `section`.`branch_id` = `branch`.`id`
ERROR - 2021-03-25 01:52:01 --> Severity: error --> Exception: Call to a member function result_array() on boolean C:\xampp\htdocs\schoolsys\application\models\Fees_model.php 186
ERROR - 2021-03-25 01:54:43 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '`=`
JOIN `section` ON `branch`.`id` = `section`.`branch_id`' at line 3 - Invalid query: SELECT `branch`.`id`, `class`.`name`, `section`.`name`
FROM `branch`
JOIN `class` ON `branch`.`id` = `class`.`branch_id` `=`
JOIN `section` ON `branch`.`id` = `section`.`branch_id`
ERROR - 2021-03-25 01:54:43 --> Severity: error --> Exception: Call to a member function result_array() on boolean C:\xampp\htdocs\schoolsys\application\models\Fees_model.php 186
ERROR - 2021-03-25 02:01:05 --> Query error: Table 'school.name' doesn't exist - Invalid query: SELECT *
FROM `name`
WHERE `branch_id` = '1'
ERROR - 2021-03-25 02:01:05 --> Severity: error --> Exception: Call to a member function row_array() on boolean C:\xampp\htdocs\schoolsys\application\views\fees\allocation.php 55
