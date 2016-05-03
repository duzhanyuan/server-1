/* 
 * File:   WatchdogInstance.h
 * Author: Martin Novak, xnovak1c@stud.fit.vutbr.cz
 *
 * Created on 29. March 2016
 */

#ifndef WATCHDOGINSTANCE_H
#define WATCHDOGINSTANCE_H

#include <chrono>
#include <string>
#include <memory>

#include "../../../src/TriggerTaskInstance.h"
#include "../../../src/DataMessage.h"
#include "../../../src/TaskManager.h"

#include "WatchdogManager.h"

class WatchdogInstance: public TriggerTaskInstance
{
public:
    /**
     * Constructor of class WatchdogInstance.
     */
    WatchdogInstance(long instance_id,
                     std::weak_ptr<TaskManager> owning_manager,
                     long device_euid);
    /**
     * Destructor of class WatchdogInstance.
     */
    virtual ~WatchdogInstance();
    /**
     * Entry point for task main algorithm.
     * @param data_message Received data message.
     */
    void run(DataMessage data_message) override;

private:
    
    void operatorConditionMet();
    
    void sendNotification(std::string notification);
    
    double getModuleValue(int module_id, DataMessage data_message);
    
    bool shouldAct();
    
    /**
     * Variable indicates, that instance received atleast one data message.
     */
    bool m_received_data_once;
    /**
     * Last received value from module.
     */
    double m_last_received_value;
    /**
     * Indicated if watchdog operator was met and watchdog executed its function.
     */
    bool m_can_run;
    /**
     * Stores time when watchdog executed last time.
     */
    std::chrono::system_clock::time_point m_last_act_time;
    
};

#endif /* WATCHDOGINSTANCE_H */
