<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2021-03-28 16:58:23 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 359
ERROR - 2021-03-28 16:58:23 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 360
ERROR - 2021-03-28 16:58:23 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 361
ERROR - 2021-03-28 17:16:03 --> Query error: Not unique table/alias: 'branch' - Invalid query: SELECT CONCAT(student.first_name, ' ', student.last_name) as full_name, `student`.`id` as `student_id`, `parent`.`id` as `parent_id`, `register_no`, `enroll`.`roll` as `roll_no`, `student`.`mobileno`, `student`.`email` as `email`, `section`.`name` as `section_name`, `class`.`name` as `class_name`, `student`.`gender`, `branch`.`name` as `branch_name`
FROM `student`
JOIN `branch` ON `parent`.`id` = `student`.`parent_id`
JOIN `enroll` ON `enroll`.`student_id` = `student`.`id`
JOIN `section` ON `section`.`id` = `enroll`.`section_id`
JOIN `class` ON `class`.`id` = `enroll`.`class_id`
JOIN `branch` ON `branch`.`id` = `branch`.`branch_id`
ORDER BY `student`.`id` ASC
ERROR - 2021-03-28 17:16:40 --> Query error: Not unique table/alias: 'branch' - Invalid query: SELECT CONCAT(student.first_name, ' ', student.last_name) as full_name, `student`.`id` as `student_id`, `parent`.`id` as `parent_id`, `register_no`, `enroll`.`roll` as `roll_no`, `student`.`mobileno`, `student`.`email` as `email`, `section`.`name` as `section_name`, `class`.`name` as `class_name`, `student`.`gender`, `branch`.`name` as `branch_name`
FROM `student`
JOIN `branch` ON `parent`.`id` = `student`.`parent_id`
JOIN `enroll` ON `enroll`.`student_id` = `student`.`id`
JOIN `section` ON `section`.`id` = `enroll`.`section_id`
JOIN `class` ON `class`.`id` = `enroll`.`class_id`
JOIN `branch` ON `branch`.`id` = `parent`.`branch_id`
ORDER BY `student`.`id` ASC
ERROR - 2021-03-28 17:17:26 --> Query error: Unknown column 'parent.id' in 'field list' - Invalid query: SELECT CONCAT(student.first_name, ' ', student.last_name) as full_name, `student`.`id` as `student_id`, `parent`.`id` as `parent_id`, `register_no`, `enroll`.`roll` as `roll_no`, `student`.`mobileno`, `student`.`email` as `email`, `section`.`name` as `section_name`, `class`.`name` as `class_name`, `student`.`gender`, `branch`.`name` as `branch_name`
FROM `student`
JOIN `branch` ON `parent`.`id` = `student`.`parent_id`
JOIN `enroll` ON `enroll`.`student_id` = `student`.`id`
JOIN `section` ON `section`.`id` = `enroll`.`section_id`
JOIN `class` ON `class`.`id` = `enroll`.`class_id`
ORDER BY `student`.`id` ASC
ERROR - 2021-03-28 17:18:04 --> Query error: Unknown column 'parent.id' in 'field list' - Invalid query: SELECT CONCAT(student.first_name, ' ', student.last_name) as full_name, `student`.`id` as `student_id`, `parent`.`id` as `parent_id`, `register_no`, `enroll`.`roll` as `roll_no`, `student`.`mobileno`, `student`.`email` as `email`, `section`.`name` as `section_name`, `class`.`name` as `class_name`, `branch`.`name` as `branch_name`, `student`.`gender`
FROM `student`
JOIN `branch` ON `parent`.`id` = `student`.`parent_id`
JOIN `enroll` ON `enroll`.`student_id` = `student`.`id`
JOIN `section` ON `section`.`id` = `enroll`.`section_id`
JOIN `class` ON `class`.`id` = `enroll`.`class_id`
ORDER BY `student`.`id` ASC
ERROR - 2021-03-28 17:18:41 --> Query error: Unknown column 'parent.id' in 'field list' - Invalid query: SELECT CONCAT(student.first_name, ' ', student.last_name) as full_name, `student`.`id` as `student_id`, `parent`.`id` as `parent_id`, `register_no`, `enroll`.`roll` as `roll_no`, `student`.`mobileno`, `student`.`email` as `email`, `section`.`name` as `section_name`, `class`.`name` as `class_name`, `student`.`gender`, `branch`.*
FROM `student`
JOIN `branch` ON `parent`.`id` = `student`.`parent_id`
JOIN `enroll` ON `enroll`.`student_id` = `student`.`id`
JOIN `section` ON `section`.`id` = `enroll`.`section_id`
JOIN `class` ON `class`.`id` = `enroll`.`class_id`
ORDER BY `student`.`id` ASC
ERROR - 2021-03-28 17:18:57 --> Query error: Unknown column 'parent.id' in 'field list' - Invalid query: SELECT CONCAT(student.first_name, ' ', student.last_name) as full_name, `student`.`id` as `student_id`, `parent`.`id` as `parent_id`, `register_no`, `enroll`.`roll` as `roll_no`, `student`.`mobileno`, `student`.`email` as `email`, `section`.`name` as `section_name`, `class`.`name` as `class_name`, `student`.`gender`, `branch`.*
FROM `student`
JOIN `enroll` ON `enroll`.`student_id` = `student`.`id`
JOIN `section` ON `section`.`id` = `enroll`.`section_id`
JOIN `class` ON `class`.`id` = `enroll`.`class_id`
JOIN `branch` ON `parent`.`id` = `student`.`parent_id`
ORDER BY `student`.`id` ASC
ERROR - 2021-03-28 17:49:38 --> Severity: Notice --> Undefined variable: active_tab E:\wamp64\www\schoolsys\application\views\fees\create_voucher.php 12
ERROR - 2021-03-28 17:49:38 --> Severity: Notice --> Undefined variable: active_tab E:\wamp64\www\schoolsys\application\views\fees\create_voucher.php 16
ERROR - 2021-03-28 17:49:38 --> Severity: Notice --> Undefined variable: active_tab E:\wamp64\www\schoolsys\application\views\fees\create_voucher.php 20
ERROR - 2021-03-28 17:49:38 --> Severity: Notice --> Undefined variable: active_tab E:\wamp64\www\schoolsys\application\views\fees\create_voucher.php 26
ERROR - 2021-03-28 17:49:38 --> Severity: Notice --> Undefined variable: active_tab E:\wamp64\www\schoolsys\application\views\fees\create_voucher.php 30
ERROR - 2021-03-28 17:49:38 --> Severity: Notice --> Undefined variable: active_tab E:\wamp64\www\schoolsys\application\views\fees\create_voucher.php 169
ERROR - 2021-03-28 18:12:20 --> Severity: Notice --> Undefined variable: studentlist E:\wamp64\www\schoolsys\application\views\fees\create_voucher.php 255
ERROR - 2021-03-28 18:23:07 --> Severity: Notice --> Undefined variable: widget E:\wamp64\www\schoolsys\application\views\fees\create_voucher.php 182
ERROR - 2021-03-28 18:23:07 --> Severity: Notice --> Undefined variable: branch_id E:\wamp64\www\schoolsys\application\views\fees\create_voucher.php 186
ERROR - 2021-03-28 18:23:07 --> Severity: Notice --> Undefined variable: widget E:\wamp64\www\schoolsys\application\views\fees\create_voucher.php 193
ERROR - 2021-03-28 18:23:44 --> Severity: Notice --> Undefined variable: branch_id E:\wamp64\www\schoolsys\application\views\fees\create_voucher.php 186
ERROR - 2021-03-28 20:00:35 --> Query error: Unknown column 'enroll.roll' in 'field list' - Invalid query: SELECT CONCAT(student.first_name, ' ', student.last_name) as full_name, `student`.`id` as `student_id`, `parent`.`id` as `parent_id`, `register_no`, `enroll`.`roll` as `roll_no`, `student`.`mobileno`, `student`.`email` as `email`, `section`.`name` as `section_name`, `class`.`name` as `class_name`, `student`.`gender`, `branch`.`name` as `branch_name`
FROM `student`
JOIN `parent` ON `parent`.`id` = `student`.`parent_id`
JOIN `section` ON `section`.`id` = `enroll`.`section_id`
JOIN `class` ON `class`.`id` = `enroll`.`class_id`
JOIN `branch` ON `branch`.`id` = `parent`.`branch_id`
ORDER BY `student`.`id` ASC
ERROR - 2021-03-28 20:05:03 --> Query error: Unknown column 'enroll.section_id' in 'on clause' - Invalid query: SELECT CONCAT(student.first_name, ' ', student.last_name) as full_name, `student`.`id` as `student_id`, `parent`.`id` as `parent_id`, `register_no`, `student`.`mobileno`, `student`.`email` as `email`, `section`.`name` as `section_name`, `class`.`name` as `class_name`, `student`.`gender`, `branch`.`name` as `branch_name`
FROM `student`
JOIN `parent` ON `parent`.`id` = `student`.`parent_id`
JOIN `section` ON `section`.`id` = `enroll`.`section_id`
JOIN `class` ON `class`.`id` = `enroll`.`class_id`
JOIN `branch` ON `branch`.`id` = `parent`.`branch_id`
ORDER BY `student`.`id` ASC
