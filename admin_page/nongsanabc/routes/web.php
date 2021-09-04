<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Cookie;


// #2A3F54 #172D44
Route::get('/', function() {
   // Cookie::forget('TENDANGNHAP_cookie');
    return view('index');
});

$path='App\Http\Controllers';
$prefix='admin';
Route::group(['prefix' => $prefix], function() use($prefix,$path) {


    //================DASHBOARD==================
    // admin/
    $controller=$path.'\DashboardController@';
    $prefix='dashboard';
    Route::post($prefix,$controller.'index');

    $controller=$path.'\DashboardController@';
    $prefix='dashboard/index';
    Route::get($prefix,$controller.'trangchu');

    //================QUANTRI==================
    // admin/
    $controller=$path.'\QuanTriController@';
    $prefix='quantri';
    Route::get($prefix,$controller.'index');
    $controller=$path.'\QuanTriController@';

    Route::group(['prefix' => $prefix], function() use($prefix,$path) {
        // admin/quantri/
        $controller=$path.'\QuanTriController@';
        $prefix='them';
        Route::get($prefix,$controller.'them');
        // admin/quantri/

        $prefix='themmoi';
        Route::post($prefix,$controller.'themmoi');
        // admin/quantri/

        $prefix='capnhat';
        Route::post($prefix,$controller.'capnhat');
        // admin/quantri/

        $prefix='capnhatanh';
        Route::post($prefix,$controller.'capnhatanh');
        // admin/quantri/

        $prefix='chinhsua/{tendangnhap}';
        Route::get($prefix,$controller.'chinhsua');
        // admin/quantri/

        $prefix='xoa/{tendangnhap}';
        Route::get($prefix,$controller.'xoa');

        $prefix='tim/{key_word}';
        Route::get($prefix,$controller.'tim');


    });
    // $prefix='quantri/chinhsua/{tendangnhap}';
    // Route::get($prefix,$controller.'chinhsua');

    //================SANPHAM==================
    // admin/
    $controller=$path.'\SanPhamController@';
    $prefix='sanpham';
    Route::get($prefix,$controller.'index');
    Route::group(['prefix' => $prefix], function() use($prefix,$path) {
        // admin/quantri/
        $controller=$path.'\SanPhamController@';
        $prefix='them';
        Route::get($prefix,$controller.'them');
        // admin/quantri/

        $prefix='themmoi';
        Route::post($prefix,$controller.'themmoi');
        // admin/quantri/

        $prefix='capnhat';
        Route::post($prefix,$controller.'capnhat');
        // admin/quantri/

        $prefix='capnhatanh';
        Route::post($prefix,$controller.'capnhatanh');
        // admin/quantri/

        $prefix='chinhsua/{sanpham_id}';
        Route::get($prefix,$controller.'chinhsua');
        // admin/quantri/

        $prefix='xoa/{sanpham_id}';
        Route::get($prefix,$controller.'xoa');

        $controller=$path.'\SanPhamController@';
        $prefix='timtheoloai/{loai_ten}';
        Route::get($prefix,$controller.'timtheoloai');

        $controller=$path.'\SanPhamController@';
        $prefix='tim/{key_word}';
        Route::get($prefix,$controller.'tim');


    });

    //================DONHANG==================
    // admin/
    $controller=$path.'\DonHangController@';
    $prefix='donhang';
    Route::get($prefix,$controller.'index');
    Route::group(['prefix' => $prefix], function() use($prefix,$path) {
        // admin/donhang/
        $controller=$path.'\DonHangController@';
        $prefix='chitietdonhang/{dathang_id}';
        Route::get($prefix,$controller.'chitietdonhang');

        $controller=$path.'\DonHangController@';
        $prefix='danggiao/{dathang_id}';
        Route::get($prefix,$controller.'danggiao');

        $controller=$path.'\DonHangController@';
        $prefix='thanhcong/{dathang_id}';
        Route::get($prefix,$controller.'thanhcong');

        $controller=$path.'\DonHangController@';
        $prefix='phantrang';
        Route::get($prefix,$controller.'phantrang');

        $controller=$path.'\DonHangController@';
        $prefix='ngaydatgiamdan';
        Route::get($prefix,$controller.'ngaydatgiamdan');

        $controller=$path.'\DonHangController@';
        $prefix='donthanhcongtang';
        Route::get($prefix,$controller.'donthanhcongtang');

        $controller=$path.'\DonHangController@';
        $prefix='donthanhconggiam';
        Route::get($prefix,$controller.'donthanhconggiam');

        $controller=$path.'\DonHangController@';
        $prefix='donchoduyettang';
        Route::get($prefix,$controller.'donchoduyettang');

        $controller=$path.'\DonHangController@';
        $prefix='donchoduyetgiam';
        Route::get($prefix,$controller.'donchoduyetgiam');

        $controller=$path.'\DonHangController@';
        $prefix='dondanggiaotang';
        Route::get($prefix,$controller.'dondanggiaotang');

        $controller=$path.'\DonHangController@';
        $prefix='dondanggiaogiam';
        Route::get($prefix,$controller.'dondanggiaogiam');


        $controller=$path.'\DonHangController@';
        $prefix='tim/{key_word}';
        Route::get($prefix,$controller.'tim');


    });




});



