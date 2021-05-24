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

        <?php if (isset($inquiries)): ?>
            <section class="panel appear-animation" data-appear-animation="<?= $global_config['animations'] ?>" data-appear-animation-delay="100">
                <header class="panel-heading">
                    <h4 class="panel-title"><i class="fas fa-user-graduate"></i> <?php echo translate('inquiry_list'); ?></h4>
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


<script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
<link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/20.2.5/css/dx.common.css" />
<link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/20.2.5/css/dx.light.css" />
<script src="https://cdn3.devexpress.com/jslib/20.2.5/js/dx.all.js"></script>

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
                    dataField: "inquiry_no",
                    caption: "Inquiry Number",
                    width: 140,
                    headerFilter: {
                        groupInterval: 10000
                    }
                }, {
                    caption: "Inq Type",
                    dataField: "inq_type",
                    headerFilter: {
                        allowSearch: true
                    }
                }, {
                    caption: "Branch Name",
                    dataField: "branch_name",
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
                    caption: "Category",
                    dataField: "category_name",
                    headerFilter: {
                        allowSearch: true
                    }
                }, {
                    caption: "First Name",
                    dataField: "first_name",
                    headerFilter: {
                        allowSearch: true
                    }
                }, {
                    caption: "Last Name",
                    dataField: "last_name",
                    headerFilter: {
                        allowSearch: true
                    }
                }, {
                    caption: "Gender",
                    dataField: "gender",
                    headerFilter: {
                        allowSearch: true
                    }
                }, {
                    caption: "Guardian Name",
                    dataField: "grd_name",
                    headerFilter: {
                        allowSearch: true
                    }
                }, {
                    caption: "Guardian Relation",
                    dataField: "grd_relation",
                    headerFilter: {
                        allowSearch: true
                    }
                }, {
                    caption: "Gdr Office No",
                    dataField: "gdr_office_no",
                    headerFilter: {
                        allowSearch: true
                    }
                }, {
                    caption: "Mobile No",
                    dataField: "grd_mobileno",
                    headerFilter: {
                        allowSearch: true
                    }
                }, {
                    caption: "Email",
                    dataField: "grd_email",
                    headerFilter: {
                        allowSearch: true
                    }
                }, {
                    caption: "Remarks",
                    dataField: "previous_remarks",
                    headerFilter: {
                        allowSearch: true
                    }
                }, {
                    dataField: "visited_date",
                    alignment: "right",
                    dataType: "date",
                    width: 120,
                    calculateFilterExpression: function (value, selectedFilterOperations, target) {
                        if (target === "headerFilter" && value === "weekends") {
                            return [[getOrderDay, "=", 0], "or", [getOrderDay, "=", 6]];
                        }
                        return this.defaultCalculateFilterExpression.apply(this, arguments);
                    },
                    headerFilter: {
                        dataSource: function (data) {
                            data.dataSource.postProcess = function (results) {
                                results.push({
                                    text: "Weekends",
                                    value: "weekends"
                                });
                                return results;
                            };
                        }
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
//{
//                    "ID": 91,
//                    "OrderNumber": 214222,
//                    "OrderDate": "2017/02/08",
//                    "DeliveryDate": "2017/02/10 9:45",
//                    "SaleAmount": 11050,
//                    "Terms": "30 Days",
//                    "CustomerStoreCity": "Phoenix, AZ",
//                    "Employee": "Clark Morgan"
//                }
    var orders = <?= json_encode($inquiries); ?>;
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