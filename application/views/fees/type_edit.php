<section class="panel">
	<div class="tabs-custom">
		<ul class="nav nav-tabs">
			<li>
				<a href="<?=base_url('fees/type')?>"><i class="fas fa-list-ul"></i> <?php echo translate('fees_type') . " " . translate('list'); ?></a>
			</li>
			<li class="active">
				<a href="#create" data-toggle="tab"><i class="far fa-edit"></i> <?php echo translate('edit') . " " . translate('fees_type'); ?></a>
			</li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="create">
				<?php echo form_open($this->uri->uri_string(), array('class' => 'form-horizontal form-bordered frm-submit')); ?>
				<input type="hidden" name="type_id" value="<?=$category['id']?>">
				<input type="hidden" name="voucher_type" value="expense">
					<?php if (is_superadmin_loggedin() ): ?>
					<div class="form-group">
						<label class="control-label col-md-3"><?=translate('branch')?> <span class="required">*</span></label>
						<div class="col-md-6">
							<?php
								$arrayBranch = $this->app_lib->getSelectList('branch');
								echo form_dropdown("branch_id", $arrayBranch, $category['branch_id'], "class='form-control' id='branch_id'
								data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity'");
							?>
							<span class="error"></span>
						</div>
					</div>
					<?php endif; ?>
					<div class="form-group">
						<label class="col-md-3 control-label"><?php echo translate('name'); ?> <span class="required">*</span></label>
						<div class="col-md-6">
							<input type="text" class="form-control" name="type_name" value="<?=$category['name']?>" />
							<span class="error"></span>
						</div>
					</div>	

					<!-- Added by JR -->
					<div class="form-group">
						<label  class="col-md-3 control-label"><?php echo translate('frequency'); ?> <span class="required">*</span></label>
						<div class="col-md-6">
							<div class="radio-custom radio-success radio-inline mb-xs">
								<input type="radio" value="1" name="frequency_type"  id="sstatus_1" <?= $category['frequency_type'] == 1 ? 'checked': '' ?>>
								<label for="sstatus_1"><?=translate('one_time_fee')?></label>
							</div>

							<div class="radio-custom radio-success radio-inline mb-xs">
								<input type="radio" value="2" name="frequency_type" id="sstatus_2"  <?= $category['frequency_type'] == 2 ? 'checked': '' ?>>
								<label for="sstatus_2"><?=translate('monthly')?></label>
							</div>

							<div class="radio-custom radio-success radio-inline">
								<input type="radio" value="3" name="frequency_type" id="sstatus_3"  <?= $category['frequency_type'] == 3 ? 'checked': '' ?>>
								<label for="sstatus_3"><?=translate('choose')?></label>
							</div>
						</div>
					</div>

					<div class="form-group month-options <?= $category['frequency_type'] == 3 ? '': 'mfp-hide' ?>">
						<label class="control-label col-md-3"><?=translate('select_months')?> <span class="required">*</span></label>
						<div class="col-md-6">
							<?php
								$array_months = $this->app_lib->get_months();
								echo form_dropdown("frequency[]", $array_months, unserialize($category['frequency']), "class='form-control' id='frequency_type'
								data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity' multiple='multiple'" );
							?>
							<span class="error"></span>
						</div>
					</div>


					<!-- END  -->

					<div class="form-group">
						<label class="col-md-3 control-label"><?php echo translate('description'); ?></label>
						<div class="col-md-6 mb-md">
							<textarea class="form-control" id="description" name="description" placeholder="" rows="3"><?=$category['description']?></textarea>
						</div>
					</div>
					<footer class="panel-footer">
						<div class="row">
							<div class="col-md-2 col-md-offset-3">
								<button type="submit" class="btn btn-default btn-block" data-loading-text="<i class='fas fa-spinner fa-spin'></i> Processing">
									<i class="fas fa-plus-circle"></i> <?php echo translate('update'); ?>
								</button>
							</div>
						</div>	
					</footer>
				<?php echo form_close(); ?>
			</div>
		</div>
	</div>
</section>