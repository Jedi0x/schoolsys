<?php
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Fees_model extends MY_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('sms_model');
    }

    public function feeFineCalculation($allocationID, $typeID)
    {
        $this->db->select('fd.amount,fd.due_date,f.*');
        $this->db->from('fee_allocation as a');
        $this->db->join('fee_groups_details as fd', 'fd.fee_groups_id = a.group_id and fd.fee_type_id = ' . $this->db->escape($typeID), 'left');
        $this->db->join('fee_fine as f', 'f.group_id = fd.fee_groups_id and f.type_id = fd.fee_type_id', 'inner');
        $this->db->where('a.id', $allocationID);
        $this->db->where('f.session_id', get_session_id());
        $getDB = $this->db->get()->row_array();
        if (is_array($getDB) && count($getDB)) {
            $dueDate = $getDB['due_date'];
            if (strtotime($dueDate) < strtotime(date('Y-m-d'))) {
                $feeAmount = $getDB['amount'];
                $feeFrequency = $getDB['fee_frequency'];
                $fineValue = $getDB['fine_value'];
                if ($getDB['fine_type'] == 1) {
                    $fineAmount = $fineValue;
                } else {
                    $fineAmount = ($feeAmount / 100) * $fineValue;
                }
                $now = time(); // or your date as well
                $dueDate = strtotime($dueDate);
                $datediff = $now - $dueDate;
                $overDay = round($datediff / (60 * 60 * 24));
                if ($feeFrequency != 0) {
                    $fineAmount = ($overDay / $feeFrequency) * $fineAmount;
                }
                return $fineAmount;
            } else {
                return 0;
            }
        } else {
            return 0;
        }
    }


    # Added by JR
    public function feeFineCalculations($allocationID, $typeID, $voucher_no)
    {
        $this->db->select('fd.amount,fee_vouchers.due_date as due_date,f.*');
        $this->db->from('fee_allocation as a');
        $this->db->join('fee_groups_details as fd', 'fd.fee_groups_id = a.group_id and fd.fee_type_id = ' . $this->db->escape($typeID), 'left');
        $this->db->join('fee_fine as f', 'f.group_id = fd.fee_groups_id and f.type_id = fd.fee_type_id', 'inner');
        $this->db->join('fee_vouchers', 'fee_vouchers.voucher_no = '.$voucher_no);
        $this->db->where('a.id', $allocationID);
        $this->db->where('f.session_id', get_session_id());
        $getDB = $this->db->get()->row_array();
        if (is_array($getDB) && count($getDB)) {
            $dueDate = $getDB['due_date'];
            if (strtotime($dueDate) < strtotime(date('Y-m-d'))) {
                $feeAmount = $getDB['amount'];
                $feeFrequency = $getDB['fee_frequency'];
                $fineValue = $getDB['fine_value'];
                if ($getDB['fine_type'] == 1) {
                    $fineAmount = $fineValue;
                } else {
                    $fineAmount = ($feeAmount / 100) * $fineValue;
                }
                $now = time(); // or your date as well
                $dueDate = strtotime($dueDate);
                $datediff = $now - $dueDate;
                $overDay = round($datediff / (60 * 60 * 24));
                if ($feeFrequency != 0) {
                    $fineAmount = ($overDay / $feeFrequency) * $fineAmount;
                }
                return $fineAmount;
            } else {
                return 0;
            }
        } else {
            return 0;
        }
    }

    public function getStudentAllocationList($classID, $sectionID, $groupID, $branchID)
    {
        $sql = "SELECT e.*, s.photo, CONCAT(s.first_name, ' ', s.last_name) as fullname, s.gender, s.register_no, s.parent_id, s.email, s.mobileno, IFNULL(fa.id, 0) as allocation_id
        FROM enroll as e LEFT JOIN student as s ON e.student_id = s.id LEFT JOIN login_credential as l ON l.user_id = s.id AND l.role = '7' LEFT JOIN
        fee_allocation as fa ON fa.student_id=e.student_id AND fa.group_id = " . $this->db->escape($groupID) . " AND
        fa.session_id= " . $this->db->escape(get_session_id()) . " WHERE e.class_id = " . $this->db->escape($classID) .
        " AND e.branch_id = " . $this->db->escape($branchID) . " AND e.session_id = " . $this->db->escape(get_session_id());
        if ($sectionID != 'all') {
            $sql .= " AND e.section_id =" . $this->db->escape($sectionID);
        }
        $sql .= " ORDER BY s.id ASC";
        return $this->db->query($sql)->result_array();
    }


    # Added by JR

    public function getStudentAllocationLists($classID, $sectionID, $groupID, $branchID)
    {   

        $sql = "SELECT e.*, s.photo, CONCAT(s.first_name, ' ', s.last_name) as fullname, s.gender, s.register_no, s.parent_id, s.email, s.mobileno, IFNULL(fa.id, 0) as allocation_id
        FROM enroll as e LEFT JOIN student as s ON e.student_id = s.id LEFT JOIN login_credential as l ON l.user_id = s.id AND l.role = '7' LEFT JOIN
        fee_allocation as fa ON fa.student_id=e.student_id AND fa.group_id = " . $this->db->escape($groupID) . " AND
        fa.session_id= " . $this->db->escape(get_session_id());

        if ($classID != 'all') {
            $sql.= " WHERE e.class_id = " . $this->db->escape($classID);
        }

        $sql.=" AND e.branch_id = " . $this->db->escape($branchID) . " AND e.session_id = " . $this->db->escape(get_session_id());


        if ($sectionID != 'all') {
            $sql .= " AND e.section_id =" . $this->db->escape($sectionID);
        }
        $sql .= " ORDER BY s.id ASC";
        return $this->db->query($sql)->result_array();
    }



    # END

    public function getInvoiceStatus($studentID)
    {
        $status = "";
        $sql = "SELECT SUM(fee_groups_details.amount) as total, min(fee_allocation.id) as inv_no FROM fee_allocation LEFT JOIN fee_groups_details ON
        fee_groups_details.fee_groups_id = fee_allocation.group_id LEFT JOIN fees_type ON fees_type.id = fee_groups_details.fee_type_id WHERE
        fee_allocation.student_id = " . $this->db->escape($studentID) . " AND fee_allocation.session_id = " . $this->db->escape(get_session_id());
        $balance = $this->db->query($sql)->row_array();
        $invNo = str_pad($balance['inv_no'], 4, '0', STR_PAD_LEFT);

        $sql = "SELECT IFNULL(SUM(fee_payment_history.amount), 0) as amount, IFNULL(SUM(fee_payment_history.discount), 0) as discount, IFNULL(SUM(fee_payment_history.fine), 0) as fine FROM
        fee_payment_history LEFT JOIN fee_allocation ON fee_payment_history.allocation_id = fee_allocation.id WHERE
        fee_allocation.student_id = " . $this->db->escape($studentID) . " AND fee_allocation.session_id = " . $this->db->escape(get_session_id());
        $paid = $this->db->query($sql)->row_array();

        if ($paid['amount'] == 0) {
            $status = 'unpaid';
        } elseif ($balance['total'] == ($paid['amount'] + $paid['discount'])) {
            $status = 'total';
        } elseif ($paid['amount'] > 1) {
            $status = 'partly';
        }
        return array('status' => $status, 'invoice_no' => $invNo);
    }

    public function getInvoiceDetails($studentID)
    {
        $sql = "SELECT fee_allocation.id as allocation_id, fees_type.name, fee_groups_details.amount, fee_groups_details.due_date, fee_groups_details.fee_type_id FROM fee_allocation LEFT JOIN
        fee_groups_details ON fee_groups_details.fee_groups_id = fee_allocation.group_id LEFT JOIN fees_type ON fees_type.id = fee_groups_details.fee_type_id WHERE
        fee_allocation.student_id = " . $this->db->escape($studentID) . " AND fee_allocation.session_id = " . $this->db->escape(get_session_id());
        return $this->db->query($sql)->result_array();
    }


    public function getVoucherDetails($voucher_id)
    {
        $sql = "SELECT fee_vouchers.* FROM fee_allocation LEFT JOIN fee_vouchers ON fee_vouchers.student_id = fee_allocation.student_id WHERE
        fee_vouchers.id = " . $this->db->escape($voucher_id) . " AND fee_allocation.session_id = " . $this->db->escape(get_session_id());
        return $this->db->query($sql)->row();
    }

    public function getInvoiceBasic($studentID)
    {
        $this->db->select('s.id,e.branch_id,s.first_name,s.last_name,s.email as student_email,s.current_address as student_address,c.name as class_name,b.school_name,b.email as school_email,b.mobileno as school_mobileno,b.address as school_address');
        $this->db->from('enroll as e');
        $this->db->join('student as s', 's.id = e.student_id', 'inner');
        $this->db->join('class as c', 'c.id = e.class_id', 'left');
        $this->db->join('branch as b', 'b.id = e.branch_id', 'left');
        $this->db->where('e.student_id', $studentID);
        return $this->db->get()->row_array();
    }
    
    public function getStudentFeeDeposit($allocationID, $typeID)
    {
        $sqlDeposit = "SELECT IFNULL(SUM(amount), '0.00') as total_amount, IFNULL(SUM(discount), '0.00') as total_discount, IFNULL(SUM(fine), '0.00') as total_fine FROM
        fee_payment_history WHERE allocation_id = " . $this->db->escape($allocationID) . " AND type_id = " . $this->db->escape($typeID);
        return $this->db->query($sqlDeposit)->row_array();
    }

    public function getPaymentHistory($allocationID, $groupID)
    {
        $this->db->select('h.*,t.name,t.fee_code,pt.name as payvia');
        $this->db->from('fee_payment_history as h');
        $this->db->join('fees_type as t', 't.id = h.type_id', 'left');
        $this->db->join('payment_types as pt', 'pt.id = h.pay_via', 'left');
        $this->db->where('h.allocation_id', $allocationID);
        $this->db->order_by('h.id', 'asc');
        return $this->db->get()->result_array();
    }

    public function typeSave($data)
    {   
        $arrayData = array(
            'branch_id' => $this->application_model->get_branch_id(),
            'name' => $data['type_name'],
            'fee_code' => strtolower(str_replace(' ', '-', $data['type_name'])),
            'description' => $data['description'],
            # Added by JR
            'frequency' => isset($data['frequency']) ? serialize($data['frequency']) : null,
            'frequency_type' => $data['frequency_type']
            # END
        );
        if (!isset($data['type_id'])) {
            $this->db->insert('fees_type', $arrayData);
        } else {
            $this->db->where('id', $data['type_id']);
            $this->db->update('fees_type', $arrayData);
        }
    }


    // add partly of the fee
    public function add_fees($data, $id = '')
    {
        $total_due = get_type_name_by_id('fee_invoice', $id, 'total_due');
        $payment_amount = $data['amount'];
        if (($payment_amount <= $total_due) && ($payment_amount > 0)) {
            $arrayHistory = array(
                'fee_invoice_id' => $id,
                'collect_by' => get_user_stamp(),
                'remarks' => $data['remarks'],
                'method' => $data['method'],
                'amount' => $payment_amount,
                'date' => date("Y-m-d"),
                'session_id' => get_session_id(),
            );
            $this->db->insert('payment_history', $arrayHistory);

            if ($total_due <= $payment_amount) {
                $this->db->where('id', $id);
                $this->db->update('fee_invoice', array('status' => 2));
            } else {
                $this->db->where('id', $id);
                $this->db->update('fee_invoice', array('status' => 1));
            }
            $this->db->where('id', $id);
            $this->db->set('total_paid', 'total_paid + ' . $payment_amount, false);
            $this->db->set('total_due', 'total_due - ' . $payment_amount, false);
            $this->db->update('fee_invoice');

            // send payment confirmation sms
            $arrayHistory['student_id'] = $data['student_id'];
            $arrayHistory['timestamp'] = date("Y-m-d");
            $this->sms_model->send_sms($arrayHistory, 2);
            return true;
        } else {
            return false;
        }
    }
    public function getfeeallocation()
    {
        $this->db->select('student.first_name as student_name,class.name as class_name,section.name as section_name,branch.name as branch_name');
        $this->db->from('fee_allocation');
        $this->db->join('enroll', 'enroll.student_id = fee_allocation.student_id', 'inner');
        $this->db->join('class', 'class.id = enroll.class_id ');
        $this->db->join('section', 'section.id = enroll.section_id ');

        // $this->db->join('fee_groups', 'fee_groups.id = fee_allocation.group_id ');
        $this->db->join('branch', 'branch.id = fee_allocation.branch_id ');
        $this->db->join('student', 'student.id = fee_allocation.student_id');



        $result = $this->db->get()->result_array();
        return $result;

    }
    public function getClassandSection()
    {
        $this->db->select('branch.id as branch_id,class.name as class_name,section.name as section_name');
        $this->db->from('branch');
        $this->db->join('class', 'class.branch_id = branch.id ');
        $this->db->join('section', 'section.branch_id = branch.id');
        $result = $this->db->get()->result_array();
        return $result;

    }
    public function getInvoiceList($class_id, $section_id, $branch_id)
    {
        $this->db->select('e.student_id,e.roll,s.first_name,s.last_name,s.register_no,s.mobileno,c.name as class_name,se.name as section_name');
        $this->db->from('fee_allocation as fa');
        $this->db->join('enroll as e', 'e.student_id = fa.student_id', 'inner');
        $this->db->join('student as s', 's.id = e.student_id', 'left');
        $this->db->join('class as c', 'c.id = e.class_id', 'left');
        $this->db->join('section as se', 'se.id = e.section_id', 'left');
        $this->db->where('fa.branch_id', $branch_id);
        $this->db->where('fa.session_id', get_session_id());
        $this->db->where('e.class_id', $class_id);
        if ($section_id != 'all') {
            $this->db->where('e.section_id', $section_id);
        }
        $this->db->group_by('fa.student_id');
        $this->db->order_by('e.id', 'asc');
        $result = $this->db->get()->result_array();
        foreach ($result as $key => $value) {
            $result[$key]['feegroup'] = $this->getfeeGroup($value['student_id']);
        }
        return $result;
    }


    # Added by JR

    public function getFeeAllocatedList($class_id, $section_id, $branch_id)
    {
        $this->db->select('e.student_id,e.roll,s.first_name,s.last_name,s.register_no,s.mobileno,c.name as class_name,se.name as section_name');
        $this->db->from('fee_allocation as fa');
        $this->db->join('enroll as e', 'e.student_id = fa.student_id', 'inner');
        $this->db->join('student as s', 's.id = e.student_id', 'left');
        $this->db->join('class as c', 'c.id = e.class_id', 'left');
        $this->db->join('section as se', 'se.id = e.section_id', 'left');
        $this->db->where('fa.branch_id', $branch_id);
        $this->db->where('fa.session_id', get_session_id());
        $this->db->where('e.class_id', $class_id);
        if ($section_id != 'all') {
            $this->db->where('e.section_id', $section_id);
        }
        $this->db->group_by('fa.student_id');
        $this->db->order_by('e.id', 'asc');
        $result = $this->db->get()->result_array();
        foreach ($result as $key => $value) {
            $result[$key]['feegroup'] = $this->getfeeGroup($value['student_id']);
        }
        return $result;
    }

    # END

    public function getDueInvoiceList($class_id, $section_id, $feegroup_id, $fee_feetype_id)
    {
        $sql = "SELECT IFNULL(SUM(h.amount), '0') as total_amount, IFNULL(SUM(h.discount), '0') as total_discount, gd.amount as full_amount, gd.due_date, e.student_id, e.roll, s.first_name, s.last_name,
        s.register_no, s.mobileno, c.name as class_name, se.name as section_name FROM fee_allocation as fa LEFT JOIN fee_payment_history as h ON h.allocation_id = fa.id and h.type_id = " .
        $this->db->escape($fee_feetype_id) . " INNER JOIN fee_groups_details as gd ON gd.fee_groups_id = fa.group_id and gd.fee_type_id = " . $this->db->escape($fee_feetype_id) . " INNER JOIN
        enroll as e ON e.student_id = fa.student_id LEFT JOIN student as s ON s.id = e.student_id LEFT JOIN class as c ON c.id = e.class_id LEFT JOIN section as se ON se.id = e.section_id WHERE
        fa.group_id = " . $this->db->escape($feegroup_id) . " AND fa.session_id = " . $this->db->escape(get_session_id()) . " AND e.class_id = " . $this->db->escape($class_id);
        
        if ($section_id != 'all') {
            $sql .= " AND e.section_id = " . $this->db->escape($section_id);
        }
        $sql .= " GROUP BY  fa.student_id ORDER BY e.id ASC";
        $result = $this->db->query($sql)->result_array();

        foreach ($result as $key => $value) {
            $result[$key]['feegroup'] = $this->getfeeGroup($value['student_id']);
        }
        return $result;
    }

    public function getDueReport($class_id='', $section_id='')
    {
        $this->db->select('fa.id as allocation_id,sum(gd.amount) as total_fees,e.student_id,e.roll,s.first_name,s.last_name,s.register_no,s.mobileno,c.name as class_name,se.name as section_name');
        $this->db->from('fee_allocation as fa');
        $this->db->join('fee_groups_details as gd', 'gd.fee_groups_id = fa.group_id', 'left');
        $this->db->join('enroll as e', 'e.student_id = fa.student_id', 'inner');
        $this->db->join('student as s', 's.id = e.student_id', 'left');
        $this->db->join('class as c', 'c.id = e.class_id', 'left');
        $this->db->join('section as se', 'se.id = e.section_id', 'left');
        $this->db->where('fa.session_id', get_session_id());
        $this->db->where('e.class_id', $class_id);
        if (!empty($section_id)){
            $this->db->where('e.section_id', $section_id);
        }
        $this->db->group_by('fa.student_id');
        $this->db->order_by('e.roll', 'asc');
        $result = $this->db->get()->result_array();
        foreach ($result as $key => $value) {
            $result[$key]['payment'] = $this->getPaymentDetails($value['student_id']);
        }
        return $result;
    }

    function getPaymentDetails($student_id)
    {
        $this->db->select('IFNULL(SUM(amount), 0) as total_paid, IFNULL(SUM(discount), 0) as total_discount, IFNULL(SUM(fine), 0) as total_fine');
        $this->db->from('fee_allocation');
        $this->db->join('fee_payment_history', 'fee_payment_history.allocation_id = fee_allocation.id', 'left');
        $this->db->where('fee_allocation.student_id', $student_id);
        return  $this->db->get()->row_array();
    }

    public function getStuPaymentHistory($classID='', $SectionID='', $paymentVia, $start, $end, $branchID, $onlyFine=false)
    {
        $this->db->select('h.*,ft.name as type_name,e.student_id,e.roll,s.first_name,s.last_name,s.register_no,s.mobileno,c.name as class_name,se.name as section_name,pt.name as pay_via');
        $this->db->from('fee_payment_history as h');
        $this->db->join('fee_allocation as fa', 'fa.id = h.allocation_id', 'inner');
        $this->db->join('fees_type as ft', 'ft.id = h.type_id', 'left');
        $this->db->join('enroll as e', 'e.student_id = fa.student_id', 'inner');
        $this->db->join('student as s', 's.id = e.student_id', 'left');
        $this->db->join('class as c', 'c.id = e.class_id', 'left');
        $this->db->join('section as se', 'se.id = e.section_id', 'left');
        $this->db->join('payment_types as pt', 'pt.id = h.pay_via', 'left');
        $this->db->where('fa.session_id', get_session_id());
        $this->db->where('h.date  >=', $start);
        $this->db->where('h.date <=', $end);
        $this->db->where('e.branch_id', $branchID);
        if ($onlyFine == true) {
           $this->db->where('h.fine !=', 0);
        }
        if (!empty($classID)){
            $this->db->where('e.class_id', $classID);
        }
        if (!empty($SectionID)){
            $this->db->where('e.section_id', $SectionID);
        }
        if ($paymentVia != 'all') {
            if ($paymentVia == 'online') {
               $this->db->where('h.collect_by', 'online');
            } else {
                $this->db->where('h.collect_by !=', 'online');
            }
        }
        $this->db->order_by('h.id', 'asc');
        $result = $this->db->get()->result_array();
        return $result;
    }

    # Added by JR

    public function getStuHistory($student_name='', $father_name='', $registration_no='', $roll_no='', $father_mobile_no='', $father_nic_no='')
    {
        $this->db->select('CONCAT(student.first_name, \' \', student.last_name) as full_name, student.id as student_id, parent.id as parent_id, register_no, enroll.roll as roll_no, student.mobileno, student.email as email, section.name as section_name, class.name as class_name, student.gender, branch.name as branch_name');

        $this->db->from('student');
        $this->db->join('parent', 'parent.id = student.parent_id');
        $this->db->join('enroll', 'enroll.student_id = student.id');
        $this->db->join('section', 'section.id = enroll.section_id');
        $this->db->join('class', 'class.id = enroll.class_id');
        $this->db->join('branch', 'branch.id = parent.branch_id');
        $this->db->join('fee_allocation', 'fee_allocation.student_id = student.id');
        
        if (!empty($student_name)){
            // $this->db->where('CONCAT(student.first_name, \' \', student.last_name) = ', $student_name);
            $this->db->like('CONCAT(student.first_name, \' \', student.last_name)', $student_name, 'both'); 
        }

        if (!empty($father_name)){
            //$this->db->where('parent.father_name', $father_name);
            $this->db->like('parent.father_name', $father_name, 'both'); 
        }


        if (!empty($registration_no)){
            $this->db->where('student.register_no', $registration_no);
        }

        if (!empty($roll_no)){
            //$this->db->where('enroll.roll', $roll_no);
            $this->db->like('enroll.roll', $roll_no, 'both'); 
        }

        if (!empty($father_mobile_no)){
            //$this->db->where('parent.mobileno', $father_mobile_no);
            $this->db->like('parent.mobileno', $father_mobile_no, 'both'); 
        }

        // if (!empty($father_nic_no)){
        //     $this->db->where('register_no', $father_nic_no);
        // }

        $this->db->order_by('student.id', 'asc');
        $result = $this->db->get()->result_array();
        return $result;
    }


    public function getStudentHistory($branch='', $class='', $section='')
    {
        $this->db->select('CONCAT(student.first_name, \' \', student.last_name) as full_name, student.id as student_id, parent.id as parent_id, register_no, enroll.roll as roll_no, student.mobileno, student.email as email, section.name as section_name, class.name as class_name, student.gender, branch.name as branch_name');

        $this->db->from('student');
        $this->db->join('parent', 'parent.id = student.parent_id');
        $this->db->join('enroll', 'enroll.student_id = student.id');
        $this->db->join('section', 'section.id = enroll.section_id');
        $this->db->join('class', 'class.id = enroll.class_id');
        $this->db->join('branch', 'branch.id = parent.branch_id');
        
        if (!empty($branch)){
            if($branch == 'all'){

            }else{
                $this->db->where('branch.id', $branch);

            }
            
        }

        if (!empty($class)){
            if($class == 'all'){

            }else{
                $this->db->where('class.id', $class);
            }
            
        }


        if (!empty($section)){
            if($section == 'all'){

            }else{
                $this->db->where('section.id', $section);
            }
            
        }

        $this->db->order_by('student.id', 'asc');
        $result = $this->db->get()->result_array();
        return $result;
    }

    # END

    public function getStuPaymentReport($classID='', $sectionID, $studentID, $typeID, $start, $end, $branchID)
    {
        $this->db->select('h.*,gd.due_date,ft.name as type_name,e.student_id,e.roll,s.first_name,s.last_name,s.register_no,pt.name as pay_via');
        $this->db->from('fee_payment_history as h');
        $this->db->join('fee_allocation as fa', 'fa.id = h.allocation_id', 'inner');
        $this->db->join('fees_type as ft', 'ft.id = h.type_id', 'left');
        $this->db->join('fee_groups_details as gd', 'gd.fee_groups_id = fa.group_id and gd.fee_type_id = h.type_id', 'left');
        $this->db->join('enroll as e', 'e.student_id = fa.student_id', 'inner');
        $this->db->join('student as s', 's.id = e.student_id', 'left');
        $this->db->join('payment_types as pt', 'pt.id = h.pay_via', 'left');
        $this->db->where('fa.session_id', get_session_id());
        $this->db->where('h.date  >=', $start);
        $this->db->where('h.date <=', $end);
        $this->db->where('e.branch_id', $branchID);
        $this->db->where('e.class_id', $classID);
        if (!empty($typeID)) {
            $typeID = explode("|", $typeID);
            $this->db->where('h.type_id', $typeID[1]);
        }
        if (!empty($studentID)) {
            $this->db->where('e.student_id', $studentID);
        }
        $this->db->where('e.section_id', $sectionID);
        $this->db->order_by('h.id', 'asc');
        $result = $this->db->get()->result_array();
        return $result;
    }

    function getfeeGroup($studentID)
    {
        $this->db->select('g.name');
        $this->db->from('fee_allocation as fa');
        $this->db->join('fee_groups as g', 'g.id = fa.group_id', 'inner');
        $this->db->where('fa.student_id', $studentID);
        $this->db->where('fa.session_id', get_session_id());
        return $this->db->get()->result_array();
    }

    function reminderSave($data)
    {
        $arrayData = array(
            'frequency' => $data['frequency'], 
            'days' => $data['days'], 
            'student' => (isset($data['chk_student']) ? 1 : 0), 
            'guardian' => (isset($data['chk_guardian']) ? 1 : 0), 
            'message' => $data['message'], 
            'branch_id' => $data['branch_id'], 
        );
        if (!isset($data['reminder_id'])) {
            $this->db->insert('fees_reminder', $arrayData);
        } else {
            $this->db->where('id', $data['reminder_id']);
            $this->db->update('fees_reminder', $arrayData);
        }  
    }

    function getFeeReminderByDate($date, $branch_id)
    {
        $this->db->select('fee_groups_details.*,fees_type.name');
        $this->db->from('fee_groups_details');
        $this->db->join('fees_type', 'fees_type.id = fee_groups_details.fee_type_id', 'inner');
        $this->db->where('fee_groups_details.due_date', $date);
        $this->db->where('fees_type.branch_id', $branch_id);
        $this->db->order_by('fee_groups_details.id', 'asc');
        return $this->db->get()->result_array();
    }

    function getStudentsListReminder($groupID='', $typeID='')
    {
        $sessionID = get_type_name_by_id('global_settings', 1, 'session_id');
        $this->db->select('a.id as allocation_id,CONCAT(s.first_name," ",s.last_name) as child_name,s.mobileno as child_mobileno,pr.name as guardian_name,pr.mobileno as guardian_mobileno');
        $this->db->from('fee_allocation as a');
        $this->db->join('student as s','s.id = a.student_id', 'inner');
        $this->db->join('parent as pr','pr.id = s.parent_id', 'left');
        $this->db->where('a.group_id', $groupID);
        $this->db->where('a.session_id', $sessionID);
        $result = $this->db->get()->result_array();
        foreach ($result as $key => $value) {
            $result[$key]['payment'] = $this->getPaymentDetailsByTypeID($value['allocation_id'], $typeID);
        }
        return $result;
    }

    function getPaymentDetailsByTypeID($allocationID, $typeID)
    {
        $this->db->select('IFNULL(SUM(amount), 0) as total_paid, IFNULL(SUM(discount), 0) as total_discount');
        $this->db->from('fee_payment_history');
        $this->db->where('allocation_id', $allocationID);
        $this->db->where('type_id', $typeID);
        return $this->db->get()->row_array();
    }

    public function depositAmountVerify($amount)
    {
        if ($amount != "") {
            $typeID = $this->input->post('fees_type');
            $feesType = explode("|", $typeID);
            $remainAmount = $this->getBalance($feesType[0], $feesType[1]);
            $discount = (isset($_POST['discount_amount']) ? $_POST['discount_amount'] : 0);
            $depositAmount = $amount + $discount;
            if ($remainAmount['balance'] < $depositAmount) {
                $this->form_validation->set_message('deposit_verify', 'Amount cannot be greater than the remaining.');
                return false;
            } else {
                return true;
            }
        }
        return true;
    }

    public function getBalance($allocationID, $typeID)
    {
        $groupsID = get_type_name_by_id('fee_allocation', $allocationID, 'group_id');
        $getType = $this->db->select('amount')->where(array('fee_groups_id' => $groupsID, 'fee_type_id' => $typeID))->get('fee_groups_details')->row_array();

        $this->db->select('IFNULL(sum(p.amount), 0) as total_amount,IFNULL(sum(p.discount), 0) as total_discount,IFNULL(sum(p.fine), 0) as total_fine');
        $this->db->from('fee_payment_history as p');
        $this->db->where('p.allocation_id', $allocationID);
        $this->db->where('p.type_id', $typeID);
        $paid = $this->db->get()->row_array();
        $balance = $getType['amount'] - ($paid['total_amount'] + $paid['total_discount']);
        $total_fine = $paid['total_fine'];
        return array('balance' => $balance, 'fine' => $total_fine);
    }

    // voucher transaction save function
    public function saveTransaction($data)
    {
        $branchID   = $this->application_model->get_branch_id();
        $accountID  = $data['account_id'];
        $date       = $data['date'];
        $amount     = $data['amount'];

        // get the current balance of the selected account
        $qbal   = $this->app_lib->get_table('accounts', $accountID, true);
        $cbal   = $qbal['balance'];
        $bal    = $cbal + $amount;
        // query system voucher head / insert
        $arrayHead = array(
            'name'      => 'Student Fees Collection',
            'type'      => 'income',
            'system'    => 1,
            'branch_id' => $branchID
        );
        $this->db->where($arrayHead);
        $query =$this->db->get('voucher_head');
        if ($query->num_rows() > 0) {
            $voucher_headID = $query->row()->id;
        } else {
            $this->db->insert('voucher_head', $arrayHead);
            $voucher_headID = $this->db->insert_id();
        }
        // query system transactions / insert
        $arrayTransactions =array(
            'account_id'        => $accountID,
            'voucher_head_id'   => $voucher_headID,
            'type'              => 'deposit',
            'system'            => 1,
            'date'              => date("Y-m-d", strtotime($date)),
            'branch_id'         => $branchID
        );
        $this->db->where($arrayTransactions);
        $query = $this->db->get('transactions');
        if ($query->num_rows() == 1) {
            $this->db->set('amount', 'amount+' . $amount, FALSE);
            $this->db->set('cr', 'cr+' . $amount, FALSE);
            $this->db->set('bal', $bal);
            $this->db->where('id', $query->row()->id);
            $this->db->update('transactions');
        } else {
            $arrayTransactions['ref']           = '';
            $arrayTransactions['amount']        = $amount;
            $arrayTransactions['dr']            = 0;
            $arrayTransactions['cr']            = $amount;
            $arrayTransactions['bal']           = $bal;
            $arrayTransactions['pay_via']       = 5;
            $arrayTransactions['description']   = date("d-M-Y", strtotime($date)) . " Total Fees Collection";
            $this->db->insert('transactions', $arrayTransactions);
        }

        $this->db->where('id', $accountID);
        $this->db->update('accounts', array('balance' => $bal));
    }


    # Added by JR

    public function fee_voucher($data)
    {
        $this->db->insert('fee_vouchers', $data);
        return $this->db->insert_id();
    }

    public function all_vouchers()
    {
        $this->db->select('enroll.student_id,enroll.roll,student.first_name,student.last_name,student.register_no,student.mobileno,class.name as class_name,section.name as section_name,fee_vouchers.voucher_no as voucher_no, fee_vouchers.fee_month as fee_month, fee_vouchers.status as status');
        $this->db->from('fee_vouchers');
        $this->db->join('fee_allocation', 'fee_allocation.student_id = fee_vouchers.student_id');
        $this->db->join('enroll', 'enroll.student_id = fee_allocation.student_id');
        $this->db->join('student', 'student.id = enroll.student_id');
        $this->db->join('class', 'class.id = enroll.class_id', 'left');
        $this->db->join('section', 'section.id = enroll.section_id', 'left');
        $this->db->where('fee_allocation.session_id', get_session_id());
        $this->db->where('fee_vouchers.status',0);
        $this->db->group_by('fee_vouchers.student_id');
        $this->db->order_by('enroll.id', 'asc');

        $result = $this->db->get()->result_array();
        foreach ($result as $key => $value) {
            $result[$key]['feegroup'] = $this->getfeeGroup($value['student_id']);
        }
        return $result;
    }

    public function all_vouchers_list()
    {
        $voucher_list = array();
        $this->db->select('enroll.student_id,enroll.roll,student.first_name,student.last_name,student.register_no,student.mobileno,class.name as class_name,section.name as section_name,fee_vouchers.voucher_no as voucher_no, fee_vouchers.fee_month as fee_month, fee_vouchers.status as status');
        $this->db->from('fee_vouchers');
        $this->db->join('fee_allocation', 'fee_allocation.student_id = fee_vouchers.student_id');
        $this->db->join('enroll', 'enroll.student_id = fee_allocation.student_id');
        $this->db->join('student', 'student.id = enroll.student_id');
        $this->db->join('class', 'class.id = enroll.class_id', 'left');
        $this->db->join('section', 'section.id = enroll.section_id', 'left');
        $this->db->where('fee_vouchers.status',0);
        $this->db->order_by('enroll.id', 'asc');

        $result = $this->db->get()->result_array();
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



    public function getVoucherList($student_name='', $father_name='', $registration_no='', $roll_no='', $father_mobile_no='', $father_nic_no='', $voucher_no = '', $voucher_bar_code = '', $bio_matric_impression = '')
    {
        $this->db->select('enroll.student_id,enroll.roll,student.first_name,student.last_name,student.register_no,student.mobileno,class.name as class_name,section.name as section_name, fee_vouchers.voucher_no as voucher_no, fee_vouchers.id as fee_voucher_id, fee_vouchers.fee_month as fee_month,fee_vouchers.status as status');
        $this->db->from('fee_vouchers');
        $this->db->join('fee_allocation', 'fee_allocation.student_id = fee_vouchers.student_id');
        $this->db->join('enroll', 'enroll.student_id = fee_allocation.student_id');
        $this->db->join('student', 'student.id = enroll.student_id');
        $this->db->join('parent', 'parent.id = student.parent_id');
        $this->db->join('class', 'class.id = enroll.class_id', 'left');
        $this->db->join('section', 'section.id = enroll.section_id', 'left');
        $this->db->group_by('fee_vouchers.student_id');
        $this->db->order_by('enroll.id', 'asc');

        if (!empty($student_name)){
            $this->db->like('CONCAT(student.first_name, \' \', student.last_name', $student_name, 'both'); 
        }

        if (!empty($father_name)){
            $this->db->like('parent.father_name', $father_name, 'both'); 
        }


        if (!empty($registration_no)){
            $this->db->like('student.register_no', $registration_no, 'both'); 
        }

        if (!empty($roll_no)){
            $this->db->like('enroll.roll', $roll_no, 'both'); 
        }

        if (!empty($father_mobile_no)){
            $this->db->like('parent.mobileno', $father_mobile_no, 'both'); 
        }

        // if (!empty($father_nic_no)){
        //     $this->db->where('register_no', $father_nic_no);
        // }

        if (!empty($voucher_no)){
            $this->db->like('fee_vouchers.voucher_no', $voucher_no, 'both'); 
        }


        if (!empty($voucher_bar_code)){
            $this->db->like('fee_vouchers.voucher_barcode', $voucher_bar_code, 'both'); 
        }


        // if (!empty($bio_matric_impression)){
        //     $this->db->where('student.bio_matric_impression', $bio_matric_impression);
        // }

        $result = $this->db->get()->result_array();
        foreach ($result as $key => $value) {
            $result[$key]['feegroup'] = $this->getfeeGroup($value['student_id']);
        }
        return $result;
    }

    public function getVoucherFeeDetails($voucher_id='')
    {
        $arr = array();
        $this->db->select('fee_allocation.id as allocation_id,fee_allocation.student_id as student_id, fees_type.name, fees_type.frequency as fees_frequency,fees_type.frequency_type as fee_frequency_type,fee_groups_details.amount, fee_groups_details.due_date, fee_groups_details.fee_type_id,fee_vouchers.fee_month as fee_month');
        $this->db->from('fee_vouchers');
        $this->db->join('fee_allocation', 'fee_allocation.student_id = fee_vouchers.student_id');
        $this->db->join('fee_groups_details', 'fee_groups_details.fee_groups_id = fee_allocation.group_id');
        $this->db->join('fees_type', 'fees_type.id = fee_groups_details.fee_type_id');
        $this->db->where('fee_vouchers.id', $voucher_id);
        $result = $this->db->get()->result_array();

        if(!empty($result)){
            foreach ($result as $key => $value) {

                if($value['fee_frequency_type'] == 1){

                    $checkstudentFee = check_student_fee($value['student_id']);
                    if(!$checkstudentFee){
                        array_push($arr, array('allocation_id'=> $value['allocation_id'], 'name' => $value['name'], 'amount' => $value['amount'], 'fee_type_id' => $value['fee_type_id']));
                    }

                } 
                else if($value['fee_frequency_type'] == 3){
                    
                    $res = array_intersect(unserialize($value['fee_month']),unserialize($value['fees_frequency']));
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

    public function check_voucher_month($voucher_id, $fee_type_id)
    {

        $this->db->where('id',$voucher_id);
        $voucher = $this->db->get('fee_vouchers')->row();

        $res = count(unserialize($voucher->fee_month));
        $this->db->where('id',$fee_type_id);
        $fee_type = $this->db->get('fees_type')->row();
        if(!empty($fee_type->frequency)){
           $response = array_intersect(unserialize($fee_type->frequency),unserialize($voucher->fee_month));

           $res = count($response);
        }
        if($fee_type->frequency_type == 1){
            $res = 1;
        }

        return $res;
    }

    public function collect_fee($data)
    {
        $fee = array(
            'voucher_id' => $data['voucher_id'],
            'student_id' => $data['student_id'],
            'amount' => $data['amount'],
            'session_id' => get_session_id(),
            'total_paid' => $data['paid_amount'],
            'total_due' => $data['amount'] - $data['paid_amount']
        );
        $result = $this->db->insert('fee_voucher_payments', $fee);

        if ($data['amount'] <= $data['paid_amount']) {
            $this->db->where('id', $data['voucher_id']);
            $this->db->update('fee_vouchers', array('status' => 1));
        } else {
            $this->db->where('id', $data['voucher_id']);
            $this->db->update('fee_vouchers', array('status' => 2));
        }

        return $result;
    }

    # END
}
