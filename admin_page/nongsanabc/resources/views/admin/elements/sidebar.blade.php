<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
    <div class="menu_section">
        <ul class="nav side-menu">
            {{--  <li><a href="/admin/dashboard"><i class="fa fa-home"></i> Trang chủ</a></li>  --}}


            @if(isset($tendangnhap))

                @if ($tendangnhap=="admin")
                <li><a href="/admin/quantri"><i class="fa fa-user"></i> Quản trị</a></li>
                @endif

            @else
                @if (Cookie::get('TENDANGNHAP_cookie')=="admin")
                <li><a href="/admin/quantri"><i class="fa fa-user"></i> Quản trị</a></li>
                @endif

            @endif


            <li><a href="/admin/sanpham"><i class="fa fa fa-building-o"></i> Sản phẩm</a></li>
            <li><a href="/admin/donhang"><i class="fa fa-sliders"></i> Đơn hàng</a></li>
        </ul>
    </div>
</div>
