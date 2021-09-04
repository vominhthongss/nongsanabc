<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
class KhachHangController extends Controller
{

    //API
    //================KHACHHANG==================
    function khachhang(){
        $row=DB::select('
        select * from khachhang
        ');
        return response()->json($row, 200,
        ['Content-Type' => 'application/json;charset=UTF-8'],
        JSON_UNESCAPED_UNICODE);
    }
    function capnhat(Request $request){
        $query=DB::update('
        update khachhang
        set
        KHACHHANG_TEN = ?,
        KHACHHANG_PHAI= ?,
        KHACHHANG_DIACHI= ?,
        KHACHHANG_NGAYSINH= ?
        where KHACHHANG_ID = ?

        ',
        [
            $request->input('KHACHHANG_TEN'),
            $request->input('KHACHHANG_PHAI'),
            $request->input('KHACHHANG_DIACHI'),
            $request->input('KHACHHANG_NGAYSINH'),
            $request->input('KHACHHANG_ID')
        ]);
        if($query){
            return response()->json("Thành công", 201,
        ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'],JSON_UNESCAPED_UNICODE);
        }
        else return "Không thành công";

    }
    function doimatkhau(Request $request){
        $query=DB::update('
        update khachhang
        set
        KHACHHANG_MATKHAU = ?
        where KHACHHANG_ID = ?

        ',
        [
            $request->input('KHACHHANG_MATKHAU'),
            $request->input('KHACHHANG_ID')
        ]);
        if($query){
            return response()->json("Thành công", 201,
        ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'],JSON_UNESCAPED_UNICODE);
        }
        else return "Không thành công";
    }

    function dangky(Request $request){
        $check=DB::select('select count(*) count from khachhang
        where KHACHHANG_SDT= ?', [
            $request->input('KHACHHANG_SDT'),
        ]);

        //  response()->json($check);
        foreach($check as $i){
            $kt = $i->count;
        }
        if($kt=="1"){
            return 0;
        }


        $query=DB::insert('
        insert into khachhang
        (
        KHACHHANG_TEN,
        KHACHHANG_SDT,
        KHACHHANG_PHAI,
        KHACHHANG_DIACHI,
        KHACHHANG_NGAYSINH,
        KHACHHANG_MATKHAU,
        KHACHHANG_ANH_URL)
        values (?,?,?,?,?,?,?)
    ',
    [
        $request->input('KHACHHANG_TEN'),
        $request->input('KHACHHANG_SDT'),
        $request->input('KHACHHANG_PHAI'),
        $request->input('KHACHHANG_DIACHI'),
        $request->input('KHACHHANG_NGAYSINH'),
        $request->input('KHACHHANG_MATKHAU'),
        $request->input('KHACHHANG_ANH_URL')
    ]);
        if($query){
            return response()->json(1, 201,
        ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'],);
        }
        else return "That bai";
    }

    function dangnhap($khachhang_sdt, $khachhang_matkhau){
        $check=DB::select('select count(*) count from khachhang
        where KHACHHANG_SDT=? and KHACHHANG_MATKHAU=? ', [

            $khachhang_sdt,
            $khachhang_matkhau,

        ]);

        // return response()->json($check);
        foreach($check as $i){
            $kt = $i->count;
        }
        if($kt=="1"){
            $check=DB::select('select * from khachhang
            where KHACHHANG_SDT=? and KHACHHANG_MATKHAU=? ', [

                $khachhang_sdt,
                $khachhang_matkhau,

            ]);
            // foreach($check as $i){
            //     $kt = $i->KHACHHANG_ID;
            // }
            return response()->json($check, 201,
            ['Content-Type' => 'application/json;charset=UTF-8'],JSON_UNESCAPED_UNICODE);
        }
        else return "0";

    }
    function anhdaidien(Request $request){
        $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);
        $id=$request->input('khachhang_id');


        $imageName = $id.'.'.$request->image->extension();
      //  $imageName = time().'.'.$request->image->extension();

        $storedPath='images/avatarcustomer/'.$imageName;
        if(File::exists($storedPath)) {
            File::delete($storedPath);
        }
        $request->image->move(public_path('images/avatarcustomer'), $imageName);

        DB::update('update khachhang set KHACHHANG_ANH_URL = ? where KHACHHANG_ID = ?', [
            $storedPath,
            $id,
        ]);
        return $storedPath;
       // return response()->json([$storedPath,201]);







    }
    // function layanhdaidien($khachhang_id){
    //     $row=
    //     DB::select('select KHACHHANG_ANH_URL from khachhang where KHACHHANG_ID = ?', [
    //        $khachhang_id,
    //     ]);
    //     return $row;


    // }


    // }
    //END API


}
