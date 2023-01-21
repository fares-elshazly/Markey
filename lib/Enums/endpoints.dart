abstract class Endpoints {
  // * Authentication Endpoints
  static const register = 'register';
  static const login = 'login';
  static const logout = 'logout';
  static const profile = 'users';

  // * Tags Endpoints
  static const tags = 'tags';

  // * Community Endpoints
  static const communities = 'communities';
  static const addCommunity = 'communities';
  static const rateCommunity = 'communities/rate';

  // * Tips Endpoints
  static const tips = 'tips';
  static const addTip = 'tips';
  static const updateTip = 'tips/{id}';
  static const rateTip = 'tips/rate';
  static const spreadTip = 'tips/spread';
  static const reportTip = 'tips/report';

  // * Profile Endpoints
  static const expertProfile = 'users/{id}';
  static const addPreviousWork = 'previous_work';
  static const deletePreviousWork = 'previous_work/{id}';
  static const addCertificate = 'certificates';
  static const deleteCertificate = 'certificates/{id}';
  static const addPackage = 'packages';
  static const deletePackage = 'packages/{id}';
  static const becomeExpert = 'users/expert';

  // * Services Endpoints
  static const services = 'services';
  static const experts = 'services/experts';

  // * Bookings Endpoints
  static const book = 'payments';
}
