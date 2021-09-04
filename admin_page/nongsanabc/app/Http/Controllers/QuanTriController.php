<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
class QuanTriController extends Controller
{
    function index(){
        // $data=array(
        //     'list'=>DB::select('select * from QUANTRI order by TENDANGNHAP asc')
        // );
        // return view('admin.quantri.index',$data);
        // $tendangnhap_cookie = Cookie::get('TENDANGNHAP_cookie');
        // if($tendangnhap_cookie!="admin"){
        //     return back()
        //     ->with('success','Bạn không phải admin.');
        // }
        $tendangnhap_cookie = Cookie::get('TENDANGNHAP_cookie');
        if($tendangnhap_cookie==""){
            return view('index')->with('info','Hết phiên vui lòng đăng nhập lại');;
        }

        $row=DB::table('quantri')->select('quantri.*')->orderBy('TENDANGNHAP','asc')->paginate(5);
        return view('admin.quantri.index',['list'=>$row]);
    }

    function tim($key_word){
        // $data=array(
        //     'list'=>DB::select('select * from QUANTRI order by TENDANGNHAP asc')
        // );
        // return view('admin.quantri.index',$data);
        // $tendangnhap_cookie = Cookie::get('TENDANGNHAP_cookie');
        // if($tendangnhap_cookie!="admin"){
        //     return back()
        //     ->with('success','Bạn không phải admin.');
        // }
        $row=DB::table('quantri')
        ->select('quantri.*')
        ->where('quantri.TENDANGNHAP','like','%'.$key_word.'%')
        ->orwhere('quantri.HOTEN','like','%'.$key_word.'%')
        ->orderBy('TENDANGNHAP','asc')
        ->paginate(5);
        return view('admin.quantri.index',['list'=>$row]);
    }
    function chinhsua($tendangnhap){

        $row=DB::select('select * from quantri where TENDANGNHAP = ?', [$tendangnhap]);

        return view('admin.quantri.chinhsua.index',['row'=>$row]);
    }
    function them(){
        return view('admin.quantri.them.index');
    }
    function themmoi(Request $request){
        $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $imageName = $request->input('TENDANGNHAP').'.'.$request->image->extension();
        $storedPath='images/avataradmin/'.$imageName;
        if(File::exists($storedPath)) {
            File::delete($storedPath);
        }
        $request->image->move(public_path('images/avataradmin'), $imageName);

        $query=DB::insert('insert into quantri
        (TENDANGNHAP, MATKHAU, VAITRO, HOTEN, PHAI, NGAYSINH, SODIENTHOAI, DIACHI, ANHDAIDIEN, TRANGTHAI)
        values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [
            $request->input('TENDANGNHAP'),
            $request->input('MATKHAU'),
            $request->input('VAITRO'),
            $request->input('HOTEN'),
            $request->input('PHAI'),
            $request->input('NGAYSINH'),
            $request->input('SODIENTHOAI'),
            $request->input('DIACHI'),
            $storedPath,
            $request->input('TRANGTHAI'),

        ]);
        if($query){
            return back()
            ->with('success','Bạn vừa thêm thành viên mới.');
        }
    }
    function capnhat(Request $request){
        // $request->validate([
        //     'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        // ]);

        // $imageName = $request->input('TENDANGNHAP').'.'.$request->image->extension();
        // $storedPath='images/avataradmin/'.$imageName;
        // if(File::exists($storedPath)) {
        //     File::delete($storedPath);
        // }
        // $request->image->move(public_path('images/avataradmin'), $imageName);


        $query=DB::update('update quantri
        set MATKHAU= ?, VAITRO=?, HOTEN=?,PHAI=?,NGAYSINH=?,SODIENTHOAI=?,DIACHI=?,TRANGTHAI=?
        where TENDANGNHAP = ?',
        [

            $request->input('MATKHAU'),
            $request->input('VAITRO'),
            $request->input('HOTEN'),
            $request->input('PHAI'),
            $request->input('NGAYSINH'),
            $request->input('SODIENTHOAI'),
            $request->input('DIACHI'),
            $request->input('TRANGTHAI'),
            $request->input('TENDANGNHAP')

        ]);
        if($query){
            return back()
            ->with('success','Bạn vừa cập nhật thông tin.');
        }
    }
    function capnhatanh(Request $request){
        $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $imageName = $request->input('TENDANGNHAP').'.'.$request->image->extension();
        $storedPath='images/avataradmin/'.$imageName;
        if(File::exists($storedPath)) {
            File::delete($storedPath);
        }
        $request->image->move(public_path('images/avataradmin'), $imageName);


        $query=DB::update('update quantri
        set ANHDAIDIEN=?
        where TENDANGNHAP = ?',
        [
            $storedPath,
            $request->input('TENDANGNHAP')
        ]);
        if($query){
            return back()
            ->with('success','Bạn vừa cập nhật ảnh đại diện.')
            ->with('image',$imageName);
        }
        else{
            return back()
            ->with('unsuccess','Không thành công, thử lại !');
        }
    }
    function xoa($tendangnhap){

        $query=DB::delete('delete from quantri where TENDANGNHAP = ? ', [$tendangnhap]);
        if($query){
            return back()
            ->with('success','Bạn đã xóa thành công '.$tendangnhap);
        }
        else{
            return back()
            ->with('unsuccess','Không thành công, thử lại !');
        }
    }
}
