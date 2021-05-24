<?php $widget = (is_superadmin_loggedin() ? 4 : 6); ?>

<div class="row">
    <div class="col-md-12">
        <section class="panel hide hidden">
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
                                echo form_dropdown("branch_id", $arrayBranch, set_value('branch_id'), "class='form-control' onchange='getClassByBranch(this.value)' data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity'");
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

        <?php if (isset($vouchers)): ?>
            <section class="panel appear-animation" data-appear-animation="<?= $global_config['animations'] ?>" data-appear-animation-delay="100">
                <header class="panel-heading">
                    <h4 class="panel-title"><i class="fas fa-user-graduate"></i> <?php echo translate('fee_vouchers_list'); ?></h4>
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


