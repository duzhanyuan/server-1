/* 
 * File:   TriggerTaskInstance.h
 * Author: Martin Novak, xnovak1c@stud.fit.vutbr.cz
 *
 * Created on 22. January 2016
 */

#ifndef TRIGGERTASKINSTANCE_H
#define TRIGGERTASKINSTANCE_H

#include "DataMessage.h"
#include "TaskInstance.h"

#include <mutex>
#include <set>

class TriggerTaskInstance: public TaskInstance 
{
public:
    /**
     * Constructor of class TriggerTaskInstance.
     * @param instance_id
     * @param owning_manager
     */
    TriggerTaskInstance(int instance_id, std::weak_ptr<TaskManager> owning_manager);
    /**
     * Virtual destructor of class TriggerTaskInstance. Removes all entries
     * with this instance from DataMessageRegister before instance is deleted.
     */
    virtual ~TriggerTaskInstance();
    /**
     * Activates instance. Protects run function with activation mutex,
     * so it's not possible to run one instance more times at the same time.
     * @param data_message Message with data from registered device_euid.
     */
    void activate(DataMessage data_message) override;
    /**
     * Virtual function which is called every time gateway sends a message
     * to server with data from device this instance registered to DataMessageRegister.
     * @param data_message Message with data from registered device_euid.
     */
    virtual void run(DataMessage data_message) = 0;
    /**
     * Register instance to receive data messages from device.
     * @param device_euid EUID of device from which to receive messages.
     */
    void registerToReceiveDataFromDevice(long device_euid);
    
    /**
     * Removes one entry from DataMessageRegister.
     * After this instance won't receive any data messages from device.
     * @param device_euid EUID of device from which not to receive messages anymore.
     */
    void removeEntryFromDataMessageRegiser(long device_euid);
    /**
     * Removes all entries from DataMessageRegister of instance.
     * After this instance won't receive any data messages.
     */
    void deleteFromControlComponent() override;
    
private:
    /**
     * Set of all devices from which instance receives data messages. 
     */
    std::set<long /*device_euid*/> m_registered_device_euids;
    /**
     * Mutex which protects instance from being activated more than once.
     */
    std::mutex m_instance_mx;
};

#endif /* TRIGGERTASKINSTANCE_H */

