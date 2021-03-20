
<?php
$this->db->where_in('relid', array(1, 2));
$this->db->where_in('field_id', array(2, 3));
$this->db->delete('custom_fields_values');
?>



<?php $widget = (is_superadmin_loggedin() ? 3 : 4); ?>
<div class="row">
    <div class="col-md-12">
        <section class="panel">
            <?php echo form_open_multipart($this->uri->uri_string()); ?>
            <header class="panel-heading">
                <h4 class="panel-title"><i class="fas fa-graduation-cap"></i> <?= translate('inquiry') ?></h4>
            </header>
            <div class="panel-body">

                <!-- academic details-->
                <div class="headers-line">
                    <i class="fas fa-school"></i> <?= translate('academic_details') ?>
                </div>

                <?php $academic_year = get_session_id(); ?>
                <div class="row">
                    <div class="col-md-3 mb-sm">
                        <div class="form-group">
                            <label class="control-label"><?= translate('academic_year') ?> <span class="required">*</span></label>
                            <?php
                            $arrayYear = array("" => translate('select'));
                            $years = $this->db->get('schoolyear')->result();
                            foreach ($years as $year) {
                                $arrayYear[$year->id] = $year->school_year;
                            }
                            echo form_dropdown("year_id", $arrayYear, set_value('year_id', $academic_year), "class='form-control' id='academic_year_id'
								data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity' ");
                            ?>
                            <span class="error"><?= form_error('year_id') ?></span>
                        </div>
                    </div>

                    <div class="col-md-3 mb-sm">
                        <div class="form-group">
                            <label class="control-label"><?= translate('inquiry_type') ?> <span class="required">*</span></label>
                            <?php
                            
                                echo form_dropdown("inq_type", $arrayinqType, set_value('inq_type'), "class='form-control' id='inq_type'
								data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity'");
                                ?>
                            <span class="error"><?= form_error('inq_type') ?></span>
                        </div>
                    </div>
                    <div class="col-md-3 mb-sm">
                        <div class="form-group">
                            <label class="control-label"><?= translate('inquiry_no') ?> <span class="required">*</span></label>
                            <input type="text" class="form-control" name="inquiry_no" value="<?= set_value('inquiry_no', @$inquiry_no) ?>" />
                            <span class="error"><?= form_error('inquiry_no') ?></span>
                        </div>
                    </div>
                    
                    <div class="col-md-3 mb-sm">
                        <div class="form-group">
                            <label class="control-label"><?= translate('visited_date') ?> <span class="required">*</span></label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="far fa-calendar-alt"></i></span>
                                <input type="text" class="form-control" name="visited_date" value="<?= set_value('visited_date', date('Y-m-d')) ?>" data-plugin-datepicker
                                       data-plugin-options='{ "todayHighlight" : true }' />
                            </div>
                            <span class="error"><?= form_error('visited_date') ?></span>
                        </div>
                    </div>
                </div>

                <div class="row mb-md">
                    <?php if (is_superadmin_loggedin()): ?>
                        <div class="col-md-<?php echo $widget; ?> mb-sm">
                            <div class="form-group">
                                <label class="control-label"><?= translate('branch') ?> <span class="required">*</span></label>
                                <?php
                                $arrayBranch = $this->app_lib->getSelectList('branch');
                                echo form_dropdown("branch_id", $arrayBranch, set_value('branch_id'), "class='form-control' id='branch_id'
								data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity'");
                                ?>
                                <span class="error"><?= form_error('branch_id') ?></span>
                            </div>
                        </div>
                    <?php endif; ?>
                    <div class="col-md-<?php echo $widget; ?> mb-sm">
                        <div class="form-group">
                            <label class="control-label"><?= translate('class') ?></label>
                            <?php
                            $arrayClass = $this->app_lib->getClass($branch_id);
                            echo form_dropdown("class_id", $arrayClass, set_value('class_id'), "class='form-control' id='class_id' onchange='getSectionByClass(this.value,0)'
								data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity' ");
                            ?>
                            <span class="error"><?= form_error('class_id') ?></span>
                        </div>
                    </div>
                    <div class="col-md-<?php echo $widget; ?> mb-sm">
                        <div class="form-group">
                            <label class="control-label"><?= translate('section') ?></label>
                            <?php
                            $arraySection = $this->app_lib->getSections(set_value('class_id'), false);
                            echo form_dropdown("section_id", $arraySection, set_value('section_id'), "class='form-control' id='section_id' 
								data-plugin-selectTwo data-width='100%' data-minimum-results-for-search='Infinity' ");
                            ?>
                            <span class="error"><?= form_error('section_id') ?></span>
                        </div>
                    </div>
                    <div class="col-md-<?php echo $widget; ?> mb-sm">
                        <div class="form-group">
                            <label class="control-label"><?= translate('category') ?></label>
                            <?php
                            $arrayCategory = $this->app_lib->getStudentCategory($branch_id);
                            echo form_dropdown("category_id", $arrayCategory, set_value('category_id'), "class='form-control'
								data-plugin-selectTwo data-width='100%' id='category_id' data-minimum-results-for-search='Infinity' ");
                            ?>
                            <span class="error"><?= form_error('category_id') ?></span>
                        </div>
                    </div>
                </div>

                <!-- student details -->
                <div class="headers-line mt-md">
                    <i class="fas fa-user-check"></i> <?= translate('student_details') ?>
                </div>

                <div class="row">
                    <div class="col-md-4 mb-sm">
                        <div class="form-group">
                            <label class="control-label"> <?= translate('first_name') ?> <span class="required">*</span></label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fas fa-user-graduate"></i></span>
                                <input type="text" class="form-control" name="first_name" value="<?= set_value('first_name') ?>"/>
                            </div>
                            <span class="error"><?= form_error('first_name') ?></span>
                        </div>
                    </div>
                    <div class="col-md-4 mb-sm">
                        <div class="form-group">
                            <label class="control-label"> <?= translate('last_name') ?> <span class="required">*</span></label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fas fa-user-graduate"></i></span>
                                <input type="text" class="form-control" name="last_name" value="<?= set_value('last_name') ?>" />
                            </div>
                        </div>
                        <span class="error"><?= form_error('last_name') ?></span>
                    </div>
                    <div class="col-md-4 mb-sm">
                        <div class="form-group">
                            <label class="control-label"> <?= translate('gender') ?> </label>
                            <?php
                            $arrayGender = array(
                                'male' => translate('male'),
                                'female' => translate('female')
                            );
                            echo form_dropdown("gender", $arrayGender, set_value('gender'), "class='form-control' data-plugin-selectTwo
								data-width='100%' data-minimum-results-for-search='Infinity' ");
                            ?>
                        </div>
                    </div>
                </div>

                <!--guardian details-->
                <div class="headers-line">
                    <i class="fas fa-user-tie"></i> <?= translate('guardian_details') ?>
                </div>


                <div id="guardian_form">
                    <div class="row">
                        <div class="col-md-6 mb-sm">
                            <div class="form-group">
                                <label class="control-label"><?= translate('guardian_name') ?></label>
                                <input class="form-control" name="grd_name" type="text" value="<?= set_value('grd_name') ?>">
                            </div>
                            <span class="error"><?= form_error('grd_name') ?></span>
                        </div>
                        <div class="col-md-6 mb-sm">
                            <div class="form-group">
                                <label class="control-label"><?= translate('guardian_relation') ?></label>
                                <input class="form-control" name="grd_relation" value="<?= set_value('grd_relation') ?>" type="text">
                                <span class="error"><?= form_error('grd_relation') ?></span>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        
                        <div class="col-md-4 mb-sm">
                            <div class="form-group">
                                <label class="control-label"><?= translate('gdr_office_no') ?></label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fas fa-phone-volume"></i></span>
                                    <input class="form-control" name="gdr_office_no" type="text" value="<?= set_value('gdr_office_no') ?>">
                                </div>
                                <span class="error"><?= form_error('gdr_office_no') ?></span>
                            </div>
                        </div>
                        <div class="col-md-4 mb-sm">
                            <div class="form-group">
                                <label class="control-label"><?= translate('mobile_no') ?> <span class="required">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fas fa-phone"></i></span>
                                    <input class="form-control" name="grd_mobileno" type="text" value="<?= set_value('grd_mobileno') ?>">
                                </div>
                                <span class="error"><?= form_error('grd_mobileno') ?></span>
                            </div>
                        </div>
                        <div class="col-md-4 mb-sm">
                            <div class="form-group">
                                <label class="control-label"><?= translate('email') ?></label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="far fa-envelope-open"></i></span>
                                    <input type="email" class="form-control" name="grd_email" id="grd_email" value="<?= set_value('grd_email') ?>" />
                                </div>
                                <span class="error"><?= form_error('grd_email') ?></span>
                            </div>
                        </div>
                    </div>
                    
                </div>

                
                <div class="row mb-lg">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label"><?= translate('remarks') ?></label>
                            <textarea name="previous_remarks" rows="2" class="form-control"><?= set_value('previous_remarks') ?></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="panel-footer">
                <div class="row">
                    <div class="col-md-offset-10 col-md-2">
                        <input type="hidden" name="i_id" />
                        
                        <button type="submit" name="save" value="1" class="btn btn btn-default btn-block">
                            <i class="fas fa-plus-circle"></i> <?= translate('save') ?>
                        </button>
                    </div>
                </div>
            </footer>
            <?php echo form_close(); ?>
        </section>
    </div>
</div>