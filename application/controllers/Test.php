<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * @package : Aanttech school management system
 * @version : 3.0
 * @developed by : AanttechCoder
 * @support : Aanttechcoder@yahoo.com
 * @author url : http://codecanyon.net/user/AanttechCoder
 * @filename : Accounting.php
 * @copyright : Reserved AanttechCoder Team
 */

class Test extends Admin_Controller
{

	public function __construct()
    {
        parent::__construct();
        $this->load->helper('api');
        $this->load->model('authentication_model');
        $this->load->model('fees_model');

    }

    public function index()
    {
       
        $output = array();
        $output['lables'] = array(
                "Jan",
                "Feb",
                "Mar",
                "Apr",
                "May",
                "Jun",
                "Jul",
                "Aug",
                "Sep",
                "Oct",
                "Nov",
                "Dec"
            );
        for ($month = 0; $month <= 11; $month++) {
            $total_obtain_marks = 0;
            $total_full_marks = 0;
            $this->db->select('t.*,s.name as subject_name,eh.hall_no,m.mark as obtain_marks,m.student_id');
            $this->db->from('timetable_exam as t');
            $this->db->join('subject as s', 's.id = t.subject_id', 'left');
            $this->db->join('mark as m', 'm.subject_id = t.subject_id', 'left');
            $this->db->join('exam_hall as eh', 'eh.id = t.hall_id', 'left');
            $this->db->where('m.student_id', 6);
            $this->db->where('month(t.exam_date)', $month+1);
            $this->db->where('year(t.exam_date)', date('Y'));
            $exam_details =  $this->db->get()->result();
            $output['data'][$month] =  0;
            if(!empty($exam_details)){

                foreach ($exam_details as $e => $exam) {
                    $mark_distribution = json_decode($exam->mark_distribution, true);
                    $obtainedMark = json_decode($exam->obtain_marks, true);

                    $mark_distribution = array_values($mark_distribution);
                    $obtainedMark = array_values($obtainedMark);
                    $response[$e]['full_mark'] = $mark_distribution[0]['full_mark'];
                    $response[$e]['obtain_mark'] = $obtainedMark[0];
                    $total_obtain_marks+=$response[$e]['obtain_mark'];
                    $total_full_marks+=$response[$e]['full_mark'];

                }
                $percentage = ($total_obtain_marks * 100) / $total_full_marks;
                $number = number_format($percentage, 2, '.', '') . '%';
                $output['data'][$month] =  $number;
            }
        }


debug($output);
       



    

        

    }
    



}