<title>Create Barcode Generator IN PHP</title>
<!--custom javascript-->



<div class="content">
  <div class="container-fluid">
    <h2 style="color:green;">Create Barcode Generator Using PHP</h2> 
    <br><br>  
    <div class="row">
      <div class="col-md-6">
        <form method="POST" >
          <div class="row">
            <div class="col-md-6">

              <div class="form-group">
                <label>Enter Product Name/No For Generate Barcode:</label>
                <input type="text" class="form-control" name="text" value="onlinestudys" required>
              </div>
            </div>
          </div>

         
          <div class="row">
            <div class="col-md-6">

              <div class="form-group">
                <label>Select Barcode Type:</label>
                <select class="form-control" name="codetype" required>
                <option value="Code128" <?php if(@$_POST['codetype'] =="Code128")echo"selected";?>>Code128</option>
                <option value="Codabar" <?php if(@$_POST['codetype'] =="Codabar")echo"selected";?>>Codabar</option>
                <option <?php if(@$_POST['codetype'] =="Code39")echo"selected";?>>Code39</option>
                <option <?php if(@$_POST['codetype'] =="Code25")echo"selected";?>>Code25</option>
                </select>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-6">

              <div class="form-group">
                <label >Select Barcode Orientation/Display:</label>
                <select class="form-control" name="orientation" required >
                <option value="Horizontal" <?php if(@$_POST['orientation'] =="Horizontal")echo"selected";?>>Horizontal</option>
                <option value="Vertical" <?php if(@$_POST['orientation'] =="Vertical")echo"selected";?>>Vertical</option>
                </select>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-4">
              <input type="submit" name="create_bar_code" class="btn btn-info form-control" value="Create Barcode">
            </div>
          </div>
        </form>
      </div>
    
      <div class="col-md-4">
        <?php
        if(isset($_POST['create_bar_code'])) 
        {

          $text             =  trim($_POST['text']);
          $codetype         =  $_POST['codetype'];
          $orientation      =  $_POST['orientation'];
          $size             =  20;
          $print            =  "true";
          $filepath         =  "C:/xampphtdocs/schoolsys/assets/images/voucher_barcode/".$text.".png";
          $filepath="";
          echo '<h2>Generated Barcode:</h2>';
          echo '<div style="border:2px solid green;margin:5px;padding:5px"><img class="barcode.php" alt="'.$text.'" src="generate_barcode?text='.$text.'&codetype='.$codetype.'&filepath='.$filepath.'&orientation='.$orientation.'&size='.$size.'&print='.$print.'"/></div>';
        }
        ?>
      </div>
    </div>
    <br><br>

  </div>   
</div>  

