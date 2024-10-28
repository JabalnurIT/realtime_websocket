enum SignInText {
  signIn,
  phoneNumber,
  phoneNumberHint,
  sentOTP,
}

enum OtpText {
  enterOtpCode,
  timeLeft,
  userNotFound,
  otpNotCorrect,
  loginSuccess,
  confirmOtp,
  resendOtp,
}

enum DashboardText {
  dashboard,
  transaction,
  qris,
  settlement,
  profile,
}

enum HomeText {
  welcome,
  logout,
}

enum ProfileText {
  editProfile,
  viewProfile,
}

class Tz {
  static const Map<SignInText, String> _signInTexts = {
    SignInText.signIn: 'Masuk',
    SignInText.phoneNumber: 'No Telepon',
    SignInText.phoneNumberHint: 'Masukkan No Telepon',
    SignInText.sentOTP: 'Kirim OTP',
  };

  static const Map<OtpText, String> _otpTexts = {
    OtpText.enterOtpCode: 'Masukkan Kode OTP',
    OtpText.timeLeft: 'Waktu tersisa:',
    OtpText.userNotFound: 'Pengguna tidak ditemukan',
    OtpText.otpNotCorrect: 'Kode OTP tidak sesuai',
    OtpText.loginSuccess: 'Anda berhasil masuk',
    OtpText.confirmOtp: 'Konfirmasi OTP',
    OtpText.resendOtp: 'Kirim Ulang',
  };

  static const Map<DashboardText, String> _dashboardTexts = {
    DashboardText.dashboard: 'Beranda',
    DashboardText.transaction: 'Transaksi',
    DashboardText.qris: 'QRIS',
    DashboardText.settlement: 'Settlement',
    DashboardText.profile: 'Profil',
  };

  static const Map<HomeText, String> _homeTexts = {
    HomeText.welcome: 'Selamat Datang',
    HomeText.logout: 'Keluar',
  };

  static const Map<ProfileText, String> _profileTexts = {
    ProfileText.editProfile: 'Edit Profil',
    ProfileText.viewProfile: 'Lihat Profil',
  };

  static String errorTextNotFound = '==>text not found<==';

  static String getSignInText(SignInText text) =>
      _signInTexts[text] ?? errorTextNotFound;
  static String getOtpText(OtpText text) =>
      _otpTexts[text] ?? errorTextNotFound;
  static String getDashboardText(DashboardText text) =>
      _dashboardTexts[text] ?? errorTextNotFound;
  static String getHomeText(HomeText text) =>
      _homeTexts[text] ?? errorTextNotFound;
  static String getProfileText(ProfileText text) =>
      _profileTexts[text] ?? errorTextNotFound;
}
