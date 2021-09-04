@foreach ($list as $i )

{{$i->SANPHAM_ID}}
{{$i->SANPHAM_TEN}}
@endforeach
{{$list->links()}}
