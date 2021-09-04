<!DOCTYPE html>
<html lang="en">
<head>
    @include('admin.elements.head')

</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">
            <div class="left_col scroll-view">
                <div class="navbar nav_title" style="border: 0;">
                    <a href="index.html" class="site_title">
                        <i class="fa fa-paw">
                        </i>
                        <span>Nông Sản ABC</span></a>
                </div>
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
        <!-- /form admin -->
        @include('admin.quantri.chinhsua.form')
        <!-- /end form admin -->
        <!-- footer content -->
        {{--  @include('admin.elements.footer')  --}}
        <!-- /footer content -->
    </div>
</div>
@include('admin.elements.script')
</body>
</html>
