<div class="right_col" role="main">
    <div class="page-header zvn-page-header">
        <div class="zvn-page-header-title">
            <h3>Thêm sản phẩm</h3>
        </div>
        <div class="zvn-page-header-breadcrumb ">
            <ul class="zvn-breadcrumb-title clearfix">

            </ul>
        </div>


    </div>
    @if ($message = Session::get('success'))
    <div class="alert alert-success alert-block">
        <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>{{ $message }}</strong>
    </div>
    @endif
    @if ($message = Session::get('unsuccess'))
    <div class="alert alert-warning alert-block">
        <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>{{ $message }}</strong>
    </div>
    @endif
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">


                    <ul class="nav navbar-right panel_toolbox">
                        <li class="pull-right"><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <br/>

                    <form name="myForm" id="myForm" data-parsley-validate class="form-horizontal form-label-left"
                    onsubmit="return checkBeforeSubmit();"
                    action="/admin/sanpham/themmoi" method="POST" enctype="multipart/form-data">
                        @csrf


                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">Tên sản phẩm
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="SANPHAM_TEN" name="SANPHAM_TEN" required="required"
                                       class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">Số lượng
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="number" id="SANPHAM_SOLUONG" name="SANPHAM_SOLUONG" required="required"
                                       class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">Đơn giá
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="number" id="SANPHAM_DONGIA" name="SANPHAM_DONGIA" required="required"
                                       class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Mô tả <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <textarea name="SANPHAM_MOTA" id="SANPHAM_MOTA"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="avatar">Hình sản phẩm <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="file" name="image" required="required"
                                       class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>



                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="province">Loại<span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select class="form-control" name="LOAI_ID">
                                    @foreach ($loai as $i )
                                    <option value="{{$i->LOAI_ID}}">{{$i->LOAI_TEN}}</option>
                                    @endforeach



                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="province">Nơi sản xuất <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-     6 col-sm-6 col-xs-12">
                                <select class="form-control" name="NOISANXUAT_ID">
                                    @foreach ($noisanxuat as $i )
                                    <option value="{{$i->NOISANXUAT_ID}}">{{$i->NOISANXUAT_TEN}}</option>
                                    @endforeach

                                </select>
                            </div>
                        </div>



                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <button class="btn btn-danger" type="button">
                                    <a href="/admin/quantri" style="text-decoration: none;color: white;"> Quay về</a>
                                </button>
                                <button type="submit" class="btn btn-success">Lưu</button>
                            </div>
                        </div>
                    </form>
                    <script>
                        function checkBeforeSubmit(){
                            var x = document.getElementById("myForm").elements.namedItem("SANPHAM_SOLUONG").value;
                            let y = document.getElementById("myForm").elements.namedItem("SANPHAM_DONGIA").value;
                            if(x<1){
                                alert("Số lượng không hợp lệ !");
                                return false
                            }
                            if(y.length>10){
                                alert("Đơn giá quá lớn !");
                                return false
                            }
                            if(y<0){
                                alert("Đơn giá không hợp lệ !");
                                return false
                            }

                        }
                    </script>
                </div>
            </div>
        </div>

    </div>
</div>
