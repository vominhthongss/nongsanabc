<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

//================SANPHAM==================
$path='App\Http\Controllers';
$controller=$path.'\SanPhamController@sanpham';
Route::get('sanpham',$controller);

$path='App\Http\Controllers';
$controller=$path.'\SanPhamController@timsanpham';
Route::get('timsanpham/{sanpham_ten}',$controller);

$path='App\Http\Controllers';
$controller=$path.'\SanPhamController@sanphamtheoloai';
Route::get('sanphamtheoloai/{loai_ten}',$controller);

$path='App\Http\Controllers';
$controller=$path.'\SanPhamController@chitietsanpham';
Route::get('chitietsanpham/{sanpham_id}',$controller);

$path='App\Http\Controllers';
$controller=$path.'\SanPhamController@danhgia';
Route::post('danhgia',$controller);

$path='App\Http\Controllers';
$controller=$path.'\SanPhamController@xemdanhgia';
Route::get('xemdanhgia/{sanpham_id}',$controller);

$path='App\Http\Controllers';
$controller=$path.'\SanPhamController@kiemtradanhgia';
Route::get('kiemtradanhgia/{sanpham_id}/{khachhang_id}',$controller);


//================DONHANG==================
$path='App\Http\Controllers';
$controller=$path.'\DonHangController@donhang';
Route::get('donhang/{khachhang_id}',$controller);

$path='App\Http\Controllers';
$controller=$path.'\DonHangController@dathang';
Route::post('dathang',$controller);

$path='App\Http\Controllers';
$controller=$path.'\DonHangController@themgiohang';
Route::post('themgiohang',$controller);

$path='App\Http\Controllers';
$controller=$path.'\DonHangController@xoagiohang';
Route::get('xoagiohang/{khachhang_id}/{sanpham_id}',$controller);

$path='App\Http\Controllers';
$controller=$path.'\DonHangController@xemgiohang';
Route::get('xemgiohang/{khachhang_id}',$controller);

$path='App\Http\Controllers';
$controller=$path.'\DonHangController@chitietdathang';
Route::get('chitietdathang/{dathang_id}',$controller);

$path='App\Http\Controllers';
$controller=$path.'\DonHangController@xoadon';
Route::post('xoadon/{dathang_id}',$controller);

$path='App\Http\Controllers';
$controller=$path.'\DonHangController@huydon';
Route::post('huydon/{dathang_id}',$controller);

//================KHACHHANG==================
$path='App\Http\Controllers';
$controller=$path.'\KhachHangController@khachhang';
Route::get('khachhang',$controller);

$controller=$path.'\KhachHangController@capnhat';
Route::post('capnhat',$controller);

$controller=$path.'\KhachHangController@dangky';
Route::post('dangky',$controller);

$controller=$path.'\KhachHangController@dangnhap';
Route::post('dangnhap/{khachhang_sdt}/{khachhang_matkhau}',$controller);

$controller=$path.'\KhachHangController@doimatkhau';
Route::post('doimatkhau',$controller);

$controller=$path.'\KhachHangController@anhdaidien';
Route::post('anhdaidien',$controller);

// $controller=$path.'\KhachHangController@layanhdaidien';
// Route::get('layanhdaidien/{khachhang_id}',$controller);

// $controller=$path.'\KhachHangController@dathang';
// Route::post('dathang',$controller);
