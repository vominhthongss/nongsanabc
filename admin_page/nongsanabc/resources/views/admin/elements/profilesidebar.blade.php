<div class="profile clearfix">
    <div class="profile_pic">
        @if(isset($anhdaidien))

        <img src="{{ asset($anhdaidien) }}" alt="..." class="img-circle profile_img">
        @else


        <img src="{{ asset(Cookie::get('ANHDAIDIEN_cookie')) }}" alt="..." class="img-circle profile_img">
        @endif



    </div>
    <div class="profile_info">
        <span>Xin chào,</span>
        @if(isset($hoten))
        <h2>{{$hoten}}</h2>
        @else

        <h2>{{Cookie::get('HOTEN_cookie')}}</h2>
        @endif

    </div>
</div>
