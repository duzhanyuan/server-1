/* 
 * File:   RefreshManager.cpp
 * Author: Martin Novak, xnovak1c@stud.fit.vutbr.cz
 * 
 * Created on 21. January 2016
 */

#include "RefreshManager.h"

#include "RefreshInstance.h"

RefreshManager::RefreshManager(MANAGER_TYPE type, std::string name) :
    TimedAlgorithmManager(type, name)
{
}
/*
RefreshManager::RefreshManager(const RefreshManager& orig) {
}
*/
RefreshManager::~RefreshManager() {
}

void RefreshManager::createInstance(unsigned long user_id, unsigned int users_instance_personal_id) {
    //std::cout << "TimedAlgorithmManager::createInstance >> m_id: " << m_id << std::endl;
    m_algorithm_instances.insert({m_instance_id_counter, std::make_shared<RefreshInstance>(user_id, users_instance_personal_id)});
    
    m_instance_id_counter++;
}