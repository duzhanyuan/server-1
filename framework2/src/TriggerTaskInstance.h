/* 
 * File:   TriggerTaskInstance.h
 * Author: Martin Novak, xnovak1c@stud.fit.vutbr.cz
 *
 * Created on 22. January 2016
 */

#ifndef TRIGGERTASKINSTANCE_H
#define TRIGGERTASKINSTANCE_H

#include "TaskInstance.h"
class TriggerTaskInstance//:public TaskInstance 
{
public:
    TriggerTaskInstance();
    TriggerTaskInstance(const TriggerTaskInstance& orig);
    virtual ~TriggerTaskInstance();
private:

};

#endif /* TRIGGERTASKINSTANCE_H */

