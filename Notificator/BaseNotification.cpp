#include "BaseNotification.h"
#include "Notificator.h"
#include "Utils.h"
#include <sstream>
#include <iostream>
#include "XmlHelper.h"

using namespace std;

BaseNotification::BaseNotification(string name, int userId, int notificationId, long time)
: Notification(), 
  mName(name), 
  mUserId(userId), 
  mNotificationId(notificationId), 
  mTime(time) {
}

vector<string> BaseNotification::sendGcm(vector<string> *ids) {
  JsonNotificationBuilder builder;
  builder =  builder.registrationIds(ids)
         .addData(JSON_DATA_NAME, getName())
         .addData(JSON_DATA_USER_ID, Utils::intToString(mUserId))
         .addData(JSON_DATA_TIME, Utils::longToString(mTime))
         .addData(JSON_DATA_TYPE, getType())
         .addData(JSON_DATA_MSGID, Utils::intToString(mNotificationId));

  addGcmData(&builder);

  Notificator::sendGcm(builder.build());

  //TODO
  vector<string> gcmDelete;
  gcmDelete.clear();
  return gcmDelete;
}

string BaseNotification::getDbXml() {
  stringstream ss;
  
  // add compulsory XML data
  // <notif attr=value>
  /*
  ss << "<" << XML_TAG_NOTIFICATION;

  XmlHelper::addAttribute(&ss, DATA_NAME, getName());
  XmlHelper::addAttribute(&ss, DATA_USER_ID, getUserId());
  XmlHelper::addAttribute(&ss, DATA_TYPE, getType());
  XmlHelper::addAttribute(&ss, DATA_TIME, getTime());
  XmlHelper::addAttribute(&ss, DATA_MSGID, getId());

  ss << ">";
  */
  // add specific XML data
  addDbXmlData(&ss);

  // add end tag
  // </notif>
  // XmlHelper::endTag(&ss, XML_TAG_NOTIFICATION); 

  return ss.str();
}

int BaseNotification::getUserId() {
  return mUserId;
}

int BaseNotification::getId() {
  return mNotificationId;
}

long BaseNotification::getTime() {
  return mTime;
}

string BaseNotification::getName() {
  return mName;
}
