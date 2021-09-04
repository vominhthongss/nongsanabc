<div class="right_col" role="main">
    {{--  <div class="zvn-add-new pull-right">
        <a href="/admin/quantri/them" class="btn btn-success"><i
                class="fa fa-plus-circle"></i> Kiểm duyệt đơn hàng</a>
    </div>  --}}
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
    <!--ĐƠN HÀNG-->
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Đơn hàng</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li class="pull-right"><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="zvn-box-btn-filter">
                    <a href="/admin/donhang/" type="button" class="btn btn-info" data-toggle="tooltip" data-placement="top">
                        <i >Tất cả đơn hàng</i>
                    </a>
                    <a href="/admin/donhang/" type="button" class="btn" data-toggle="tooltip" data-placement="top" >
                        <i class="glyphicon glyphicon-menu-up"></i>
                    </a>
                    <a href="/admin/donhang/ngaydatgiamdan" type="button" class="btn" data-toggle="tooltip" data-placement="top">
                        <i class="glyphicon glyphicon-menu-down"></i>
                    </a>
                    <a href="/admin/donhang/donchoduyettang" type="button" class="btn btn-info" data-toggle="tooltip" data-placement="top" >
                        <i >Đơn chờ duyệt</i>
                    </a>
                    <a href="/admin/donhang/donchoduyettang" type="button" class="btn" data-toggle="tooltip" data-placement="top" >
                        <i class="glyphicon glyphicon-menu-up"></i>
                    </a>
                    <a href="/admin/donhang/donchoduyetgiam" type="button" class="btn" data-toggle="tooltip" data-placement="top" >
                        <i class="glyphicon glyphicon-menu-down" ></i>
                    </a>
                    <a href="/admin/donhang/dondanggiaotang" type="button" class="btn btn-info" data-toggle="tooltip" data-placement="top" >
                        <i >Đơn đang giao</i>
                    </a>
                    <a href="/admin/donhang/dondanggiaotang" type="button" class="btn" data-toggle="tooltip" data-placement="top" >
                        <i class="glyphicon glyphicon-menu-up" ></i>
                    </a>
                    <a href="/admin/donhang/dondanggiaogiam" type="button" class="btn" data-toggle="tooltip" data-placement="top">
                        <i class="glyphicon glyphicon-menu-down"></i>
                    </a>
                    <a href="/admin/donhang/donthanhcongtang" type="button" class="btn btn-info" data-toggle="tooltip" data-placement="top" >
                        <i >Đơn thành công</i>
                    </a>
                    <a href="/admin/donhang/donthanhcongtang" type="button" class="btn" data-toggle="tooltip" data-placement="top" >
                        <i class="glyphicon glyphicon-menu-up" ></i>
                    </a>
                    <a href="/admin/donhang/donthanhconggiam" type="button" class="btn" data-toggle="tooltip" data-placement="top">
                        <i class="glyphicon glyphicon-menu-down"></i>
                    </a>
                </div>
                @include('admin.donhang.elements.search')
                <div class="x_content">
                    <div class="table-responsive">
                        <table class="table table-striped jambo_table bulk_action">
                            <thead>
                            <tr class="headings">
                                <th class="column-title">Id đơn hàng</th>
                                <th class="column-title">Họ tên khách</th>
                                <th class="column-title">Trạng thái chờ</th>
                                <th class="column-title">Ngày đặt</th>
                                <th class="column-title" >Ngày giao</th>
                                <th class="column-title">Người duyệt</th>
                                <th class="column-title">Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach ($list as $item)


                            <tr class="even pointer">

                                <td>{{$item->DATHANG_ID}}</td>
                                <td class="">{{$item->KHACHHANG_TEN}}</td>

                                    @if ($item->DATHANG_TRANGTHAI=="Hủy")
                                    <td style="color: red;">
                                    <b>{{$item->DATHANG_TRANGTHAI}}</b>
                                    </td>
                                    @else
                                        @if ($item->DATHANG_TRANGTHAI=="Đang giao")
                                        <td style="color: blue;">
                                            <b>{{$item->DATHANG_TRANGTHAI}}</b>
                                        </td>
                                        @else
                                            @if ($item->DATHANG_TRANGTHAI=="Thành công")
                                            <td style="color: green;">
                                                <b>{{$item->DATHANG_TRANGTHAI}}</b>
                                            </td>
                                            @else
                                            <td style="color: rgb(141, 51, 66);">
                                                <b>{{$item->DATHANG_TRANGTHAI}}</b>
                                            </td>
                                            @endif
                                        @endif
                                    @endif



                                <td>{{$item->DATHANG_NGAYDAT}}</td>

                                <td>{{$item->DATHANG_NGAYGIAO}}</td>
                                <td>{{$item->HOTEN}}</td>

                                @if ($item->DATHANG_TRANGTHAI=="Hủy")
                                <td class="last">
                                    <div class="zvn-box-btn-filter">
                                        <a href="/admin/donhang/chitietdonhang/{{$item->DATHANG_ID}}" type="button" class="btn btn-info" data-toggle="tooltip" data-placement="top" data-original-title="Xem chi tiết">
                                            <i class="fa fa-info"></i>
                                        </a>
                                    </div>
                                </td>
                                @else
                                    @if ($item->DATHANG_TRANGTHAI=="Đang giao")
                                    <td class="last">
                                        <div class="zvn-box-btn-filter">
                                            <a href="/admin/donhang/chitietdonhang/{{$item->DATHANG_ID}}" type="button" class="btn btn-info" data-toggle="tooltip" data-placement="top" data-original-title="Chi tiết đơn">
                                                <i class="fa fa-info"></i>
                                            </a>
                                            <a href="/admin/donhang/thanhcong/{{$item->DATHANG_ID}}" type="button" class="btn" data-toggle="tooltip" data-placement="top" data-original-title="Chuyển sang THÀNH CÔNG">
                                                <i class="fa fa-check">Nhấn vào khi THÀNH CÔNG</i>
                                            </a>
                                        </div>
                                    </td>

                                    @else
                                        @if ($item->DATHANG_TRANGTHAI=="Thành công")
                                        <td class="last">
                                            <div class="zvn-box-btn-filter">
                                                <a href="/admin/donhang/chitietdonhang/{{$item->DATHANG_ID}}" type="button" class="btn btn-info" data-toggle="tooltip" data-placement="top" data-original-title="Xem chi tiết">
                                                    <i class="fa fa-info"></i>
                                                </a>
                                            </div>
                                        </td>
                                        @else
                                        <td class="last">
                                            <div class="zvn-box-btn-filter">
                                                <a href="/admin/donhang/chitietdonhang/{{$item->DATHANG_ID}}" type="button" class="btn btn-info" data-toggle="tooltip" data-placement="top" data-original-title="Chi tiết đơn">
                                                    <i class="fa fa-info"></i>
                                                </a>
                                                <a href="/admin/donhang/danggiao/{{$item->DATHANG_ID}}" type="button" class="btn" data-toggle="tooltip" data-placement="top" data-original-title="Chuyển sang ĐANG GIAO">
                                                    <i class="fa fa-edit">Nhấn vào khi ĐANG GIAO</i>
                                                </a>
                                            </div>
                                        </td>
                                        </td>
                                        @endif
                                    @endif
                                @endif



                            </tr>

                            @endforeach

                            </tbody>
                        </table>


                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--end-SẢN PHẨM-->
    <!--box-pagination-->
    @include('admin.donhang.elements.pagination')
    <!--end-box-pagination-->
</div>
