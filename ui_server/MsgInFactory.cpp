#include "MsgInFactory.h"

#include "ServerException.h"

#include <algorithm> 

#include "msgs/IMsgIn.h"

#include "msgs/UserLogIn.h"
#include "msgs/DevicesGet.h"
#include "msgs/MsgInUnknown.h"
#include "msgs/GatesGetConnected.h"
#include "msgs/LocationsGet.h"
#include "msgs/LogGet.h"
#include "msgs/LocationAdd.h"
#include "msgs/LocationDelete.h"
#include "msgs/AccountDel.h"
#include "msgs/AccountUpdate.h"
#include "msgs/AccountAdd.h"
#include "msgs/DevicesGetAll.h"
#include "msgs/DeviceDelete.h"
#include "msgs/GateScanMode.h"
#include "msgs/ModuleSwitchState.h"
#include "msgs/GateAdd.h"
#include "msgs/DevicesGetNew.h"
#include "msgs/NotificationSetGCMID.h"
#include "msgs/NotificationEraseGCMID.h"
#include "msgs/MsgInAlgorithmsRedirect.h"
#include "msgs/MsgInGamificationRedirect.h"
#include "msgs/NotificationsGet.h"
#include "msgs/NotificationReaded.h"
#include "msgs/UserGetInfo.h"
#include "msgs/UserRegister.h"
#include "msgs/GateDelete.h"
#include "msgs/UserLogout.h"
#include "msgs/GateGetInfo.h"
#include "msgs/DevicesUpdate.h"
#include "msgs/GateUpdate.h"
#include "msgs/AccountGet.h"


MsgInFactory::MsgInFactory(void)
{
}


MsgInFactory::~MsgInFactory(void)
{
}

MsgInFactory& MsgInFactory::getInstance(){
    static MsgInFactory instance;
    return instance;
}

IMsgIn* MsgInFactory::createMsg(const char* msg)
{
    
    pugi::xml_document* doc = new pugi::xml_document();
    pugi::xml_parse_result result = doc->load(msg);
        
    if (!result)
    {
        Logger::error()<< "XML [" << msg << "] parsed with errors" << endl;
        Logger::error()<< "Error description: " << result.description() << endl;
        Logger::error() << "Error offset: " << result.offset << " (error at [..." << (msg + result.offset) << "]"<<endl;
        return new MsgInUnknown(doc); 
    }
    
    
    //doc->save(std::cout, "\t", pugi::format_indent);
    
    string state = doc->child(proto::communicationNode).attribute(proto::stateAttr).value();
    
    Logger::getInstance(Logger::DEBUG3) << "factory: creating msg "<< state<< endl;

    if(state == GatesGetConnected::state)
        return new GatesGetConnected(doc);
    if(state == DevicesGetAll::state)
        return new DevicesGetAll(doc);
    if(state == DevicesGet::state)
        return new DevicesGet(doc);
    if(state == UserLogIn::state)
        return new UserLogIn(doc);
    if(state == UserRegister::state)
        return new UserRegister(doc);
    if(state == LocationsGet::state)
        return new LocationsGet(doc);
    if(state == LocationAdd::state)
        return new LocationAdd(doc);
    if(state == LocationDelete::state)
        return new LocationDelete(doc);
    if(state == AccountGet::state)
        return new AccountGet(doc);
    if(state == AccountDel::state)
        return new AccountDel(doc);
    if(state == AccountUpdate::state)
        return new AccountUpdate(doc);
    if(state == MsgInAddAccount::state)
        return new MsgInAddAccount(doc);
    if(state == GetLog::state)
        return new GetLog(doc);
    if(state == DeviceDelete::state)
        return new DeviceDelete(doc);
    if(state == DevicesUpdate::state)
        return new DevicesUpdate(doc);
    if(state == GateScanMode::state)
        return new GateScanMode(doc);
    if(state == ModuleSwitchState::state)
        return new ModuleSwitchState(doc);
    if(state == GateAdd::state)
        return new GateAdd(doc);
    if(state == DevicesGetNew::state)
        return new DevicesGetNew(doc);
    if(state == NotificationSetGCMID::state)
        return new NotificationSetGCMID(doc);
    if(state == NotificationEraseGCMID::state)
        return new NotificationEraseGCMID(doc);
    if(state == UserGetInfo::state)
        return new UserGetInfo(doc);
    if(state == UserLogout::state)
        return new UserLogout(doc);
    if(state == GateGetInfo::state)
        return new GateGetInfo(doc);
    if(state == GateUpdate::state)
        return new GateUpdate(doc); 
    if(state == NotificationsGet::state)
        return new NotificationsGet(doc);
    if(state == NotificationReaded::state)
        return new NotificationReaded(doc);    
    if(state == GateDelete::state)
        return new GateDelete(doc);
    
     vector<string> algMsgs = {"addalg", "getalg", "getalgs", "setalg", "delalg", "getallalgs", "passborder"};
    
    if(std::find(algMsgs.begin(), algMsgs.end(), state)!=algMsgs.end())
        return new MsgInAlgorithmsRedirect(doc);
 /*   
    vector<string> gamiMsgs = {"getallachievements","setprogresslvl"};
    
    if(std::find(gamiMsgs.begin(), gamiMsgs.end(), state) != gamiMsgs.end())
        return new MsgInGamificationRedirect(doc);   
*/
    Logger::getInstance(Logger::ERROR)<<"UNKNOWN MSG"<<endl;
    return new MsgInUnknown(doc);
}
