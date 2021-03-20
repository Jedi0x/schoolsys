<?php
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Inquiry_model extends MY_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    // moderator student all information
    public function save($data, $getBranch)
    {
        
        
        $inser_data1 = array(
            'year_id' => $data['year_id'],
            'inq_type' => $data['inq_type'],
            'inquiry_no' => $data['inquiry_no'],
            'visited_date' => date("Y-m-d", strtotime($data['visited_date'])),
            'branch_id' => $data['branch_id'],
            'class_id' => $data['class_id'],
            'section_id' => $data['section_id'],
            'category_id' => $data['category_id'],
            'first_name' => $data['first_name'],
            'last_name' => $data['last_name'],
            'gender' => $data['gender'],
            'grd_name' => $data['grd_name'],
            'grd_relation' => $data['grd_relation'],
            'gdr_office_no' => $data['gdr_office_no'],
            'grd_mobileno' => $data['grd_mobileno'],
            'grd_email' => $data['grd_email'],
            'previous_remarks' => $data['previous_remarks']
        );
        
//      echo '<pre>';
//        print_r($inquiry_id);
//        exit;
        
        if (isset($data['inquiry_no']) && $data['i_id'] == '') {
             $this->db->insert('inquiry', $inser_data1);
            $inquiry_id = $this->db->insert_id();
            
//              echo '<pre>';
//        print_r($inquiry_id);
//        exit;
            
            return $inquiry_id;
        }else{
            // update student all information in the database            
            $this->db->where('id', $data['id']);
            $this->db->update('inquiry', $inser_data1);
        }
    }

    public function csvImport($row, $classID, $sectionID, $branchID)
    {
        $getParent = $this->db->select('id')->where(array('branch_id' => $branchID, 'email' => $row['GuardianEmail']))->get('parent')->row_array();
        if (count($getParent)) {
            $parentID = $getParent['id'];
        } else {
            // add new guardian all information in db
            $arrayParent = array(
                'name' => $row['GuardianName'],
                'relation' => $row['GuardianRelation'],
                'father_name' => $row['FatherName'],
                'mother_name' => $row['MotherName'],
                'occupation' => $row['GuardianOccupation'],
                'mobileno' => $row['GuardianMobileNo'],
                'address' => $row['GuardianAddress'],
                'email' => $row['GuardianEmail'],
                'branch_id' => $branchID,
                'photo' => 'defualt.png',
            );
            $this->db->insert('parent', $arrayParent);
            $parentID = $this->db->insert_id();
            $parent_credential = array(
                'username' => $row["GuardianEmail"],
                'role' => 6,
                'user_id' => $parentID,
                'password' => $this->app_lib->pass_hashed($row["GuardianPassword"]),
            );
            $this->db->insert('login_credential', $parent_credential);
        }

        $inser_data1 = array(
            'first_name' => $row['FirstName'],
            'last_name' => $row['LastName'],
            'blood_group' => $row['BloodGroup'],
            'gender' => $row['Gender'],
            'birthday' => date("Y-m-d", strtotime($row['Birthday'])),
            'mother_tongue' => $row['MotherTongue'],
            'religion' => $row['Religion'],
            'parent_id' => $parentID,
            'caste' => $row['Caste'],
            'mobileno' => $row['Phone'],
            'city' => $row['City'],
            'state' => $row['State'],
            'current_address' => $row['PresentAddress'],
            'permanent_address' => $row['PermanentAddress'],
            'category_id' => $row['CategoryID'],
            'admission_date' => date("Y-m-d", strtotime($row['AdmissionDate'])),
            'register_no' => substr(app_generate_hash(), 4, 7),
            'photo' => 'defualt.png',
            'email' => $row['StudentEmail'],
        );
        //save all student information in the database file
        $this->db->insert('student', $inser_data1);
        $studentID = $this->db->insert_id();
        //save student login credential
        $inser_data2 = array(
            'username' => $row["StudentEmail"],
            'role' => 7,
            'user_id' => $studentID,
            'password' => $this->app_lib->pass_hashed($row["StudentPassword"]),
        );
        $this->db->insert('login_credential', $inser_data2);

        //save student enroll information in the database file
        $arrayEnroll = array(
            'student_id' => $studentID,
            'class_id' => $classID,
            'section_id' => $sectionID,
            'branch_id' => $branchID,
            'roll' => $row['Roll'],
            'session_id' => get_session_id(),
        );
        $this->db->insert('enroll', $arrayEnroll);
    }

    public function getFeeProgress($id)
    {
        $this->db->select('IFNULL(SUM(gd.amount), 0) as totalfees,IFNULL(SUM(p.amount), 0) as totalpay,IFNULL(SUM(p.discount),0) as totaldiscount');
        $this->db->from('fee_allocation as a');
        $this->db->join('fee_groups_details as gd', 'gd.fee_groups_id = a.group_id', 'inner');
        $this->db->join('fee_payment_history as p', 'p.allocation_id = a.id and p.type_id = gd.fee_type_id', 'left');
        $this->db->where('a.student_id', $id);
        $this->db->where('a.session_id', get_session_id());
        $r = $this->db->get()->row_array();
        $total_amount = floatval($r['totalfees']);
        $total_paid = floatval($r['totalpay'] + $r['totaldiscount']);
        if ($total_paid != 0) {
            $percentage = ($total_paid / $total_amount) * 100;
            return number_format($percentage);
        } else {
            return 0;
        }
    }

    public function getStudentList($classID = '', $sectionID = '', $branchID = '', $deactivate = false)
    {
        $this->db->select('e.*,s.photo, CONCAT(s.first_name, " ", s.last_name) as fullname,s.register_no,s.parent_id,s.email,s.blood_group,s.birthday,l.active,c.name as class_name,se.name as section_name');
        $this->db->from('enroll as e');
        $this->db->join('student as s', 'e.student_id = s.id', 'inner');
        $this->db->join('login_credential as l', 'l.user_id = s.id and l.role = 7', 'inner');
        $this->db->join('class as c', 'e.class_id = c.id', 'left');
        $this->db->join('section as se', 'e.section_id=se.id', 'left');
        $this->db->where('e.class_id', $classID);
        $this->db->where('e.branch_id', $branchID);
        $this->db->where('e.session_id', get_session_id());
        $this->db->order_by('s.id', 'ASC');
        if ($sectionID != 'all') {
            $this->db->where('e.section_id', $sectionID);
        }
        if ($deactivate == true) {
            $this->db->where('l.active', 0);
        }
        return $this->db->get();
    }

    public function getSearchStudentList($search_text)
    {
        $this->db->select('e.*,s.photo,s.first_name,s.last_name,s.register_no,s.parent_id,s.email,s.blood_group,s.birthday,c.name as class_name,se.name as section_name,sp.name as parent_name');
        $this->db->from('enroll as e');
        $this->db->join('student as s', 'e.student_id = s.id', 'left');
        $this->db->join('class as c', 'e.class_id = c.id', 'left');
        $this->db->join('section as se', 'e.section_id=se.id', 'left');
        $this->db->join('parent as sp', 'sp.id = s.parent_id', 'left');
        $this->db->where('e.session_id', get_session_id());
        if (!is_superadmin_loggedin()) {
            $this->db->where('e.branch_id', get_loggedin_branch_id());
        }
        $this->db->group_start();
        $this->db->like('s.first_name', $search_text);
        $this->db->or_like('s.last_name', $search_text);
        $this->db->or_like('s.register_no', $search_text);
        $this->db->or_like('s.email', $search_text);
        $this->db->or_like('e.roll', $search_text);
        $this->db->or_like('s.blood_group', $search_text);
        $this->db->or_like('sp.name', $search_text);
        $this->db->group_end();
        $this->db->order_by('s.id', 'desc');
        return $this->db->get();
    }

    public function getSingleStudent($id = '')
    {
        $this->db->select('s.*,l.username,l.active,e.class_id,e.section_id,e.id as enrollid,e.roll,e.branch_id,e.session_id,c.name as class_name,se.name as section_name,sc.name as category_name');
        $this->db->from('enroll as e');
        $this->db->join('student as s', 'e.student_id = s.id', 'left');
        $this->db->join('login_credential as l', 'l.user_id = s.id and l.role = 7', 'inner');
        $this->db->join('class as c', 'e.class_id = c.id', 'left');
        $this->db->join('section as se', 'e.section_id = se.id', 'left');
        $this->db->join('student_category as sc', 's.category_id=sc.id', 'left');
        $this->db->where('s.id', $id);
        if (!is_superadmin_loggedin()) {
            $this->db->where('e.branch_id', get_loggedin_branch_id());
        }
        $query = $this->db->get();
        if ($query->num_rows() == 0) {
            show_404();
        }
        return $query->row_array();
    }

    public function regSerNumber()
    {
        $prefix = '';
        $config = $this->db->select('institution_code,reg_prefix')->where(array('id' => 1))->get('global_settings')->row();
        if ($config->reg_prefix == 'on') {
            $prefix = $config->institution_code;
        }
        $result = $this->db->select("max(id) as id")->get('student')->row_array();
        $id = $result["id"];
        if (!empty($id)) {
            $maxNum = str_pad($id + 1, 5, '0', STR_PAD_LEFT);
        } else {
            $maxNum = '00001';
        }

        return ($prefix . $maxNum);
    }
    
    public function regSer()
    {
        $prefix = '';
        $config = $this->db->select('institution_code,reg_prefix')->where(array('id' => 1))->get('global_settings')->row();
        if ($config->reg_prefix == 'on') {
            $prefix = $config->institution_code;
        }
        $result = $this->db->select("max(id) as id")->get('inquiry')->row_array();
        $id = $result["id"];
        if (!empty($id)) {
            $maxNum = str_pad($id + 1, 5, '0', STR_PAD_LEFT);
        } else {
            $maxNum = '00001';
        }
        
//        echo $prefix; exit;

        return ($prefix . $maxNum);
    }
}
