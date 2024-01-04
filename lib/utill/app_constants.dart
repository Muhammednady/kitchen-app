import 'package:Kitchen_system/model/body/language_model.dart';
import 'package:Kitchen_system/utill/images.dart';

class AppConstants {
  static const String baseurl = 'http://194.163.132.242:8080/api';
  static const String baseurlImages = 'http://194.163.132.242:8080/Photos/';

  static const String arabic = 'Arabic';
  static const String english = 'English';
  static const String saveLanguage = 'SaveLanguage';

  static const String language = 'language';
  static const String yes = 'yes';
  static const String no = 'no';
  static const String wantToSignOut = 'wantToSignOut';
  static const String wantToRemove = 'wantToRemove';
  static const String signSuccess = 'signSuccess';
  static const String sendSuccess = 'sendSuccess';
  static const String findLanguage = 'find_language';
  static const String chooseLanguage = 'choose_language';
  static const String sendFailure = 'sendFailure';
  static const String unauthorized = 'unauthorized';
  static const String notFoundUrl = 'notFoundUrl';
  static const String notHasAuthorized = 'notHasAuthorized';
  static const String signError = 'signError';
  static const String serverFailure = 'serverFailure';
  static const String saveLocation = 'saveLocation';
  static const String send = 'send';

  static const String youDeniedLocationPermission = 'you_denied_location_permission';

  // Shared Key
  static const String theme = 'theme';
  static const String ownerId = 'ownerId';
  static const String token = 'multivendor_token';
  static const String expireOn = 'expireOn';
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';
  static const String clientId = 'clientId';
  static const String typeId = 'typeId';

// endPoint

  static const String login = '/Users/Login';
  static const String addClient = '/ClientFile/AddClientFile';
  static const String addClientPayment = '/ClientPayment/AddClientPayment';
  static const String getAllUsers = '/Users/GetAllUsers';
  static const String loadFinalStatusList = '/StatusCategory/LoadFinalStatusList/';
  static const String addClientFile = '/ClientFile/AddClientFile';
  static const String getShortClientFiles = '/ClientFile/GetShortClientFiles';
  static const String loadPriceOffer = '/ClientFile/LoadPriceOffer';
  static const String getUnitsItemsbyCategory = '/StatusCategory/GetUnitsItemsbyCategory';
  static const String getClientFileById = '/ClientFile/GetClientFileById/';
  static const String addClientFileFollowUp = '/ClientFileAttachment/AddClientFileFollowUp';
  static const String getAllFollowUp = '/ClientFileAttachment/GetAllFollowUp';
  static const String addClientFileAttachment = '/ClientFileAttachment/AddClientFileAttachment';
  static const String getAllClients = '/Client/GetAllClients';
  static const String updateClientFile = '/ClientFile/UpdateClientFile/';
  static const String deleteClientFile = '/ClientFile/DeleteClientFile/';
  static const String getStatusCategoryById = '/StatusCategory/GetStatusCategoryById/';
  static const String getAllClientFileAttachment = '/ClientFileAttachment/GetAllClientFileAttachment';
  static const String deleteClientFileAttachment = '/ClientFileAttachment/DeleteClientFileAttachment/';
  static const String loadProductionRequests = '$baseurl/ClientFile/LoadProductionRequests';
  static const String getAllFinalStatus = '$baseurl/ClientFile/GetAllFinalStatusClientFile';
  static const String changeFinalStatus = '$baseurl/ClientFile/ChangeFinalStatusClientFile';
  static const String addNoteClientFile = '/ClientFileAttachment/AddNotesClientFile';
  static const String getAllNotes = '/ClientFileAttachment/GetAllNotes';
  static const String deleteNote = '/ClientFileAttachment/DeleteNote';
  static const String deleteFollowUp = '/ClientFileAttachment/DeleteFollowUp';
  static const String getClientPayment = '/ClientPayment/GetClientPayment';
  static const String getClientMaintenance = '/ClientFile/GetClientFileMaintainance';
  static const String addClientMaintenance = '/ClientFile/AddClientFileMaintainance';
  static const String getAllFileClientTop = '/ClientFileTop/GetAllFileClientTop';
  static const String deleteClientFileTopById = '/ClientFileTop/DeleteFileClientTopById';

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: Images.arabic,
        languageName: AppConstants.arabic,
        countryCode: 'SA',
        languageCode: 'ar'),
    LanguageModel(
        imageUrl: Images.unitedKingdom,
        languageName: AppConstants.english,
        countryCode: 'US',
        languageCode: 'en'),
  ];
}
