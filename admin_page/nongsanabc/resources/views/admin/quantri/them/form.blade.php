<div class="right_col" role="main">
    <div class="page-header zvn-page-header">
        <div class="zvn-page-header-title">
            <h3>Thêm thành viên quản trị</h3>
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

                    <form name="myForm" onsubmit="return checkBeforeSubmit()" id="myForm" data-parsley-validate class="form-horizontal form-label-left"
                    action="/admin/quantri/themmoi" method="POST" enctype="multipart/form-data">
                    {{--  action="/admin/quantri/themmoi"  --}}
                    @csrf
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Tên đăng nhập <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="TENDANGNHAP" name="TENDANGNHAP" required="required"
                                       class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Mật khẩu</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="password" class="form-control" id="MATKHAU1" name="MATKHAU1" value="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Xác nhận mật khẩu</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="password" class="form-control" id="MATKHAU" name="MATKHAU" value="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="province">Vai trò <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select class="form-control" id="VAITRO" name="VAITRO">
                                    <option>Thành viên</option>
                                    <option>Admin</option>

                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">Họ tên
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="HOTEN" name="HOTEN" required="required"
                                       class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Phái</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="radio radio-inline">
                                    <label>
                                        <input type="radio" id="PHAI" value ="Nam" name="PHAI" checked="checked">
                                        <i class="helper"></i>Nam
                                    </label>
                                </div>
                                <div class="radio radio-inline">
                                    <label>
                                        <input type="radio" id="PHAI" value ="Nữ" name="PHAI">
                                        <i class="helper"></i>Nữ
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="birthday">Ngày sinh
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="date" id="NGAYSINH" name="NGAYSINH" required="required"
                                       class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">Số điện thoại
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="SODIENTHOAI" name="SODIENTHOAI"required="required"
                                       class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">Địa chỉ
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="DIACHI" name="DIACHI" required="required"
                                       class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="avatar">Avatar <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="file" name="image" required="required"
                                       class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="province">Trạng thái <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select class="form-control" id="TRANGTHAI" name="TRANGTHAI">
                                    <option>Kích hoạt</option>
                                    <option>Chưa kích hoạt</option>
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
                            var mk1 = document.getElementById("myForm").elements.namedItem("MATKHAU1").value;
                            var mk2 = document.getElementById("myForm").elements.namedItem("MATKHAU").value;
                            if(mk1!=mk2){
                                alert("Xác nhận mật khẩu không đúng !");
                                return false;
                            }
                            var f=0;
                            let tendangnhap=document.getElementById("myForm").elements.namedItem("TENDANGNHAP").value;
                            for(i=0;i<tendangnhap.length;i++){
                                if(tendangnhap[i]==" "){
                                    f=1;
                                    alert("Có khoảng trống trong tên đăng nhập !");
                                    return false;
                                }

                            }
                        }
                    </script>
                </div>
            </div>
        </div>

    </div>
</div>
