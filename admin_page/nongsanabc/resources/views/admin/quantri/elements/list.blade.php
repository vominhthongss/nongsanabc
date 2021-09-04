
<div class="right_col" role="main">
    <div class="zvn-add-new pull-right">
        <a href="/admin/quantri/them" class="btn btn-success"><i
                class="fa fa-plus-circle"></i> Thêm mới thành viên</a>
    </div>
    <br>
    <br>
    <div>
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
  </div>
    <!--DANH SÁCH THÀNH VIÊN-->
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Quản trị</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li class="pull-right"><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                @include('admin.quantri.elements.search')
                <div class="x_content">
                    <div class="table-responsive">
                        <table class="table table-striped jambo_table bulk_action">
                            <thead>
                            <tr class="headings">
                                <th class="column-title">Tên đăng nhập</th>
                                <th class="column-title">Họ tên</th>
                                <th class="column-title">Số điện thoại</th>
                                <th class="column-title">Vai trò</th>
                                <th class="column-title" >Ảnh đại diện</th>
                                <th class="column-title">Giới tính</th>
                                <th class="column-title">Địa chỉ</th>
                                <th class="column-title">Trạng thái</th>
                                <th class="column-title">Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach ($list as $item)
                            <tr class="even pointer">

                                <td>{{$item->TENDANGNHAP}}</td>
                                <td class="">{{$item->HOTEN}}</td>
                                <td>{{$item->SODIENTHOAI}}</td>
                                <td>{{$item->VAITRO}}</td>
                                {{--  <td>{{$item->ANHDAIDIEN}}</td>  --}}
                                <td width="80px"><img src="{{ asset($item->ANHDAIDIEN) }}"
                                    alt="hailan" class="zvn-thumb"></td>
                                <td>{{$item->PHAI}}</td>
                                <td>{{$item->DIACHI}}</td>
                                <td>{{$item->TRANGTHAI}}</td>
                                <td class="last">
                                    <div class="zvn-box-btn-filter"><a
                                            href="/admin/quantri/chinhsua/{{$item->TENDANGNHAP}}"
                                            type="button" class="btn btn-icon btn-success" data-toggle="tooltip"
                                            data-placement="top" data-original-title="Edit">
                                        <i class="fa fa-pencil"></i>
                                    </a>
                                    <a href="/admin/quantri/xoa/{{$item->TENDANGNHAP}}"
                                           type="button" class="btn btn-icon btn-danger btn-delete"
                                           data-toggle="tooltip" data-placement="top"
                                           data-original-title="Delete" onclick="return kiemTra();"">
                                        <i class="fa fa-trash"></i>
                                    </a>
                                    </div>
                                </td>


                            </tr>
                            @endforeach
                            </tbody>
                        </table>
                        <script>
                            function kiemTra(){
                                if(confirm("Bạn chắc chứ ?")){
                                    return true;
                                }
                                else return false;
                            }
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--end-SẢN PHẨM-->
    <!--box-pagination-->
    @include('admin.quantri.elements.pagination')
    <!--end-box-pagination-->
</div>
