<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\ModelNotFoundException;
class DashboardController extends Controller
{
    function index(Request $request){
            $query =
            DB::select('select count(*) as count from quantri
            where TENDANGNHAP = ? and MATKHAU= ? and TRANGTHAI= "Kích hoạt" ', [
                $request->input('TENDANGNHAP'),
                $request->input('MATKHAU'),
            ]);
            foreach($query as $i){
                $kt=$i->count;
            }
            $row=
            DB::select('select HOTEN,ANHDAIDIEN from quantri
            where TENDANGNHAP = ? ', [
            $request->input('TENDANGNHAP'),
            ]);
            foreach($row as $i){
            $hoten=$i->HOTEN;
            $anhdaidien=$i->ANHDAIDIEN;
            }

            $tendangnhap=$request->input('TENDANGNHAP');
            if($kt==1){

                $minutes = 60;
                Cookie::queue(Cookie::make('TENDANGNHAP_cookie', $request->input('TENDANGNHAP'), $minutes));
                Cookie::queue(Cookie::make('HOTEN_cookie', $hoten, $minutes));
                Cookie::queue(Cookie::make('ANHDAIDIEN_cookie', $anhdaidien, $minutes));

                return view('admin.dashboard.index',['tendangnhap'=>$tendangnhap,'hoten'=>$hoten,'anhdaidien'=>$anhdaidien]);

            }
            return back()->with('info','Sai tài khoản mật khẩu.');





    }
    function trangchu(){

        return view('admin.trangchu.index');
    }
}
