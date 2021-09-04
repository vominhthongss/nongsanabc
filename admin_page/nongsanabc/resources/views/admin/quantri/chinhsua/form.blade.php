<div class="right_col" role="main">
    <div class="page-header zvn-page-header">
        <div class="zvn-page-header-title">
            <h3>Chỉnh sửa thành viên quản trị</h3>
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
        <div class="bg-warning">
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
                    //Đổi ảnh đại diện
                    <form id="demo-form1" data-parsley-validate class="form-horizontal form-label-left" action="/admin/quantri/capnhatanh" method="POST" enctype="multipart/form-data">
                        @foreach ($row as $i)


                        @csrf


                        <div class="form-group">

                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="avatar">Ảnh đại diện <span
                                class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <img width="30%" src="{{ asset($i->ANHDAIDIEN) }}" alt="hailan" class="zvn-thumb">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="avatar">Đổi ảnh <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="file" name="image" required="required"
                                       class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Tên đăng nhập <span
                            class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="TENDANGNHAP" name="TENDANGNHAP" required="required" readonly="true"
                        value="{{$i->TENDANGNHAP}}"
                               class="form-control col-md-7 col-xs-12">
                    </div>

                        @endforeach
                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <button class="btn btn-danger" type="button">
                                    <a href="/admin/quantri" style="text-decoration: none;color: white;"> Quay về</a>
                                </button>
                                <button type="submit" class="btn btn-success">Lưu</button>
                            </div>
                        </div>
                        <div class="ln_solid"></div>
                    </form>

                    //Thông tin
                    <form name="myForm" onsubmit="return validateForm()" id="demo-form2" data-parsley-validate class="form-horizontal form-label-left"
                    action="/admin/quantri/capnhat" method="POST" enctype="multipart/form-data"
                   >
                        @foreach ($row as $i)


                        @csrf



                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Tên đăng nhập <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="TENDANGNHAP" name="TENDANGNHAP" required="required"
                                value="{{$i->TENDANGNHAP}}"
                                       class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Mật khẩu</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="password" class="form-control" id="MATKHAU1" name="MATKHAU"
                                value="{{$i->MATKHAU}}"
                                >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Xác nhận mật khẩu</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="password" class="form-control" id="MATKHAU2" name="MATKHAU"
                                value="{{$i->MATKHAU}}"
                                >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="province">Vai trò <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select class="form-control" id="VAITRO" name="VAITRO" value="{{$i->VAITRO}}">
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
                                value="{{$i->HOTEN}}"
                                       class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Phái</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                @if ($i->PHAI=="Nam")
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
                                @endif
                                @if ($i->PHAI=="Nữ")
                                <div class="radio radio-inline">
                                    <label>
                                        <input type="radio" id="PHAI" value ="Nam" name="PHAI">
                                        <i class="helper"></i>Nam
                                    </label>

                                </div>
                                <div class="radio radio-inline">
                                    <label>
                                        <input type="radio" id="PHAI" value ="Nữ" name="PHAI"  checked="checked">
                                        <i class="helper"></i>Nữ
                                    </label>
                                </div>
                                @endif
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="birthday">Ngày sinh
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="date" id="NGAYSINH" name="NGAYSINH" required="required"
                                value="{{$i->NGAYSINH}}"
                                       class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">Số điện thoại
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="SODIENTHOAI" name="SODIENTHOAI"required="required"
                                value="{{$i->SODIENTHOAI}}"
                                       class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">Địa chỉ
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="DIACHI" name="DIACHI" required="required"
                                value="{{$i->DIACHI}}"
                                       class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="province">Trạng thái <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select class="form-control" id="TRANGTHAI" name="TRANGTHAI"

                                value="{{$i->TRANGTHAI}}">
                                    <option>Kích hoạt</option>
                                    <option>Chưa kích hoạt</option>
                                </select>
                            </div>
                        </div>
                        @endforeach

                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <button class="btn btn-danger" type="button">
                                    <a href="/admin/quantri" style="text-decoration: none;color: white;"> Quay về</a>
                                </button>
                                <button type="submit" class="btn btn-success">Lưu</button>
                            </div>
                        </div>
                        <div class="ln_solid"></div>
                    </form>
                    <script>
                        function validateForm() {

                            var matkhau1 = document.forms["myForm"]["MATKHAU1"].value;
                            var matkhau2 = document.forms["myForm"]["MATKHAU2"].value;
                            if (matkhau1  != matkhau2) {
                              alert("Xác nhận mật khẩu không giống nhau !");
                              return false;
                            }
                          }
                    </script>
                </div>
            </div>
        </div>

    </div>
</div>
