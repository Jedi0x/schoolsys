<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
require APPPATH. '/libraries/SignatureInvalidException.php';
require APPPATH . '/libraries/JWT.php';
require APPPATH. '/libraries/BeforeValidException.php';
require APPPATH. '/libraries/ExpiredException.php';

use Restserver\Libraries\REST_Controller;
use \Firebase\JWT\JWT;

class User extends REST_Controller {

    function __construct() {

        // Construct the parent class
        parent::__construct();

        $this->methods['user_get']['limit'] = 500000; // 500 requests per hour per user/key
        $this->methods['user_post']['limit'] = 100000; // 100 requests per hour per user/key
        $this->methods['user_delete']['limit'] = 50; // 50 requests per hour per user/key

        $this->load->model('student_model');
        $this->load->model('email_model');
        $this->load->model('sms_model');
        $this->load->model('parents_model');
        $this->load->model('userrole_model');
        $this->load->model('exam_model');
        $this->load->model('leave_model');
        $this->load->model('application_model');

    }

    public function leave_post() {

        $token = $this->input->get_request_header('Authorization');
        $token = explode(' ', $token)[1];
        
        try{
            $user_data = JWT::decode($token, "user_auth",array('HS256'));
            $leave_category = $this->input->post('leave_category');
            $daterange = $this->input->post('daterange');
            $reason = $this->input->post('reason');

            $this->form_validation->set_rules('leave_category', 'leave_category', 'required');
            $this->form_validation->set_rules('daterange', 'daterange', 'required');
            $this->form_validation->set_rules('reason','reason', 'required');
            if ($this->form_validation->run() === false) {
                $this->response(array('status' => false, 'message' => $_POST), REST_Controller::HTTP_NOT_FOUND);
            }else{

                $daterange = explode(' - ', $daterange);
                $start_date = date("Y-m-d", strtotime($daterange[0]));
                $end_date = date("Y-m-d", strtotime($daterange[1]));
                $apply_date = date("Y-m-d H:i:s");
                $datetime1 = new DateTime($start_date);
                $datetime2 = new DateTime($end_date);
                $leave_days = $datetime2->diff($datetime1)->format("%a") + 1;
                $orig_file_name = '';
                $enc_file_name = '';


                if (isset($_FILES["attachment_file"]) && !empty($_FILES['attachment_file']['name'])) {
                    $config['upload_path']      = './uploads/attachments/leave/';
                    $config['allowed_types']    = "gif|jpg|jpeg|png|pdf";
                    $config['max_size']         = '2024';
                    $config['encrypt_name']     = true;
                    $this->upload->initialize($config);
                    
                    if($this->upload->do_upload("attachment_file")){
                        $orig_file_name = $this->upload->data('orig_name');
                        $enc_file_name  = $this->upload->data('file_name');

                        $leaveData = array(
                            'user_id'           => $user_data->loggedin_userid,
                            'role_id'           => $user_data->loggedin_role_id,
                            'session_id'        => $user_data->set_session_id,
                            'category_id'       => $leave_category,
                            'reason'            => $reason,
                            'branch_id'         => $user_data->loggedin_branch,
                            'start_date'        => date("Y-m-d", strtotime($start_date)),
                            'end_date'          => date("Y-m-d", strtotime($end_date)),
                            'leave_days'        => $leave_days,
                            'status'            => 1,
                            'orig_file_name'    => $orig_file_name,
                            'enc_file_name'     => $enc_file_name,
                            'apply_date'        => $apply_date,
                        );
                        $res = $this->db->insert('leave_application', $leaveData);
                        if($res){
                            $this->set_response(array('status' => TRUE, 'message' => translate('leave_requested_successfully')), REST_Controller::HTTP_OK);
                        }else{
                            $this->response(array('status' => FALSE, 'message' => translate('something went_wrong')), REST_Controller::HTTP_NOT_FOUND);
                        }

                    }else{
                        
                        $this->response(array('status' => false, 'message' => $this->upload->display_errors()), REST_Controller::HTTP_NOT_FOUND);

                    }

                   
                }

            }

            
        } catch (Exception $ex) {
            $response = array("status" => FALSE,"message" => 'Unauthorized token');
            $this->response($response, REST_Controller::HTTP_UNAUTHORIZED);
        
        } 
       
    }


    public function view_get() {

        $headers = $this->input->request_headers();

//        $branchID = $headers['branchID'];
//        $classID = $headers['classID'];
//        $sectionID = $headers['sectionID'];

        $branchID = $this->get('branchID');
        $classID = $this->get('classID');
        $sectionID = $this->get('sectionID');


        $this->data['students'] = $this->application_model->getStudentListByClassSection($classID, $sectionID, $branchID, false, true);
        if (isset($this->data['students']) && !empty($this->data['students'])) {
            $this->data['title'] = translate('student_list');
            $this->data['status'] = TRUE;
            $this->data['message'] = count($this->data['students']) . ' ' . translate('record_found.');

            $this->set_response($this->data, REST_Controller::HTTP_OK);
        } else {
            $this->data['title'] = translate('student_list');
            $this->data['status'] = FALSE;
            $this->data['message'] = translate('No_record_found.');
            // Set the response and exit
            $this->response($this->data, REST_Controller::HTTP_NOT_FOUND); // NOT_FOUND (404) being the HTTP response code
        }
    }

    public function parentprofile_get() {

        $token = $this->input->get_request_header('Authorization');
        $token = explode(' ', $token)[1];
        
        try{
            $user_data = JWT::decode($token, "user_auth",array('HS256'));
            $id = $user_data->loggedin_id;

            $this->data['parent_id'] = $id;
            $this->data['parent'] = $this->parents_model->getSingleParent($id);
            $this->data['childs'] = $this->parents_model->childsResult($id);
            $this->data['title'] = translate('parents_profile');
            $this->set_response($this->data, REST_Controller::HTTP_OK);
        } catch (Exception $ex) {
            $response = array("status" => FALSE,"message" => 'Unauthorized token');
            $this->response($response, REST_Controller::HTTP_UNAUTHORIZED);
        
        } 

    }

    public function studentprofile_get() {
        $this->load->model('fees_model');
        $this->load->model('exam_model');

        $this->data['title'] = translate('student_profile');

        $headers = $this->input->request_headers();
//        $id = $headers['id'];

        $id = $this->get('id');

        $getStudent = $this->student_model->getSingleStudent($id);
        $this->data['student'] = $getStudent;
        $this->data['parent_detail'] = $this->student_model->get('parent', array('id' => $id), true);
        $this->data['previous_details'] = json_decode($getStudent['previous_details'], true);
//        $this->data['allocations'] = $this->fees_model->getInvoiceDetails($id);




        $count = 1;
        $total_fine = 0;
        $total_discount = 0;
        $total_paid = 0;
        $total_balance = 0;
        $total_amount = 0;
        $allocations = $this->fees_model->getInvoiceDetails($id);
        foreach ($allocations as $fkey => $fee) {
            $deposit = $this->fees_model->getStudentFeeDeposit($fee['allocation_id'], $fee['fee_type_id']);
            $type_discount = $deposit['total_discount'];
            $type_fine = $deposit['total_fine'];
            $type_amount = $deposit['total_amount'];
            $balance = $fee['amount'] - ($type_amount + $type_discount);
            $total_discount += $type_discount;
            $total_fine += $type_fine;
            $total_paid += $type_amount;
            $total_balance += $balance;
            $total_amount += $fee['amount'];

            $this->data['allocations'][$fkey]['name'] = $fee['name'];
            $this->data['allocations'][$fkey]['due_date'] = _d($fee['due_date']);

            $status = 0;
            $labelmode = '';
            if ($type_amount == 0) {
                $status = translate('unpaid');
                $labelmode = 'label-danger-custom';
            } elseif ($balance == 0) {
                $status = translate('total_paid');
                $labelmode = 'label-success-custom';
            } else {
                $status = translate('partly_paid');
                $labelmode = 'label-info-custom';
            }
            $this->data['allocations'][$fkey]['due_date'] = $status;

            $currency_symbol = $global_config['currency_symbol'];
            $this->data['allocations'][$fkey]['amount'] = $currency_symbol . $fee['amount'];
            $this->data['allocations'][$fkey]['type_discount'] = $currency_symbol . $type_discount;
            $this->data['allocations'][$fkey]['type_fine'] = $currency_symbol . $type_fine;
            $this->data['allocations'][$fkey]['type_amount'] = $currency_symbol . $type_amount;
            $this->data['allocations'][$fkey]['balance'] = $currency_symbol . number_format($balance, 2, '.', '');
        }

        $this->db->order_by('id', 'desc');
        $this->db->where(array('role_id' => 7, 'user_id' => $id));
        $this->data['book_result'] = $this->db->get('book_issues')->result_array();

        $this->db->where('student_id', $student['id']);
        $this->data['documents'] = $this->db->get('student_documents')->result();

        $this->set_response($this->data, REST_Controller::HTTP_OK);
    }

    public function studentfee_get() {
        $this->load->model('fees_model');

        $this->data['title'] = translate('student_fee');

        $headers = $this->input->request_headers();
//        $id = $headers['id'];

        $id = $this->get('id');

        $count = 1;
        $total_fine = 0;
        $total_discount = 0;
        $total_paid = 0;
        $total_balance = 0;
        $total_amount = 0;
        $allocations = $this->fees_model->getInvoiceDetails($id);
        foreach ($allocations as $fkey => $fee) {
            $deposit = $this->fees_model->getStudentFeeDeposit($fee['allocation_id'], $fee['fee_type_id']);
            $type_discount = $deposit['total_discount'];
            $type_fine = $deposit['total_fine'];
            $type_amount = $deposit['total_amount'];
            $balance = $fee['amount'] - ($type_amount + $type_discount);
            $total_discount += $type_discount;
            $total_fine += $type_fine;
            $total_paid += $type_amount;
            $total_balance += $balance;
            $total_amount += $fee['amount'];

            $this->data['fee_detail'][$fkey]['name'] = $fee['name'];
            $this->data['fee_detail'][$fkey]['due_date'] = _d($fee['due_date']);

            $status = 0;
            $labelmode = '';
            if ($type_amount == 0) {
                $status = translate('unpaid');
                $labelmode = 'label-danger-custom';
            } elseif ($balance == 0) {
                $status = translate('total_paid');
                $labelmode = 'label-success-custom';
            } else {
                $status = translate('partly_paid');
                $labelmode = 'label-info-custom';
            }
            $this->data['fee_detail'][$fkey]['due_date'] = $status;

            $currency_symbol = $global_config['currency_symbol'];
            $this->data['fee_detail'][$fkey]['amount'] = $currency_symbol . $fee['amount'];
            $this->data['fee_detail'][$fkey]['type_discount'] = $currency_symbol . $type_discount;
            $this->data['fee_detail'][$fkey]['type_fine'] = $currency_symbol . $type_fine;
            $this->data['fee_detail'][$fkey]['type_amount'] = $currency_symbol . $type_amount;
            $this->data['fee_detail'][$fkey]['balance'] = $currency_symbol . number_format($balance, 2, '.', '');
        }


        $this->set_response($this->data, REST_Controller::HTTP_OK);
    }

    public function studentAttendance_get() {
        $this->load->model('fees_model');
        $this->load->model('exam_model');

        $headers = $this->input->request_headers();
//        $id = $headers['id'];

        $id = $this->get('student_id');

        $this->data['month'] = $month = date('m', strtotime($this->get('timestamp')));
        $this->data['year'] = $year = date('Y', strtotime($this->get('timestamp')));
        $this->data['days'] = $days = cal_days_in_month(CAL_GREGORIAN, $this->data['month'], $this->data['year']);

        $this->data['title'] = 'Monthly Attendance Sheet of ' . date("F Y", strtotime($year . '-' . $month));
        $this->data['student'] = $student = $this->userrole_model->getStudentDetailsById($id);

        if (!empty($student)) {
            $total_present = 0;
            $total_absent = 0;
            $total_late = 0;
            for ($i = 1; $i <= $days; $i++) {
                $date = date('Y-m-d', strtotime($year . '-' . $month . '-' . $i));
                $atten = $this->userrole_model->get_attendance_by_date($id, $date);

//                echo '<pre>';
//                print_r($atten);
//                exit;

                if ($atten['status'] == 'A') {
                    $total_absent++;
                } else if ($atten['status'] == 'P') {
                    $total_present++;
                } else if ($atten['status'] == 'L') {
                    $total_late++;
                } else if ($atten['status'] == 'H') {
                    $total_hospital++;
                } else {
                    // $total_absent++;
                }

                if ($atten['status'] == '') {
                    $this->data['atten'][$i]['status'] = '-';
                } else {
                    $this->data['atten'][$i]['status'] = $atten['status'];
                }

                $this->data['atten'][$i]['remark'] = "{$atten['remark']}";
                $adate = $atten['date'];
                $cdate = $atten['created_at'];
                $time = new DateTime($cdate);
                $date = $time->format('d-m-Y');
                $time = $time->format('H:i');

                $this->data['atten'][$i]['attendance_date'] = "{$adate}";
                $this->data['atten'][$i]['creation_date'] = "{$date}";
                $this->data['atten'][$i]['creation_time'] = "{$time}";
            }


            $this->data['total_absent'] = $total_absent;
            $this->data['total_present'] = $total_present;
            $this->data['total_late'] = $total_late;
            $this->data['total_hospital'] = $total_hospital;

            $this->data['status'] = TRUE;
            $this->data['message'] = '';

            $this->set_response($this->data, REST_Controller::HTTP_OK);
        } else {
            $this->data['status'] = FALSE;
            $this->data['message'] = translate('No_record_found.');
            // Set the response and exit
            $this->response($this->data, REST_Controller::HTTP_NOT_FOUND); // NOT_FOUND (404) being the HTTP response code
        }
    }

    public function studentExam_get() {
        $this->load->model('exam_model');

        $headers = $this->input->request_headers();
//        $id = $headers['id'];

        $id = $this->get('student_id');

        $this->data['title'] = translate('exam_master');
        $this->data['student'] = $this->student_model->getSingleStudent($id);
        $stu = $this->data['student'];



        if (!empty($stu)) {
            $this->db->where('class_id', $stu['class_id']);
            $this->db->where('section_id', $stu['section_id']);
            $this->db->where('session_id', $stu['session_id']);
            $this->db->group_by('exam_id');
            $variable = $this->db->get('timetable_exam')->result_array();


            foreach ($variable as $erow) {
                $examID = $erow['exam_id'];

                $this->data['exam_title'][] = $this->application_model->exam_name_by_id($examID);

                $result = $this->exam_model->getStudentReportCard($stu['id'], $examID, $stu['session_id']);

                $this->data['student_result'][] = $result['exam'];

                if (!empty($result['exam'])) {
                    $student = $result['student'];
                    $getMarksList = $result['exam'];
                    $getExam = $this->db->where(array('id' => $examID))->get('exam')->row_array();

                    $this->data['examDetailData'][] = $getExam;

                    $getSchool = $this->db->where(array('id' => $getExam['branch_id']))->get('branch')->row_array();
                    $schoolYear = get_type_name_by_id('schoolyear', get_session_id(), 'school_year');

                    $markDistribution = json_decode($getExam['mark_distribution'], true);
                    $colspan = count($markDistribution) + 1;
                    $total_grade_point = 0;
                    $grand_obtain_marks = 0;
                    $grand_full_marks = 0;
                    $result_status = 1;
                    foreach ($getMarksList as $row) {
                        $total_obtain_marks = 0;
                        $total_full_marks = 0;
                        $fullMarkDistribution = json_decode($row['mark_distribution'], true);
                        $obtainedMark = json_decode($row['get_mark'], true);
                        foreach ($fullMarkDistribution as $i => $val) {
                            $obtained_mark = floatval($obtainedMark[$i]);
                            $fullMark = floatval($val['full_mark']);
                            $passMark = floatval($val['pass_mark']);
                            if ($obtained_mark < $passMark) {
                                $result_status = 0;
                            }

                            $total_obtain_marks += $obtained_mark;
                            $obtained = $row['get_abs'] == 'on' ? 'Absent' : $obtained_mark;
                            $total_full_marks += $fullMark;
                        }
                        $grand_obtain_marks += $total_obtain_marks;
                        $grand_full_marks += $total_full_marks;
                    }
                }
            }

            $this->data['examDetail'] = $variable;




            $this->data['grand_obtain_marks'] = $grand_obtain_marks;
            $this->data['grand_full_marks'] = $grand_full_marks;

            $percentage = ($grand_obtain_marks * 100) / $grand_full_marks;
            $this->data['avg'] = number_format($percentage, 2, '.', '') . '%';
            $this->data['result_status'] = ($result_status == 0 ? 'Fail' : 'Pass');

            $this->data['status'] = TRUE;
            $this->data['message'] = '';

            $this->set_response($this->data, REST_Controller::HTTP_OK);
        } else {
            $this->data['status'] = FALSE;
            $this->data['message'] = translate('No_record_found.');
            // Set the response and exit
            $this->response($this->data, REST_Controller::HTTP_NOT_FOUND); // NOT_FOUND (404) being the HTTP response code
        }
    }

  


}
