import '../Constanta/Constanta.dart';
import 'apiresponse.dart';
import 'baseapiservices.dart';

class ModulDaringAPIService {
  //ENDPOINT REGIST
  final String endpoint = "${Constanta().apiUrl}read/read.php";
  final String endpointmhs = "${Constanta().apiUrl}users/mahasiswa/insert.php";
  final String endpointguest = "${Constanta().apiUrl}users/guest/insert.php";
  final String endpointadmin = "${Constanta().apiUrl}users/admin/insert.php";
  final String endpointdosen = "${Constanta().apiUrl}users/dosen/insert.php";
  final String endpointlabor = "${Constanta().apiUrl}users/laboran/insert.php";

  //ENDPOINT LOGIN
  final String endpointmhsLog = "${Constanta().apiUrl}users/mahasiswa/auth.php";
  final String endpointadminLog = "${Constanta().apiUrl}users/admin/auth.php";
  final String endpointguestLog = "${Constanta().apiUrl}users/guest/auth.php";
  final String endpointdosenLog = "${Constanta().apiUrl}users/dosen/auth.php";
  final String endpointlaborLog = "${Constanta().apiUrl}users/laboran/auth.php";

  //ENDPOINT CHANGE PASSWORD
  final String endpointUD =
      "${Constanta().apiUrl}users/dosen/read_by_username.php";
  final String endpointCpDosen =
      "${Constanta().apiUrl}users/dosen/changepassword.php";
  final String endpointUM =
      "${Constanta().apiUrl}users/mahasiswa/read_by_username.php";
  final String endpointCpMahasiswa =
      "${Constanta().apiUrl}users/mahasiswa/changepassword.php";
  final String endpointUG =
      "${Constanta().apiUrl}users/guest/read_by_username.php";
  final String endpointCpGuest =
      "${Constanta().apiUrl}users/guest/changepassword.php";
  final String endpointUA =
      "${Constanta().apiUrl}users/admin/read_by_username.php";
  final String endpointCpAdmin =
      "${Constanta().apiUrl}users/admin/changepassword.php";
  final String endpointUL =
      "${Constanta().apiUrl}users/laboran/read_by_username.php";
  final String endpointCpLaboran =
      "${Constanta().apiUrl}users/laboran/changepassword.php";

  //ENDPOINT MATAKULIAH MAHASISWA
  final String endpointAddMatkul =
      "${Constanta().apiUrl}matkul/insert_matkulmhs.php";



  //ENDPOINT VIDEO MODULE
    final String endpointVideo = "${Constanta().apiUrl}modulpraktik/read-video.php";
  //ENDPOINT PDF
    final String endpointPdf = "${Constanta().apiUrl}modulpraktik/read-pdf.php";

  //ENDPOINT PDF
    final String endpointInsertModul = "${Constanta().apiUrl}modulpraktik/insert.php";
  

  Future<ApiResponseModel> getJurusanData(dynamic requestBody) async {
    //Menampilkan Data Jurusan
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpoint, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  //LOGIN
  Future<ApiResponseModel> loginMhs(dynamic requestBody) async {
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointmhsLog, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  Future<ApiResponseModel> loginAdmin(dynamic requestBody) async {
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointadminLog, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  Future<ApiResponseModel> loginGuest(dynamic requestBody) async {
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointguestLog, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  Future<ApiResponseModel> loginDosen(dynamic requestBody) async {
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointdosenLog, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  Future<ApiResponseModel> loginLaboran(dynamic requestBody) async {
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointlaborLog, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  //REGIST MAHASISWA
  Future<ApiResponseModel> insertMahasiswaData(dynamic requestBody) async {
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointmhs, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  //GUEST
  Future<ApiResponseModel> insertGuestData(dynamic requestBody) async {
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointguest, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  //ADMIN
  Future<ApiResponseModel> insertAdminData(dynamic requestBody) async {
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointadmin, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  //DOSEN
  Future<ApiResponseModel> insertDosenData(dynamic requestBody) async {
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointdosen, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  //LABORAN
  Future<ApiResponseModel> insertLaboranData(dynamic requestBody) async {
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointlabor, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  //CHANGE PASSWORD
  //DOSEN
  Future<ApiResponseModel> getCPDosenDataByUsername(dynamic requestBody) async {
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointCpDosen, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  Future<ApiResponseModel> getDosenDataByUsername(dynamic requestBody) async {
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointUD, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  //MAHASISWA
  Future<ApiResponseModel> getCPMahasiswaDataByUsername(
      dynamic requestBody) async {
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointCpMahasiswa, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  Future<ApiResponseModel> getMahasiswaDataByUsername(
      dynamic requestBody) async {
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointUM, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  //GUEST
  Future<ApiResponseModel> getCPGuestDataByUsername(dynamic requestBody) async {
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointCpGuest, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  Future<ApiResponseModel> getGuestDataByUsername(dynamic requestBody) async {
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointUG, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  //ADMIN
  Future<ApiResponseModel> getCPAdminDataByUsername(dynamic requestBody) async {
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointCpAdmin, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  Future<ApiResponseModel> getAdminDataByUsername(dynamic requestBody) async {
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointUA, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  //LABORAN
  Future<ApiResponseModel> getCPLaboranDataByUsername(
      dynamic requestBody) async {
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointCpLaboran, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  Future<ApiResponseModel> getLaboranDataByUsername(dynamic requestBody) async {
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointUL, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  //ENDPOINT MATA KULIAH MAHASISWA
  Future<ApiResponseModel> insertMatkulMhs(dynamic requestBody) async {
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointAddMatkul, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  Future<ApiResponseModel> getVideoModule(dynamic requestBody) async {
    //Menampilkan Video
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointVideo, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  Future<ApiResponseModel> getPdfModule(dynamic requestBody) async {
    //Menampilkan Video
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointPdf, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  Future<ApiResponseModel> insertModulePrakt(dynamic requestBody) async {
    //Insert Modul
    ApiResponseModel apiResponse = ApiResponseModel(
        success: false, message: "default", code: 200, content: null);
    await BaseApiService.sendPostRequest(endpointInsertModul, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }
}
