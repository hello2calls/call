//
//  UserDefaultItemList.h
//  TouchPalDialer
//
//  Created by 亮秀 李 on 12/4/12.
//
//

#import <Foundation/Foundation.h>
/*basic section*/
#define IS_SMART_DIAL_TIP_VIEW_ALERADY_SHOWN    @"IS_SMART_DIAL_TIP_VIEW_ALERADY_SHOWN"
#define SCHEDULE_TASKS                          @"SCHEDULE_TASKS"
#define GLOBALLY_UNIQUE_ID                      @"GLOBALLY_UNIQUE_ID"
#define KEY_CURRENT_PRODUCT_VERSION_DATE        @"KEY_CURRENT_PRODUCT_VERSION_DATE"
#define KEY_CURRENT_PRODUCT_VERSION             @"KEY_CURRENT_PRODUCT_VERSION"  //not in use since 4.5.5
#define KEY_ACTIVATED_PRODUCT_VERSION           @"KEY_ACTIVATED_PRODUCT_VERSION"
#define TOUCHPAL_ACTIVE_CODE                    @"TOUCHPAL_ACTIVE_CODE"  //not in use since 4.5.4
#define ACTIVATE_IDENTIFIER                     @"ACTIVATE_IDENTIFIER"
#define LAST_SUCCESS_ACTIVE_TIME                @"LAST_SUCCESS_ATIVE_TIME" // not in use since 4.5.5
#define LAST_TRY_ACTIVE_TIME                    @"LAST_TRY_ACTIVE_TIME" // not in use since 4.5.5
#define FIRST_LOAD_TOUCHPAL_TIME                @"FIRST_LOAD_TOUCHPAL_TIME"
#define RATE_IS_ALERT_VIEW                      @"RATE_IS_ALERT_VIEW"
#define IS_UNEXPECTEDLY_QUITS                   @"IS_UNEXPECTEDLY_QUITS"
#define IS_CUSTOMER_RATE_TOUCHPAL               @"IS_CUSTOMER_RATE_TOUCHPAL"
#define RATE_TOUCHPAl_NO_COUNT                  @"RATE_TOUCHPAl_NO_COUNT"
#define HAVE_ALREADY_SEEN_INSTALL_PLUGIN_ALERT  @"HAVE_ALREADY_SEEN_INSTALL_PLUGIN_ALERT"
#define KEY_LAST_CHECK_UPDATE_DATE              @"last_check_update_date" // autou update
#define LAST_DATE_PUSH_UMENG_EVENT_LOG_SENT_NEXT_LAUNCH @"LAST_DATE_PUSH_UMENG_EVENT_LOG_SENT_NEXT_LAUNCH"

#define APPLE_PUSH_TOKEN                        @"APPLE_PUSH_TOKEN"
#define APPLE_VOIP_PUSH_TOKEN                   @"APPLE_VOIP_PUSH_TOKEN"
/*yellow page section*/
//user generate data to share sina
#define IS_FIRST_INTO_OFFLINE_DATA           @"IS_FIRST_INTO_OFFLINE_DATA"
#define KEY_IS_YELLOW_CITY_NEEDS_UPDATE      @"KEY_IS_YELLOW_CITY_NEEDS_UPDATE"
#define KEY_IS_YELLOW_CITY_UPDATE_IN_PROCESS @"KEY_IS_YELLOW_CITY_UPDATE_IN_PROCESS"
#define IS_USER_DOWN_CITY                    @"IS_USER_DOWN_CITY"
#define IS_USER_KNOWN_CITY_HAS_UPDATE        @"IS_USER_KNOWN_CITY_HAS_UPDATE"
#define MARKET_EVENT_VERSION                 @"MARKET_EVENT_VERSION"
#define LAST_CHECK_MARKET_DATA_TIME          @"LAST_CHECK_MARKET_DATA_TIME"

#define KEY_IS_CITY_VISIT_TOUCHPAL_COULD     @"KEY_IS_CITY_VISIT_TOUCHPAL_COULD"
#define CURRENT_YELLOW_CITY_KEY              @"CURRENT_YELLOW_CITY_KEY"
#define PREVIOUS_CUSTOM_LOACTION_CITY        @"PREVIOUS_CUSTOM_LOACTION_CITY"
#define IS_LAUNCH_YELLOWPAGE_APP             @"IS_LAUNCH_YELLOWPAGE_APP"
#define KEY_APP_IS_IN_YELLOWPAGE             @"KEY_APP_IS_IN_YELLOWPAGE"
#define CURRENT_YELLOW_CITY_KEY              @"CURRENT_YELLOW_CITY_KEY"

#define TAB_AD_REQ_TIMESTAMP              @"TAB_AD_REQ_TIMESTAMP"
#define TAB_AD_REQ_INTERVAL              @"TAB_AD_REQ_INTERVAL"

#define LOCATION_2D       @"LOCATION_2D"
#define DATE_CITY_LAST_CHECK_UPDATE_AUTO  @"DATE_CITY_LAST_CHECK_UPDATE_AUTO"
/*call log section*/
#define ADVANCED_SOURCE_CHANNEL_KEY             @"ADVANCED_SOURCE_CHANNEL_KEY"
#define IS_LAUNCH_SYSYTEM_CALLLOG_GETTING_APP   @"IS_LAUNCH_SYSYTEM_CALLLOG_GETTING_APP"
/*alypay section*/
#define NO_PAY_CONFIRM_PROMPT                   @"NO_PAY_CONFIRM_PROMPT"
/*SQL DATABASE SECTION*/
#define SQL_DATABASE_VERSION_KEY                @"SQL_DATABASE_VERSION_KEY"
/* lauch for one time section*/
#define DUE_DATE_TO_POP_INTERFACE_INVESTIGATE   @"DUE_DATE_TO_POP_INTERFACE_INVESTIGATE"
#define FIRST_LAUNCH_VERSION                    @"FIRST_LAUNCH_VERSION"
#define LAST_LAUNCH_VERSION                     @"LAST_LAUNCH_VERSION"
#define IS_LAUNCH_SMARTEYE_SETTING              @"IS_LAUNCH_SMARTEYE_SETTING"
#define FIRST_LAUNCH_MARK                       @"FIRST_LAUNCH_MARK"
#define IS_FIRST_LOAD_RATE_VIEW                 @"IS_FIRST_LOAD_RATE_VIEW"
#define GUIDE_TO_YELLOWPAGE_AFTER_DOWNLOADING_HAVE_ALREADY_SHOWN @"GUIDE_TO_YELLOWPAGE_AFTER_DOWNLOADING_HAVE_ALREADY_SHOWN"
#define SHOW_TIPS_REMINDER_LIST                     @"show_tips_reminder_list"
#define SMARTEYE_TIPVIEW_HAVE_ALREADY_SHOWN         @"SMARTEYE_TIPVIEW_HAVE_ALREADY_SHOWN"
#define IS_FIRST_LUNCH_SWIPE_IN_CELL                @"IS_FIRST_LUNCH_SWIPE_IN_CELL"
#define IS_INTERFACE_INVESTIGATE_VIEW_ALREADY_SHOWN @"IS_INTERFACE_INVESTIGATE_VIEW_ALREADY_SHOWN"
#define IS_PUT_APP_TO_BOTTOM_REMINDER_ALREADY_SHOWN @"IS_PUT_APP_TO_BOTTOM_REMINDER_ALREADY_SHOWN"
#define IS_LANCH_GESTURE_APP                        @"IS_LANCH_GESTURE_APP"
#define IS_LAUNCH_SKIN_SETTING_APP                  @"IS_LAUNCH_SKIN_SETTING_APP"
#define IS_TOUCHPAL_NEWER                           @"IS_TOUCHPAL_NEWER"
#define TOUCHPAL_NEWER_FIRST_OPEN_DATE              @"TOUCHPAL_NEWER_FIRST_OPEN_DATE"

#define UserSkin_ChangedTime  @"UserSkin_ChangedTime"

#define VERSION_JUST_BEFORE_UPGRADE                 @"VERSION_JUST_BEFORE_UPGRADE"
/*SNS*/
#define sns_facebook_identity                       @"sns_facebook_identity"
#define sns_facebook_display_name                   @"sns_facebook_display_name"
#define K_FB_Access_Token                           @"FBAccessTokenKey"
#define K_FB_Expiration_Date                        @"FBExpirationDateKey"
#define kOpenUDIDKey                                @"TPOpenUDID"
#define renren_access_Token                         @"renren_access_Token"
#define renren_expiration_Date                      @"renren_expiration_Date"
#define renren_session_Key                          @"renren_session_Key"
#define renren_secret_Key                           @"renren_secret_Key"
#define session_UserId                              @"session_UserId"
#define sns_renren_identity                         @"sns_renren_identity"
#define sns_renren_display_name                     @"sns_renren_display_name"
#define access_Token                                @"access_Token"
#define expiration_Date                             @"expiration_Date"
#define session_Key                                 @"session_Key"
#define secret_Key                                  @"secret_Key"
#define storeKeySinaWeiboAuthDataV2                 @"SinaWeiboAuthDataV2"
#define sns_twitter_identity                        @"sns_twitter_identity"
#define sns_twitter_display_name                    @"sns_twitter_display_name"
#define sns_twitter_authData                        @"sns_twitter_authData"
#define IS_CANCELD_FOR_SNS_ENTRY_                   @"IS_CANCELD_FOR_SNS_ENTRY_"
/*gesture section*/
#define IS_FIRST_DIFINE_GESTURE                     @"IS_FIRST_DIFINE_GESTURE"
#define IS_OPEN_GESTURE_RECOGNIZER                  @"IS_OPEN_GESTURE_RECOGNIZER"
#define HOW_MUCH_GESTURES                           @"HOW_MUCH_GESTURES"
/*contact section */
#define CURRENT_CHECKED_GROUP_ID                    @"CURRENT_CHECKED_GROUP_ID"
#define KEY_IS_GROUP_FIRST_SYNCHRONIZED             @"is_group_first_synchronized"
/*engine section */
#define   KEY_CURRENT_ACCOUNT_REGISTER	        @"KEY_CURRENT_ACCOUNT_REGISTER"
#define   KEY_MY_CURRENT_CHECKCODE				@"KEY_MY_CURRENT_CHECKCODE"
/*section settings*/
#define IS_SIM_CHANGED                @"IS_SIM_CHANGED"
#define IS_AUTO_DAIL_IP               @"IS_AUTO_DAIL_IP"
#define IS_SET_ROMING                 @"IS_SET_ROMING"
#define NUMBER_AREA_CODE              @"NUMBER_AREA_CODE"
#define CURRENT_CHINA_CARRIER         @"CURRENT_CHINA_CARRIER"
#define IS_SMART_DAIL_ADVICE          @"IS_SMART_DAIL_ADVICE"
#define CURRENT_SIM_MNC               @"CURRENT_SIM_MNC"
#define CURRENT_NETWORK_MNC           @"CURRENT_NETWORK_MNC"
#define APP_CURRENT_SKIN_ID           @"APP_CURRENT_SKIN_ID"
#define APP_CURRENT_SOUNDS           @"APP_CURRENT_SOUNDS"
#define INTEVAL_CHECK_SWAP            @"INTERVAL_CHECK_SWAP"
/*section callerinfoshow*/
#define CLICKED_OK_WITH_CIF_INSTALL   @"CLICKED_OK_WITH_CIF_INSTALL"
#define TPDIALER_VER_STR_WHEN_SUGGEST_INSTALL_CIF @"TPDIALER_VER_STR_WHEN_SUGGEST_INSTALL_CIF"
#define DATE_SHOULD_SUGGEST_INSTALL_CIF     @"DATE_SHOULD_SUGGEST_INSTALL_CIF"
#define DATE_SHOULD_SUGGEST_UPDATE_APP      @"DATE_SHOULD_SUGGEST_UPDATE_APP"

/*cached callertell statistics*/
#define CACHED_CALLERTELL_STATISTICS_DICT   @"CACHED_CALLERTELL_STATISTICS_DICT"
#define USER_PHONE_NUMBER                   @"USER_PHONE_NUMBER"

// Test support
#define IS_LAUNCH_SETTIN_FOR_VERSION                @"IS_LAUNCH_SETTIN_FOR_VERSION"
#define IS_CHECKING_SYSYTEM_CALLLOG_GETTING_APP     @"IS_CHECKING_SYSYTEM_CALLLOG_GETTING_APP"
#define YELLOWPAGE_GUIDE_VIEW_HAVE_ALREADY_SHOWN    @"YELLOWPAGE_GUIDE_VIEW_HAVE_ALREADY_SHOWN"

#define SCHEDULE_TASK_USAGE                         @"SCHEDULE_TASK_USAGE"
#define SCHEDULE_TASK_SKIN_USAGE                    @"SCHEDULE_TASK_SKIN_USAGE"
#define SCHEDULE_TASK_NEW_SKIN_DISCOVER             @"SCHEDULE_TASK_NEW_SKIN_DISCOVER"
#define SCHEDULE_TASK_CALLLOG_UPLOAD                @"SCHEDULE_TASK_CALLLOG_UPLOAD"
#define SCHEDULE_TASK_UPDATE_ZIP             @"SCHEDULE_TASK_UPDATE_ZIP"
#define SCHEDULE_TASK_SERVER_NUMBER_CHECK           @"SCHEDULE_TASK_SERVER_NUMBER_CHECK"
#define SCHEDULE_TASK_UPLOAD_CALLLOG                @"SCHEDULE_TASK_UPLOAD_CALLLOG"
#define SCHEDULE_TASK_UPLOAD_CONTACT                @"SCHEDULE_TASK_UPLOAD_CONTACT"
#define SCHEDULE_TASK_UPLOAD_PROFILE                @"SCHEDULE_TASK_UPLOAD_PROFILE"
#define SCHEDULE_TASK_CALLERID_UPDATE               @"SCHEDULE_TASK_CALLERID_UPDATE"


// Plugins
#define PLUGIN_MORE_ICON_CLICKED @"PLUGIN_MORE_ICON_CLICKED"
#define PLUGIN_VOTED_IDENTIFIER  @"PLUGIN_VOTED_IDENTIFIER"

// CallerTell statistics
#define LAST_CHECK_STATISTICS_DATE @"LAST_CHECK_STATISTICS_DATE"
#define STATISTIC_CALLERTELL_TOTAL_COUNT_NEW @"STATISTIC_CALLERTELL_TOTAL_COUNT_NEW"
#define STATISTIC_CALLERTELL_RECOG_COUNT_NEW @"STATISTIC_CALLERTELL_RECOG_COUNT_NEW"
#define STATISTIC_CALLERTELL_MARK_COUNT_NEW @"STATISTIC_CALLERTELL_MARK_COUNT_NEW"
#define STATISTIC_CALLERTELL_RECENT_COUNT_NEW @"STATISTIC_CALLERTELL_RECENT_COUNT_NEW"
//IP dial sections
#define EXCLUDED_MEMBERS_FOR_IP_RULES    @"EXCLUDED_MEMBERS_FOR_IP_RULES"

//login info
#define ACCOUNT_INFO_SECRET         @"ACCOUNT_INFO_SECRET"
#define ACCOUNT_INFO_USERID         @"ACCOUNT_INFO_USERID"
#define EXCLUDED_MEMBERS_FOR_IP_RULES    @"EXCLUDED_MEMBERS_FOR_IP_RULES"

#define SEATTLE_AUTH_LOGIN_TICKET       @"SEATTLE_AUTH_LOGIN_TICKET"
#define SEATTLE_AUTH_LOGIN_ACCESS_TOKEN @"SEATTLE_AUTH_LOGIN_ACCESS_TOKEN"

//Backup
#define LAST_BACKUP_TIME     @"LAST_BACKUP_TIME"

//Voip
#define VOIP_REGISTER_ACCOUNT_NAME @"VOIP_REGISTER_ACCOUNT_NAME"
#define VOIP_REGISTER_SECRET_CODE @"VOIP_REGISTER_SECRET_CODE"
#define IS_VOIP_ON @"IS_VOIP_ON"
#define SHOULD_FORCE_UPDATE @"SHOULD_FORCE_UPDATE"
#define VOIP_HOST_URL @"VOIP_HOST_URL"
#define VOIP_ACCOUNT_INFO_CHECK_TIME @"VOIP_ACCOUNT_INFO_CHECK_TIME"
#define VOIP_USER_EXIST_CHECK_TIME @"VOIP_USER_EXIST_CHECK_TIME"
#define VOIP_INVITATION_CODE @"VOIP_INVITATION_CODE"
#define VOIP_INVITATION_USED_COUNT @"VOIP_INVITATION_USED_COUNT"
#define VOIP_SHARE_TIME_COUNT @"VOIP_SHARE_TIME_COUNT"
#define VOIP_BALANCE @"VOIP_BALANCE"
#define VOIP_MONTH_BALANCE @"VOIP_MONTH_BALANCE"
#define VOIP_REGISTER_TIME @"VOIP_REGISTER_TIME"
#define VOIP_QUEUE_PAGE_HAS_VISIT @"VOIP_QUEUE_PAGE_HAS_VISIT"
#define VOIP_UPDATE_EDGE_SERVER_TIME @"VOIP_UPDATE_EDGE_SERVER_TIME"
#define VOIP_LOGIN_QUEUE_NUMBER_TIME @"VOIP_LOGIN_QUEUE_NUMBER_TIME"

#define VOIP_IF_PRIVILEGA @"VOIP_IF_PRIVILEGA"
#define VOIP_PRIVILEGA_EXPIRED_TIME @"VOIP_PRIVILEGA_EXPIRED_TIME"
#define VOIP_FIND_PRIVILEGA_SERVICE_TIME @"VOIP_FIND_PRIVILEGA_SERVICE_TIME"
#define VOIP_FIND_PRIVILEGA_DAY @"VOIP_FIND_PRIVILEGA_DAY"
#define VOIP_PRIVILEGA_UPDATE_TIME @"VOIP_PRIVILEGA_UPDATE_TIME"

#define VOIP_CALL_ERROR_XINJIANG @"VOIP_CALL_ERROR_XINJIANG"
#define VOIP_CALL_LANDLINE @"VOIP_CALL_LANDLINE"
#define VOIP_CALL_SERVICE @"VOIP_CALL_SERVICE"
#define VOIP_IS_NEW_ACCOUNT @"VOIP_IS_NEW_ACCOUNT"
#define VOIP_LOG_UPLOAD_CHECK @"VOIP_LOG_UPLOAD_CHECK"
#define VOIP_EDGE_SERVER_CHECK @"VOIP_EDGE_SERVER_CHECK"
#define VOIP_FEC_CHECK @"VOIP_FEC_CHECK"
#define VOIP_FEC_CONFIG_LEVEL @"VOIP_FEC_CONFIG_LEVEL"
#define VOIP_POSTBOY_SERVERS @"VOIP_POSTBOY_SERVERS"
#define VOIP_POSTBOY_SERVERS_VERSION @"VOIP_POSTBOY_SERVERS_VERSION"
#define VOIP_POSTKIDS_CHECK_INTERVAL @"VOIP_POSTKIDS_CHECK_INTERVAL"
#define VOIP_REC_GOOD_RATE_THRESHOLD @"VOIP_REC_GOOD_RATE_THRESHOLD"
#define VOIP_CONFIG_STRING @"VOIP_CONFIG_STRING"
#define VOIP_CALLBACK_WIZARD_SHOWN @"VOIP_CALLBACK_WIZARD_SHOWN"
#define VOIP_CALLINTERNATIONAL_WIZARD_SHOWN @"VOIP_CALLINTERNATIONAL_WIZARD_SHOWN"

#define RECODE_USAGE_DAY @"RECODE_USAGE_DAY"
#define DELETE_ADRESOURCEFILEANDPLIST_DAY @"DELETE_ADRESOURCEFILEANDPLIST_DAY"

#define VOIP_HAD_CALL @"VOIP_HAD_CALL"

#define VOIP_LAST_MOBILE_POSTKID @"VOIP_LAST_MOBILE_POSTKID"

#define VOIP_SHOW_CALLBACK_NOTI @"VOIP_SHOW_CALLBACK_NOTI"

#define POP_INVITE_DIALOG_TIMES @"POP_INVITE_DIALOG_TIMES"
#define IS_APP_AD_ACTIVATE @"IS_APP_AD_ACTIVATE"
#define AD_ACTIVATE_TIME_SCHEDULE @"APP_ACTIVATE_TIME_SCHEDULE"
#define RAIBOW_ACTIVATE_SCHEDULE @"RAIBOW_ACTIVATE_SCHEDULE"
#define SEATTLE_PROXY_SCHEDULE @"SEATTLE_PROXY_SCHEDULE"

#define VOIP_FIRST_CALL @"VOIP_FIRST_CALL"
#define VOIP_FIRST_INTERNATIONAL_CALL @"VOIP_FIRST_INTERNATIONAL_CALL"
#define VOIP_FIRST_CALL_FRIEND @"VOIP_FIRST_CALL_FRIEND"

#define IS_FIRST_CALL_FRIEND_WITHOUT_VOIP @"IS_FIRST_CALL_FRIEND_WITHOUT_VOIP"
#define VOIP_SHORT_URL_DIC @"VOIP_SHORT_URL_DIC"
#define VOIP_BACK_CALL_ENABLE @"VOIP_BACK_CALL_ENABLE"
#define VOIP_AUTO_BACK_CALL_ENABLE @"VOIP_AUTO_BACK_CALL_ENABLE"
#define VOIP_BACK_CALL_NAME_SAVED @"VOIP_BACK_CALL_NAME_SAVED"
#define VOIP_BACK_CALL_NAME_REMOVED @"voip_back_call_name_removed"

#define VOIP_17_NUMBER_ALERT @"VOIP_17_NUMBER_ALERT"
#define VOIP_ENABLE_CELL_DATA @"VOIP_ENABLE_CELL_DATA"
#define VOIP_INTERNATIONAL_ENABLE_CELL_DATA @"VOIP_INTERNATIONAL_ENABLE_CELL_DATA"
#define VOIP_INTERNATIONAL_ROAMING_REMINDER @"VOIP_INTERNATIONAL_ROAMING_REMINDER"
#define VOIP_HAS_SHOW_SPIT_STRONG_GUIDE @"VOIP_HAS_SHOW_SPIT_STRONG_GUIDE"
#define VOIP_SHOW_SPIT_WEAK_GUIDE_TIMES @"VOIP_SHOW_SPIT_WEAK_GUIDE_TIMES"

#define VOIP_FIRST_VISIT_TOUCHPAL_PAGE_WITH_ALERT @"VOIP_FIRST_VISIT_TOUCHPAL_PAGE_WITH_ALERT"

#define NEW_TOUCHPALER_NUMBER_ARRAY @"NEW_TOUCHPALER_NUMBER_ARRAY"
#define VOIP_FIRST_LOGINED @"VOIP_FIRST_LOGINED"
#define VOIP_UPLOAD_CALLLOG @"VOIP_UPLOAD_CALLLOG"
#define VOIP_LAST_CALLBACK_SUCCESS @"VOIP_LAST_CALLBACK_SUCCESS"

//Noah
#define NOAH_GUIDE_POINT_REFRESH @"NOAH_GUIDE_POINT_REFRESH"
#define NOAH_CONFIG_FILE_CHECK @"NOAH_CONFIG_FILE_CHECK"
#define SHOULD_MENU_POINT_SHOW @"SHOULD_MENU_POINT_SHOW"
#define NOAH_SHOULD_COPY_LOCAL_FILE @"NOAH_SHOULD_COPY_LOCAL_FILE"
#define NOAH_GUIDE_POINT_MARKET @"NOAH_GUIDE_POINT_MARKET"
#define NOAH_GUIDE_POINT_PERSONAL_SKIN  @"NOAH_GUIDE_POINT_PERSONAL_SKIN"
#define NOAH_GUIDE_POINT_PERSONAL_REDBAG  @"NOAH_GUIDE_POINT_PERSONAL_REDBAG"
#define NOAH_GUIDE_POINT_PERSONAL_VOIP @"NOAH_GUIDE_POINT_PERSONAL_VOIP"
#define NOAH_GUIDE_POINT_PERSONAL_WALLET @"NOAH_GUIDE_POINT_PERSONAL_WALLET"
#define NOAH_GUIDE_POINT_PERSONAL_ANTIHARASS @"NOAH_GUIDE_POINT_PERSONAL_ANTIHARASS"
#define NOAH_GUIDE_POINT_PERSONAL_BACKFEE @"NOAH_GUIDE_POINT_PERSONAL_BACKFEE"
#define NOAH_GUIDE_POINT_PERSONAL_CARD @"NOAH_GUIDE_POINT_PERSONAL_CARD"
#define NOAH_GUIDE_POINT_PERSONAL_FREE_MINUTE @"NOAH_GUIDE_POINT_PERSONAL_FREE_MINUTE"
#define NOAH_GUIDE_POINT_PERSONAL_SETTING @"NOAH_GUIDE_POINT_PERSONAL_SETTING"
#define NOAH_GUIDE_POINT_PERSONAL_TRAFFIC @"NOAH_GUIDE_POINT_PERSONAL_TRAFFIC"

//Feeds
#define FEEDS_QEURY_RED_PACKET_ALL @"FEEDS_QEURY_RED_PACKET_ALL"
#define FEEDS_QEURY_RED_PACKET_TIME @"FEEDS_QEURY_RED_PACKET_TIME"
#define FEEDS_WELCOME_SHOW @"FEEDS_WELCOME_SHOW"

#define FEEDS_QEURY_SIGN_TIME @"FEEDS_QEURY_SIGN_TIME"
#define FEEDS_SHOW_LOGIN_BAR @"FEEDS_SHOW_LOGIN_BAR"

//DataSender
#define DATA_CONTACT_LAST_SENT @"DATA_CONTACT_LAST_SENT"
#define DATA_CURRENT_CALLLOG_COUNT @"DATA_CURRENT_CALLLOG_COUNT"


//all
#define TOUCHPAL_USER_HAS_LOGIN @"TOUCHPAL_USER_HAS_LOGIN"

//flow
#define CALL_FLOW_BUSINESS_KNOWN @"CALL_FLOW_BUSINESS_KNOWN"
#define FLOW_BONUS @"FLOW_BONUS"
#define FLOW_OPERATION_SHOWN @"FLOW_OPERATION_SHOWN"
#define FLOW_HINT_SHOWN @"FLOW_HINT_SHOWN"

//profile
#define PERSON_PROFILE_URL @"PERSON_PROFILE_URL"
#define PERSON_PROFILE_TYPE @"PERSON_PROFILE_TYPE"
#define PERSON_PROFILE_GENDER @"PERSON_PROFILE_GENDER"

//stream
#define FLOW_STREAM_HEADER_BUTTON @"FLOW_STREAM_HEADER_BUTTON"
#define VOIP_STREAM_HEADER_BUTTON @"VOIP_STREAM_HEADER_BUTTON"

//WebSearch
//#define NATIVE_PARAM_FIRST_LOC @"native_param_first_loc"        //"true" | "false"
#define NATIVE_PARAM_ADDR @"native_param_addr"
#define NATIVE_PARAM_CITY @"native_param_city"
#define NATIVE_PARAM_LOCATION @"native_param_location"
#define WEBSEARCH_FIRST_ENABLE_LOCATION @"WEBSEARCH_FIRST_ENABLE_LOCATION"
#define NATIVE_PARAM_ADDR_CACHE_TIME @"native_param_addr_cache_time"
#define NATIVE_PARAM_CITY_CACHE_TIME @"native_param_city_cache_time"
#define NATIVE_PARAM_LOCATION_CACHE_TIME @"native_param_locate_cache_time"
#define NATIVE_PARAM_BACK_WITH_REFRESH @"native_param_back_with_refresh"        //"true" | "false"

//yellowpage zip download
#define LAST_ZIP_DOWNLOAD_TIME @"last_zip_download_time"
#define ZIP_INIT_UNZIP @"zip_init_unzip"
#define ZIP_DOWNLOAD_ETAG @"zip_download_etag"
#define ZIP_DOWNLOAD_LENGHT @"zip_download_length"
#define ZIP_DOWNLOAD_TEMP_FILE @"webpages_temp/webpages_temp.zip"
#define ZIP_DOWNLOAD_TEMP_DIRECTORY @"webpages_temp"
#define INDEX_REQUEST_DATA @"index_request_data"
#define INDEX_REQUEST_DATA_FILTER @"index_request_data_filter"
#define INDEX_REQUEST_ACTIVITY @"index_request_activity"
#define INDEX_REQUEST_MINI_BANNER @"index_request_mini_banner"
#define INDEX_REQUEST_MINI_BANNER_TAB_CLICK @"index_request_mini_banner_tab_click"
#define INDEX_REQUEST_FULL_AD_TAB_CLICK @"index_request_full_ad_tab_click"


#define INDEX_HAS_ACTIVITY @"index_has_activity"
#define ZIP_NATIVE_VERSION @"zip_native_version"
#define ZIP_CURRENT_VERSION @"zip_current_version"
#define INDEX_CITY_SELECTED @"index_city_selected"
#define INDEX_CATEGORY_BLIST @"index_category_black_list"
#define INDEX_SERVICE_BOTTOM_PREFIX @"index_service_bottom_prefix_"
#define YP_USER_TAG @"yp_user_tag"
#define YP_USER_TRACK @"yp_user_track"
#define INDEX_TAB_POINT_URLS @"index_tab_point_urls"

//ZIP file download filename
#define INDEX_ZIP_FILENAME @"index_zip_filename"
//Zip file unzip file path
#define INDEX_UNZIP_FILEPATH @"index_unzip_filepath"

//yellowPage uitableview reuse cell
#define YP_UITABLEVIEW_REUSE_CELL @"yp_uitableview_reuse_cell"

#define STREAM_REFRESH_HISTORY_TIME @"STREAM_REFRESH_HISTORY_TIME"
#define VOIP_SHOW_ALERT_DIC @"VOIP_SHOW_ALERT_DIC"
#define REGISTER_LAST_INPUT_NUMBER @"REGISTER_LAST_INPUT_NUMBER"

//task
#define TASK_BONUS_ID_ @"TASK_BONUS_ID_"
#define TASK_BONUS_TIME_ @"TASK_BONUS_TIME_"
#define TASK_BONUS_DAILY_ALERT @"TASK_BONUS_DAILY_ALERT"

#define UMFEEDBACK_AUTO_REPLY_TIME @"UMFEEDBACK_AUTO_REPLY_TIME"
#define UMFEEDBACK_AUTO_TAG_TIME @"UMFEEDBACK_AUTO_TAG_TIME"
#define UMFEEDBACK_MESSAGE_ID @"UMFEEDBACK_MESSAGE_ID"
#define UMFEEDBACK_NEW_HINT @"UMFEEDBACK_NEW_HINT"
#define UMFEEDBACK_MESSAGE_COUNT @"UMFEEDBACK_MESSAGE_COUNT"
#define UMFEEDBACK_MESSAGE_FIRST_REPLY @"UMFEEDBACK_MESSAGE_FIRST_REPLY"
#define UMFEEDBACK_INFO_LOAD @"UMFEEDBACK_INFO_LOAD"
#define UMFEEDBACK_INFO_LOAD_NOREGISTER @"UMFEEDBACK_INFO_LOAD_NOREGISTER"
#define UMFEEDBACK_INFO_COLLECT @"UMFEEDBACK_INFO_COLLECT"
#define UMFEEDBACK_INFO_COLLECT_COUNT @"UMFEEDBACK_INFO_COLLECT_COUNT"
#define HAS_RECORD_USER_INTER_ROMAING @"HAS_RECORD_USER_INTER_ROMAING"

#define COLLECT_AND_UPLOAD_LOG  @"COLLECT_AND_UPLOAD_LOG"
#define KEYBOARD_TYPE_RESTORE @"KEYBOARD_TYPE_RESTORE"
#define INTERVAL_APP_ACTIVATE @"INTERVAL_APP_ACTIVATE"
#define APP_TASK_BONUS @"APP_TASK_BONUS"
#define APP_TASK_BONUS_ALERT_ID @"APP_TASK_BONUS_ALERT_ID"
#define NEWER_WIZARD_READ @"NEWER_WIZARD_READ"
#define SHOULD_SHOW_ANTIALERT_SWIITCH_OFF @"SHOULD_SHOW_ANTIALERT_SWIITCH_OFF"

#define SERVER_NUMBERS_FOR_FREE_CALL @"SERVER_NUMBERS_FOR_FREE_CALL"


#define VOIP_CALL_SPIT_BUTTON_PRESS_STATE @"VOIP_CALL_SPIT_BUTTON_PRESS_STATE"
#define VOIP_SHOULD_GUIDE_BACK_CALL @"VOIP_SHOULD_GUIDE_BACK_CALL"

#define VOIP_CALL_CELL_DATA_HAS_REMIND @"VOIP_CALL_CELL_DATA_HAS_REMIND"

#define VOIP_CALL_OVERSEA_REMIND @"VOIP_CALL_OVERSEA_REMIND"

#define VOIP_CELL_DATA_ACCEPTING_REMIND @"VOIP_CELL_DATA_ACCEPTING_REMIND"

#define VOIP_INCOMING_ALERT_BADGE_NUMBER @"VOIP_INCOMING_ALERT_BADGE_NUMBER"

#define MESSAGE_BOX_DEFAULT_MESSAGE_NEED_ADD @"MESSAGE_BOX_DEFAULT_MESSAGE_NEED_ADD"
//local callerid
#define CALLERID_CHECK @"CALLERID_CHECK"

#define HANGUP_FEATURE_GUIDE_INDEX @"HANGUP_FEATURE_GUIDE_INDEX"

#define HANGUP_SPIT_GUIDE @"HANGUP_SPIT_GUIDE"

#define ERROR_HANGUP_COMPSATE_SUCCESS_DATE @"ERROR_HANGUP_COMPSATE_SUCCESS_DATE"

//proxy
#define SEATTLE_PROXY_VERSION @"SEATTLE_PROXY_VERSION"
#define SEATTLE_PROXY_DICTIONARY @"SEATTLE_PROXY_DICTIONARY"


//token api
#define USER_POPUP_API @"USER_POPUP_API"
#define USER_POPUP_RESULT @"USER_POPUP_RESULT"
#define USER_POPUP_RESPONSE @"USER_POPUP_RESPONSE"

//commercial
#define SHOW_COMMERCIAL_URL @"show_commercial_url"
#define CLICK_COMMERCIAL_URL @"click_commercial_url"
#define CALL_AD_UDP_ADDRESSES @"CALL_AD_UDP_ADDRESSES"
#define CALL_AD_UDP_ADD_UPDATE @"CALL_AD_UDP_ADD_UPDATE"
#define IS_CALLING_AD_CLICK_ACTIVE @"IS_CALLING_AD_CLICK_ACTIVE"

//contact_accessibility
#define CONTACT_ACCESSIBILITY @"CONTACT_ACCESSIBILITY"

#define SHARE_CHECK_NEXT_UPDATE_TIME @"SHARE_CHECK_NEXT_UPDATE_TIME"

//dialer_guide_animation
#define DIALER_GUIDE_ANIMATION_TIMES @"DIALER_GUIDE_ANIMATION_TIMES"
#define DIALER_GUIDE_ANIMATION_WAIT @"DIALER_GUIDE_ANIMATION_WAIT"
#define DIALER_GUIDE_ANIMATION_FIRST_TIME @"DIALER_GUIDE_ANIMATION_FIRST_TIME"
#define DIALER_IS_CALL_NOW @"DIALER_IS_CALL_NOW"

#define VOIP_ACCOUNT_INFO @"VOIP_ACCOUNT_INFO"

//add isCardUser
#define VOIP_ACCOUNT_IS_CARD_USER @"VOIP_ACCOUNT_IS_CARD_USER"

#define PERSON_CENTER_INFO_CHECK_TIME @"PERSON_CENTER_INFO_CHECK_TIME"

#define DIALER_GUIDE_ANIMATION_ONE_USER_USED @"DIALER_GUIDE_ANIMATION_ONE_USER_USED"
#define DIALER_GUIDE_ANIMATION_HAS_SHOWN @"DIALER_GUIDE_ANIMATION_HAS_SHOWN"
#define DIALER_GUIDE_ANIMATION_ONE_USER_SHOWN @"DIALER_GUIDE_ANIMATION_ONE_USER_SHOWN"
#define DIALER_GUIDE_ANIMATION_SHOULD_SHOW @"DIALER_GUIDE_ANIMATION_SHOULD_SHOW"

//yellow_page_location
#define YELLOW_PAGE_LOCATION_START_SCHEDULE @"YELLOW_PAGE_LOCATION_START_SCHEDULE"
#define YELLOW_PAGE_LOCATION_WAIT_TIME @"YELLOW_PAGE_LOCATION_WAIT_TIME"
#define YELLOW_PAGE_LOCATION_SCHEDULE_TIME @"YELLOW_PAGE_LOCATION_SCHEDULE_TIME"

//today_wdiget
#define TODAY_WIDGET_USED @"TODAY_WIDGET_USED"

//antiharass
#define ANTIHARASS_UPDATE_TIME @"ANTIHARASS_UPDATE_TIME"
#define ANTIHARASS_SHOW_DOT @"ANTIHARASS_SHOW_DOT"

#define ANTIHARASS_DATAVERSION_iOS10NEW @"ANTIHARASS_DATAVERSION_iOS10NEW"
#define ANTIHARASS_REMOVE_ANTIHARASS_ADDRESSBOOK @"ANTIHARASS_REMOVE_ANTIHARASS_ADDRESSBOOK"
#define ANTIHARASS_HAND_TOPVIEW_DATAVERSION @"ANTIHARASS_HAND_TOPVIEW_DATAVERSION"

#define ANTIHARASS_NOW_LOADING_TO_EXTENTION @"ANTIHARASS_NOW_LOADING_TO_EXTENTION"

#define ANTIHARASS_IS_ON @"ANTIHARASS_IS_ON"
#define ANTIHARASS_AUTOUPDATEINWIFI_ON @"ANTIHARASS_AUTOUPDATEINWIFI_ON"
#define ANTIHARASS_IS_UPDATE_IN_WIFI @"ANTIHARASS_IS_UPDATE_IN_WIFI"
#define ANTIHARASS_IS_UPDATE_WITH_VIEW @"ANTIHARASS_IS_UPDATE_WITH_VIEW"
#define ANTIHARASS_FEATURES_GUIDE @"ANTIHARASS_FEATURES_GUIDE"
#define CALL_DIRECTORY_EXTENSION_AUTHORIZATION @"CALL_DIRECTORY_EXTENSION_AUTHORIZATION"
#define CALL_DIRECTORY_EXTENSION_AUTO_UPDATE @"CALL_DIRECTORY_EXTENSION_AUTO_UPDATE"

#define ANTIHARASS_IS_READY_FOR_UPDATE_IN_WIFI @"ANTIHARASS_IS_READY_FOR_UPDATE_IN_WIFI"

#define ANTIHARASS_SHOULD_SHOW_UPDATEVIEW @"ANTIHARASS_SHOULD_SHOW_UPDATEVIEW"
#define ANTIHARASS_UPDATE_SUCCESS_NOTICE @"ANTIHARASS_UPDATE_SUCCESS_NOTICE"
#define ANTIHARASS_NEED_HAND_UPDATE_NOTICE @"ANTIHARASS_NEED_HAND_UPDATE_NOTICE"


#define APP_BECOME_ACTIVE_SHOW_BUILD_SUCCESS @"APP_BECOME_ACTIVE_SHOW_BUILD_SUCCESS"
#define ANTIHARASS_HIDE_UPDATE_WITH_VERSION @"ANTIHARASS_HIDE_UPDATE_WITH_VERSION"
#define ANTIHARASS_IS_SHOW_TODAY_VIEW @"ANTIHARASS_IS_SHOW_TODAY_VIEW"
#define ANTIHARASS_NOT_AUTO_SHOW_TODAY_VIEW_ONCE @"ANTIHARASS_NOT_AUTO_SHOW_TODAY_VIEW_ONCE"
#define ANTIHARASS_TODAYWIDGET_NOT_SHOW_WITH_VERSION @"ANTIHARASS_TODAYWIDGET_NOT_SHOW_WITH_VERSION"

#define ANTIHARASS_CACHE_DOWNLOAD_FAILD @"ANTIHARASS_CACHE_DOWNLOAD_FAILD"
#define ANTIHARASS_CLOSE_TODAY_VIEW @"ANTIHARASS_CLOSE_TODAY_VIEW"
#define ANTIHARASS_UPDATE_FROM_TODAYWIDGET @"ANTIHARASS_UPDATE_FROM_TODAYWIDGET"

#define ANTIHARASS_SHOULD_HIDE_READ_ME_DOT @"ANTIHARASS_SHOULD_HIDE_READ_ME_DOT"



#define ANTIHARASS_REDDOT_GUARD @"ANTIHARASS_REDDOT_GUARD"
#define ANTIHARASS_UPDATE_OK @"ANTIHARASS_UPDATE_OK"
#define ANTIHARASS_TYPE @"ANTIHARASS_TYPE"
#define ANTIHARASS_DATABASE_TYPE @"ANTIHARASS_DATABASE_TYPE"
#define ANTIHARASS_VERSION @"ANTIHARASS_VERSION"
#define ANTIHARASS_REMOTE_VERSION @"ANTIHARASS_REMOTE_VERSION"
#define ANTIHARASS_IS_FIRST_USED @"ANTIHARASS_IS_FIRST_USED"
#define ANTIHARASS_USED @"ANTIHARASS_USED"
#define ANTIHARASS_CITY_CHOOSED @"ANTIHARASS_CITY_CHOOSED"

#define ANTIHARASS_GUIDE_SHOWN @"ANTIHARASS_GUIDE_SHOWN"

//woday_widget_animation
#define TODAY_WIDGET_ANIMATION_SHOWN_1 @"TODAY_WIDGET_ANIMATION_SHOWN_1"
#define TODAY_WIDGET_ANIMATION_SHOWN_2 @"TODAY_WIDGET_ANIMATION_SHOWN_2"
#define TODAY_WIDGET_ANIMATION_SHOWN_3 @"TODAY_WIDGET_ANIMATION_SHOWN_3"
#define TODAY_WIDGET_ANIMATION_SHOWN_4 @"TODAY_WIDGET_ANIMATION_SHOWN_4"
#define TODAY_WIDGET_ANIMATION_SHOWN_LOG_PUSH @"TODAY_WIDGET_ANIMATION_SHOWN_LOG_PUSH"

#define LAST_APP_LANGUAGE @"LAST_APP_LANGUAGE"

//themeSouns
#define SOUND @"SOUND"
#define NOSHOWANTIVIEW @"NOSHOWANTIVIEW"
#define NOTSHOWSOUNDTIPS @"NOTSHOWSOUNDTIPS"

//testSupport
#define OPENNOAH_TESTSERVICE @"OPENNOAH_TESTSERVICE"

//sharing, inviting
#define INVITING_IN_CONTACT_SUCCEED @"inviting_in_contact_succeed"

// feeback
#define FEEDBACK_QUESTION_CATEGORY @"feedback_question_category"
#define FEEDBACK_QUESTION_PATH @"feedback_question_path"
#define FEEDBACK_REFERRER_URL @"feedback_referrer_url"
#define FEEDBACK_LAST_VOIP_CALL @"feedback_last_voip_call"

// detecting apps
#define RIVAL_APPS_LAST_RECORDED_TIME @"rival_apps_last_recorded_time"
#define RIVAL_APPS_LAST_FETCHED_TIME @"rival_apps_last_fetched_time"

// in-call status
#define PREVIOUS_STATUS_BAR_ORIGIN_Y @"PREVIOUS_STATUS_BAR_ORIGIN_Y"
//剪贴板
#define PASTEBOARD_LAST_STRING @"PASTEBOARD_LAST_STRING"
#define PASTEBOARD_STRING_STATE @"PASTEBOARD_STRING_STATE"
#define PASTEBOARD_COPY_FROM_TOUCHPAL @"PASTEBOARD_COPY_FROM_TOUCHPAL"
#define PASTEBOARD_FIRST_START_ONCE @"PASTEBOARD_FIRST_START_ONCE"
#define PASTEBOARD_FIRST_SHOW_COUNT @"PASTEBOARD_FIRST_SHOW_COUNT"

//国际免费电话邀请函
#define ifHadShowInviteViewStates  @"ifHadShowInviteViewStates"
#define have_participated_voip_oversea @"have_participated_voip_oversea"
#define have_show_voip_oversea_point @"have_show_voip_oversea_point"
#define hide_voip_oversea_lable_point @"hide_voip_oversea_lable_point"
#define active_in_background @"active_in_background"

//个人中心引导
#define if_first_launch_State  @"if_first_launch_State"
#define had_show_personCenterGuideStatus  @"had_show_personCenterGuideStatus"
#define select_index_in_root_bar @"select_index_in_root_bar"
#define should_show_wallet_when_login @"should_show_wallet_when_login"
#define should_show_wallet_icon_in_enterance @"should_show_wallet_icon_in_enterance"

#define had_show_test_inapp_guide @"had_show_test_inapp_guide"

#define unregister_fristCall_tip @"unregister_fristCall_tip"
#define unregister_fristCall10Min_tip @"unregister_fristCall10Min_tip"

#define had_popview_add_vip @"had_popview_add_vip"
#define have_join_wechat_public_status @"have_join_wechat_public_status"
#define have_click_vs_no_free @"have_click_vs_no_free"

//引导弹框出现时间
#define ASK_LIKE_VIEW_SHOW_TIME @"ASK_LIKE_VIEW_SHOW_TIME"
#define ASK_LIKE_VIEW_COULD_SHOW @"ASK_LIKE_VIEW_COULD_SHOW"

// voip account info change
// account info changes (i.e. diff)
#define VOIP_ACCOUNT_INFO_DIFF @"voip_account_info_diff"

// hotfix: to delete the usage files in the document
#define USAGE_PLIST_FILES_DELETED @"usage_plist_files_deleted"

#define  CHECK_ID_VIP_NULL_DAY @"check_if_vip_null_day"
#define  VIP_NULL_DAY_SHOW @"vip_null_day_show"

//voip error code
#define error_code_dic @"error_code_dic"
#define ad_strategy_incoming_arr @"ad_strategy_incoming_arr"
#define if_ad_strategy_incoming_inarr @"if_ad_strategy_incoming_inarr"

#define ad_strategy_outgoing_arr @"ad_strategy_outgoing_arr"
#define if_ad_strategy_outgoing_inarr @"if_ad_strategy_outgoing_inarr"
#define voip_error_code_version @"voip_error_code_version"

#define ad_now_resource_arr @"ad_now_resource_arr"
#define ad_resource_arr @"ad_resource_arr"
#define if_any_ad_resource @"if_any_ad_resource"
#define next_active_show_guide_decide_once @"next_active_show_guide_decide_once"
#define next_active_show_guide @"next_active_show_guide"
#define deal_strategy_number @"deal_strategy_number"

// contact transfer通讯录迁移
#define CONTACT_TRANSFER_QR_CODE_STRING @"contact_transfer_qr_code_string"
#define CONTACT_TRANSFER_GUIDE_SHOWN @"contact_transfer_guide_shown"
#define CONTACT_FAMILY_GUIDE_SHOWN @"contact_family_guide_shown"
#define CONTACT_FAMILY_GUIDE_CLICK_DATE @"contact_family_guide_click_date"

#define CONTACT_TRANSFER_GUIDE_CLICKED @"contact_transfer_guide_clicked"
#define CONTACT_TRANSFER_FILE_SAVED @"contact_transfer_file_saved"

#define CONTACT_TRANSFER_INSERTED_COUNT @"contact_transfer_inserted_count"

//
#define FEATURE_GUIDE_TIPS_CONTROLLER_APPEAR_COUNT @"feature_guide_tips_controller_appear_count"

#define ALERT_KEYPAD_CHANGE_ONCE @"alertKeyPadChangeOnce"
#define UserAgent @"UserAgent"

#define KEY_PAD_TOOL_TIP_CLICKED @"key_pad_tool_tip_clicked"
#define NEW_INSTALL_FOR_EMPTY_CALLLOG_CHECKED @"new_install_for_empty_calllog_checked"

#define HANGUP_MODEL_TIME @"HANGUP_MODEL_TIME"
#define HANGUP_MODEL_NUMBER @"HANGUP_MODEL_NUMBER"

#define AD_STEP_TIME @"ad_step_time"

#define CALL_POPUP_HTML_IS_QUERYING @"is_querying_call_popup_html"
#define CALL_POPUP_HTML_READY @"call_popup_html_ready"
#define HANGUP_NO_AD_REASON @"hangup_no_ad_reason"
#define HANGUP_NO_AD @"hangup_no_ad"

#define PHONE_PAD_IS_VISIBLE @"phone_pad_is_visible"

#define PUBLIC_NUMBER_RED_DOT_LAST_CLICK @"public_number_red_dot_last_click"

#define DEBUG_INFO @"debug_info"

// last ad debug info
#define LAST_AD_PAGE_TYPE @"last_ad_page_type"
#define LAST_AD_PAGE_DETAIL @"last_ad_page_detail"
#define LAST_AD_ID @"last_ad_id"

// last free call info
// call mode: incoming, outgoing, backcall, test
// call type: P2P, C2P, C2C, BACK_CALL(for debugging)
#define LAST_FREE_CALL_MODE @"last_free_call_mode"
#define LAST_FREE_CALL_TYPE @"last_free_call_type"
#define LAST_FREE_CALL_CALLER_NUMBER @"last_free_call_caller_number"
#define LAST_FREE_CALL_CALLEE_NUMBER @"last_free_call_callee_number"
#define LAST_FREE_CALL_NETWORK_TYPE @"last_free_call_network_type"
#define LAST_FREE_CALL_IS_VIP @"last_free_call_is_vip"
#define LAST_FREE_CALL_IS_FORCED_OFFLINE @"last_free_call_is_forced_offline"
#define LAST_FREE_CALL_ERROR_CODE @"last_free_call_error_code"

#define AD_WEB_HTML_DOWNLOAD_STATUS @"ad_web_html_download_status"


#define ANTIHARASS_GUIDE_IOS_10 @"ANTIHARASS_GUIDE_IOS_10"
#define ANTIHARASS_GUIDE_ISO_10_BELOW @"ANTIHARASS_GUIDE_ISO_10_BELOW"
#define SHOWANTIHARASSGUIDEIN5541 @"ShowAntiharassGuideIn5541"

#define ANTIHARASS_GUIDE_INAPP @"ANTIHARASS_GUIDE_INAPP"
#define ANTIHARASS_GUIDE_SWITCH_ON @"ANTIHARASS_GUIDE_SWITCH_ON"
#define ANTIHARASS_GUIDE_SWITCH_OFF @"ANTIHARASS_GUIDE_SWITCH_OFF"

#define ANTIHARASSEXTENSIONCITY @"antiharassExtensionCity"
#define ISFIRSTAUTOGUDIECON @"isFirstAutoGudieCon"
#define ENABLE_V6_TEST_ME @"enable_v6_test_me"
#define YP_AD_ITEM_VISIBLE_KEY @"yp_ad_item_visible_key"

#define if_hangupcon_closed @"if_hangupCon_closed"

#define SHOW_DOT @"show_dot"
// GrowingIO
#define ENABLE_GROWING_IO @"enable_growing_io"
#define GROWING_IO_LAST_FETCH_TIME @"growing_io_last_fetch_time"
#define GROWING_IO_LAST_SUCCESS_TIME @"growing_io_last_success_time"

#define INDEX_REQUEST_DOWNLOADED_NEW_BANNER @"index_request_downloaded_new_banner"
#define INDEX_REQUEST_ANIMATED_NEW_BANNER @"index_request_animated_new_banner"
// end
#define ACTIVITY_FAMILY_NEWS_NUMBER @"ActivityFamilyNewsNumber"


