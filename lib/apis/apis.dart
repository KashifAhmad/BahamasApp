class Apis {

  // Base Url
  static String baseUrl = 'http://3.143.15.229:3001/';

  // Authentications
  static String createUserApi = '${baseUrl}user/create-account';
  static String emailLoginApi = '${baseUrl}user/email-login';
  static String changePasswordApi = '${baseUrl}user/change-password';
  static String resetPasswordApi = '${baseUrl}user/reset-password';
  static String forgetPasswordApi = '${baseUrl}user/send-code';
  static String verifyCodeApi = '${baseUrl}user/verify-code?'; //${baseUrl}user/verify-code?email=&code
  static String verifyAccountApi = '${baseUrl}user/verify-account/';

  // explore
  static String mostPopularApi = '${baseUrl}business/most-popular-businesses';
  static String getAllIslandsApi = '${baseUrl}island/get-all-islands';
  static String getBusinessByIslandApi = '${baseUrl}business/get-businesses-by-island/';
  static String saveBusinessApi = '${baseUrl}business/save-business';
  static String unSaveBusinessApi = '${baseUrl}business/unsave-business';
  // static String getSavedBusinessesApi = '${baseUrl}business/get-saved-businesses/';
  static String getAllCategoriesApi = '${baseUrl}category/get-all-categories';
  static String getBusinessesByCategoryApi = '${baseUrl}business/get-businesses-by-category/';
  static String getAllBusinessesApi = '${baseUrl}business/get-all-businesses';
  static String getBusinessByUserApi = '${baseUrl}business/get-business-by-user/';
  static String searchBusinessApi = '${baseUrl}business/search-business?businessName=';
  
  // Profile
  static String editProfileApi = '${baseUrl}user/update-account/';
  static String deleteAccountApi = '${baseUrl}user/delete-account/';
  static String getUserReviewApi = '${baseUrl}review/user-review/';
  static String getBusinessReviewApi = '${baseUrl}review/business-review/';
  static String submitReviewApi = '${baseUrl}review/submit-rating';
  static String updateReviewApi = '${baseUrl}review/update-rating/';
  static String addViewBusinessApi = '${baseUrl}business/business-views';

  // Saved business 
  static String getSaveBusinessApi = '${baseUrl}business/get-saved-businesses/';
  static String getSpecificBusinessApi = '${baseUrl}business/get-specific-business/';
  static String getReviewsApi = '${baseUrl}review/business-review/';

  // Business feeds
  static String getAllBusinessFeedsApi = '${baseUrl}feed/get-all-businesses-feeds';
  static String createBusinessFeedsApi = '${baseUrl}feed/create-feed';

  // Business profile
  static String getSubCategoriesApi = '${baseUrl}subcategory/get-subcategories/';
  static String addBusinessprofileApi = '${baseUrl}business/add-business-profile';
  static String deleteBusinessApi = '${baseUrl}business/delete-business';
  static String updateBusinessProfileApi = '${baseUrl}business/update-business/';
}
