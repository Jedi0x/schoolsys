<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * @package : Ramom school management system
 * @version : 3.0
 * @developed by : RamomCoder
 * @support : ramomcoder@yahoo.com
 * @author url : http://codecanyon.net/user/RamomCoder
 * @filename : Accounting.php
 * @copyright : Reserved RamomCoder Team
 */

class Test extends Admin_Controller
{

	public function __construct()
    {
        parent::__construct();
        $this->load->helper('api');
    }

    public function index()
    {
        $this->db->select('t.*,s.name as subject_name,eh.hall_no,m.mark as obtain_marks');
                $this->db->from('timetable_exam as t');
                $this->db->join('subject as s', 's.id = t.subject_id', 'left');
                $this->db->join('mark as m', 'm.subject_id = t.subject_id', 'left');
                $this->db->join('exam_hall as eh', 'eh.id = t.hall_id', 'left');
                            $this->db->where('t.branch_id', 1);
                $this->db->where('t.exam_id', 1);
                $this->db->where('t.class_id', 4);
                $this->db->where('t.section_id', 1);
                $this->db->where('m.student_id', 1);
                $exam_details =  $this->db->get()->result();
                debug($exam_details);
    }
}