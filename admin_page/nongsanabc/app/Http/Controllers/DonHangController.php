<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use \Datetime;
class DonHangController extends Controller
{

    //API
    //================DONHANG==================
    function donhang($khachhang_id){
        $row=DB::select('
        select DATHANG_ID,

        KHACHHANG_TEN,
        KHACHHANG_SDT,
        DATHANG_TRANGTHAI,
        DATHANG_NGAYDAT,
        DATHANG_NGAYGIAO,
        KHACHHANG_DIACHI
        from dathang as a, khachhang as b, quantri as c
        where a.KHACHHANG_ID=b.KHACHHANG_ID and a.TENDANGNHAP=c.TENDANGNHAP and a.KHACHHANG_ID=?
        order by DATHANG_NGAYDAT, DATHANG_TRANGTHAI desc
        ',[$khachhang_id]);
        return response()->json($row, 200,
        ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'],
        JSON_UNESCAPED_UNICODE);
    }
    function dathang(Request $request){
        $query=DB::insert('insert into
        dathang (

            TENDANGNHAP,
            KHACHHANG_ID,
            DATHANG_TRANGTHAI,
            DATHANG_NGAYDAT,
            DATHANG_NGAYGIAO
        )
        values ( ? , ? , ? , ? , ? )', [
                // $request->input('DATHANG_ID'),
                $request->input('TENDANGNHAP'),
                $request->input('KHACHHANG_ID'),
                $request->input('DATHANG_TRANGTHAI'),
                $request->input('DATHANG_NGAYDAT'),
                $request->input('DATHANG_NGAYGIAO')

        ],);


        if($query){


            for($i=0;$i<count($request->list);$i++){
                $query2=DB::insert('insert into
                chitietdathang (DATHANG_ID,SANPHAM_ID,CHITIETDATHANG_SOLUONG)
                values (LAST_INSERT_ID(),?, ?)
                ', [
                    // $request->input('DATHANG_ID'),

                    $request->list[$i]['SANPHAM_ID'],
                    $request->list[$i]['CHITIETDATHANG_SOLUONG'],


                ],);
            }

            if($query2){
                // return response()->status(201);
                for($i=0;$i<count($request->list);$i++){
                    $query3=DB::update('update sanpham
                    set SANPHAM_SOLUONG =SANPHAM_SOLUONG - ?
                    where SANPHAM_ID = ?'
                    , [
                        // $request->input('DATHANG_ID'),


                        $request->list[$i]['CHITIETDATHANG_SOLUONG'],
                        $request->list[$i]['SANPHAM_ID'],


                    ],);
                }


                if($query3){
                    for($i=0;$i<count($request->list);$i++){
                        $query4=
                        DB::delete('delete from giohang where KHACHHANG_ID = ? and SANPHAM_ID=?', [
                            $request->input('KHACHHANG_ID'),
                            $request->list[$i]['SANPHAM_ID'],
                        ]);
                    }
                   // if($query4){
                        return response()->json("Thành công", 201,
                        ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'],
                        JSON_UNESCAPED_UNICODE);
                    //}
                }
            }
            else return "Chua thanh cong ";
        }


    }
    function themgiohang(Request $request){

        $query=
        DB::update('update giohang set GIOHANG_SOLUONG = GIOHANG_SOLUONG + ?
        where KHACHHANG_ID = ? and SANPHAM_ID= ? ', [
                $request->input('GIOHANG_SOLUONG'),
                $request->input('KHACHHANG_ID'),
                $request->input('SANPHAM_ID'),

        ]);
        if($query){
            return response()->json("Đã cập nhật số lượng", 201,
            ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'],
            JSON_UNESCAPED_UNICODE);
        }

        $query=
        DB::insert('insert into giohang (KHACHHANG_ID,SANPHAM_ID,GIOHANG_SOLUONG) values (? , ?, ?)', [
            $request->input('KHACHHANG_ID'),
            $request->input('SANPHAM_ID'),
            $request->input('GIOHANG_SOLUONG'),
        ]);
        if($query){
            return response()->json("Đã thêm vào giỏ 1 sản phẩm ", 201,
            ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'],
            JSON_UNESCAPED_UNICODE);
        }


        return "Chưa thành công";
    }
    function xoagiohang(int $khachhang_id, int $sanpham_id){

        $query=DB::delete('delete from giohang
        where KHACHHANG_ID = ? and SANPHAM_ID= ? '
        , [
            $khachhang_id,
            $sanpham_id,
        ]
    );
        if($query){
            return response()->json("Đã xóa 1 sản phẩm từ giỏ", 201,
            ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'],
            JSON_UNESCAPED_UNICODE);
        }


        return "Chưa thành công";
    }
    function xemgiohang(int $khachhang_id){

        $row=DB::select('
        select *
        from giohang as a, sanpham as b
        where a.SANPHAM_ID=b.SANPHAM_ID and a.KHACHHANG_ID = ?

        '
        , [
            $khachhang_id,
        ]
        );

            return response()->json($row, 201,
            ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'],
            JSON_UNESCAPED_UNICODE);



        return "Chưa thành công";
    }

    function chitietdathang($dathang_id){
        $row=DB::select('
        select
        a.SANPHAM_ID,SANPHAM_TEN,CHITIETDATHANG_SOLUONG,SANPHAM_DONGIA,SANPHAM_URL
        from chitietdathang as a, sanpham as b
        where a.SANPHAM_ID=b.SANPHAM_ID and a.DATHANG_ID=?
        order by SANPHAM_TEN asc
        ',[$dathang_id]);
        return response()->json($row, 200,
        ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'],
        JSON_UNESCAPED_UNICODE);
    }

    function xoadon($dathang_id){
        $query =
        DB::select('select SANPHAM_ID,CHITIETDATHANG_SOLUONG
        from chitietdathang
        where DATHANG_ID = ?', [
            $dathang_id
        ]);
        if($query){
            foreach($query as $i){
                $_SANPHAM_ID=$i->SANPHAM_ID;
                $_CHITIETDATHANG_SOLUONG=$i->CHITIETDATHANG_SOLUONG;

                DB::update('update sanpham
                set SANPHAM_SOLUONG = SANPHAM_SOLUONG + ?
                where SANPHAM_ID = ?', [
                    $_CHITIETDATHANG_SOLUONG,
                    $_SANPHAM_ID,
                ]);
            }
        }
        $query2=DB::delete('
        delete
        from dathang
        where DATHANG_ID=?
        ',[$dathang_id]);
        if($query2){
            return response()->json("Thành công", 201,
        ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'],
        JSON_UNESCAPED_UNICODE);
        }
    }
    function huydon($dathang_id){
        $query=
        DB::update('update dathang
        set DATHANG_TRANGTHAI = "Hủy"
        where DATHANG_ID = ?', [
            $dathang_id
        ]);
        if($query){
            return response()->json("Thành công", 201,
            ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'],
            JSON_UNESCAPED_UNICODE);
        }

    }
 //END API
    function index(){
        // $data=array(
        //     'list'=>DB::select('
        //     select * from dathang as a, khachhang as b, quantri as c
        //     where a.KHACHHANG_ID=b.KHACHHANG_ID and a.TENDANGNHAP=c.TENDANGNHAP
        //     order by DATHANG_NGAYDAT asc
        //     ')
        // );

        // return view('admin.donhang.index',$data);
        $tendangnhap_cookie = Cookie::get('TENDANGNHAP_cookie');
        if($tendangnhap_cookie==""){
            return view('index')->with('info','Hết phiên vui lòng đăng nhập lại');;
        }


        $row=DB::table(DB::raw('dathang','khachhang','quantri'))
        ->join('khachhang','khachhang.KHACHHANG_ID','=','dathang.KHACHHANG_ID')
        ->join('quantri','quantri.TENDANGNHAP','=','dathang.TENDANGNHAP')
        ->select('dathang.DATHANG_ID','khachhang.KHACHHANG_TEN','dathang.DATHANG_TRANGTHAI','dathang.DATHANG_NGAYDAT','dathang.DATHANG_NGAYGIAO','quantri.HOTEN')
        ->orderBy('dathang.DATHANG_NGAYDAT','desc')
        ->paginate(5);
        return view('admin.donhang.index',['list'=> $row]);

    }
    function tim($key_Word){

        $row=DB::table(DB::raw('dathang','khachhang','quantri'))
        ->join('khachhang','khachhang.KHACHHANG_ID','=','dathang.KHACHHANG_ID')
        ->join('quantri','quantri.TENDANGNHAP','=','dathang.TENDANGNHAP')
        ->select('dathang.DATHANG_ID','khachhang.KHACHHANG_TEN','dathang.DATHANG_TRANGTHAI','dathang.DATHANG_NGAYDAT','dathang.DATHANG_NGAYGIAO','quantri.HOTEN')
        ->where('dathang.DATHANG_ID', 'like', '%' . $key_Word. '%')
        ->orderBy('dathang.DATHANG_NGAYDAT','desc')
        ->paginate(5);
        return view('admin.donhang.index',['list'=> $row]);

    }
    function ngaydatgiamdan(){

        $row=DB::table(DB::raw('dathang','khachhang','quantri'))
        ->join('khachhang','khachhang.KHACHHANG_ID','=','dathang.KHACHHANG_ID')
        ->join('quantri','quantri.TENDANGNHAP','=','dathang.TENDANGNHAP')
        ->select('dathang.DATHANG_ID','khachhang.KHACHHANG_TEN','dathang.DATHANG_TRANGTHAI','dathang.DATHANG_NGAYDAT','dathang.DATHANG_NGAYGIAO','quantri.HOTEN')
        ->orderBy('dathang.DATHANG_NGAYDAT','desc')
        ->paginate(5);
        return view('admin.donhang.index',['list'=> $row]);

    }
    function donthanhcongtang(){

        $row=DB::table(DB::raw('dathang','khachhang','quantri'))
        ->join('khachhang','khachhang.KHACHHANG_ID','=','dathang.KHACHHANG_ID')
        ->join('quantri','quantri.TENDANGNHAP','=','dathang.TENDANGNHAP')
        ->select('dathang.DATHANG_ID','khachhang.KHACHHANG_TEN','dathang.DATHANG_TRANGTHAI','dathang.DATHANG_NGAYDAT','dathang.DATHANG_NGAYGIAO','quantri.HOTEN')
        ->where('dathang.DATHANG_TRANGTHAI','Thành công')
        ->orderBy('dathang.DATHANG_NGAYDAT','asc')
        ->paginate(5);
        return view('admin.donhang.index',['list'=> $row]);

    }
    function donthanhconggiam(){

        $row=DB::table(DB::raw('dathang','khachhang','quantri'))
        ->join('khachhang','khachhang.KHACHHANG_ID','=','dathang.KHACHHANG_ID')
        ->join('quantri','quantri.TENDANGNHAP','=','dathang.TENDANGNHAP')
        ->select('dathang.DATHANG_ID','khachhang.KHACHHANG_TEN','dathang.DATHANG_TRANGTHAI','dathang.DATHANG_NGAYDAT','dathang.DATHANG_NGAYGIAO','quantri.HOTEN')
        ->where('dathang.DATHANG_TRANGTHAI','Thành công')
        ->orderBy('dathang.DATHANG_NGAYDAT','desc')
        ->paginate(5);
        return view('admin.donhang.index',['list'=> $row]);

    }

    function donchoduyettang(){

        $row=DB::table(DB::raw('dathang','khachhang','quantri'))
        ->join('khachhang','khachhang.KHACHHANG_ID','=','dathang.KHACHHANG_ID')
        ->join('quantri','quantri.TENDANGNHAP','=','dathang.TENDANGNHAP')
        ->select('dathang.DATHANG_ID','khachhang.KHACHHANG_TEN','dathang.DATHANG_TRANGTHAI','dathang.DATHANG_NGAYDAT','dathang.DATHANG_NGAYGIAO','quantri.HOTEN')
        ->where('dathang.DATHANG_TRANGTHAI','Chờ duyệt')
        ->orderBy('dathang.DATHANG_NGAYDAT','asc')
        ->paginate(5);
        return view('admin.donhang.index',['list'=> $row]);

    }
    function donchoduyetgiam(){

        $row=DB::table(DB::raw('dathang','khachhang','quantri'))
        ->join('khachhang','khachhang.KHACHHANG_ID','=','dathang.KHACHHANG_ID')
        ->join('quantri','quantri.TENDANGNHAP','=','dathang.TENDANGNHAP')
        ->select('dathang.DATHANG_ID','khachhang.KHACHHANG_TEN','dathang.DATHANG_TRANGTHAI','dathang.DATHANG_NGAYDAT','dathang.DATHANG_NGAYGIAO','quantri.HOTEN')
        ->where('dathang.DATHANG_TRANGTHAI','Chờ duyệt')
        ->orderBy('dathang.DATHANG_NGAYDAT','desc')
        ->paginate(5);
        return view('admin.donhang.index',['list'=> $row]);

    }

    function dondanggiaotang(){

        $row=DB::table(DB::raw('dathang','khachhang','quantri'))
        ->join('khachhang','khachhang.KHACHHANG_ID','=','dathang.KHACHHANG_ID')
        ->join('quantri','quantri.TENDANGNHAP','=','dathang.TENDANGNHAP')
        ->select('dathang.DATHANG_ID','khachhang.KHACHHANG_TEN','dathang.DATHANG_TRANGTHAI','dathang.DATHANG_NGAYDAT','dathang.DATHANG_NGAYGIAO','quantri.HOTEN')
        ->where('dathang.DATHANG_TRANGTHAI','Đang giao')
        ->orderBy('dathang.DATHANG_NGAYDAT','asc')
        ->paginate(5);
        return view('admin.donhang.index',['list'=> $row]);

    }
    function dondanggiaogiam(){

        $row=DB::table(DB::raw('dathang','khachhang','quantri'))
        ->join('khachhang','khachhang.KHACHHANG_ID','=','dathang.KHACHHANG_ID')
        ->join('quantri','quantri.TENDANGNHAP','=','dathang.TENDANGNHAP')
        ->select('dathang.DATHANG_ID','khachhang.KHACHHANG_TEN','dathang.DATHANG_TRANGTHAI','dathang.DATHANG_NGAYDAT','dathang.DATHANG_NGAYGIAO','quantri.HOTEN')
        ->where('dathang.DATHANG_TRANGTHAI','Đang giao')
        ->orderBy('dathang.DATHANG_NGAYDAT','desc')
        ->paginate(5);
        return view('admin.donhang.index',['list'=> $row]);

    }
    function phantrang(){
        return view('admin.donhang.phantrang',['list'=>DB::table('sanpham')->paginate(5)]);
    }
    function chitietdonhang($dathang_id){
        $data=array(
            'list'=> DB::select('
        select
        a.SANPHAM_ID,SANPHAM_TEN,CHITIETDATHANG_SOLUONG,SANPHAM_DONGIA,SANPHAM_URL
        from chitietdathang as a, sanpham as b
        where a.SANPHAM_ID=b.SANPHAM_ID and a.DATHANG_ID=?
        order by SANPHAM_TEN asc
        ',[
            $dathang_id
        ]));
        // return response()->json($row, 200,
        // ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'],
        // JSON_UNESCAPED_UNICODE);
        return view('admin.donhang.chitietdonhang.index',$data);
    }
    function danggiao($dathang_id){
        $tendangnhap_cookie = Cookie::get('TENDANGNHAP_cookie');
        if($tendangnhap_cookie==""){
            return view('index')->with('info','Hết phiên vui lòng đăng nhập lại');;
        }
        $now = new DateTime();
        $today=$now->format('d/m/Y');

        $query=
        DB::update('update dathang set DATHANG_TRANGTHAI = "Đang giao", TENDANGNHAP=?, DATHANG_NGAYGIAO=? where DATHANG_ID = ?', [
            $tendangnhap_cookie,
            $today,
            $dathang_id,

        ]);
        if($query){
            return back()
            ->with('success','Bạn vừa chuyển đơn '.$dathang_id.' sang trạng thái ĐANG GIAO. ');
        }

    }
    function thanhcong($dathang_id){
        $tendangnhap_cookie = Cookie::get('TENDANGNHAP_cookie');
        if($tendangnhap_cookie==""){
            return view('index')->with('info','Hết phiên vui lòng đăng nhập lại');;
        }
        $now = new DateTime();
        $today=$now->format('d/m/Y');
        $query=
        DB::update('update dathang set DATHANG_TRANGTHAI = "Thành công", TENDANGNHAP=?,DATHANG_NGAYGIAO=?  where DATHANG_ID = ?', [
            $tendangnhap_cookie,
            $today,
            $dathang_id,
        ]);
        if($query){
            return back()
            ->with('success','Bạn vừa chuyển đơn '.$dathang_id.' sang trạng thái THÀNH CÔNG.  ');
        }

    }



}
