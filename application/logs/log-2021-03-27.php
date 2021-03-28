<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2021-03-27 01:13:20 --> Query error: Unknown column 'student.first_name' in 'field list' - Invalid query: SELECT `student`.`first_name` as `student_name`, `class`.`name` as `class_name`, `section`.`name` as `section_name`, `branch`.`name` as `branch_name`, `fee_groups`.`name` as `group_name`, `fee_groups`.`description` as `group_description`
FROM `fee_allocation`
JOIN `class` ON `class`.`id` = `fee_allocation`.`class_id`
JOIN `section` ON `section`.`id` = `fee_allocation`.`section_id`
JOIN `fee_groups` ON `fee_groups`.`id` = `fee_allocation`.`group_id`
JOIN `branch` ON `branch`.`id` = `fee_allocation`.`branch_id`
ERROR - 2021-03-27 01:13:20 --> Severity: error --> Exception: Call to a member function result_array() on boolean C:\xampp\htdocs\schoolsys\application\models\Fees_model.php 190
ERROR - 2021-03-27 01:13:22 --> Query error: Unknown column 'student.first_name' in 'field list' - Invalid query: SELECT `student`.`first_name` as `student_name`, `class`.`name` as `class_name`, `section`.`name` as `section_name`, `branch`.`name` as `branch_name`, `fee_groups`.`name` as `group_name`, `fee_groups`.`description` as `group_description`
FROM `fee_allocation`
JOIN `class` ON `class`.`id` = `fee_allocation`.`class_id`
JOIN `section` ON `section`.`id` = `fee_allocation`.`section_id`
JOIN `fee_groups` ON `fee_groups`.`id` = `fee_allocation`.`group_id`
JOIN `branch` ON `branch`.`id` = `fee_allocation`.`branch_id`
ERROR - 2021-03-27 01:13:22 --> Severity: error --> Exception: Call to a member function result_array() on boolean C:\xampp\htdocs\schoolsys\application\models\Fees_model.php 190
ERROR - 2021-03-27 01:14:56 --> Query error: Unknown column 'student.first_name' in 'field list' - Invalid query: SELECT `student`.`first_name` as `student_name`, `class`.`name` as `class_name`, `section`.`name` as `section_name`, `branch`.`name` as `branch_name`, `fee_groups`.`name` as `group_name`, `fee_groups`.`description` as `group_description`
FROM `fee_allocation`
JOIN `class` ON `class`.`id` = `fee_allocation`.`class_id`
JOIN `section` ON `section`.`id` = `fee_allocation`.`section_id`
JOIN `fee_groups` ON `fee_groups`.`id` = `fee_allocation`.`group_id`
JOIN `branch` ON `branch`.`id` = `fee_allocation`.`branch_id`
ERROR - 2021-03-27 01:14:56 --> Severity: error --> Exception: Call to a member function result_array() on boolean C:\xampp\htdocs\schoolsys\application\models\Fees_model.php 190
ERROR - 2021-03-27 01:15:11 --> Query error: Unknown column 'student.first_name' in 'field list' - Invalid query: SELECT `student`.`first_name` as `student_name`, `class`.`name` as `class_name`, `section`.`name` as `section_name`, `branch`.`name` as `branch_name`, `fee_groups`.`name` as `group_name`, `fee_groups`.`description` as `group_description`
FROM `fee_allocation`
JOIN `class` ON `class`.`id` = `fee_allocation`.`class_id`
JOIN `section` ON `section`.`id` = `fee_allocation`.`section_id`
JOIN `fee_groups` ON `fee_groups`.`id` = `fee_allocation`.`group_id`
JOIN `branch` ON `branch`.`id` = `fee_allocation`.`branch_id`
