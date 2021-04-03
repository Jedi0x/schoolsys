<?php 
$widget = (is_superadmin_loggedin() ? 4 : 4);
$tabs_active = 'all_vouchers';
if(isset($active_tab)){
	$tabs_active = $active_tab;
}

?>
<section class="panel">
	<div class="tabs-custom">
		<ul class="nav nav-tabs">
			<li class="<?php echo ($tabs_active == 'all_vouchers' ? 'active' : '' ); ?>">
				<a href="#all_vouchers" data-toggle="tab"> <?php echo translate('all_vouchers'); ?></a>
			</li>

			<li class="<?php echo ($tabs_active == 'single_voucher' ? 'active' : '' ); ?>">
				<a href="#single_voucher" data-toggle="tab"> <?php echo translate('create_single_voucher'); ?></a>
			</li>

			<li class="<?php echo ($tabs_active == 'bulk_vouchers' ? 'active' : '' ); ?>">
				<a href="#bulk_vouchers" data-toggle="tab"> <?php echo translate('create_bulk_vouchers'); ?></a>
			</li>

		</ul>
		<div class="tab-content">
			<div id="all_vouchers" class="tab-pane <?php echo ($tabs_active == 'all_vouchers' ? 'active' : '' ); ?>">
				<div class="row">
					<div class="col-md-12">
						<section class="panel appear-animation" data-appear-animation="<?= $global_config['animations'] ?>" data-appear-animation-delay="100">
							<header class="panel-heading">
								<h4 class="panel-title"><i class="fas fa-list"></i> <?php echo translate('fee_vouchers'); ?></h4>
							</header>
							<div class="dx-viewport col-md-12 pt-md  pb-md">        
								<div id="gridContainer">
									<div class="options">
										<div class="caption">Options</div>
										<div class="option">            
											<div id="autoExpand"></div>
										</div>    
									</div>
								</div>
							</div>
						</section>

					</div>
				</div>
			</div>

			<div id="single_voucher" class="tab-pane <?php echo ($tabs_active == 'single_voucher' ? 'active' : '' ); ?>">
				<div class="row">
					<div class="col-md-12">
						<section class="panel">
							<header class="panel-heading">
								<h4 class="panel-title"><?=translate('select_student')?></h4>
							</header>
							<?php echo form_open($this->uri->uri_string(), array('class' => 'validate'));?>
							<input type="hidden" name="active_tab" value="single_voucher">
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

						<?php if (isset($studentlist)):?>
							<section class="panel appear-animation" data-appear-animation="<?=$global_config['animations'] ?>" data-appear-animation-delay="100">
								<?php echo form_open($this->uri->uri_string());?>
								<header class="panel-heading">
									<h4 class="panel-title"><i class="fas fa-list"></i> <?php echo translate('student_list');?></h4>
								</header>
								<div class="panel-body mb-sm">
									<table class="table table-bordered table-condensed table-hover mb-none">
										<thead>
											<tr>
												<th width="80"><?=translate('sl')?></th>
												<th><?=translate('name')?></th>
												<th><?=translate('guardian_name')?></th>
												<th><?=translate('branch_name')?></th>
												<th><?=translate('register_no')?></th>
												<th><?=translate('roll')?></th>
												<th><?=translate('gender')?></th>
												<th><?=translate('mobile_no')?></th>
												<th><?=translate('email')?></th>
												<th><?=translate('action')?></th>
												
											</tr>
										</thead>
										<tbody>
											<?php
											$count = 1; 
											if (count($studentlist)) {
												foreach($studentlist as $row):

													$student_id = $row['student_id'];
													?>
													<tr>
														
														<td><?php echo $count++; ?></td>
														<td><?php echo $row['full_name']; ?></td>
														<td><?php echo (!empty($row['parent_id']) ? get_type_name_by_id('parent', $row['parent_id']) : 'N/A'); ?></td>
														<td><?php echo $row['branch_name']; ?></td>
														<td><?php echo $row['register_no']; ?></td>
														<td><?php echo $row['roll_no']; ?></td>
														<td><?php echo ucfirst($row['gender']); ?></td>
														<td><?php echo $row['mobileno']; ?></td>
														<td><?php echo $row['email']; ?></td>
														<td>
															<a href="javascript:;" class="btn btn-default btn-circle" onclick="create_voucher('<?=$student_id?>');">
																<i class="far fa-arrow-alt-circle-right"></i> <?=translate('create')?>
															</a>
														</td>
														
													</tr>
												<?php endforeach; }else{
													echo '<tr><td colspan="9"><h5 class="text-danger text-center">' . translate('no_information_available') . '</td></tr>'; 
												} ?>
											</tbody>
										</table>
									</div>
									<?php echo form_close();?>
							</section>
						<?php endif;?>
					</div>
				</div>
			</div>

			<div id="bulk_vouchers" class="tab-pane <?php echo ($tabs_active == 'bulk_vouchers' ? 'active' : '' ); ?>">
				<div class="row">
					<div class="col-md-12">
						<section class="panel">
							<header class="panel-heading">
								<h4 class="panel-title"><?=translate('select_student')?></h4>
							</header>
							<?php echo form_open($this->uri->uri_string(), array('class' => 'validate'));?>
							<input type="hidden" name="active_tab" value="bulk_vouchers">
							<div class="panel-body">
								<div class="row mb-sm">

									<div class="col-md-<?php echo $widget; ?>">
										<div class="form-group">
											<label class="control-label"><?=translate('branch')?> <span class="required">*</span></label>
											<?php
											$arrayBranch = $this->app_lib->getSelectList('branch','all');
											echo form_dropdown("branch_id", $arrayBranch, set_value('branch_id'), "class='form-control' id='branch_id'
												data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity'");
												?>
										</div>
									</div>

									<div class="col-md-<?php echo $widget; ?> mb-sm">
										<div class="form-group">
											<label class="control-label"><?=translate('class')?></label>
											<?php
												$arrayClass = $this->app_lib->getClass($branch_id);
												echo form_dropdown("class_id", $arrayClass, set_value('class_id'), "class='form-control' id='class_id' onchange='getSectionByClass(this.value,1)'
													 data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity' ");
													?>
										</div>
									</div>

									<div class="col-md-<?php echo $widget; ?> mb-sm">
										<div class="form-group">
											<label class="control-label"><?=translate('section')?></label>
											<?php
											$arraySection = $this->app_lib->getSections(set_value('class_id'), true);echo form_dropdown("section_id", $arraySection, set_value('section_id'), "class='form-control' id='section_id'
														data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity' ");
														?>
										</div>
									</div>

								</div>
							</div>
							<footer class="panel-footer">
								<div class="row">
									<div class="col-md-offset-10 col-md-2">
										<button type="submit" name="search_bulk" value="1" class="btn btn-default btn-block"> <i class="fas fa-filter"></i> <?=translate('filter')?></button>
									</div>
								</div>
							</footer>
							<?php echo form_close();?>
						</section>

						<?php if (isset($bulkstudentlist)):?>
							<section class="panel appear-animation" data-appear-animation="<?=$global_config['animations'] ?>" data-appear-animation-delay="100">
								<?php echo form_open($this->uri->uri_string());?>
								<header class="panel-heading">
									<h4 class="panel-title"><i class="fas fa-list"></i> <?php echo translate('student_list');?></h4>
								</header>
								<div class="panel-body mb-sm">
									<table class="table table-bordered table-condensed table-hover mb-none">
										<thead>
											<tr>
												<th width="80">
													<div class="checkbox-replace">
														<label class="i-checks"><input type="checkbox" id="selectAllchkbox"><i></i></label>
													</div>
												</th>
												<th width="80"><?=translate('sl')?></th>
												<th><?=translate('name')?></th>
												<th><?=translate('guardian_name')?></th>
												<th><?=translate('branch_name')?></th>
												<th><?=translate('register_no')?></th>
												<th><?=translate('roll')?></th>
												<th><?=translate('gender')?></th>
												<th><?=translate('mobile_no')?></th>
												<th><?=translate('email')?></th>	
											</tr>
										</thead>
										<tbody>
											<?php
											$count = 1; 
											if (count($bulkstudentlist)) {
												foreach($bulkstudentlist as $row):

													$student_id = $row['student_id'];
													?>
													<tr>
														<td class="checked-area">
															<div class="checkbox-replace">
																<label class="i-checks"><input type="checkbox" name="stu_voucehr[]" value="<?=$row['student_id']?>"><i></i></label>
															</div>
														</td>
														<td><?php echo $count++; ?></td>
														<td><?php echo $row['full_name']; ?></td>
														<td><?php echo (!empty($row['parent_id']) ? get_type_name_by_id('parent', $row['parent_id']) : 'N/A'); ?></td>
														<td><?php echo $row['branch_name']; ?></td>
														<td><?php echo $row['register_no']; ?></td>
														<td><?php echo $row['roll_no']; ?></td>
														<td><?php echo ucfirst($row['gender']); ?></td>
														<td><?php echo $row['mobileno']; ?></td>
														<td><?php echo $row['email']; ?></td>
													</tr>
												<?php endforeach; }else{
													echo '<tr><td colspan="9"><h5 class="text-danger text-center">' . translate('no_information_available') . '</td></tr>'; 
												} ?>
											</tbody>
										</table>
									</div>
									<footer class="panel-footer">
										<div class="row">
											<div class="col-md-offset-10 col-md-2">
												<a  class="btn btn-default btn-block create_vouchers"> <i class="fas fa-plus-circle"></i> <?=translate('create_voucher')?></a>
											</div>
										</div>
									</footer>
									<?php echo form_close();?>
							</section>
						<?php endif;?>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>

<!-- Create Voucher Modal -->
<div id="createVoucherModal" class="zoom-anim-dialog modal-block modal-block-lg mfp-hide">
    <section class="panel">
        <div class="panel-heading">
            <h4 class="panel-title"><i class="fas fa-plus-circle"></i> <?php echo translate('create_voucher'); ?></h4>
        </div>
		<?php echo form_open($this->uri->uri_string(), array('class' => 'form-horizontal frm-submit')); ?>
			<div class="panel-body">

			<div id="create_single_voucher_hidden_feilds"></div>

			<div class="form-group">
				<label class="col-md-3 control-label"><?=translate('carry_balance')?></label>
				<div class="col-md-6 mb-md">
					<div class="checkbox-replace mt-sm pr-xs">
						<input type="checkbox" name="carry_balance">
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-3 control-label"><?=translate('fee_month');?> <span class="required">*</span></label>
				<div class="col-md-9">
					<?php
					$array_months = $this->app_lib->get_months();
					echo form_dropdown("fee_month[]", $array_months, set_value('fee_month'), "class='form-control' id='frequency_type'
						data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity' multiple='multiple'" );
						?>
					<span class="error"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-3 control-label"><?=translate('due_date');?> <span class="required">*</span></label>
				<div class="col-md-9">
	                <input type="text" class="form-control" data-plugin-datepicker data-plugin-options='{"startView": 1}' autocomplete="off" name="due_date" id="due_date" value="<?=set_value('due_date',date("Y-m-d"))?>" />
					<span class="error"></span>
				</div>
			</div>


			<div class="form-group">
				<label class="col-md-3 control-label"><?=translate('valid_date');?> <span class="required">*</span></label>
				<div class="col-md-9">
	                <input type="text" class="form-control" data-plugin-datepicker data-plugin-options='{"startView": 1}' autocomplete="off" name="valid_date" id="valid_date" value="<?=set_value('valid_date',date("Y-m-d"))?>" />
					<span class="error"></span>
				</div>
			</div>

			

			<div class="form-group mb-md">
				<label class="col-md-3 control-label"><?=translate('fee_instruction')?></label>
				<div class="col-md-9">
					<textarea class="form-control" rows="4" name="fee_instruction" placeholder="Enter your Fee Instruction"><?=set_value('fee_instruction')?></textarea>
				</div>
			</div>
			</div>
		    <footer class="panel-footer">
		        <div class="row">
		            <div class="col-md-12 text-right">
		                <button type="submit" class="btn btn-default mr-xs" data-loading-text="<i class='fas fa-spinner fa-spin'></i> Processing">
		                    <i class="fas fa-plus-circle"></i> <?=translate('create_voucher') ?>
		                </button>
		                <button class="btn btn-default modal-dismiss"><?=translate('cancel') ?></button>
		            </div>
		        </div>
		    </footer>
		<?php echo form_close();?>
    </section>
</div>


<script type="text/javascript">
	$(document).ready(function () {
		$('#branch_id').on('change', function(){
			var branchID = $(this).val();

			getClassByBranch(branchID);


		    $.ajax({
		        url: base_url + 'fees/getGroupByBranch',
		        type: 'POST',
		        data: {
		            'branch_id' : branchID,
		        },
		        success: function (data) {
		            $('#groupID').html(data);
		        }
		    });
		});
	});
</script>

<script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
<link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/20.2.5/css/dx.common.css" />
<link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/20.2.5/css/dx.light.css" />
<script src="https://cdn3.devexpress.com/jslib/20.2.5/js/dx.all.js"></script>




<script>
    $(function () {
        var dataGrid = $("#gridContainer").dxDataGrid({
            dataSource: orders,
            columnsAutoWidth: true,
            showBorders: true,
            grouping: {
                autoExpandAll: true,
            },
            paging: {
                pageSize: 100
            },
            groupPanel: {
                visible: true
            },
            filterRow: {
                visible: true,
                applyFilter: "auto"
            },
            searchPanel: {
                visible: true,
                width: 240,
                placeholder: "Search..."
            },
            headerFilter: {
                visible: true
            },
            columns: [
                {
                    dataField: "voucher_no",
                    caption: "Voucher No",
                    width: 140,
                    headerFilter: {
                        groupInterval: 10000
                    }
                },{
                    dataField: "student_name",
                    caption: "Student",
                    width: 140,
                    headerFilter: {
                        groupInterval: 10000
                    }
                }, {
                    caption: "Register No",
                    dataField: "register_no",
                    headerFilter: {
                        allowSearch: true
                    }
                }, {
                    caption: "Mobile No",
                    dataField: "mobileno",
                    headerFilter: {
                        allowSearch: true
                    }
                }, {
                    caption: "Section Name",
                    dataField: "section_name",
                    headerFilter: {
                        allowSearch: true
                    }
                }, {
                    caption: "Class Name",
                    dataField: "class_name",
                    headerFilter: {
                        allowSearch: true
                    }
                }, {
                    caption: "Fee Month",
                    dataField: "fee_month",
                    headerFilter: {
                        allowSearch: true
                    }
                }
            ]
        }).dxDataGrid('instance');

        var applyFilterTypes = [{
                key: "auto",
                name: "Immediately"
            }, {
                key: "onClick",
                name: "On Button Click"
            }];

        var applyFilterModeEditor = $("#useFilterApplyButton").dxSelectBox({
            items: applyFilterTypes,
            value: applyFilterTypes[0].key,
            valueExpr: "key",
            displayExpr: "name",
            onValueChanged: function (data) {
                dataGrid.option("filterRow.applyFilter", data.value);
            }
        }).dxSelectBox("instance");

        $("#filterRow").dxCheckBox({
            text: "Filter Row",
            value: true,
            onValueChanged: function (data) {
                dataGrid.clearFilter();
                dataGrid.option("filterRow.visible", data.value);
                applyFilterModeEditor.option("disabled", !data.value);
            }
        });

        $("#headerFilter").dxCheckBox({
            text: "Header Filter",
            value: true,
            onValueChanged: function (data) {
                dataGrid.clearFilter();
                dataGrid.option("headerFilter.visible", data.value);
            }
        });

        function getOrderDay(rowData) {
            return (new Date(rowData.OrderDate)).getDay();
        }

        $("#autoExpand").dxCheckBox({
            value: true,
            text: "Expand All Groups",
            onValueChanged: function (data) {
                dataGrid.option("grouping.autoExpandAll", data.value);
            }
        });
    });

    var orders = <?= json_encode($all_vouchers); ?>;
</script>

<style>
    .dx-theme-generic-typography{
        overflow-y: auto;
    }
    .dx-widget {
        width: 1800px;
    }
    .dx-widget tr.dx-datagrid-filter-row{
        display: none;
    }
</style>