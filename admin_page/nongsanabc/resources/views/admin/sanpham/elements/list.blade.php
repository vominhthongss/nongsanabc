<div class="right_col" role="main">
    <div class="zvn-add-new pull-right">
        <a href="/admin/sanpham/them" class="btn btn-success"><i
                class="fa fa-plus-circle"></i> Thêm mới sản phẩm</a>
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

    <!--SẢN PHẨM-->
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Sản phẩm</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li class="pull-right"><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                {{--  tìm kiếm  --}}
                @include('admin.sanpham.elements.search')
                {{--  tìm kiếm  --}}
                <div class="x_content">
                    <div class="table-responsive">
                        <table class="table table-striped jambo_table bulk_action">
                            <thead>
                            <tr class="headings">
                                <th class="column-title">Id</th>
                                <th class="column-title">Phân loại</th>
                                <th class="column-title">Tên sản phẩm</th>
                                <th class="column-title">Mô tả</th>

                                <th class="column-title">Hình ảnh</th>
                                <th class="column-title" >Số lượng</th>
                                <th class="column-title" >Đơn giá</th>
                                {{--  <th class="column-title">Số sao</th>  --}}
                                @if (Cookie::get('TENDANGNHAP_cookie')=="admin")
                                <th class="column-title">Hành động</th>
                                @endif
                            </tr>
                            </thead>
                            <tbody>
                            @foreach ($list as $item)
                            <tr class="even pointer">

                                <td >{{$item->SANPHAM_ID}}</td>
                                <td >{{$item->LOAI_TEN}}</td>
                                <td>{{$item->SANPHAM_TEN}}</td>
                                <td  width="20%">{{$item->SANPHAM_MOTA}}</td>

                                <td width="50px"><img src="{{ asset($item->SANPHAM_URL) }}"
                                    alt="hailan" class="zvn-thumb"></td>
                                <td  >{{$item->SANPHAM_SOLUONG}}</td>
                                <td  >{{$item->SANPHAM_DONGIA}}</td>
                                {{--  <td>{{$item->TBSAO}}</td>  --}}
                                @if (Cookie::get('TENDANGNHAP_cookie')=="admin")
                                <td class="last"  width="8%">
                                    <div class="zvn-box-btn-filter"><a
                                            href="/admin/sanpham/chinhsua/{{$item->SANPHAM_ID}}"
                                            type="button" class="btn btn-icon btn-success" data-toggle="tooltip"
                                            data-placement="top" data-original-title="Edit">
                                        <i class="fa fa-pencil"></i>
                                    </a><a href="/admin/sanpham/xoa/{{$item->SANPHAM_ID}}"
                                           type="button" class="btn btn-icon btn-danger btn-delete"
                                           data-toggle="tooltip" data-placement="top"
                                           onclick="return kiemTra();"
                                           data-original-title="Delete">
                                        <i class="fa fa-trash"></i>
                                    </a>
                                    </div>
                                </td>
                                @endif


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
    @include('admin.sanpham.elements.pagination')
    <!--end-box-pagination-->
</div>
