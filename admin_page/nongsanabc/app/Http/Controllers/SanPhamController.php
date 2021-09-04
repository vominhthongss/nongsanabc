<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Cookie;
use App\Models\SanPham;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

class SanPhamController extends Controller
{
    // API

    //================SANPHAM==================
    function sanpham(){
        $row=DB::select('
        SELECT a.SANPHAM_ID,b.LOAI_TEN,a.SANPHAM_TEN,a.SANPHAM_MOTA,a.SANPHAM_URL,a.SANPHAM_SOLUONG,a.SANPHAM_DONGIA, AVG(c.DANHGIA_SOSAO) as TBSAO FROM sanpham as a, loai as b, danhgia as c
        WHERE a.LOAI_ID=b.LOAI_ID AND a.SANPHAM_ID=c.SANPHAM_ID
        GROUP BY a.SANPHAM_ID,b.LOAI_TEN,a.SANPHAM_TEN,a.SANPHAM_MOTA,a.SANPHAM_URL,a.SANPHAM_SOLUONG,a.SANPHAM_DONGIA
        ORDER BY b.LOAI_TEN ASC

        ');
        // return response()->json(['row'=>$row], 200,
        // ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'],
        // JSON_UNESCAPED_UNICODE);
        return response()->json($row,200,[
            'Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'
        ],
        JSON_UNESCAPED_UNICODE);
    }
    function timsanpham($sanpham_ten){
        $row=DB::select('
        SELECT a.SANPHAM_ID,b.LOAI_TEN,a.SANPHAM_TEN,a.SANPHAM_MOTA,a.SANPHAM_URL,a.SANPHAM_SOLUONG,a.SANPHAM_DONGIA, AVG(c.DANHGIA_SOSAO) as TBSAO FROM sanpham as a, loai as b, danhgia as c
        WHERE a.LOAI_ID=b.LOAI_ID AND a.SANPHAM_ID=c.SANPHAM_ID and a.SANPHAM_TEN like "'.'%'.$sanpham_ten.'%'.'"
        GROUP BY a.SANPHAM_ID,b.LOAI_TEN,a.SANPHAM_TEN,a.SANPHAM_MOTA,a.SANPHAM_URL,a.SANPHAM_SOLUONG,a.SANPHAM_DONGIA
        ORDER BY b.LOAI_TEN ASC

        ');
        // return response()->json(['row'=>$row], 200,
        // ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'],
        // JSON_UNESCAPED_UNICODE);
        return response()->json($row,200,[
            'Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'
        ],
        JSON_UNESCAPED_UNICODE);
    }
    function sanphamtheoloai($loai_ten){
        $row=DB::select('
        SELECT a.SANPHAM_ID,b.LOAI_TEN,a.SANPHAM_TEN,a.SANPHAM_MOTA,a.SANPHAM_URL,a.SANPHAM_SOLUONG,a.SANPHAM_DONGIA, AVG(c.DANHGIA_SOSAO) as TBSAO FROM sanpham as a, loai as b, danhgia as c
        WHERE a.LOAI_ID=b.LOAI_ID AND a.SANPHAM_ID=c.SANPHAM_ID AND b.LOAI_TEN=?
        GROUP BY a.SANPHAM_ID,b.LOAI_TEN,a.SANPHAM_TEN,a.SANPHAM_MOTA,a.SANPHAM_URL,a.SANPHAM_SOLUONG,a.SANPHAM_DONGIA
        ORDER BY b.LOAI_TEN ASC

        ',[$loai_ten]);
        // return response()->json(['row'=>$row], 200,
        // ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'],
        // JSON_UNESCAPED_UNICODE);
        return response()->json($row,200,[
            'Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'
        ],
        JSON_UNESCAPED_UNICODE);
    }
    function chitietsanpham($sanpham_id){
        $row=DB::select('
        SELECT a.SANPHAM_ID,b.LOAI_TEN,a.SANPHAM_TEN,a.SANPHAM_MOTA,a.SANPHAM_URL,a.SANPHAM_SOLUONG,a.SANPHAM_DONGIA, AVG(c.DANHGIA_SOSAO) as TBSAO FROM sanpham as a, loai as b, danhgia as c
        WHERE a.LOAI_ID=b.LOAI_ID AND a.SANPHAM_ID=c.SANPHAM_ID AND a.SANPHAM_ID='.$sanpham_id.'
        GROUP BY a.SANPHAM_ID,b.LOAI_TEN,a.SANPHAM_TEN,a.SANPHAM_MOTA,a.SANPHAM_URL,a.SANPHAM_SOLUONG,a.SANPHAM_DONGIA
        ORDER BY b.LOAI_TEN ASC

        ');
        // return response()->json(['row'=>$row], 200,
        // ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'],
        // JSON_UNESCAPED_UNICODE);
        return response()->json($row,200,[
            'Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'
        ],
        JSON_UNESCAPED_UNICODE);
    }
    function danhgia(Request $request)
    {
        $query=DB::select('select count(*) count
        from danhgia
        where KHACHHANG_ID=? and SANPHAM_ID=? and DANHGIA_NOIDUNG=? and DANHGIA_SOSAO=?'
        , [
            $request->input('KHACHHANG_ID'),
            $request->input('SANPHAM_ID'),
            $request->input('DANHGIA_NOIDUNG'),
            $request->input('DANHGIA_SOSAO'),

        ]);
        foreach($query as $i){
            $kt=$i->count;
        }
        if($kt==1){
            return response()->json("Không thành công",201,[
                'Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'
            ],
            JSON_UNESCAPED_UNICODE);
        }
        $query1 =
        DB::update('update danhgia
        SET DANHGIA_NOIDUNG=?, DANHGIA_SOSAO=?
        where KHACHHANG_ID=? and SANPHAM_ID=?

        ', [

            $request->input('DANHGIA_NOIDUNG'),
            $request->input('DANHGIA_SOSAO'),
            $request->input('KHACHHANG_ID'),
            $request->input('SANPHAM_ID'),
        ]);
        if($query1){
            return response()->json("Thành công cập nhật",201,[
                'Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'
            ],
            JSON_UNESCAPED_UNICODE);
        }
        $query2 =
        DB::insert('insert into danhgia
        (KHACHHANG_ID,
        SANPHAM_ID,
        DANHGIA_NOIDUNG,
        DANHGIA_SOSAO)
        values (?, ?, ?, ?)', [
            $request->input('KHACHHANG_ID'),
            $request->input('SANPHAM_ID'),
            $request->input('DANHGIA_NOIDUNG'),
            $request->input('DANHGIA_SOSAO'),
        ]);
        if($query2){
            return response()->json("Thành công",201,[
                'Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'
            ],
            JSON_UNESCAPED_UNICODE);
        }


        return "0";


    }
    function xemdanhgia($sanpham_id){
        $row =
        DB::select('
        select KHACHHANG_TEN,KHACHHANG_ANH_URL, DANHGIA_NOIDUNG, DANHGIA_SOSAO
        from danhgia as a, khachhang as b
        where SANPHAM_ID = ? and a.KHACHHANG_ID=b.KHACHHANG_ID and a.KHACHHANG_ID  !=0
        order by DANHGIA_SOSAO desc
        '

        , [
            $sanpham_id,
        ]);
        return response()->json($row,200,[
            'Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'
        ],
        JSON_UNESCAPED_UNICODE);

    }
    function kiemtradanhgia($sanpham_id, $khachhang_id){
        $check=
        DB::select('select count(*) count from danhgia
        where SANPHAM_ID = ? and KHACHHANG_ID=? ', [
            $sanpham_id,
            $khachhang_id,
        ]);
        foreach($check as $i){
            $kt=$i->count;
        }
      //  if($kt=="1"){

            // return response()->json("1",200,[
            //     'Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'
            // ],
            // JSON_UNESCAPED_UNICODE);
       // }
        // return "0";
        return $kt;

    }
    // END API
    function index(){
        // $data=array(
        //     'list'=>DB::select('
        //     SELECT a.SANPHAM_ID,b.LOAI_TEN,a.SANPHAM_TEN,a.SANPHAM_MOTA,a.SANPHAM_URL,a.SANPHAM_SOLUONG,a.SANPHAM_DONGIA, AVG(c.DANHGIA_SOSAO) as TBSAO
        //     FROM sanpham as a, loai as b, danhgia as c
        //     WHERE a.LOAI_ID=b.LOAI_ID AND a.SANPHAM_ID=c.SANPHAM_ID
        //     GROUP BY a.SANPHAM_ID,b.LOAI_TEN,a.SANPHAM_TEN,a.SANPHAM_MOTA,a.SANPHAM_URL,a.SANPHAM_SOLUONG,a.SANPHAM_DONGIA
        //     ORDER BY b.LOAI_TEN ASC
        //     ')
        // );
        // return view('admin.sanpham.index',$data);
        $tendangnhap_cookie = Cookie::get('TENDANGNHAP_cookie');
        if($tendangnhap_cookie==""){
            return view('index')->with('info','Hết phiên vui lòng đăng nhập lại');;
        }

        $row=DB::table(DB::raw('sanpham','loai','danhgia'))
        ->join('loai','loai.LOAI_ID','=','sanpham.LOAI_ID')
        ->join('danhgia','danhgia.SANPHAM_ID','=','sanpham.SANPHAM_ID')
        ->select('sanpham.SANPHAM_ID','loai.LOAI_TEN','sanpham.SANPHAM_TEN','sanpham.SANPHAM_MOTA','sanpham.SANPHAM_URL','sanpham.SANPHAM_SOLUONG','sanpham.SANPHAM_DONGIA')
        ->groupBy('sanpham.SANPHAM_ID','loai.LOAI_TEN','sanpham.SANPHAM_TEN','sanpham.SANPHAM_MOTA','sanpham.SANPHAM_URL','sanpham.SANPHAM_SOLUONG','sanpham.SANPHAM_DONGIA')
        ->orderBy('loai.LOAI_TEN', 'asc')
        ->paginate(5);
        return view('admin.sanpham.index',['list'=>$row]);

    }
    function timtheoloai($loai_ten){

        $row=DB::table(DB::raw('sanpham','loai','danhgia'))
        ->join('loai','loai.LOAI_ID','=','sanpham.LOAI_ID')
        ->join('danhgia','danhgia.SANPHAM_ID','=','sanpham.SANPHAM_ID')
        ->select('sanpham.SANPHAM_ID','loai.LOAI_TEN','sanpham.SANPHAM_TEN','sanpham.SANPHAM_MOTA','sanpham.SANPHAM_URL','sanpham.SANPHAM_SOLUONG','sanpham.SANPHAM_DONGIA')
        ->where('loai.LOAI_TEN',$loai_ten)
        ->groupBy('sanpham.SANPHAM_ID','loai.LOAI_TEN','sanpham.SANPHAM_TEN','sanpham.SANPHAM_MOTA','sanpham.SANPHAM_URL','sanpham.SANPHAM_SOLUONG','sanpham.SANPHAM_DONGIA')
        ->orderBy('loai.LOAI_TEN', 'asc')
        ->paginate(5);
        return view('admin.sanpham.index',['list'=>$row]);

    }
    function tim($key_word){

        $row=DB::table(DB::raw('sanpham','loai','danhgia'))
        ->join('loai','loai.LOAI_ID','=','sanpham.LOAI_ID')
        ->join('danhgia','danhgia.SANPHAM_ID','=','sanpham.SANPHAM_ID')
        ->select('sanpham.SANPHAM_ID','loai.LOAI_TEN','sanpham.SANPHAM_TEN','sanpham.SANPHAM_MOTA','sanpham.SANPHAM_URL','sanpham.SANPHAM_SOLUONG','sanpham.SANPHAM_DONGIA')
        ->where('sanpham.SANPHAM_TEN', 'like', '%' . $key_word. '%')
        ->orwhere('sanpham.SANPHAM_ID', 'like', '%' . $key_word. '%')
        ->groupBy('sanpham.SANPHAM_ID','loai.LOAI_TEN','sanpham.SANPHAM_TEN','sanpham.SANPHAM_MOTA','sanpham.SANPHAM_URL','sanpham.SANPHAM_SOLUONG','sanpham.SANPHAM_DONGIA')
        ->orderBy('loai.LOAI_TEN', 'asc')
        ->paginate(5);
        return view('admin.sanpham.index',['list'=>$row]);

    }
    function them(){
        $row1=DB::select('select * from loai
        ');
        $row2=DB::select('select * from noisanxuat
        ');


        return view('admin.sanpham.them.index',['loai'=>$row1,'noisanxuat'=>$row2]);
    }
    function themmoi(Request $request){
        $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $imageName = time().'.'.$request->image->extension();

        $storedPath='images/products/'.$imageName;
        if(File::exists($storedPath)) {
            File::delete($storedPath);
        }
        $request->image->move(public_path('images/products'), $imageName);


        //
        $length=9;
        $characters = '0123456789';
        $charactersLength = strlen($characters);
        $lan1 = '';
        for ($i = 0; $i < $length; $i++) {
            $lan1.= $characters[rand(0, $charactersLength - 1)];
        }
        $characters = $lan1;
        $charactersLength = strlen($characters );
        $SANPHAM_ID = '';
        for ($i = 0; $i < $length; $i++) {
            $SANPHAM_ID.= $characters[rand(0, $charactersLength - 1)];
        }
        //

        $query=DB::insert('insert into sanpham
        (SANPHAM_TEN,SANPHAM_SOLUONG,SANPHAM_DONGIA,SANPHAM_MOTA,SANPHAM_URL,NOISANXUAT_ID,LOAI_ID)
        values (?, ?, ?, ?, ?, ?, ?)',
        [
            // $SANPHAM_ID,
            $request->input('SANPHAM_TEN'),
            $request->input('SANPHAM_SOLUONG'),
            $request->input('SANPHAM_DONGIA'),
            $request->input('SANPHAM_MOTA'),
            $storedPath,
            $request->input('NOISANXUAT_ID'),
            $request->input('LOAI_ID'),

        ]);


        if($query){
            $query=
            DB::insert('
            insert into danhgia (KHACHHANG_ID, SANPHAM_ID,DANHGIA_NOIDUNG,DANHGIA_SOSAO)
            values (?, LAST_INSERT_ID(), ?, ?)',
            [
                0,
                // $SANPHAM_ID,
                'Chưa có đánh giá',
                5
            ]);


            return back()->with('success','Bạn vừa thêm sản phẩm mới. =');

        }
        else{
            return back()->with('unsuccess','Không thành công.');
        }
    }
    function chinhsua($sanpham_id){
        $row1=DB::select('select * from loai
        ');
        $row2=DB::select('select * from noisanxuat
        ');
        $row3=DB::select('select * from sanpham as a,loai as b,noisanxuat as c
        where a.LOAI_ID=b.LOAI_ID and a.NOISANXUAT_ID=c.NOISANXUAT_ID and a.SANPHAM_ID= ?', [$sanpham_id]);
        return view('admin.sanpham.chinhsua.index',['loai'=>$row1,'noisanxuat'=>$row2,'list'=>$row3]);
    }
    function capnhat(Request $request){



        $query=DB::update('update sanpham
        set SANPHAM_TEN=?,SANPHAM_SOLUONG=?,SANPHAM_DONGIA=?,SANPHAM_MOTA=?,NOISANXUAT_ID=?,LOAI_ID=?
        where SANPHAM_ID=?',
        [

            $request->input('SANPHAM_TEN'),
            $request->input('SANPHAM_SOLUONG'),
            $request->input('SANPHAM_DONGIA'),
            $request->input('SANPHAM_MOTA'),
            $request->input('NOISANXUAT_ID'),
            $request->input('LOAI_ID'),
            $request->input('SANPHAM_ID')

        ]);
        if($query){
             return back()->with('success','Bạn vừa cập nhật thông tin sản phẩm.');

        }
    }
    function capnhatanh(Request $request){
        $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);
        $imageName = time().'.'.$request->image->extension();

        $storedPath='images/products/'.$imageName;
        if(File::exists($storedPath)) {
            File::delete($storedPath);
        }
        $request->image->move(public_path('images/products'), $imageName);

        $query=DB::update('update sanpham set SANPHAM_URL = ? where SANPHAM_ID = ?',
        [


            $storedPath,
            $request->input('SANPHAM_ID')

        ]);
        // echo $storedPath;
        // echo '-';
        // echo $request->input('SANPHAM_ID');
        if($query){
            //return "thanh cong";
             return back()->with('success','Bạn vừa đổi ảnh.');

        }
        else{
            return "ko thanh cong";
        }

    }
    function xoa($sanpham_id){
        $query=DB::delete('delete from sanpham where SANPHAM_ID = ?', [$sanpham_id]);

        if($query){
            //return "thanh cong";
             return back()->with('success','Bạn vừa xóa thành công.');

        }
        else{
            return "ko thanh cong";
        }

    }

}
