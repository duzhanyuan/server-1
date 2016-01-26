/* 
 * File:   RefreshManager.h
 * Author: Martin Novak, xnovak1c@stud.fit.vutbr.cz
 *
 * Created on 21. January 2016
 */

#ifndef REFRESHMANAGER_H
#define REFRESHMANAGER_H

#include <string>

#include "../src/TimedAlgorithmManager.h"

class RefreshManager: public TimedAlgorithmManager
{
public:
    
    RefreshManager(MANAGER_TYPE type, std::string name);
    
    //RefreshManager(const RefreshManager& orig);
    void createInstance(unsigned long user_id, unsigned int users_instance_personal_id);
    
    virtual ~RefreshManager();
private:

};
#endif /* REFRESHMANAGER_H */

