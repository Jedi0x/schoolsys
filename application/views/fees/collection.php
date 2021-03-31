<?php $widget = (is_superadmin_loggedin() ? 4 : 6); ?>
<div class="row">
	<div class="col-md-12">
		<section class="panel">
			<header class="panel-heading">
				<h4 class="panel-title"><?=translate('select_ground')?></h4>
			</header>
			<?php echo form_open($this->uri->uri_string(), array('class' => 'validate'));?>
			<div class="panel-body">
				<div class="row mb-sm">
					<div class="col-md-4 mb-sm">
						<div class="form-group">
							<label class="control-label"><?=translate('student_name')?></label>
							<input type="text" class="form-control" name="student_name" value="<?=set_value('student_name')?>"/>

						</div>
					</div>
					<div class="col-md-4 mb-sm">
						<div class="form-group">
							<label class="control-label"><?=translate('father_name')?></label>
							<input type="text" class="form-control" name="father_name" value="<?=set_value('father_name')?>" />

						</div>
					</div>
					<div class="col-md-4 mb-sm">
						<div class="form-group">
							<label class="control-label"><?=translate('registration_no')?></label>
							<input type="text" class="form-control" name="registration_no" value="<?=set_value('registration_no')?>" />

						</div>
					</div>
				</div>

				<div class="row mb-sm">
					<div class="col-md-4 mb-sm">
						<div class="form-group">
							<label class="control-label"><?=translate('roll_no')?></label>
							<input type="text" class="form-control" name="roll_no"  value="<?=set_value('roll_no')?>"/>

						</div>
					</div>
					<div class="col-md-4 mb-sm">
						<div class="form-group">
							<label class="control-label"><?=translate('father_mobile_no')?></label>
							<input type="text" class="form-control" name="father_mobile_no" value="<?=set_value('father_mobile_no')?>" />

						</div>
					</div>
					<div class="col-md-4 mb-sm">
						<div class="form-group">
							<label class="control-label"><?=translate('father_nic_no')?></label>
							<input type="text" class="form-control" name="father_nic_no" value="<?=set_value('father_nic_no')?>" />
						</div>
					</div>
				</div>

				<div class="row mb-sm">
					<div class="col-md-4 mb-sm">
						<div class="form-group">
							<label class="control-label"><?=translate('voucher_no')?></label>
							<input type="text" class="form-control" name="voucher_no"  value="<?=set_value('voucher_no')?>"/>

						</div>
					</div>
					<div class="col-md-4 mb-sm">
						<div class="form-group">
							<label class="control-label"><?=translate('voucher_bar_code')?></label>
							<input type="text" class="form-control" name="voucher_bar_code" value="<?=set_value('voucher_bar_code')?>" />

						</div>
					</div>
					<div class="col-md-4 mb-sm">
						<div class="form-group">
							<label class="control-label"><?=translate('bio_matric_impression')?></label>
							<input type="text" class="form-control" name="bio_matric_impression" value="<?=set_value('bio_matric_impression')?>" />
						</div>
					</div>
				</div>
			</div>
			<footer class="panel-footer">
				<div class="row">
					<div class="col-md-offset-10 col-md-2">
						<button type="submit" name="search" value="1" class="btn btn-default btn-block"> <i class="fas fa-filter"></i> <?=translate('filter')?></button>
					</div>
				</div>
			</footer>
			<?php echo form_close();?>
		</section>
<?php if (isset($voucherlist)): ?>
		<section class="panel appear-animation" data-appear-animation="<?php echo $global_config['animations'];?>" data-appear-animation-delay="100">
			<?php echo form_open('fees/invoicePrint', array('class' => 'printIn')); ?>
			<header class="panel-heading">
				<h4 class="panel-title"><i class="fas fa-list-ol"></i> <?=translate('invoice_list')?></h4>
			</header>
			<div class="panel-body">
				<div class="mb-md mt-md">
					<div class="export_title"><?=translate('voucher') . " " . translate('list')?></div>
					<table class="table table-bordered table-condensed table-hover mb-none tbr-top table-export">
						<thead>
							<tr>
								<!-- <th class="hidden-print"> 
									<div class="checkbox-replace">
										<label class="i-checks" data-toggle="tooltip" data-original-title="Print Show / Hidden">
											<input type="checkbox" name="select-all" id="selectAllchkbox"> <i></i>
										</label>
									</div>
								</th> -->
								<th><?=translate('voucher_no')?></th>
								<th><?=translate('student')?></th>
								<th><?=translate('class')?></th>
								<th><?=translate('section')?></th>
								<th><?=translate('register_no')?></th>
								<th><?=translate('roll')?></th>
								<th><?=translate('mobile_no')?></th>
								<th><?=translate('fee_group')?></th>
								<th><?=translate('status')?></th>
								<th><?=translate('action')?></th>
							</tr>
						</thead>
						<tbody>
							<?php $count = 1; foreach($voucherlist as $row): ?>

							<?php 
							$student_id =  $row['student_id'];
							$fee_voucher_id = $row['fee_voucher_id'];
							?>
							<tr>
								<!-- <td class="hidden-print checked-area hidden-print">
									<div class="checkbox-replace">
										<label class="i-checks"><input type="checkbox" name="student_id[]" value="<?=$row['student_id']?>"><i></i></label>
									</div>
								</td> -->
								<td><?php echo $row['voucher_no'];?></td>
								<td><?php echo $row['first_name'] . ' ' . $row['last_name'];?></td>
								<td><?php echo $row['class_name'];?></td>
								<td><?php echo $row['section_name'];?></td>
								<td><?php echo $row['register_no'];?></td>
								<td><?php echo $row['roll'];?></td>
								<td><?php echo $row['mobileno'];?></td>
								<td><?php 
								foreach ($row['feegroup'] as $key => $value) {
									echo "- " . $value['name'] . "<br>";
								} ?></td>
								<td>
									<?php
										$labelmode = '';
										$status = $this->fees_model->getInvoiceStatus($row['student_id'])['status'];
										if($status == 'unpaid') {
											$status = translate('unpaid');
											$labelmode = 'label-danger-custom';
										} elseif($status == 'partly') {
											$status = translate('partly_paid');
											$labelmode = 'label-info-custom';
										} elseif($status == 'total') {
											$status = translate('total_paid');
											$labelmode = 'label-success-custom';
										}
										echo "<span class='value label " . $labelmode . " '>" . $status . "</span>";
									?>
								</td>
								<td>
									<!-- collect payment -->
								<?php if (get_permission('collect_fees', 'is_add')) { ?>
									<a  href="javascript:;" class="btn btn-default btn-circle" onclick="collect_fees('<?=$student_id?>','<?=$fee_voucher_id?>');">
										<i class="far fa-arrow-alt-circle-right"></i> <?=translate('collect')?>
									</a>
								<?php } ?>

									<!-- delete link -->
									<a class="btn btn-danger icon btn-circle" onclick="confirm_modal('<?=base_url('fees/invoice_delete/' . $row['student_id'])?>')"><i class="fas fa-trash-alt"></i></a>
								</td>
							</tr>
							<?php  endforeach; ?>
						</tbody>
					</table>
				</div>
			</div>
			<?php echo form_close(); ?>
		</section>
<?php endif; ?>
	</div>
</div>

<!-- Fee Collect Modal -->
<div id="feeCollectModal" class="zoom-anim-dialog modal-block modal-block-lg mfp-hide">
    <section class="panel">
        <div class="panel-heading">
            <h4 class="panel-title"><i class="fas fa-plus-circle"></i> <?php echo translate('fee_collect'); ?></h4>
        </div>
		<?php echo form_open($this->uri->uri_string(), array('class' => 'form-horizontal frm-submit')); ?>
		<div class="panel-body">

			<div id="fee_collect_hidden_feilds"></div>

			
			
			<div class="form-group mb-md">
				<label class="control-label"><?php echo translate('paid_amount'); ?> <span class="required">*</span></label>
				<input type="number" min="0" class="form-control" value="" name="paid_amount" id="paid_amount" />
				<span class="error"></span>
			</div>
		</div>

		<footer class="panel-footer">
			<div class="row">
				<div class="col-md-12 text-right">
					<button type="submit" class="btn btn-default mr-xs" data-loading-text="<i class='fas fa-spinner fa-spin'></i> Processing">
						<i class="fas fa-plus-circle"></i> <?=translate('collect') ?>
					</button>
					<button class="btn btn-default modal-dismiss"><?=translate('cancel') ?></button>
				</div>
			</div>
		</footer>
		<?php echo form_close();?>
    </section>
</div>
