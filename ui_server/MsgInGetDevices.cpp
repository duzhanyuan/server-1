#include "MsgInGetDevices.h"

using namespace std;

const string MsgInUpdate::state = "getdevs";

MsgInUpdate::MsgInUpdate(char* msg, pugi::xml_document* doc): IMsgInLoginRequired(msg, doc)
{
}

MsgInUpdate::~MsgInUpdate(void)
{
}

int MsgInUpdate::getMsgAuthorization() {
    return GUEST;
}


string MsgInUpdate::createResponseMsgOut()
{
    string adapterId;
    string facilityMac;
    string deviceType;
    
    
    vector<device> devicesVec;
     //vector<string> adapterVec;
    //vector<string> facilitiesVec;
   // vector<string> devicesVec;
    
    pugi::xml_node adapterNode =  _doc->child(P_COMMUNICATION).child(P_ADAPTER);
    pugi::xml_node facilityNode;
    pugi::xml_node deviceNode;
    
    for (; adapterNode; adapterNode = adapterNode.next_sibling(P_ADAPTER))
    {
        //adapterId = adapterNode.attribute(...).value();
        //adapterVec.insert(adapterVec.begin(), adapterId);
        
        facilityNode =  _doc->child(P_COMMUNICATION).child(P_ADAPTER).child(P_FACILITY);
        
        for (; facilityNode; facilityNode = facilityNode.next_sibling(P_FACILITY))
        {
            facilityMac = facilityNode.attribute(P_IN_FACILITY_ID).value();
            //facilitiesVec.insert(facilitiesVec.begin(), facilityMac);
            
            deviceNode =  facilityNode.child(P_DEVICE);
            for (; deviceNode; deviceNode = deviceNode.next_sibling(P_DEVICE))
            {
                deviceType = deviceNode.attribute(P_IN_DEVICE_TYPE).value();
                //devicesVec.insert(devicesVec.begin(), deviceType);
                
                device d;
                d.id = facilityMac;
                d.type = deviceType;
                //cout<<d.id<<d.type<<endl;
                devicesVec.insert(devicesVec.begin(), d);
            }
        }
    }
    
    return envelopeResponse(R_DEVICES, DBConnector::getInstance().getXMLdevices(_parredUserId, devicesVec));
}