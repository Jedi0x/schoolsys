<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2021-03-24 21:47:18 --> Severity: Notice --> Undefined variable: widget E:\wamp64\www\schoolsys\application\views\fees\create_vouchers.php 37
ERROR - 2021-03-24 21:47:18 --> Severity: Notice --> Undefined variable: branch_id E:\wamp64\www\schoolsys\application\views\fees\create_vouchers.php 41
ERROR - 2021-03-24 21:47:18 --> Severity: Notice --> Undefined variable: widget E:\wamp64\www\schoolsys\application\views\fees\create_vouchers.php 47
ERROR - 2021-03-24 21:47:18 --> Severity: Notice --> Undefined variable: widget E:\wamp64\www\schoolsys\application\views\fees\create_vouchers.php 57
ERROR - 2021-03-24 21:47:18 --> Severity: Notice --> Undefined variable: branch_id E:\wamp64\www\schoolsys\application\views\fees\create_vouchers.php 61
ERROR - 2021-03-24 21:48:53 --> Severity: Notice --> Undefined variable: widget E:\wamp64\www\schoolsys\application\views\fees\create_vouchers.php 33
ERROR - 2021-03-24 21:48:53 --> Severity: Notice --> Undefined variable: widget E:\wamp64\www\schoolsys\application\views\fees\create_vouchers.php 40
ERROR - 2021-03-24 21:48:53 --> Severity: Notice --> Undefined variable: widget E:\wamp64\www\schoolsys\application\views\fees\create_vouchers.php 47
ERROR - 2021-03-24 22:01:44 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 359
ERROR - 2021-03-24 22:01:44 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 360
ERROR - 2021-03-24 22:01:44 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 361
ERROR - 2021-03-24 22:29:35 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 359
ERROR - 2021-03-24 22:29:35 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 360
ERROR - 2021-03-24 22:29:35 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 361
ERROR - 2021-03-24 22:44:21 --> Query error: Column 'mobileno' in field list is ambiguous - Invalid query: SELECT CONCAT(student.first_name, ' ', student.last_name) as full_name, `student`.`id` as `student_id`, `parent`.`id` as `parent_id`, `register_no`, `enroll`.`roll` as `roll_no`, `mobileno`, `section`.`name` as `section_name`, `class`.`name` as `class_name`
FROM `student`
JOIN `parent` ON `parent`.`id` = `student`.`parent_id`
JOIN `enroll` ON `enroll`.`student_id` = `student`.`id`
JOIN `section` ON `section`.`id` = `enroll`.`section_id`
JOIN `class` ON `class`.`id` = `enroll`.`class_id`
WHERE `student`.`register_no` = 'RSM-00001'
ORDER BY `student`.`id` ASC
ERROR - 2021-03-24 22:50:14 --> Query error: Unknown column 'student.email as email section.name' in 'field list' - Invalid query: SELECT CONCAT(student.first_name, ' ', student.last_name) as full_name, `student`.`id` as `student_id`, `parent`.`id` as `parent_id`, `register_no`, `enroll`.`roll` as `roll_no`, `student`.`mobileno`, `student`.`email as email section`.`name` as `section_name`, `class`.`name` as `class_name`, `student`.`gender`
FROM `student`
JOIN `parent` ON `parent`.`id` = `student`.`parent_id`
JOIN `enroll` ON `enroll`.`student_id` = `student`.`id`
JOIN `section` ON `section`.`id` = `enroll`.`section_id`
JOIN `class` ON `class`.`id` = `enroll`.`class_id`
WHERE `student`.`register_no` = 'RSM-00001'
ORDER BY `student`.`id` ASC
ERROR - 2021-03-24 22:50:33 --> Severity: Notice --> Undefined index: roll E:\wamp64\www\schoolsys\application\views\fees\create_voucher.php 121
ERROR - 2021-03-24 22:52:37 --> Query error: Unknown column 'roll_no' in 'where clause' - Invalid query: SELECT CONCAT(student.first_name, ' ', student.last_name) as full_name, `student`.`id` as `student_id`, `parent`.`id` as `parent_id`, `register_no`, `enroll`.`roll` as `roll_no`, `student`.`mobileno`, `student`.`email` as `email`, `section`.`name` as `section_name`, `class`.`name` as `class_name`, `student`.`gender`
FROM `student`
JOIN `parent` ON `parent`.`id` = `student`.`parent_id`
JOIN `enroll` ON `enroll`.`student_id` = `student`.`id`
JOIN `section` ON `section`.`id` = `enroll`.`section_id`
JOIN `class` ON `class`.`id` = `enroll`.`class_id`
WHERE `roll_no` = '2'
ORDER BY `student`.`id` ASC
ERROR - 2021-03-24 22:54:35 --> Query error: Unknown column 'full_name' in 'where clause' - Invalid query: SELECT CONCAT(student.first_name, ' ', student.last_name) as full_name, `student`.`id` as `student_id`, `parent`.`id` as `parent_id`, `register_no`, `enroll`.`roll` as `roll_no`, `student`.`mobileno`, `student`.`email` as `email`, `section`.`name` as `section_name`, `class`.`name` as `class_name`, `student`.`gender`
FROM `student`
JOIN `parent` ON `parent`.`id` = `student`.`parent_id`
JOIN `enroll` ON `enroll`.`student_id` = `student`.`id`
JOIN `section` ON `section`.`id` = `enroll`.`section_id`
JOIN `class` ON `class`.`id` = `enroll`.`class_id`
WHERE `full_name` = 'Test One'
ORDER BY `student`.`id` ASC
ERROR - 2021-03-24 22:57:39 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''Test One'
ORDER BY `student`.`id` ASC' at line 7 - Invalid query: SELECT CONCAT(student.first_name, ' ', student.last_name) as full_name, `student`.`id` as `student_id`, `parent`.`id` as `parent_id`, `register_no`, `enroll`.`roll` as `roll_no`, `student`.`mobileno`, `student`.`email` as `email`, `section`.`name` as `section_name`, `class`.`name` as `class_name`, `student`.`gender`
FROM `student`
JOIN `parent` ON `parent`.`id` = `student`.`parent_id`
JOIN `enroll` ON `enroll`.`student_id` = `student`.`id`
JOIN `section` ON `section`.`id` = `enroll`.`section_id`
JOIN `class` ON `class`.`id` = `enroll`.`class_id`
WHERE CONCAT(student.first_name, ' ', student.last_name) 'Test One'
ORDER BY `student`.`id` ASC
