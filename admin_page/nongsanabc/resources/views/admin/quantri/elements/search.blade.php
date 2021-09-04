<div class="col-md-6">
    <div class="input-group">

        <input type="text" class="form-control" name="search_value" value="" id="search_value" placeholder="Nhập tên đăng nhập hoặc họ tên">
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
            window.location="/admin/quantri/tim/"+keyWord;


        }
    </script>
    </span>
        <input type="hidden" name="search_field" value="all">
    </div>
</div>
