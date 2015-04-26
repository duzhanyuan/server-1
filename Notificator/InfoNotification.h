/* 
 * File:   InfoNotification.h
 * Author: Martin
 *
 * Created on 2. prosinec 2014, 0:13
 */

#ifndef INFONOTIFICATION_H
#define	INFONOTIFICATION_H

#include <string>
#include <vector>
#include "BaseNotification.h"
#include "JsonNotificationBuilder.h"

class InfoNotification : public BaseNotification {
public:
    virtual string getDbXml() = 0;
    virtual ~InfoNotification();

    int getLevel();
protected:
    InfoNotification(string name, int userId, int notificationId,
             long time);
    virtual void addGcmData(JsonNotificationBuilder *builder) = 0;
    string getType();
private:
};

#endif	/* INFONOTIFICATION_H */

