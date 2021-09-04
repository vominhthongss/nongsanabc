import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:nongsanabc/screens/account/account_screen.dart';

//MediaQuery.of(context).size.width
const HOST_URL = 'http://10.0.2.2:8000/'; //Địa chỉ host

const ALL_PRODUCT_API_URL = HOST_URL + 'api/sanpham/'; //Api lấy tất cả sản phẩm
const FIND_PRODUCT = HOST_URL + 'api/timsanpham/'; //tìm sản phẩm
const TYPE_PRODUCT_API_URL =
    HOST_URL + 'api/sanphamtheoloai/'; //Api lấy tất cả sản phẩm
const ALL_BILL = HOST_URL + 'api/donhang/';
const BUY_GOODS = HOST_URL + 'api/dathang/';
const ADD_TO_CART = HOST_URL + 'api/themgiohang/';
const DELETE_CART = HOST_URL + 'api/xoagiohang/';
const CHECK_CART = HOST_URL + 'api/xemgiohang/';
const LOGIN = HOST_URL + 'api/dangnhap/';
const SIGNUP = HOST_URL + 'api/dangky/';
const DETAIL_BILL = HOST_URL + "api/chitietdathang/";
const DELETE_BILL = HOST_URL + "api/xoadon/";
const CANCEL_BILL = HOST_URL + "api/huydon/";
const CHECK_EVA = HOST_URL + "api/kiemtradanhgia/";
const SUBMIT_EVALUATION = HOST_URL + "api/danhgia/";
const GET_ALL_EVALUATION = HOST_URL + "api/xemdanhgia/";
const UPDATE_INFO = HOST_URL + 'api/capnhat/';
const CHANGE_PASSWORD = HOST_URL + 'api/doimatkhau/';
const POST_AVA = HOST_URL + 'api/anhdaidien/';
// const GET_AVT = HOST_URL + 'api/layanhdaidien/';
const ADMIN_NAME = 'noone';
const STATUS_BUYING = 'Chờ duyệt';
