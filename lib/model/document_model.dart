class Document {
  String? doc_title;
  String? doc_url;
  String? doc_date;
  int? page_num;

  Document(this.doc_title, this.doc_url, this.doc_date, this.page_num);

  static List<Document> doc_list = [
    Document(
        "SISTEM INFORMASI",
        "http://file.upi.edu/Direktori/FPEB/PRODI._MANAJEMEN_FPEB/197207152003121-CHAIRUL_FURQON/004._SIM-sistem_informasi.pdf",
        "28-11-2022",
        30),
    Document(
        "HUBUNGAN PENDIDIKAN DAN USIA IBU DENGAN PENGETAHUAN IBU TENTANG PESAN-PESAN GIZI",
        "http://eprints.ums.ac.id/22030/19/ARTIKEL_ILMIAH.pdf",
        "04-10-2020",
        15)
  ];
}
