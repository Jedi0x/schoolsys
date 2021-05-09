<?php

// create new PDF document
$pdf = new TCPDF('L', PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetTitle('Voucher');

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// set image ratio
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

$pdf->SetFont('dejavusans', '', 7);

// remove header and footer
$pdf->SetPrintHeader(false);
$pdf->SetPrintFooter(false);
$pdf->AddPage();

$header = '
<table style="color: #fff; padding:35px;">
    <tbody>
        <tr>
            <td></td>
        </tr>
    </tbody>
</table>';

$pdf->writeHTML($header, false, false, false, false, '');



$date=date_create($voucher_info->issue_date);
$issue_date  = date_format($date,"Y/m/d");


$date=date_create($voucher_info->due_date);
$due_date  = date_format($date,"Y/m/d");

// create some HTML content
$html = '

<style>
.border td {
  border: 2px solid black;
}


.border-class {
  padding: 0px !important;
}

.border-class td {
  border: 1px solid black;
}
</style>';


$html .='
<table class="border" style="border-collapse: separate; border-spacing: 8px; padding: 0px;">
	<tr>
		<td>
			<table class="border-class">
				<tr>
					<td>
						<table style="padding-bottom:40px; padding-top:3px;" >
							<tr>
								<td align="center">
									<p><b><u>'.$voucher_info->school_name.' '.$voucher_info->branch_name.'</u></b><br>'.$voucher_info->address.', '.$voucher_info->city.', '.$voucher_info->state.'.<br>'.$voucher_info->mobileno.'</p>
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<td>
						<table class="border-class" cellpadding="3px;">
							<tr>
								<td colspan="3" align="center" style="background-color: #c6c6c6; "><b>Fee Voucher</b></td>
							</tr>

							<tr>
								<td><b>Challan#:</b></td>
								<td colspan="2"><b>'.$voucher_info->voucher_no.'</b></td>
								
							</tr>

							<tr>
								<td>IssueDate</td>
								<td colspan="2">'.$issue_date.'</td>
							</tr>

							<tr>
								<td><b>FeeMonth</b></td>
								<td colspan="2"><b>'.get_voucher_month($voucher_info->fee_month).' '.$voucher_info->fee_year.'</b></td>
							</tr>

							<tr>
								<td><b>DueDate</b></td>
								<td colspan="2"><b>'.$due_date.'</b></td>
							</tr>

							<tr>
								<td>Student</td>
								<td colspan="2">'.$voucher_info->student_name.'</td>
							</tr>

							<tr>
								<td>Father Name</td>
								<td colspan="2">'.$voucher_info->parent_name.'</td>
							</tr>

							<tr>
								<td>Class</td>
								<td colspan="2">'.$voucher_info->class_name.' - '.$voucher_info->section_name.'</td>
							</tr>

							<tr>
								<td>Roll No</td>
								<td colspan="2">'.$voucher_info->roll.'</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>

					<td>
						<table class="border-class" cellpadding="3px;">
							<tr>
								<td colspan="2"  align="center" style="background-color: #c6c6c6;"><b>VoucherDetail</b></td>
							</tr>

							<tr>
								<td>Particulars</td>
								<td align="center">Amount</td>
							</tr>

							<tr>
								<td>Fee</td>
								<td align="right">'.$voucher_info->fee_amount.'</td>
							</tr>

							<tr>
								<td>TotalAmount :</td>
								<td align="right">'.$voucher_info->fee_amount.'</td>
							</tr>

							<tr>
								<td colspan="2"  align="center" style="border: none !important;">
									<table class="border-class"  style="padding-bottom:50px;">
										<tr>
											<td style="border: none !important;"> Dues, once paid are non refundable in any case. </td>
										</tr>
									</table>
								</td>
							</tr>

							<tr>
								<td colspan="2" style="border: none !important;">
									<table class="border-class" >
										<tr>
											<td align="left" style="border: none !important;">&nbsp;&nbsp;&nbsp;_________________   </td>
											<td align="right" style="border: none !important;">  _________________&nbsp;&nbsp;&nbsp;&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>

							<tr>
								<td colspan="2" style="border: none !important;">
									<table  class="border-class"  style="padding-bottom:15px;">
										<tr>
											<td align="left" style="border: none !important;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Office  </td>
											<td align="right" style="border: none !important;">  Bank Stamp &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>


							<tr>
								<td colspan="2" align="center" style="border: none !important;">Bank`s Copy</td>
							</tr>

							<tr>
								<td colspan="2" align="center">
									فیس سکول کیمپس میں جمع نہیں کروائی جا سکتی
								</td>
							</tr>

							<tr>
								<td colspan="2" align="center">Duplicate Changes of Chalan Form: Rs. 50</td>
							</tr>
						</table>
					</td>

				</tr>
			</table>
		</td>

		<td>
			<table class="border-class">
				<tr>
					<td>
						<table style="padding-bottom:40px; padding-top:3px;" >
							<tr>
								<td align="center">
									<p><b><u>'.$voucher_info->school_name.' '.$voucher_info->branch_name.'</u></b><br>'.$voucher_info->address.', '.$voucher_info->city.', '.$voucher_info->state.'.<br>'.$voucher_info->mobileno.'</p>
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<td>
						<table class="border-class" cellpadding="3px;">
							<tr>
								<td colspan="3" align="center" style="background-color: #c6c6c6; "><b>Fee Voucher</b></td>
							</tr>

							<tr>
								<td><b>Challan#:</b></td>
								<td colspan="2"><b>'.$voucher_info->voucher_no.'</b></td>
							</tr>

							<tr>
								<td>IssueDate</td>
								<td colspan="2">'.$issue_date.'</td>
							</tr>

							<tr>
								<td><b>FeeMonth</b></td>
								<td colspan="2"><b>'.get_voucher_month($voucher_info->fee_month).' '.$voucher_info->fee_year.'</b></td>
							</tr>

							<tr>
								<td><b>DueDate</b></td>
								<td colspan="2"><b>'.$due_date.'</b></td>
							</tr>

							<tr>
								<td>Student</td>
								<td colspan="2">'.$voucher_info->student_name.'</td>

							</tr>

							<tr>
								<td>Father Name</td>
								<td colspan="2">'.$voucher_info->parent_name.'</td>
							</tr>

							<tr>
								<td>Class</td>
								<td colspan="2">'.$voucher_info->class_name.' - '.$voucher_info->section_name.'</td>
							</tr>

							<tr>
								<td>Roll No</td>
								<td colspan="2">'.$voucher_info->roll.'</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>

					<td>
						<table class="border-class" cellpadding="3px;">
							<tr>
								<td colspan="2"  align="center" style="background-color: #c6c6c6;"><b>VoucherDetail</b></td>
							</tr>

							<tr>
								<td>Particulars</td>
								<td align="center">Amount</td>
							</tr>

							<tr>
								<td>Fee</td>
								<td align="right">'.$voucher_info->fee_amount.'</td>
							</tr>

							<tr>
								<td>TotalAmount :</td>
								<td align="right">'.$voucher_info->fee_amount.'</td>
							</tr>

							<tr>
								<td colspan="2"  align="center" style="border: none !important;">
									<table class="border-class"  style="padding-bottom:50px;">
										<tr>
											<td style="border: none !important;"> Dues, once paid are non refundable in any case. </td>
										</tr>
									</table>
								</td>
							</tr>

							<tr>
								<td colspan="2" style="border: none !important;">
									<table class="border-class" >
										<tr>
											<td align="left" style="border: none !important;">&nbsp;&nbsp;&nbsp;_________________   </td>
											<td align="right" style="border: none !important;">  _________________&nbsp;&nbsp;&nbsp;&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>

							<tr>
								<td colspan="2" style="border: none !important;">
									<table  class="border-class"  style="padding-bottom:15px;">
										<tr>
											<td align="left" style="border: none !important;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Office  </td>
											<td align="right" style="border: none !important;">  Bank Stamp &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>


							<tr>
								<td colspan="2" align="center" style="border: none !important;">Bank`s Copy</td>
							</tr>

							<tr>
								<td colspan="2" align="center">
									فیس سکول کیمپس میں جمع نہیں کروائی جا سکتی
								</td>
							</tr>

							<tr>
								<td colspan="2" align="center">Duplicate Changes of Chalan Form: Rs. 50</td>
							</tr>
						</table>
					</td>

				</tr>
			</table>
		</td>

		<td>
			<table class="border-class">
				<tr>
					<td>
						<table style="padding-bottom:40px; padding-top:3px;" >
							<tr>
								<td align="center">
									<p><b><u>'.$voucher_info->school_name.' '.$voucher_info->branch_name.'</u></b><br>'.$voucher_info->address.', '.$voucher_info->city.', '.$voucher_info->state.'.<br>'.$voucher_info->mobileno.'</p>
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<td>
						<table class="border-class" cellpadding="3px;">
							<tr>
								<td colspan="3" align="center" style="background-color: #c6c6c6; "><b>Fee Voucher</b></td>
							</tr>

							<tr>
								<td><b>Challan#:</b></td>
								<td colspan="2"><b>'.$voucher_info->voucher_no.'</b></td>
							</tr>

							<tr>
								<td>IssueDate</td>
								<td colspan="2">'.$issue_date.'</td>
							</tr>

							<tr>
							<td><b>FeeMonth</b></td>
							<td colspan="2"><b>'.get_voucher_month($voucher_info->fee_month).' '.$voucher_info->fee_year.'</b></td>
							</tr>

							<tr>
								<td><b>DueDate</b></td>
								<td colspan="2"><b>'.$due_date.'</b></td>
							</tr>

							<tr>
								<td>Student</td>
								<td colspan="2">'.$voucher_info->student_name.'</td>
							</tr>

							<tr>
								<td>Father Name</td>
								<td colspan="2">'.$voucher_info->parent_name.'</td>
							</tr>

							<tr>
								<td>Class</td>
								<td colspan="2">'.$voucher_info->class_name.' - '.$voucher_info->section_name.'</td>
							</tr>

							<tr>
								<td>Roll No</td>
								<td colspan="2">'.$voucher_info->roll.'</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>

					<td>
						<table class="border-class" cellpadding="3px;">
							<tr>
								<td colspan="2"  align="center" style="background-color: #c6c6c6;"><b>VoucherDetail</b></td>
							</tr>

							<tr>
								<td>Particulars</td>
								<td align="center">Amount</td>
							</tr>

							<tr>
								<td>Fee</td>
								<td align="right">'.$voucher_info->fee_amount.'</td>
							</tr>

							<tr>
								<td>TotalAmount :</td>
								<td align="right">'.$voucher_info->fee_amount.'</td>
							</tr>

							<tr>
								<td colspan="2"  align="center" style="border: none !important;">
									<table class="border-class"  style="padding-bottom:50px;">
										<tr>
											<td style="border: none !important;"> Dues, once paid are non refundable in any case. </td>
										</tr>
									</table>
								</td>
							</tr>

							<tr>
								<td colspan="2" style="border: none !important;">
									<table class="border-class" >
										<tr>
											<td align="left" style="border: none !important;">&nbsp;&nbsp;&nbsp;_________________   </td>
											<td align="right" style="border: none !important;">  _________________&nbsp;&nbsp;&nbsp;&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>

							<tr>
								<td colspan="2" style="border: none !important;">
									<table  class="border-class"  style="padding-bottom:15px;">
										<tr>
											<td align="left" style="border: none !important;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Office  </td>
											<td align="right" style="border: none !important;">  Bank Stamp &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>


							<tr>
								<td colspan="2" align="center" style="border: none !important;">Bank`s Copy</td>
							</tr>

							<tr>
								<td colspan="2" align="center">
									فیس سکول کیمپس میں جمع نہیں کروائی جا سکتی
								</td>
							</tr>

							<tr>
								<td colspan="2" align="center">Duplicate Changes of Chalan Form: Rs. 50</td>
							</tr>
						</table>
					</td>

				</tr>
			</table>
		</td>

		<td>
			<table class="border-class">
				<tr>
					<td>
						<table style="padding-bottom:40px; padding-top:3px;" >
							<tr>
								<td align="center">
									<p><b><u>'.$voucher_info->school_name.' '.$voucher_info->branch_name.'</u></b><br>'.$voucher_info->address.', '.$voucher_info->city.', '.$voucher_info->state.'.<br>'.$voucher_info->mobileno.'</p>
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<td>
						<table class="border-class" cellpadding="3px;">
							<tr>
								<td colspan="3" align="center" style="background-color: #c6c6c6; "><b>Fee Voucher</b></td>
							</tr>

							<tr>
								<td><b>Challan#:</b></td>
								<td colspan="2"><b>'.$voucher_info->voucher_no.'</b></td>
							</tr>

							<tr>
								<td>IssueDate</td>
								<td colspan="2">'.$issue_date.'</td>
							</tr>

							<tr>
								<td><b>FeeMonth</b></td>
								<td colspan="2"><b>'.get_voucher_month($voucher_info->fee_month).' '.$voucher_info->fee_year.'</b></td>
							</tr>

							<tr>
								<td><b>DueDate</b></td>
								<td colspan="2"><b>'.$due_date.'</b></td>>
							</tr>

							<tr>
								<td>Student</td>
								<td colspan="2">'.$voucher_info->student_name.'</td>
							</tr>

							<tr>
								<td>Father Name</td>
								<td colspan="2">'.$voucher_info->parent_name.'</td>
							</tr>

							<tr>
								<td>Class</td>
								<td colspan="2">'.$voucher_info->class_name.' - '.$voucher_info->section_name.'</td>
							</tr>

							<tr>
								<td>Roll No</td>
								<td colspan="2">'.$voucher_info->roll.'</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>

					<td>
						<table class="border-class" cellpadding="3px;">
							<tr>
								<td colspan="2"  align="center" style="background-color: #c6c6c6;"><b>VoucherDetail</b></td>
							</tr>

							<tr>
								<td>Particulars</td>
								<td align="center">Amount</td>
							</tr>

							<tr>
								<td>Fee</td>
								<td align="right">'.$voucher_info->fee_amount.'</td>
							</tr>

							<tr>
								<td>TotalAmount :</td>
								<td align="right">'.$voucher_info->fee_amount.'</td>
							</tr>

							<tr>
								<td colspan="2"  align="center" style="border: none !important;">
									<table class="border-class"  style="padding-bottom:50px;">
										<tr>
											<td style="border: none !important;"> Dues, once paid are non refundable in any case. </td>
										</tr>
									</table>
								</td>
							</tr>

							<tr>
								<td colspan="2" style="border: none !important;">
									<table class="border-class" >
										<tr>
											<td align="left" style="border: none !important;">&nbsp;&nbsp;&nbsp;_________________   </td>
											<td align="right" style="border: none !important;">  _________________&nbsp;&nbsp;&nbsp;&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>

							<tr>
								<td colspan="2" style="border: none !important;">
									<table  class="border-class"  style="padding-bottom:15px;">
										<tr>
											<td align="left" style="border: none !important;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Office  </td>
											<td align="right" style="border: none !important;">  Bank Stamp &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>


							<tr>
								<td colspan="2" align="center" style="border: none !important;">Bank`s Copy</td>
							</tr>

							<tr>
								<td colspan="2" align="center">
									فیس سکول کیمپس میں جمع نہیں کروائی جا سکتی
								</td>
							</tr>

							<tr>
								<td colspan="2" align="center">Duplicate Changes of Chalan Form: Rs. 50</td>
							</tr>
						</table>
					</td>

				</tr>
			</table>
		</td>
	</tr>
</table>
</div>

';

// output the HTML content
$pdf->writeHTML($html, true, false, true, false);



// ---------------------------------------------------------

//Close and output PDF document
$pdf->Output('example_006.pdf', 'I');

