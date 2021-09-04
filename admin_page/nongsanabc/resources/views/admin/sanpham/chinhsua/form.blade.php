<div class="right_col" role="main">
    <div class="page-header zvn-page-header">
        <div class="zvn-page-header-title">
            <h3>Chỉnh sửa sản phẩm</h3>
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
                    //Đổi ảnh
                    <form name="myForm" id="myForm1" data-parsley-validate class="form-horizontal form-label-left"
                    action="/admin/sanpham/capnhatanh" method="POST" enctype="multipart/form-data">
                        @csrf
                        @foreach ($list as $i )
                        <div class="form-group">
                            <input type="text" value="{{$i->SANPHAM_ID}}" name="SANPHAM_ID" style="display: none;">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="avatar">Hình sản phẩm <span
                                class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <img width="30%" src="{{ asset($i->SANPHAM_URL) }}" alt="hailan" class="zvn-thumb">
                            </div>
                        </div>
                        @endforeach

                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="avatar">Đổi ảnh <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="file" name="image" required="required"
                                       class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <button class="btn btn-danger" type="button">
                                    <a href="/admin/sanpham" style="text-decoration: none;color: white;"> Quay về</a>
                                </button>
                                <button type="submit" class="btn btn-success">Lưu</button>
                            </div>
                        </div>
                        <div class="ln_solid"></div>
                    </form>
                    //Chỉnh sửa thông tin
                    <form name="myForm" id="myForm2" data-parsley-validate class="form-horizontal form-label-left"
                    onsubmit="return checkBeforeSubmit();"
                    action="/admin/sanpham/capnhat" method="POST" enctype="multipart/form-data">
                        @csrf

                        @foreach ($list as $i )
                        <input type="text" value="{{$i->SANPHAM_ID}}" name="SANPHAM_ID" style="display: none;">
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">Tên sản phẩm
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="SANPHAM_TEN" name="SANPHAM_TEN" required="required"
                                value="{{$i->SANPHAM_TEN}}"
                                       class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">Số lượng
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="number" id="SANPHAM_SOLUONG" name="SANPHAM_SOLUONG" required="required"
                                value="{{$i->SANPHAM_SOLUONG}}"
                                       class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">Đơn giá
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="number" id="SANPHAM_DONGIA" name="SANPHAM_DONGIA" required="required"
                                value="{{$i->SANPHAM_DONGIA}}"
                                       class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Mô tả <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <textarea name="SANPHAM_MOTA" id="SANPHAM_MOTA">{{$i->SANPHAM_MOTA}}</textarea>
                            </div>
                        </div>




                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="province">Loại<span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select class="form-control" name="LOAI_ID">
                                    <option value="{{$i->LOAI_ID}}">{{$i->LOAI_TEN}}</option>
                                    @foreach ($loai as $item )
                                        @if ($i->LOAI_ID!=$item->LOAI_ID)
                                        <option value="{{$item->LOAI_ID}}">{{$item->LOAI_TEN}}</option>
                                        @endif

                                    @endforeach



                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="province">Nơi sản xuất <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-     6 col-sm-6 col-xs-12">
                                <select class="form-control" name="NOISANXUAT_ID" >
                                    <option value="{{$i->NOISANXUAT_ID}}">{{$i->NOISANXUAT_TEN}}</option>
                                    @foreach ($noisanxuat as $item )
                                        @if ($i->NOISANXUAT_ID!=$item->NOISANXUAT_ID)
                                        <option value="{{$item->NOISANXUAT_ID}}">{{$item->NOISANXUAT_TEN}}</option>
                                        @endif
                                    @endforeach

                                </select>
                            </div>
                        </div>

                        @endforeach



                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <button class="btn btn-danger" type="button">
                                    <a href="/admin/sanpham" style="text-decoration: none;color: white;"> Quay về</a>
                                </button>
                                <button type="submit" class="btn btn-success">Lưu</button>
                            </div>
                        </div>
                        <div class="ln_solid"></div>
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
