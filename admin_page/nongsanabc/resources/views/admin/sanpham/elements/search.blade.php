<div class="col-md-6">
    <div class="input-group">
        <div class="input-group-btn">
            <button type="button"
                    class="btn btn-default dropdown-toggle btn-active-field"
                    data-toggle="dropdown" aria-expanded="false">
                Tìm <span class="caret"></span>
            </button>
            <ul class="dropdown-menu dropdown-menu-right" role="menu">

                <li><a href="/admin/sanpham/timtheoloai/Gia vị"
                        class="select-field" data-field="fullname">Tìm gia vị</a>
                 </li>
                <li><a href="/admin/sanpham/timtheoloai/Thức uống"
                       class="select-field" data-field="fullname">Tìm thức uống</a>
                </li>
                <li><a href="/admin/sanpham/timtheoloai/Rau củ"
                    class="select-field" data-field="fullname">Tìm rau củ</a>
                </li>
                <li><a href="/admin/sanpham/timtheoloai/Trái cây"
                    class="select-field" data-field="fullname">Tìm trái cây</a>
                </li>
            </ul>
        </div>


        <input type="text" class="form-control" name="search_value" value="" id="search_value" placeholder="Nhập id sản phẩm hoặc tên sản phẩm">
        <span class="input-group-btn">

        <button id="btn-search" type="button" class="btn btn-primary" onclick="timKiem()">Tìm kiếm</button>
        <script>

            var input = document.getElementById("search_value");
            input.addEventListener("keyup", function(event) {
                if (event.keyCode === 13) {
                    event.preventDefault();
                    document.getElementById("btn-search").click();
                }
            });
            function timKiem(){
                var keyWord=document.getElementById("search_value").value;
                window.location="/admin/sanpham/tim/"+keyWord;


            }
        </script>

    </span>
        <input type="hidden" name="search_field" value="all">
    </div>
</div>
