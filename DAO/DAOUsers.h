/* 
 * File:   DAOUsers.h
 * Author: pavel
 *
 * Created on 16. březen 2015, 20:03
 */

#ifndef DAOUSERS_H
#define	DAOUSERS_H

#include "DAO.h"

#include "DAOMobileDevices.h"
struct User
{
    int user_id;
    std::string mail;
    std::string password;
   std:: string phoneLocale;
   int verifiedMail;
   std::string name;
   std::string givenName;
   std::string familyName;
   std::string link;
   std::string picture;
   std::string gender;
   std::string googleLocale;
  std::string googleId;
};

class DAOUsers:public DAO{
private:
    DAOUsers();
    DAOUsers(DAOUsers const&);// Don't Implement
    void operator=(DAOUsers const&); // Don't implement
public:
    static DAOUsers& getInstance();
    ~DAOUsers(void);
    
    int add(User user);
    int getUserIdbyIhaToken(std::string token);
    int getUserIDbyAlternativeKeys(std::string mail, std::string google_id, std::string name);
    int upsertUserWithMobileDevice(User user, MobileDevice mobile);
    bool isMailRegistred(std::string mail);
    bool isNameRegistred(std::string name);
    bool isGoogleIdRegistred(std::string g_id);
    User getUserAssociatedWithToken(std::string token);
    std::string getUserRoleM(int userId, std::string adapterId);
    std::string getXMLusersAdapters(int userId);
};



#endif	/* DAOUSERS_H */

