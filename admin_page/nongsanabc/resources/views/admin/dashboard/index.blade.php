
<!DOCTYPE html>
<html lang="vi">
<head>
@include('admin.elements.head')
</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">
            <div class="left_col scroll-view">
                @include('admin.elements.topsidebar')
                <div class="clearfix"></div>
                <!-- menu profile quick info -->
                @include('admin.elements.profilesidebar')
                <!-- /menu profile quick info -->
                <br/>
                <!-- sidebar menu -->

                    @include('admin.elements.sidebar')

                <!-- /sidebar menu -->

                <!-- /menu footer buttons -->
                @include('admin.elements.footsidebar')
                <!-- /menu footer buttons -->
            </div>
        </div>
        <!-- top navigation -->
        @include('admin.elements.topnav')
        <!-- /top navigation -->
        <!-- page content -->
        @include('admin.trangchu.elements.list')
        <!-- /page content -->
        <!-- footer -->
        {{-- @include('admin.elements.footer') --}}
        <!-- /footer -->
    </div>
</div>
@include('admin.elements.script')


</body>
</html>
