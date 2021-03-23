<?php $currency_symbol = $global_config['currency_symbol']; ?>
<section class="panel">
	<div class="tabs-custom">
		<ul class="nav nav-tabs">
			<li class="active">
				<a href="#list" data-toggle="tab"><i class="fas fa-list-ul"></i> <?php echo translate('fees_type') . " " . translate('list'); ?></a>
			</li>
<?php if (get_permission('fees_type', 'is_add')){ ?>
			<li>
				<a href="#create" data-toggle="tab"><i class="far fa-edit"></i> <?php echo translate('add') . " " . translate('fees_type'); ?></a>
			</li>
<?php } ?>
		</ul>
		<div class="tab-content">
			<div id="list" class="tab-pane active">
				<div class="mb-md">
					<div class="export_title">Fees Type List</div>
					<table class="table table-bordered table-hover table-condensed table-export">
						<thead>
							<tr>
								<th width="50"><?php echo translate('sl'); ?></th>
							<?php if (is_superadmin_loggedin()): ?>
								<th><?=translate('branch')?></th>
							<?php endif; ?>
								<th><?=translate('name')?></th>
								<th><?=translate('fee_code')?></th>
								<th><?=translate('description')?></th>
								<th><?=translate('action')?></th>
							</tr>
						</thead>
						<tbody>
							<?php $count = 1; foreach ($categorylist as $row): ?>
							<tr>
								<td><?php echo $count++; ?></td>
							<?php if (is_superadmin_loggedin()): ?>
								<td><?php echo get_type_name_by_id('branch', $row['branch_id']);?></td>
							<?php endif; ?>
								<td><?php echo $row['name']; ?></td>
								<td><?php echo $row['fee_code']; ?></td>
								<td><?php echo $row['description']; ?></td>
								<td>
									<?php if (get_permission('fees_type', 'is_edit')): ?>
										<a href="<?php echo base_url('fees/type_edit/' . $row['id']); ?>" class="btn btn-circle btn-default icon"
										data-toggle="tooltip" data-original-title="<?php echo translate('edit'); ?>"> 
											<i class="fas fa-pen-nib"></i>
										</a>
									<?php endif; if (get_permission('fees_type', 'is_delete')): ?>
										<?php echo btn_delete('fees/type_delete/' . $row['id']); ?>
									<?php endif; ?>
								</td>
							</tr>
							<?php endforeach; ?>
						</tbody>
					</table>
				</div>
			</div>
<?php if (get_permission('fees_type', 'is_add')){ ?>
			<div class="tab-pane" id="create">
				<?php echo form_open($this->uri->uri_string(), array('class' => 'form-horizontal form-bordered frm-submit')); ?>
				<input type="hidden" name="voucher_type" value="expense">
					<?php if (is_superadmin_loggedin() ): ?>
					<div class="form-group">
						<label class="control-label col-md-3"><?=translate('branch')?> <span class="required">*</span></label>
						<div class="col-md-6">
							<?php
								$arrayBranch = $this->app_lib->getSelectList('branch');
								echo form_dropdown("branch_id", $arrayBranch, set_value('branch_id'), "class='form-control' id='branch_id'
								data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity'");
							?>
							<span class="error"></span>
						</div>
					</div>
					<?php endif; ?>
					<div class="form-group">
						<label class="col-md-3 control-label"><?php echo translate('name'); ?> <span class="required">*</span></label>
						<div class="col-md-6">
							<input type="text" class="form-control" name="type_name" value="<?=set_value('type_name')?>" />
							<span class="error"></span>
						</div>
					</div>

					<!-- Added by JR -->
					<div class="form-group">
						<label  class="col-md-3 control-label"><?php echo translate('frequency'); ?> <span class="required">*</span></label>
						<div class="col-md-6">
							<div class="radio-custom radio-success radio-inline mb-xs">
								<input type="radio" value="1" name="frequency_type"  id="sstatus_1" checked>
								<label for="sstatus_1"><?=translate('one_time_fee')?></label>
							</div>

							<div class="radio-custom radio-success radio-inline mb-xs">
								<input type="radio" value="2" name="frequency_type" id="sstatus_2">
								<label for="sstatus_2"><?=translate('monthly')?></label>
							</div>

							<div class="radio-custom radio-success radio-inline">
								<input type="radio" value="3" name="frequency_type" id="sstatus_3">
								<label for="sstatus_3"><?=translate('choose')?></label>
							</div>
						</div>
					</div>

					<div class="form-group month-options mfp-hide">
						<label class="control-label col-md-3"><?=translate('select_months')?> <span class="required">*</span></label>
						<div class="col-md-6">
							<?php
								$array_months = $this->app_lib->get_months();
								echo form_dropdown("frequency[]", $array_months, set_value('frequency_type'), "class='form-control' id='frequency_type'
								data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity' multiple='multiple'" );
							?>
							<span class="error"></span>
						</div>
					</div>


					<!-- END  -->

					<div class="form-group">
						<label class="col-md-3 control-label"><?php echo translate('description'); ?></label>
						<div class="col-md-6 mb-md">
							<textarea class="form-control" id="description" name="description" placeholder="" rows="3" ></textarea>
						</div>
					</div>
					<footer class="panel-footer">
						<div class="row">
							<div class="col-md-2 col-md-offset-3">
								<button type="submit" class="btn btn-default btn-block" data-loading-text="<i class='fas fa-spinner fa-spin'></i> Processing">
									<i class="fas fa-plus-circle"></i> <?php echo translate('save'); ?>
								</button>
							</div>
						</div>	
					</footer>
				<?php echo form_close(); ?>
			</div>
<?php } ?>
		</div>
	</div>
</section>