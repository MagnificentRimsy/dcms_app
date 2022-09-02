class Endpoints {
  static const String signup = 'administrations/CreateAccount';
  static const String signin = 'administrations​/SignIn'; 
  static const String validateOtp = 'api/administrations/ValidateOtp';
  static const String activateAccount = 'administrations/ActivateAccount?UserName=';
  static const String login = 'administrations/Login?UserName=';
  static const String Get2FaStatus = 'administrations/Get2FAStatus?UserName=';
  static const String GenerateOtp = 'administrations/GetOtp';
  static const String validateTwoFactorToken = 'administrations/ValidateOtp';
  static const String createBatch = 'configurations/AddBatch';

  static const String updatePersonalInformation = 'auth/personal-information';
  static const String updateBankingInformation = 'auth/bank-information';
  static const String updateDocuments = 'auth/documents';
  static const String setPin = 'auth/set-pin';
  static const String tokenRefresh = 'auth/refresh';
  static const String verifyOTP = 'auth/verify-otp';
  static const String sendOTP = 'auth/send-otp';
  static const String deleteFile = 'files/delete';
  static const String bank = 'account/bank';
  static const String verifyPin = 'auth/verify-pin';
  static const String startForgotPassword = 'auth/start-forgot-password';
  static const String startForgotPin = 'account/start-forgot-pin';
  static const String finishForgotPassword = 'auth/finish-forgot-password';
  static const String finishForgotPin = 'account/finish-forgot-pin';
}
