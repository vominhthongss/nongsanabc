class Processing {
  String xulytien(int sotien) {
    String tien = sotien.toString();
    int count = 0;
    String ketqua = '';
    for (int i = tien.length - 1; i >= 0; i--) {
      count++;
      ketqua += tien[i];
      if (count == 3 && i != 0) {
        ketqua += ',';
        count = 0;
      }
    }

    return ketqua.split('').reversed.join() + " đ";
  }

  String xulysosao(String sosao) {
    String ketqua = '';
    for (int i = 0; i < 3; i++) {
      ketqua += sosao[i];
    }

    return ketqua;
  }
}
