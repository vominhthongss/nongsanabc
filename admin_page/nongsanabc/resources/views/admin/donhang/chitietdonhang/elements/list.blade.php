<div class="right_col" role="main">


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
                <div class="x_content">
                    <div class="table-responsive">
                        <table class="table table-striped jambo_table bulk_action">
                            <thead>
                            <tr class="headings">
                                <th class="column-title">Id sản phẩm</th>
                                <th class="column-title">Tên sản phẩm</th>
                                <th class="column-title">Số lượng</th>
                                <th class="column-title">Đơn giá</th>
                                <th class="column-title">Ảnh sản phẩm</th>

                            </tr>
                            </thead>
                            <tbody>
                            @foreach ($list as $item)
                            <tr class="even pointer">

                                <td>{{$item->SANPHAM_ID}}</td>



                                <td>{{$item->SANPHAM_TEN}}</td>

                                <td>{{$item->CHITIETDATHANG_SOLUONG}}</td>
                                <td>{{$item->SANPHAM_DONGIA}}</td>
                                {{--  <td>{{$item->SANPHAM_URL}}</td>  --}}
                                <td width="200px"><img src="{{ asset($item->SANPHAM_URL) }}"
                                    alt="hailan" class="zvn-thumb"></td>





                            </tr>
                            @endforeach
                            </tbody>
                        </table>


                            @foreach ($list as $item)
                            @php
                            $tong=0;
                            $tong+=$item->CHITIETDATHANG_SOLUONG * $item->SANPHAM_DONGIA;
                            @endphp
                            @endforeach
                            <div>

                            <h3>
                                TỔNG TIỀN: <h3 style="color: green">{{$tong}} VNĐ</h3>
                            </h3>

                             </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--end-SẢN PHẨM-->
    <!--box-pagination-->
    {{--  @include('admin.elements.pagination')  --}}
    <!--end-box-pagination-->
</div>
