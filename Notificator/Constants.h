
#ifndef CONSTANTS_H
#define CONSTANTS_H

#include <string>




static const int TTL_UNDEFINED = -1;
static const string STRING_UNDEFINED = "";

/** DATA TAGS */
static const string DATA_MSGID_DELETE = "mid_del";
static const string DATA_MSGID = "mid";
static const string DATA_TYPE = "type";
static const string DATA_USER_ID = "uid";
static const string DATA_TIME = "time";
static const string DATA_ACTION = "act";
static const string DATA_MESSAGE = "msg";
static const string DATA_NAME = "name";
static const string DATA_ADAPTER_ID = "aid";
static const string DATA_DEVICE_ID = "did";
static const string DATA_DEVICE_TYPE = "dtype";
static const string DATA_URI = "uri";
static const string DATA_BATTERY = "bat";
static const string DATA_SIGNAL = "rssi";
static const string DATA_ALG_ID = "algid";
static const string DATA_ACHIEVEMENT = "id";

/**************************************************/
/*********         JSON              **************/
/**************************************************/

#define TRUE "\"true\""
#define FALSE "\"false\""

/** JSON TAGS */
static const string JSON_TAG_WHILE_IDLE = "\"delay_while_idle\"";
static const string JSON_TAG_NOTIFICATION_KEY = "\"notification_key\"";
static const string JSON_TAG_COLLAPSE_KEY = "\"collapse_key\"";
static const string JSON_TAG_DATA = "\"data\"";
static const string JSON_TAG_TTL = "\"time_to_live\"";
static const string JSON_TAG_RESTRICTED_PACK = "\"restricted_package_name\"";
static const string JSON_TAG_DRY_RUN = "\"dry_run\"";

static const string JSON_TAG_TO = "\"to\"";
static const string JSON_TAG_OPERATION = "\"operation\"";
static const string JSON_TAG_NOTIFICATION_KEY_NAME ="\"notification_key_name\"";
static const string JSON_TAG_REG_IDS = "\"registration_ids\"";

/** JSON DATA KEYS */
static const string JSON_DATA_MSGID = "\"" + DATA_MSGID  + "\"";
static const string JSON_DATA_TYPE = "\"" + DATA_TYPE + "\"";
static const string JSON_DATA_USER_ID = "\"" + DATA_USER_ID + "\"";
static const string JSON_DATA_TIME = "\"" + DATA_TIME + "\"";
static const string JSON_DATA_MESSAGE = "\"" + DATA_MESSAGE + "\"";
static const string JSON_DATA_NAME = "\"" + DATA_NAME + "\"";
static const string JSON_DATA_ADAPTER_ID = "\"" + DATA_ADAPTER_ID + "\"";
static const string JSON_DATA_DEVICE_ID = "\"" + DATA_DEVICE_ID + "\"";
static const string JSON_DATA_DEVICE_TYPE = "\"" + DATA_DEVICE_TYPE + "\"";
static const string JSON_DATA_MSGID_DELETE = "\"" + DATA_MSGID_DELETE + "\"";
static const string JSON_DATA_URI = "\"" + DATA_URI + "\"";
static const string JSON_DATA_BATTERY = "\"" + DATA_BATTERY + "\"";
static const string JSON_DATA_SIGNAL = "\"" + DATA_SIGNAL + "\"";
static const string JSON_DATA_ALG_ID = "\"" + DATA_ALG_ID + "\"";
static const string JSON_DATA_ACHIEVEMENT = "\"" + DATA_ACHIEVEMENT + "\"";

/** XML SPECIFIC TAGS */
static const string XML_TAG_NOTIFICATION = "notif";

/** NOTIFICATION NAME */
static const string NAME_WATCHDOG = "watchdog";
static const string NAME_DELETE_NOTIF = "delete_not";
static const string NAME_URI = "uri";
static const string NAME_SENSOR_ADDED = "sensor_add";
static const string NAME_SENSOR_LOW_BATTERY = "sensor_bat";
static const string NAME_SENSOR_LOW_SIGNAL = "sensor_sig";
static const string NAME_ADAPTER_ADDED = "adapter_add";
static const string NAME_ADAPTER_OFFLINE = "adapter_off";
static const string NAME_ACHIEVEMENT = "achievement";

/** NOTIFICAITON TYPE AND LEVEL */
static const string TYPE_ALERT = "alert";
static const string TYPE_INFO = "info";
static const string TYPE_ADVERT = "advert";
static const string TYPE_CONTROL = "control";

static const int LEVEL_ALERT = 400;
static const int LEVEL_INFO = 300;
static const int LEVEL_ADVERT = 200;
static const int LEVEL_CONTROL = 100;
#endif
