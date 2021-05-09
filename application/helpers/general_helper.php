<?php
if ( !defined( 'BASEPATH' ) )exit( 'No direct script access allowed' );

// return translation
function translate($word = '')
{
    $CI = &get_instance();
    if ($CI->session->has_userdata('set_lang')) {
        $set_lang = $CI->session->userdata('set_lang');
    } else {
        $set_lang = get_global_setting('translation');
    }

    if ($set_lang == '') {
        $set_lang = 'english';
    }
    $query = $CI->db->get_where('languages', array('word' => $word));
    if ($query->num_rows() > 0) {
        if (isset($query->row()->$set_lang) && $query->row()->$set_lang != '') {
            return $query->row()->$set_lang;
        } else {
            return $query->row()->english;
        }
    } else {
        $arrayData = array(
            'word' => $word,
            'english' => ucwords(str_replace('_', ' ', $word)),
        );
        $CI->db->insert('languages', $arrayData);
        return ucwords(str_replace('_', ' ', $word));
    }
}

function get_permission($permission, $can = '')
{
    $ci = &get_instance();
    $role_id = $ci->session->userdata('loggedin_role_id');
    if ($role_id == 1) {
        return true;
    }
    $permissions = get_staff_permissions($role_id);
    foreach ($permissions as $permObject) {
        if ($permObject->permission_prefix == $permission && $permObject->$can == '1') {
            return true;
        }
    }
    return false;
}

function get_staff_permissions($id)
{
    $ci = &get_instance();
    $sql = "SELECT `staff_privileges`.*, `permission`.`id` as `permission_id`, `permission`.`prefix` as `permission_prefix` FROM `staff_privileges` JOIN `permission` ON `permission`.`id`=`staff_privileges`.`permission_id` WHERE `staff_privileges`.`role_id` = " . $ci->db->escape($id);
    $result = $ci->db->query($sql)->result();
    return $result;
}

function get_session_id()
{
    $CI = &get_instance();
    if ($CI->session->has_userdata('set_session_id')) {
        $session_id = $CI->session->userdata('set_session_id');
    } else {
        $session_id = get_global_setting('session_id');
    }
    return $session_id;
}

function is_secure($url)
{
    if ((!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') || $_SERVER['SERVER_PORT'] == 443) {
        $val = 'https://' . $url;
    } else {
        $val = 'http://' . $url;
    }
    return $val;
}

function get_global_setting($name = '')
{
    $CI = &get_instance();
    $name = trim($name);
    $CI->db->where('id', 1);
    $CI->db->select($name);
    $query = $CI->db->get('global_settings');

    if ($query->num_rows() > 0) {
        $row = $query->row();
        return $row->$name;
    }
}

// is superadmin logged in @return boolean
function is_superadmin_loggedin()
{
    $CI = &get_instance();
    if ($CI->session->userdata('loggedin_role_id') == 1) {
        return true;
    }
    return false;
}

// is admin logged in @return boolean
function is_admin_loggedin()
{
    $CI = &get_instance();
    if ($CI->session->userdata('loggedin_role_id') == 2) {
        return true;
    }
    return false;
}

// is teacher logged in @return boolean
function is_teacher_loggedin()
{
    $CI = &get_instance();
    if ($CI->session->userdata('loggedin_role_id') == 3) {
        return true;
    }
    return false;
}

// is accountant logged in @return boolean
function is_accountant_loggedin()
{
    $CI = &get_instance();
    if ($CI->session->userdata('loggedin_role_id') == 4) {
        return true;
    }
    return false;
}

// is librarian logged in @return boolean
function is_librarian_loggedin()
{
    $CI = &get_instance();
    if ($CI->session->userdata('loggedin_role_id') == 5) {
        return true;
    }
    return false;
}

// is parent logged in @return boolean
function is_parent_loggedin()
{
    $CI = &get_instance();
    if ($CI->session->userdata('loggedin_role_id') == 6) {
        return true;
    }
    return false;
}

// is parent logged in @return boolean
function is_student_loggedin()
{
    $CI = &get_instance();
    if ($CI->session->userdata('loggedin_role_id') == 7) {
        return true;
    }
    return false;
}

// get logged in user id - login credential DB id
function get_loggedin_id()
{
    $ci = &get_instance();
    return $ci->session->userdata('loggedin_id');
}

// get staff db id
function get_loggedin_user_id()
{
    $ci = &get_instance();
    return $ci->session->userdata('loggedin_userid');
}

// get session loggedin
function is_loggedin()
{
    $CI = &get_instance();
    if ($CI->session->has_userdata('loggedin')) {
        return true;
    }
    return false;
}

// get loggedin role name
function loggedin_role_name()
{
    $CI = &get_instance();
    $roleID = $CI->session->userdata('loggedin_role_id');
    return $CI->db->select('name')->where('id', $roleID)->get('roles')->row()->name;
}

function loggedin_role_id()
{
    $ci = &get_instance();
    return $ci->session->userdata('loggedin_role_id');
}

// get logged in user type
function get_loggedin_user_type()
{
    $CI = &get_instance();
    return $CI->session->userdata('loggedin_type');
}

// get logged in user type
function get_loggedin_branch_id()
{
    $CI = &get_instance();
    return $CI->session->userdata('loggedin_branch');
}

// get parent selected active children Id
function get_activeChildren_id()
{
    $CI = &get_instance();
    return $CI->session->userdata('myChildren_id');
}

// get table name by type and id
function get_type_name_by_id($table, $type_id = '', $field = 'name')
{
    $CI = &get_instance();
    $get = $CI->db->select($field)->from($table)->where('id', $type_id)->limit(1)->get()->row_array();
    return $get[$field];
}

// set session alert / flashdata
function set_alert($type, $message)
{
    $CI = &get_instance();
    $CI->session->set_flashdata('alert-message-' . $type, $message);
}

// generate md5 hash
function app_generate_hash()
{
    return md5(rand() . microtime() . time() . uniqid());
}

// generate encryption key
function generate_encryption_key()
{
    $CI = &get_instance();
    // In case accessed from my_functions_helper.php
    $CI->load->library('encryption');
    $key = bin2hex($CI->encryption->create_key(16));
    return $key;
}

// generate get image url
function get_image_url($role = '', $file_name = '')
{
    if ($file_name == 'defualt.png' || empty($file_name)) {
        $image_url = base_url('uploads/app_image/defualt.png');
    } else {
        if (file_exists('uploads/images/' . $role . '/' . $file_name)) {
            $image_url = base_url('uploads/images/' . $role . '/' . $file_name);
        } else {
            $image_url = base_url('uploads/app_image/defualt.png');
        }
    }
    return $image_url;
}

// get date format config
function _d($date)
{
    if ($date == '' || is_null($date) || $date == '0000-00-00') {
        return '';
    }
    $formats = 'Y-m-d';
    $get_format = get_global_setting('date_format');
    if ($get_format != '') {
        $formats = $get_format;
    }
    return date($formats, strtotime($date));
}

// delete url
function btn_delete($uri)
{
    return "<button class='btn btn-danger icon btn-circle' onclick=confirm_modal('" . base_url($uri) . "') ><i class='fas fa-trash-alt'></i></button>";
}

// delete url
function csrf_jquery_token()
{
    $csrf = [get_instance()->security->get_csrf_token_name() => get_instance()->security->get_csrf_hash()];
    return $csrf;
}

function check_hash_restrictions($table, $id, $hash)
{
    $CI = &get_instance();
    if (!$table || !$id || !$hash) {
        show_404();
    }

    $query = $CI->db->select('hash')->from($table)->where('id', $id)->get();
    if ($query->num_rows() > 0) {
        $get_hash = $query->row()->hash;
    } else {
        $get_hash = '';
    }
    if (empty($hash) || ($get_hash != $hash)) {
        show_404();
    }
}

function get_nicetime($date)
{
    $get_format = get_global_setting('date_format');
    if (empty($date)) {
        return "Unknown";
    }
    // Current time as MySQL DATETIME value
    $csqltime = date('Y-m-d H:i:s');
    // Current time as Unix timestamp
    $ptime = strtotime($date);
    $ctime = strtotime($csqltime);

    //Now calc the difference between the two
    $timeDiff = floor(abs($ctime - $ptime) / 60);

    //Now we need find out whether or not the time difference needs to be in
    //minutes, hours, or days
    if ($timeDiff < 2) {
        $timeDiff = "Just now";
    } elseif ($timeDiff > 2 && $timeDiff < 60) {
        $timeDiff = floor(abs($timeDiff)) . " minutes ago";
    } elseif ($timeDiff > 60 && $timeDiff < 120) {
        $timeDiff = floor(abs($timeDiff / 60)) . " hour ago";
    } elseif ($timeDiff < 1440) {
        $timeDiff = floor(abs($timeDiff / 60)) . " hours ago";
    } elseif ($timeDiff > 1440 && $timeDiff < 2880) {
        $timeDiff = floor(abs($timeDiff / 1440)) . " day ago";
    } elseif ($timeDiff > 2880) {
        $timeDiff = date($get_format, $ptime);
    }
    return $timeDiff;
}

function bytesToSize($path, $filesize = '')
{
    if (!is_numeric($filesize)) {
        $bytes = sprintf('%u', filesize($path));
    } else {
        $bytes = $filesize;
    }
    if ($bytes > 0) {
        $unit = intval(log($bytes, 1024));
        $units = [
            'B',
            'KB',
            'MB',
            'GB',
        ];
        if (array_key_exists($unit, $units) === true) {
            return sprintf('%d %s', $bytes / pow(1024, $unit), $units[$unit]);
        }
    }
    return $bytes;
}

function array_to_object($array)
{
    if (!is_array($array) && !is_object($array)) {
        return new stdClass();
    }
    return json_decode(json_encode((object) $array));
}

function access_denied()
{
    set_alert('error', translate('access_denied'));
    redirect(site_url('dashboard'));
}

function ajax_access_denied()
{
    set_alert('error', translate('access_denied'));
    $array = array('status' => 'access_denied');
    echo json_encode($array);
    exit();
}

function slugify($text){
    // replace non letter or digits by -
    $text = preg_replace('~[^\pL\d]+~u', '_', $text);

    // transliterate
    $text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);

    // remove unwanted characters
    $text = preg_replace('~[^-\w]+~', '', $text);

    // trim
    $text = trim($text, '_');

    // remove duplicated - symbols
    $text = preg_replace('~-+~', '_', $text);

    // lowercase
    $text = strtolower($text);
    return $text;
}

// website menu list
function web_menu_list($publish = '', $default = '', $branchID = '')
{
    $CI = &get_instance();
    if (empty($branchID)) {
        $branchID = $CI->home_model->getDefaultBranch();
    }
    $CI->db->select('*');
    if ($publish != '') {
        $CI->db->where('publish', $publish);
    }
    if ($default != '') {
        $CI->db->where('system', $default);
    }
    $CI->db->order_by('ordering', 'asc');
    $CI->db->where_in('branch_id', array(0, $branchID));
    $result = $CI->db->get('front_cms_menu')->result_array();
    return $result;
}

function get_request_url()
{
    $url = $_SERVER['QUERY_STRING'];
    $url = (!empty($url) ? '?' . $url : '');
    return $url;
}

function delete_dir($dirPath)
{
    if (!is_dir($dirPath)) {
        throw new InvalidArgumentException("$dirPath must be a directory");
    }
    if (substr($dirPath, strlen($dirPath) - 1, 1) != '/') {
        $dirPath .= '/';
    }
    $files = glob($dirPath . '*', GLOB_MARK);
    foreach ($files as $file) {
        if (is_dir($file)) {
            delete_dir($file);
        } else {
            unlink($file);
        }
    }
    if (rmdir($dirPath)) {
        return true;
    }
    return false;
}


/**
 * This function is used to print arrays and strings
 * @param  string $arr array name
 * @param  boolean $exit true|false
 */

function debug($arr, $exit = false)
{
  print "<pre>";
  print_r($arr);
  print "</pre>";
  if($exit)
    exit;
}

function get_option($name='')
{
    $CI = & get_instance();
    $CI->db->select('value');
    $CI->db->where('name', $name);
    $row = $CI->db->get('options')->row();
    if ($row) {
        $val = $row->value;
    }else{
        $val= '';
    }

    return $val;
}


function voucher_no()
{
    $voucher_no = str_pad(get_option('next_voucher_number'), get_option('number_padding_prefixes'), '0', STR_PAD_LEFT);

    return $voucher_no;
}

function get_fee_type_discount($student,$fee_type)
{
    $CI = & get_instance();
    $CI->db->select('*');
    $CI->db->where('student_id', $student);
    $CI->db->where('fee_type', $fee_type);
    $row = $CI->db->get('student_discount')->row();
    return $row;  
}

function getBalanceByType($fee_allocation_id,$fee_type_id,$voucher_no)
{
    $CI = & get_instance();
    $input = $fee_allocation_id;
    if (empty($input)) {
        $balance = 0;
        $fine = 0;
    } else {
        $fine = $CI->fees_model->feeFineCalculations($fee_allocation_id, $fee_type_id,$voucher_no);

        $b = $CI->fees_model->getBalance($fee_allocation_id, $fee_type_id);
        $balance = $b['balance'];
        $fine = abs($fine - $b['fine']);
    }
    return $fine;
}

function get_voucher_month($months)
{
    $months = unserialize($months);
   
    $return_months = array();
    if(in_array(1, $months)){
        array_push($return_months, 'January');
    }
    if(in_array(2, $months)){
        array_push($return_months, 'February');
    }
    if(in_array(3, $months)){
        array_push($return_months, 'March');
    }
    if(in_array(4, $months)){
        array_push($return_months, 'April');
    }
    if(in_array(5, $months)){
        array_push($return_months, 'May');
    }
    if(in_array(6, $months)){
        array_push($return_months, 'June');
    }
    if(in_array(7, $months)){
        array_push($return_months, 'July');
    }
    if(in_array(8, $months)){
        array_push($return_months, 'August');
    }
    if(in_array(9, $months)){
        array_push($return_months, 'September');
    }
    if(in_array(10, $months)){
        array_push($return_months, 'October');
    }
    if(in_array(11, $months)){
        array_push($return_months, 'November');
    }
    if(in_array(12, $months)){
        array_push($return_months, 'December');
    }

    return implode(", ",$return_months);
}

function get_status($status)
{
    if($status == 1){
        $status_info = 'Paid';
    } elseif ($status == 2) {
        $status_info = 'Partial Paid';
    }else{
        $status_info = 'Unpaid';
    }
    return $status_info;
}

function check_voucher_month($voucher_id,$fee_type_id)
{
    $CI = & get_instance();
    $check_voucher = $CI->fees_model->check_voucher_month($voucher_id, $fee_type_id);
    return $check_voucher;
}


function check_added_voucher_month($student_id,$fee_month)
{
    $CI = & get_instance();
    $fail = 0;
    foreach ($fee_month as $k => $v) {
        $CI->db->select("*");
        $CI->db->where('fee_month',$v);
        $CI->db->where('student_id',$student_id);
        $CI->db->where('fee_year',date("Y"));
        $check = $CI->db->get('fee_voucher_months')->row();
        if(!empty($check)){
            $fail++;
        }
    }
    if($fail > 0){
        return false;
    }else{
        return true;
    }
}


function get_paid_amount_voucher($voucher_id)
{
    $CI = & get_instance();
    $CI->db->select("*");
    $CI->db->where('voucher_id',$voucher_id);
    $voucher = $CI->db->get('fee_voucher_payments')->row();
    if(!empty($voucher)){
        return $voucher->total_paid;
    }else{
        return 0;
    }
}

function previous_balance($student_id)
{
    $CI = & get_instance();
    $CI->db->select("sum(total_due) as total_due");
    $CI->db->where('student_id',$student_id);
    $voucher = $CI->db->get('fee_voucher_payments')->row();
    if(!empty($voucher)){
        return $voucher->total_due;
    }else{
        return 0;
    }
}

function voucher_month_validation($months)
{   
    $size = sizeof($months);
    if($size > 1){
        foreach ($months as $k => $month) {
            if(isset($months[$k+1])){
                if($months[$k+1] == ($month+1)){
                    return true;
                }else{
                    return false;
                }
            }
        } 
    }else{
        return true;
    } 
}

function check_student_fee($student_id)
{
    $CI = & get_instance();
    $CI->db->select("*");
    $CI->db->where('student_id',$student_id);
    $voucher = $CI->db->get('fee_voucher_payments')->row();
    if(!empty($voucher)){
        return true;
    }else{
        return false;
    }
}


function voucher_month($month)
{
    switch ($month) {
      case 1:
      echo 'January';
      break;

      case 2:
      echo 'February';
      break;

      case 3:
      echo 'March';
      break;

      case 4:
      echo 'April';
      break;

      case 5:
      echo 'May';
      break;

      case 6:
      echo 'June';
      break;

      case 7:
      echo 'July';
      break;

      case 8:
      echo 'August';
      break;

      case 9:
      echo 'September';
      break;

      case 10:
      echo 'October';
      break;

      case 11:
      echo 'November';
      break;

      case 12:
      echo 'December';
      break;
  }

}


function get_monthly_vouchers($month)
{
    $CI = & get_instance();
    $voucher_list = array();
    $CI->db->select('enroll.student_id,enroll.roll,student.first_name,student.last_name,student.register_no,student.mobileno,class.name as class_name,section.name as section_name,fee_vouchers.voucher_no as voucher_no, fee_vouchers.fee_month as fee_month, fee_vouchers.status as status');
    $CI->db->from('fee_vouchers');
    $CI->db->join('fee_allocation', 'fee_allocation.student_id = fee_vouchers.student_id');
    $CI->db->join('enroll', 'enroll.student_id = fee_allocation.student_id');
    $CI->db->join('student', 'student.id = enroll.student_id');
    $CI->db->join('class', 'class.id = enroll.class_id', 'left');
    $CI->db->join('section', 'section.id = enroll.section_id', 'left');
    $CI->db->where('fee_vouchers.status',0);
    $CI->db->where('MONTH(fee_vouchers.due_date) = ',$month);
    $CI->db->where('YEAR(fee_vouchers.due_date) = YEAR(CURDATE())');
    $CI->db->order_by('enroll.id', 'asc');

    $result = $CI->db->get()->result_array();
    if(!empty($result)){
        foreach ($result as $k => $v) {
            array_push($voucher_list, array(
                'student_name' => $v['first_name'].' '.$v['last_name'],
                'register_no' => $v['register_no'],
                'mobileno' => $v['mobileno'],
                'class_name' => $v['class_name'],
                'section_name' => $v['section_name'],
                'voucher_no' => $v['voucher_no'],
                'fee_month' => get_voucher_month($v['fee_month'])
            ));
        }
    }
    $filter = array_column($voucher_list, 'voucher_no');

    array_multisort($filter, SORT_DESC, $voucher_list);

    return $voucher_list;
}

function student_voucher($student,$fee_months)
{
    $CI = & get_instance();
    $CI->db->select("MONTH(created_at) as allocation_month, YEAR(created_at) as allocation_year");
    $CI->db->from('fee_allocation');
    $CI->db->where('student_id',$student);
    $result = $CI->db->get()->row();

    $allocation_month = $result->allocation_month;
    $allocation_year = $result->allocation_year;

    if ($fee_months[0] >= $allocation_month){
        if($allocation_year == date('Y')){   
            for ($i=$allocation_month; $i < $fee_months[0]; $i++) { 
                $CI->db->select("*");
                $CI->db->from('fee_voucher_months');
                $CI->db->where('student_id',$student);
                $CI->db->where('fee_month',$i);
                $CI->db->where('fee_year',date('Y'));
                $result = $CI->db->get()->row();
                if(empty($result)){
                    return false;
                }
            }
            return true;
        }

        
        
    }else{
        return false;
    }

    

}


function get_voucher_able($fee_months,$student_id){

    $CI = & get_instance();
    $arr = array();
    $CI->db->select('fee_allocation.id as allocation_id,fee_allocation.student_id as student_id, fees_type.name, fees_type.frequency as fees_frequency,fees_type.frequency_type as fee_frequency_type,fee_groups_details.amount, fee_groups_details.due_date, fee_groups_details.fee_type_id');
    $CI->db->from('fee_allocation');
    $CI->db->join('fee_groups_details', 'fee_groups_details.fee_groups_id = fee_allocation.group_id');
    $CI->db->join('fees_type', 'fees_type.id = fee_groups_details.fee_type_id');
    $CI->db->where('fee_allocation.student_id', $student_id);
    $result = $CI->db->get()->result_array();

    if(!empty($result)){
        foreach ($result as $key => $value) {

            if($value['fee_frequency_type'] == 1){

                $checkstudentFee = check_student_fee($student_id);
                if(!$checkstudentFee){
                    array_push($arr, array('allocation_id'=> $value['allocation_id'], 'name' => $value['name'], 'amount' => $value['amount'], 'fee_type_id' => $value['fee_type_id']));
                }

            } 
            else if($value['fee_frequency_type'] == 3){

                $res = array_intersect(unserialize($fee_months),unserialize($value['fees_frequency']));
                if(!empty($res)){
                    array_push($arr, array('allocation_id'=> $value['allocation_id'], 'name' => $value['name'], 'amount' => $value['amount'], 'fee_type_id' => $value['fee_type_id']));
                }

            } else if($value['fee_frequency_type'] == 2){
                array_push($arr, array('allocation_id'=> $value['allocation_id'], 'name' => $value['name'], 'amount' => $value['amount'], 'fee_type_id' => $value['fee_type_id']));
            }


        } 
    }

    return $arr;

}



