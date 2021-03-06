#include "DAOMobileDevices.h"

using namespace std;
using namespace soci;

DAOMobileDevices::DAOMobileDevices()
{
}

DAOMobileDevices::~DAOMobileDevices() 
{
}

int DAOMobileDevices::delGCMId(int oldUserId, string gcmid) 
{
    Logger::getInstance(Logger::DEBUG3)<<"DB:"<<"delGCMId"<<oldUserId<<endl;
    try{
        soci::session sql(*_pool);
        
        statement st = (sql.prepare << 
                "update mobile_devices set push_notification = '' where fk_user_id = :user_id and push_notification=:gcmid",
                use(oldUserId, "user_id"),use(gcmid,"gcmid")
             );
        st.execute(true);
        return st.get_affected_rows();
    }
    catch (soci::postgresql_soci_error& e)
    {
        Logger::getInstance(Logger::ERROR) << "Error: " << e.what() << '\n';
        return 0;
    }
}

int DAOMobileDevices::setGCMId(string token, string gcmid) {
    Logger::getInstance(Logger::DEBUG3)<<"DB:"<<"setGCMId"<<"tok:"<<token<<"gc"<<gcmid<<endl;
    try{
        soci::session sql(*_pool);
        
       statement st = (sql.prepare << 
                "update mobile_devices set push_notification = :gcmid where token = :ihaToken",
                use(token, "ihaToken"), use(gcmid,"gcmid")
             );
        st.execute(true);
        return st.get_affected_rows();
    }
    catch (soci::postgresql_soci_error& e)
    {
        Logger::getInstance(Logger::ERROR) << "Error: " << e.what() << '\n';
        return 0;
    }
}

int DAOMobileDevices::insertPushNotification(int userId, string push_notif) {
    Logger::getInstance(Logger::DEBUG3)<<"DB:"<<"setGCMId"<<"gc"<<push_notif<<endl;
    try{
        soci::session sql(*_pool);
        
       statement st = (sql.prepare << 
                "insert into push_notification(user_id, notification_id) values(:userId, :notif) ",
                use(userId, "userId"), use(push_notif, "notif")
             );
        st.execute(true);
        return st.get_affected_rows();
    }
    catch (soci::postgresql_soci_error& e)
    {
        Logger::getInstance(Logger::ERROR) << "Error: " << e.what() << '\n';
        return 0;
    }
}

int DAOMobileDevices::deletepushNotification(int oldUserId, string notification) 
{
    Logger::getInstance(Logger::DEBUG3)<<"DB:"<<"delGCMId"<<oldUserId<<endl;
    try{
        soci::session sql(*_pool);
        
        statement st = (sql.prepare << 
                "delete from push_notification where user_id = :user_id and notification_id =:notif",
                use(oldUserId, "user_id"),use(notification,"notif")
             );
        st.execute(true);
        return st.get_affected_rows();
    }
    catch (soci::postgresql_soci_error& e)
    {
        Logger::getInstance(Logger::ERROR) << "Error: " << e.what() << '\n';
        return 0;
    }
}

int DAOMobileDevices::upsertMobileDevice(MobileDevice mobile, int userId)
{
    session sql(*_pool);
    Logger::db()<<"DB:"<<"upsertMobileDevice"<<endl;
    try
    {
            soci::session sql(*_pool);
            
            //bon_token TEXT, d_mobile_id TEXT,d_type TEXT, d_locale TEXT, d_push_n TEXT, d_uid integer
            sql << "select upsert_mobile_device(:bt, :mobileID, :type, :loc, :pushN, :userID)",
                    use(mobile.token), use(mobile.mobile_id), use(mobile.type), use(mobile.locale),use(mobile.push_notification),use(userId);
            return 1;
    }
    catch (soci::postgresql_soci_error& e)
    {
                Logger::db() << "Error: " << e.what() << " sqlState: " << e.sqlstate() <<endl;
            return 0;
    }
}
