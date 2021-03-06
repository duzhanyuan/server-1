#ifndef BASENOTIFICATION_H
#define BASENOTIFICATION_H

#include "Notification.h"
#include <string>
#include <vector>
#include "JsonNotificationBuilder.h"
#include "Constants.h"
#include <sstream>

using namespace std;

class BaseNotification : public Notification
{
    public:
        virtual int getLevel() = 0;
        virtual ~BaseNotification() {};
        virtual bool saveToDb() = 0;

        string getDbXml();
        vector<string> sendGcm(vector<string> *ids);       
        int getId();
        int getUserId();
        long getTime();
        string getName();

    protected:
        BaseNotification(string name, int userId, 
            int notificationId, long time);
        string getGcmMsg(string ids);
        virtual void addGcmData(JsonNotificationBuilder *builder) = 0;
        virtual void addDbXmlData(stringstream *ss) = 0; 
        virtual string getType() = 0;
    
    private:
        string mName;
        int mUserId;
        int mNotificationId;
        long mTime;
        
        string getGcmIds(vector<string> *ids);
};

#endif // BASENOTIFICATION_H
