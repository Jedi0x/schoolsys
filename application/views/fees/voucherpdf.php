<?php


$pdf->SetFont('dejavusans', '', 7);

$header = '
<table style="color: #fff; padding:35px;">
    <tbody>
        <tr>
            <td></td>
        </tr>
    </tbody>
</table>';

$pdf->writeHTML($header, false, false, false, false, '');



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
									<p><b><u>EFA School System Abu Bakar Campus</u></b><br>C-229, Gulshan-e-Ravi, Lahore.<br>03007404445</p>
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
								<td><b>248</b></td>
								<td rowspan="4">&nbsp;&nbsp;&nbsp;</td>
							</tr>

							<tr>
								<td>IssueDate</td>
								<td>02/12/2019</td>
							</tr>

							<tr>
								<td><b>FeeMonth</b></td>
								<td><b>February2019</b></td>
							</tr>

							<tr>
								<td><b>DueDate</b></td>
								<td><b>02/10/2019</b></td>
							</tr>

							<tr>
								<td>Student</td>
								<td colspan="2">Abdul Hanan</td>
							</tr>

							<tr>
								<td>Father Name</td>
								<td colspan="2">Muhammad Usman</td>
							</tr>

							<tr>
								<td>Class</td>
								<td colspan="2">Playgroup-A</td>
							</tr>

							<tr>
								<td>Roll No</td>
								<td colspan="2">119822</td>
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
								<td align="right">1,200</td>
							</tr>

							<tr>
								<td>TotalAmount :</td>
								<td align="right">1,200</td>
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
									<p><b><u>EFA School System Abu Bakar Campus</u></b><br>C-229, Gulshan-e-Ravi, Lahore.<br>03007404445</p>
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
								<td><b>248</b></td>
								<td rowspan="4">&nbsp;&nbsp;&nbsp;</td>
							</tr>

							<tr>
								<td>IssueDate</td>
								<td>02/12/2019</td>
							</tr>

							<tr>
								<td><b>FeeMonth</b></td>
								<td><b>February2019</b></td>
							</tr>

							<tr>
								<td><b>DueDate</b></td>
								<td><b>02/10/2019</b></td>
							</tr>

							<tr>
								<td>Student</td>
								<td colspan="2">Abdul Hanan</td>
							</tr>

							<tr>
								<td>Father Name</td>
								<td colspan="2">Muhammad Usman</td>
							</tr>

							<tr>
								<td>Class</td>
								<td colspan="2">Playgroup-A</td>
							</tr>

							<tr>
								<td>Roll No</td>
								<td colspan="2">119822</td>
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
								<td align="right">1,200</td>
							</tr>

							<tr>
								<td>TotalAmount :</td>
								<td align="right">1,200</td>
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
									<p><b><u>EFA School System Abu Bakar Campus</u></b><br>C-229, Gulshan-e-Ravi, Lahore.<br>03007404445</p>
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
								<td><b>248</b></td>
								<td rowspan="4">&nbsp;&nbsp;&nbsp;</td>
							</tr>

							<tr>
								<td>IssueDate</td>
								<td>02/12/2019</td>
							</tr>

							<tr>
								<td><b>FeeMonth</b></td>
								<td><b>February2019</b></td>
							</tr>

							<tr>
								<td><b>DueDate</b></td>
								<td><b>02/10/2019</b></td>
							</tr>

							<tr>
								<td>Student</td>
								<td colspan="2">Abdul Hanan</td>
							</tr>

							<tr>
								<td>Father Name</td>
								<td colspan="2">Muhammad Usman</td>
							</tr>

							<tr>
								<td>Class</td>
								<td colspan="2">Playgroup-A</td>
							</tr>

							<tr>
								<td>Roll No</td>
								<td colspan="2">119822</td>
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
								<td align="right">1,200</td>
							</tr>

							<tr>
								<td>TotalAmount :</td>
								<td align="right">1,200</td>
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
									<p><b><u>EFA School System Abu Bakar Campus</u></b><br>C-229, Gulshan-e-Ravi, Lahore.<br>03007404445</p>
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
								<td><b>248</b></td>
								<td rowspan="4">&nbsp;&nbsp;&nbsp;</td>
							</tr>

							<tr>
								<td>IssueDate</td>
								<td>02/12/2019</td>
							</tr>

							<tr>
								<td><b>FeeMonth</b></td>
								<td><b>February2019</b></td>
							</tr>

							<tr>
								<td><b>DueDate</b></td>
								<td><b>02/10/2019</b></td>
							</tr>

							<tr>
								<td>Student</td>
								<td colspan="2">Abdul Hanan</td>
							</tr>

							<tr>
								<td>Father Name</td>
								<td colspan="2">Muhammad Usman</td>
							</tr>

							<tr>
								<td>Class</td>
								<td colspan="2">Playgroup-A</td>
							</tr>

							<tr>
								<td>Roll No</td>
								<td colspan="2">119822</td>
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
								<td align="right">1,200</td>
							</tr>

							<tr>
								<td>TotalAmount :</td>
								<td align="right">1,200</td>
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

