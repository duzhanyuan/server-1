/* 
 * File:   MsgInAddView.cpp
 * Author: pavel
 * 
 * Created on 2. červenec 2014, 15:00
 */

#include "MsgInAddView.h"



const std::string MsgInAddView::state = "addview";

MsgInAddView::MsgInAddView(pugi::xml_document* doc): IMsgInLoginRequired(doc) {
}
MsgInAddView::~MsgInAddView() {
}

int MsgInAddView::getMsgAuthorization() {
    return GUEST;
}

string MsgInAddView::createResponseMsgOut()
{
    /*
    pugi::xml_node deviceNode =  _doc->child("communication").child("device");
    string deviceId;
    string deviceType;
    string viewName = _doc->child("communication").attribute("name").value();
    string viewIcon = _doc->child("communication").attribute("icon").value();
    int vi;
    try{
       vi = stoi(viewIcon);
    }catch(...){
        throw ServerException(ServerException::ICON);
    }
    if(vi<0)//TODO horni omezeni
        throw ServerException(ServerException::ICON);
    */
    //TODO castecne pridani (2x ten samy senzor=chyba))
    /*DBConnector::getInstance().addView(_userId, viewName, viewIcon);
    
    for (; deviceNode; deviceNode = deviceNode.next_sibling("device"))
    {
        deviceId = deviceNode.attribute("id").value();
        deviceType = deviceNode.attribute("type").value();
        DBConnector::getInstance().addDeviceToView(viewName,_userId, deviceId, deviceType);
    }*/
     return envelopeResponse(R_TRUE);
}
