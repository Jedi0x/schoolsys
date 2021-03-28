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
ERROR - 2021-03-28 21:41:06 --> Severity: User Error --> Composer detected issues in your platform: Your Composer dependencies require a PHP version ">= 7.3.0". You are running 7.0.33. E:\wamp64\www\schoolsys\application\third_party\barcode\vendor\composer\platform_check.php 24
ERROR - 2021-03-28 21:44:54 --> Severity: error --> Exception: Char e is unsupported E:\wamp64\www\schoolsys\application\third_party\barcode\vendor\picqer\php-barcode-generator\src\Types\TypeCode128.php 170
ERROR - 2021-03-28 21:45:47 --> Severity: Notice --> Uninitialized string offset: 12 E:\wamp64\www\schoolsys\application\third_party\barcode\vendor\picqer\php-barcode-generator\src\Types\TypeCode11.php 95
ERROR - 2021-03-28 21:45:47 --> Severity: error --> Exception: Char H is unsupported E:\wamp64\www\schoolsys\application\third_party\barcode\vendor\picqer\php-barcode-generator\src\Types\TypeCode11.php 42
ERROR - 2021-03-28 21:52:46 --> Severity: Warning --> A non-numeric value encountered E:\wamp64\www\schoolsys\application\third_party\barcode\vendor\picqer\php-barcode-generator\src\Types\TypeEanUpcBase.php 214
ERROR - 2021-03-28 21:52:46 --> Severity: Warning --> A non-numeric value encountered E:\wamp64\www\schoolsys\application\third_party\barcode\vendor\picqer\php-barcode-generator\src\Types\TypeEanUpcBase.php 214
ERROR - 2021-03-28 21:52:46 --> Severity: Warning --> A non-numeric value encountered E:\wamp64\www\schoolsys\application\third_party\barcode\vendor\picqer\php-barcode-generator\src\Types\TypeEanUpcBase.php 214
ERROR - 2021-03-28 21:52:46 --> Severity: Warning --> A non-numeric value encountered E:\wamp64\www\schoolsys\application\third_party\barcode\vendor\picqer\php-barcode-generator\src\Types\TypeEanUpcBase.php 214
ERROR - 2021-03-28 21:52:46 --> Severity: Warning --> A non-numeric value encountered E:\wamp64\www\schoolsys\application\third_party\barcode\vendor\picqer\php-barcode-generator\src\Types\TypeEanUpcBase.php 214
ERROR - 2021-03-28 21:52:46 --> Severity: Warning --> A non-numeric value encountered E:\wamp64\www\schoolsys\application\third_party\barcode\vendor\picqer\php-barcode-generator\src\Types\TypeEanUpcBase.php 214
ERROR - 2021-03-28 21:52:46 --> Severity: Notice --> Undefined index: H E:\wamp64\www\schoolsys\application\third_party\barcode\vendor\picqer\php-barcode-generator\src\Types\TypeEanUpcBase.php 177
ERROR - 2021-03-28 21:52:46 --> Severity: Notice --> Undefined index: e E:\wamp64\www\schoolsys\application\third_party\barcode\vendor\picqer\php-barcode-generator\src\Types\TypeEanUpcBase.php 177
ERROR - 2021-03-28 21:52:46 --> Severity: Notice --> Undefined index: l E:\wamp64\www\schoolsys\application\third_party\barcode\vendor\picqer\php-barcode-generator\src\Types\TypeEanUpcBase.php 177
ERROR - 2021-03-28 21:52:46 --> Severity: Notice --> Undefined index: l E:\wamp64\www\schoolsys\application\third_party\barcode\vendor\picqer\php-barcode-generator\src\Types\TypeEanUpcBase.php 177
ERROR - 2021-03-28 21:52:46 --> Severity: Notice --> Undefined index: o E:\wamp64\www\schoolsys\application\third_party\barcode\vendor\picqer\php-barcode-generator\src\Types\TypeEanUpcBase.php 177
ERROR - 2021-03-28 21:52:46 --> Severity: Notice --> Undefined index:   E:\wamp64\www\schoolsys\application\third_party\barcode\vendor\picqer\php-barcode-generator\src\Types\TypeEanUpcBase.php 177
ERROR - 2021-03-28 21:52:46 --> Severity: error --> Exception: Char T not allowed E:\wamp64\www\schoolsys\application\third_party\barcode\vendor\picqer\php-barcode-generator\src\Types\TypeEanUpcBase.php 183
ERROR - 2021-03-28 21:52:46 --> Severity: Warning --> Cannot modify header information - headers already sent by (output started at E:\wamp64\www\schoolsys\system\core\Exceptions.php:271) E:\wamp64\www\schoolsys\system\core\Common.php 570
ERROR - 2021-03-28 21:53:38 --> Severity: error --> Exception: Char H is unsupported E:\wamp64\www\schoolsys\application\third_party\barcode\vendor\picqer\php-barcode-generator\src\Types\TypeCodabar.php 47
ERROR - 2021-03-28 21:57:03 --> Severity: Warning --> file_put_contents(E:\wamp64\www\schoolsys\assets/images/voucher_barcodes/barcode.png): failed to open stream: No such file or directory E:\wamp64\www\schoolsys\application\controllers\Fees.php 918
ERROR - 2021-03-28 22:12:34 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 359
ERROR - 2021-03-28 22:12:34 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 360
ERROR - 2021-03-28 22:12:34 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 361
ERROR - 2021-03-28 22:27:17 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 359
ERROR - 2021-03-28 22:27:17 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 360
ERROR - 2021-03-28 22:27:18 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 361
ERROR - 2021-03-28 22:37:25 --> Non-existent class: Pdf
ERROR - 2021-03-28 22:38:37 --> Non-existent class: Pdf
ERROR - 2021-03-28 22:38:39 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 359
ERROR - 2021-03-28 22:38:39 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 360
ERROR - 2021-03-28 22:38:39 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 361
ERROR - 2021-03-28 22:40:30 --> Severity: error --> Exception: Cannot access parent:: when current class scope has no parent E:\wamp64\www\schoolsys\application\libraries\Barcode.php 8
ERROR - 2021-03-28 22:40:52 --> Severity: error --> Exception: Cannot access parent:: when current class scope has no parent E:\wamp64\www\schoolsys\application\libraries\Barcode.php 8
ERROR - 2021-03-28 22:41:20 --> Non-existent class: Pdf
ERROR - 2021-03-28 22:43:43 --> Non-existent class: Voucher_pdf
ERROR - 2021-03-28 22:43:51 --> Non-existent class: Voucher_pdf
ERROR - 2021-03-28 22:44:54 --> Non-existent class: Voucher_pdf
ERROR - 2021-03-28 22:45:41 --> Non-existent class: Pdf
ERROR - 2021-03-28 22:49:20 --> Non-existent class: Pdf
ERROR - 2021-03-28 17:50:53 --> Non-existent class: Pdf
ERROR - 2021-03-28 17:52:04 --> Non-existent class: Pdf
ERROR - 2021-03-28 17:53:45 --> Non-existent class: Pdf
ERROR - 2021-03-28 17:53:45 --> Severity: Warning --> Cannot modify header information - headers already sent by (output started at E:\wamp64\www\schoolsys\application\libraries\Pdf.php:1) E:\wamp64\www\schoolsys\system\core\Common.php 570
ERROR - 2021-03-28 17:54:09 --> Non-existent class: Pdf
ERROR - 2021-03-28 17:54:09 --> Severity: Warning --> Cannot modify header information - headers already sent by (output started at E:\wamp64\www\schoolsys\application\libraries\Pdf.php:1) E:\wamp64\www\schoolsys\system\core\Common.php 570
ERROR - 2021-03-28 17:54:48 --> Non-existent class: Pdf
ERROR - 2021-03-28 17:54:48 --> Severity: Warning --> Cannot modify header information - headers already sent by (output started at E:\wamp64\www\schoolsys\application\libraries\Pdf.php:1) E:\wamp64\www\schoolsys\system\core\Common.php 570
ERROR - 2021-03-28 17:54:55 --> Non-existent class: Pdf
ERROR - 2021-03-28 17:54:55 --> Severity: Warning --> Cannot modify header information - headers already sent by (output started at E:\wamp64\www\schoolsys\application\libraries\Pdf.php:1) E:\wamp64\www\schoolsys\system\core\Common.php 570
ERROR - 2021-03-28 17:55:05 --> Non-existent class: Pdf
ERROR - 2021-03-28 17:55:05 --> Severity: Warning --> Cannot modify header information - headers already sent by (output started at E:\wamp64\www\schoolsys\application\libraries\Pdf.php:1) E:\wamp64\www\schoolsys\system\core\Common.php 570
ERROR - 2021-03-28 22:56:01 --> Non-existent class: Pdf
ERROR - 2021-03-28 22:56:01 --> Severity: Warning --> Cannot modify header information - headers already sent by (output started at E:\wamp64\www\schoolsys\application\libraries\Pdf.php:1) E:\wamp64\www\schoolsys\system\core\Common.php 570
ERROR - 2021-03-28 22:56:08 --> Non-existent class: Pdf
ERROR - 2021-03-28 22:56:08 --> Severity: Warning --> Cannot modify header information - headers already sent by (output started at E:\wamp64\www\schoolsys\application\libraries\Pdf.php:1) E:\wamp64\www\schoolsys\system\core\Common.php 570
ERROR - 2021-03-28 22:56:19 --> Non-existent class: Pdf
ERROR - 2021-03-28 22:56:46 --> Non-existent class: Pdf
ERROR - 2021-03-28 22:56:47 --> Non-existent class: Pdf
ERROR - 2021-03-28 22:57:18 --> Non-existent class: XYZ
ERROR - 2021-03-28 22:57:19 --> Non-existent class: XYZ
ERROR - 2021-03-28 22:57:20 --> Non-existent class: XYZ
ERROR - 2021-03-28 22:57:20 --> Non-existent class: XYZ
ERROR - 2021-03-28 22:58:06 --> Non-existent class: XYZ
ERROR - 2021-03-28 22:58:16 --> Unable to load the requested class: CI_XYZ
ERROR - 2021-03-28 22:59:43 --> Unable to load the requested class: CI_XYZ
ERROR - 2021-03-28 22:59:53 --> Non-existent class: CI_XYZ
ERROR - 2021-03-28 23:00:01 --> Unable to load the requested class: XYZ
ERROR - 2021-03-28 23:02:35 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 359
ERROR - 2021-03-28 23:02:35 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 360
ERROR - 2021-03-28 23:02:35 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 361
ERROR - 2021-03-28 23:07:07 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 359
ERROR - 2021-03-28 23:07:07 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 360
ERROR - 2021-03-28 23:07:07 --> Severity: Notice --> Undefined variable: fees_summary E:\wamp64\www\schoolsys\application\views\dashboard\index.php 361
