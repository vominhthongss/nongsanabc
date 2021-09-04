<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Requests;
use Illuminate\Support\Facades\Cookie;
use App\Http\Controllers\Controller;

class CookieController extends Controller {
   public function setCookie($tendangnhap) {
      $minutes = 1;
      Cookie::queue('TENDANGNHAP_cookie', $tendangnhap, $minutes);
   }
   public function getCookie() {
    $value = Cookie::get('TENDANGNHAP_cookie');
    echo $value;
   }
}
