<?php

function exam_name_by_id($exam_id) {

	$CI = &get_instance();

	$getExam = $CI->db->get_where('exam', array('id' => $exam_id))->row_array();

	if (!empty($getExam['term_id'])) {

		$getTerm = $CI->db->get_where('exam_term', array('id' => $getExam['term_id']))->row_array();

		return $getExam['name'] . ' (' . $getTerm['name'] . ')';

	} else {

		return $getExam['name'];

	}

}


function class_name_by_id($class_id) {

	$CI = &get_instance();
	$getClass = $CI->db->get_where('class', array('id' => $class_id))->row_array();
	return $getClass['name'];
}

function section_name_by_id($Section_id) {

	$CI = &get_instance();
	$getSection = $CI->db->get_where('section', array('id' => $Section_id))->row_array();
	return $getSection['name'];
}


function hall_name_by_id($hall_id)
{
	$CI = &get_instance();
	$exam_hall = $CI->db->get_where('exam_hall', array('id' => $hall_id))->row_array();
	return $exam_hall['hall_no'];
}

function get_user_enroll($user_id)
{
	$CI = &get_instance();
	$user_details = $CI->db->get_where('enroll', array('student_id' => $user_id))->row_array();
	return $user_details;
}
