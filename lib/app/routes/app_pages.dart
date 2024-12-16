import 'package:get/get.dart';

import '../modules/admin/daftarkan_nasabah/bindings/daftarkan_nasabah_binding.dart';
import '../modules/admin/daftarkan_nasabah/views/daftarkan_nasabah_view.dart';
import '../modules/admin/daftarkan_nasabah/views/detail_registrasi_view.dart';
import '../modules/admin/home_admin/bindings/home_admin_binding.dart';
import '../modules/admin/home_admin/views/history_transaksi_admin_view.dart';
import '../modules/admin/home_admin/views/home_admin_view.dart';
import '../modules/admin/setor_tunai_admin/bindings/setor_tunai_admin_binding.dart';
import '../modules/admin/setor_tunai_admin/views/setor_tunai_admin_view.dart';
import '../modules/admin/tarik_tunai_admin/bindings/tarik_tunai_admin_binding.dart';
import '../modules/admin/tarik_tunai_admin/views/tarik_tunai_admin_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/nasabah/detail_transaksi/bindings/detail_transaksi_binding.dart';
import '../modules/nasabah/detail_transaksi/views/detail_transaksi_view.dart';
import '../modules/nasabah/home/bindings/home_binding.dart';
import '../modules/nasabah/home/views/histoty_transaksi_view.dart';
import '../modules/nasabah/home/views/home_view.dart';
import '../modules/nasabah/setor_tunai/bindings/setor_tunai_binding.dart';
import '../modules/nasabah/setor_tunai/views/setor_tunai_view.dart';
import '../modules/nasabah/tarik_tunai/bindings/tarik_tunai_binding.dart';
import '../modules/nasabah/tarik_tunai/views/tarik_tunai_view.dart';
import '../modules/nasabah/validasi_pin/bindings/validasi_pin_binding.dart';
import '../modules/nasabah/validasi_pin/views/validasi_pin_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashscreenView(),
      binding: SplashscreenBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: _Paths.HISTORYUSER,
      page: () => HistotyTransaksiView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.TARIK_TUNAI,
      page: () => TarikTunaiView(),
      binding: TarikTunaiBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: _Paths.SETOR_TUNAI,
      page: () => SetorTunaiView(),
      binding: SetorTunaiBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: _Paths.VALIDASI_PIN,
      page: () => const ValidasiPinView(),
      binding: ValidasiPinBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: _Paths.DETAIL_TRANSAKSI,
      page: () => const DetailTransaksiView(),
      binding: DetailTransaksiBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: _Paths.HOME_ADMIN,
      page: () => HomeAdminView(),
      binding: HomeAdminBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: _Paths.HISTORYADMIN,
      page: () => HistoryTransaksiAdminView(),
      binding: HomeAdminBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: _Paths.TARIK_TUNAI_ADMIN,
      page: () => const TarikTunaiAdminView(),
      binding: TarikTunaiAdminBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: _Paths.SETOR_TUNAI_ADMIN,
      page: () => SetorTunaiAdminView(),
      binding: SetorTunaiAdminBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: _Paths.DAFTARKAN_NASABAH,
      page: () => const DaftarkanNasabahView(),
      binding: DaftarkanNasabahBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: _Paths.DETAIL_REGISTRASI_NASABAH,
      page: () => const DetailRegistrasiView(),
      binding: DaftarkanNasabahBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 200),
    ),
  ];
}
