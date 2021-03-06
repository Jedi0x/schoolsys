<?php $widget = (is_superadmin_loggedin() ? 4 : 6); ?>
<div class="row">
    <div class="col-md-12">
        <section class="panel">
            <header class="panel-heading">
                <h4 class="panel-title"><?= translate('select_ground') ?></h4>
            </header>
            <?php echo form_open($this->uri->uri_string(), array('class' => 'validate')); ?>
            <div class="panel-body">
                <div class="row mb-sm">
                    <?php if (is_superadmin_loggedin()): ?>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label"><?= translate('branch') ?></label>
                                <?php
                                $arrayBranch = $this->app_lib->getSelectList('branch');
                                echo form_dropdown("branch_id", $arrayBranch, set_value('branch_id'), "class='form-control' onchange='getClassByBranch(this.value)'
								data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity'");
                                ?>
                            </div>
                        </div>
                    <?php endif; ?>
                    <div class="col-md-<?php echo $widget; ?> mb-sm">
                        <div class="form-group">
                            <label class="control-label"><?= translate('class') ?></label>
                            <?php
                            $arrayClass = $this->app_lib->getClass($branch_id);
                            echo form_dropdown("class_id", $arrayClass, set_value('class_id'), "class='form-control' id='class_id' onchange='getSectionByClass(this.value,1)'
								 data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity' ");
                            ?>
                        </div>
                    </div>
                    <div class="col-md-<?php echo $widget; ?> mb-sm">
                        <div class="form-group">
                            <label class="control-label"><?= translate('section') ?></label>
                            <?php
                            $arraySection = $this->app_lib->getSections(set_value('class_id'), true);
                            echo form_dropdown("section_id", $arraySection, set_value('section_id'), "class='form-control' id='section_id'
								data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity' ");
                            ?>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="panel-footer">
                <div class="row">
                    <div class="col-md-offset-10 col-md-2">
                        <button type="submit" name="search" value="1" class="btn btn-default btn-block"> <i class="fas fa-filter"></i> <?= translate('filter') ?></button>
                    </div>
                </div>
            </footer>
            <?php echo form_close(); ?>
        </section>

        <?php if (isset($inquiries)): ?>
            <section class="panel appear-animation" data-appear-animation="<?= $global_config['animations'] ?>" data-appear-animation-delay="100">
                <header class="panel-heading">
                    <div class="panel-btn">
                        <button class="btn btn-default btn-circle" id="student_bulk_delete" data-loading-text="<i class='fas fa-spinner fa-spin'></i> Processing">
                            <i class="fas fa-trash-alt"></i> <?= translate('bulk_delete') ?>
                        </button>
                    </div>
                    <h4 class="panel-title"><i class="fas fa-user-graduate"></i> <?php echo translate('inquiry_list'); ?></h4>
                </header>
                <div class="panel-body mb-md">
                    <table class="table table-bordered table-condensed table-hover table-export">
                        <thead>
                            <tr>
                                <th width="10" class="no-sort">
                                    <div class="checkbox-replace">
                                        <label class="i-checks"><input type="checkbox" id="selectAllchkbox"><i></i></label>
                                    </div>
                                </th>
                                <th width="180"><?= translate('name') ?></th>
                                <th><?= translate('gender') ?></th>
                                <th><?= translate('branch') ?></th>
                                <th><?= translate('class') ?></th>
                                <th><?= translate('section') ?></th>
                                <th><?= translate('category') ?></th>
                                <th><?= translate('inquiry_no') ?></th>
                                <th><?= translate('guardian_name') ?></th>
                                <th><?= translate('guardian_relation') ?></th>
                                <th><?= translate('guardian_office') ?></th>
                                <th><?= translate('guardian_mobile') ?></th>
                                <th><?= translate('guardian_email') ?></th>
                                <th class="no-sort"><?= translate('previous_remarks') ?></th>
                                <th><?= translate('action') ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($inquiries as $row): ?>
                                <tr>
                                    <td class="checked-area">
                                        <div class="checkbox-replace">
                                            <label class="i-checks">
                                                <input type="checkbox" class="cb_bulkdelete" id="<?= $row['id'] ?>"><i></i>
                                            </label>
                                        </div>
                                    </td>
                                    <td class="min-w-lg"><?php echo $row['first_name']. ' ' .$row['last_name']; ?></td>
                                    <td><?php echo $row['gender']; ?></td>
                                    <td><?php echo $row['branch_name']; ?></td>
                                    <td><?php echo $row['class_name']; ?></td>
                                    <td><?php echo $row['section_name']; ?></td>
                                    <td><?php echo $row['category_name']; ?></td>
                                    <td class="min-w-sm"><?php echo $row['inquiry_no']; ?></td>
                                    <td class="min-w-sm"><?php echo $row['grd_name']; ?></td>
                                    <td><?php echo $row['grd_relation']; ?></td>
                                    <td><?php echo $row['gdr_office_no']; ?></td>
                                    <td><?php echo $row['grd_mobileno']; ?></td>
                                    <td><?php echo $row['grd_email']; ?></td>
                                    <td class="min-w-lg"><?php echo $row['previous_remarks']; ?></td>
                                    
                                    <td class="min-w-sm">
                                        <!-- quick view -->
<!--                                        <a href="javascript:void(0);" onclick="studentQuickView('<?= $row['id'] ?>');" 
                                           class="btn btn-default btn-circle icon" data-toggle="tooltip"
                                           data-original-title="<?= translate('quick_view') ?>">
                                            <i class="fas fa-qrcode"></i>
                                        </a>-->
                                        <?php echo btn_delete('inquiry/delete_data/' . $row['id'] . '/' . $row['inquiry_no']); ?>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </section>
        <?php endif; ?>
    </div>
</div>

<div class="zoom-anim-dialog modal-block modal-block-primary mfp-hide" id="quickView">
    <section class="panel">
        <header class="panel-heading">
            <h4 class="panel-title">
                <i class="far fa-user-circle"></i> <?= translate('quick_view') ?>
            </h4>
        </header>
        <div class="panel-body">
            <div class="quick_image">
                <img alt="" class="user-img-circle" id="quick_image" src="<?= base_url('uploads/app_image/defualt.png') ?>" width="120" height="120">
            </div>
            <div class="text-center">
                <h4 class="text-weight-semibold mb-xs" id="quick_full_name"></h4>
                <p><?= translate('student') ?> / <span id="quick_category"></p>
            </div>
            <div class="table-responsive mt-md mb-md">
                <table class="table table-striped table-bordered table-condensed mb-none">
                    <tbody>
                        <tr>
                            <th><?= translate('register_no') ?></th>
                            <td><span id="quick_register_no"></span></td>
                            <th><?= translate('roll') ?></th>
                            <td><span id="quick_roll"></span></td>
                        </tr>
                        <tr>
                            <th><?= translate('admission_date') ?></th>
                            <td><span id="quick_admission_date"></span></td>
                            <th><?= translate('date_of_birth') ?></th>
                            <td><span id="quick_date_of_birth"></span></td>
                        </tr>
                        <tr>
                            <th><?= translate('blood_group') ?></th>
                            <td><span id="quick_blood_group"></span></td>
                            <th><?= translate('religion') ?></th>
                            <td><span id="quick_religion"></span></td>
                        </tr>
                        <tr>
                            <th><?= translate('email') ?></th>
                            <td colspan="3"><span id="quick_email"></span></td>
                        </tr>
                        <tr>
                            <th><?= translate('mobile_no') ?></th>
                            <td><span id="quick_mobile_no"></span></td>
                            <th><?= translate('state') ?></th>
                            <td><span id="quick_state"></span></td>
                        </tr>
                        <tr class="quick-address">
                            <th><?= translate('address') ?></th>
                            <td colspan="3" height="80px;"><span id="quick_address"></span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <footer class="panel-footer">
            <div class="row">
                <div class="col-md-12 text-right">
                    <button class="btn btn-default modal-dismiss"><?= translate('close') ?></button>
                </div>
            </div>
        </footer>
    </section>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $('#student_bulk_delete').on('click', function () {
            var btn = $(this);
            var arrayID = [];
            $("input[type='checkbox'].cb_bulkdelete").each(function (index) {
                if (this.checked) {
                    arrayID.push($(this).attr('id'));
                }
            });
            if (arrayID.length != 0) {
                swal({
                    title: "<?php echo translate('are_you_sure') ?>",
                    text: "<?php echo translate('delete_this_information') ?>",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonClass: "btn btn-default swal2-btn-default",
                    cancelButtonClass: "btn btn-default swal2-btn-default",
                    confirmButtonText: "<?php echo translate('yes_continue') ?>",
                    cancelButtonText: "<?php echo translate('cancel') ?>",
                    buttonsStyling: false,
                    footer: "<?php echo translate('deleted_note') ?>"
                }).then((result) => {
                    if (result.value) {
                        $.ajax({
                            url: base_url + "student/bulk_delete",
                            type: "POST",
                            dataType: "JSON",
                            data: {array_id: arrayID},
                            success: function (data) {
                                swal({
                                    title: "<?php echo translate('deleted') ?>",
                                    text: data.message,
                                    buttonsStyling: false,
                                    showCloseButton: true,
                                    focusConfirm: false,
                                    confirmButtonClass: "btn btn-default swal2-btn-default",
                                    type: data.status
                                }).then((result) => {
                                    if (result.value) {
                                        location.reload();
                                    }
                                });
                            }
                        });
                    }
                });
            }
        });
    });
</script>