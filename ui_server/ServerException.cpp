/* 
 * File:   ServerException.cpp
 * Author: pavel
 * 
 * Created on 17. červenec 2014, 13:46
 */

#include <string.h>

#include "ServerException.h"

using namespace std;

    const int  ServerException::VERSION = 1;
     const int  ServerException::TOKEN_EMAIL = 2;
     const int  ServerException::EMAIL = 3; //+text
     const int  ServerException::LOCALE = 4;

     const int  ServerException::ADAPTER_ID = 5;

     const int  ServerException::AGG_FUNCTION = 8;
     const int  ServerException::INTERVAL = 9;
     const int ServerException::DEVICE_ID_TYPE = 10; //+text

     const int ServerException::XML = 12;

     const int  ServerException::MISSING_ENTITY = 13;
     const int  ServerException::ICON = 14;
     const int  ServerException::ACTION = 15;
     const int  ServerException::MSG_RIGHT = 16;
     const int  ServerException::ROLE = 17; //+text
     const int  ServerException::EMAIL_ROLE = 17; //+text
     const int  ServerException::TIME_UTC = 18;

     const int  ServerException::BAD_ACTOR_VALUE = 19;

     const int  ServerException::RESIGN = 20;
     const int ServerException::NOTREG_A = 21;
     const int  ServerException::NOTREG_B = 22;

     const int  ServerException::ROOM_TYPE = 50;

     const int  ServerException::SERVER2SERVER = 100;
     const int  ServerException::SWITCH_FAIL = 100;
     const int  ServerException::ADAPTER_LISTEN_FAIL =100;

     const int  ServerException::WRONG_COND_OR_EMTPY_COND = 200;
     const int  ServerException::WRONG_OR_EMPTY_ACTION = 201;
     const int  ServerException::CONDITION_ACTION = 202;
     
     const int  ServerException::GCMID = 300;

     const int  ServerException::UNKNOWN_ERROR =998;
    
     const int ServerException::MSG_UNKNOWN = 999;

ServerException::ServerException(int errCode) : runtime_error("x") {
    _errCode = errCode;
    _errText ="";
}

ServerException::ServerException(int errCode, string errText)  : runtime_error("x") {
    _errCode = errCode;
    _errText = errText;
}
/*
ServerException::ServerException(int errCode, string errText, string id, string state)  : runtime_error("x") {
    _errCode = errCode;
    _errText = errText;
    _id = id;
    _state = state;
}*/
/*
 ServerException::~ServerException() {
 }*/

const char* ServerException::what() const throw()
{
    //TODO number or longer text
    return "Server exception: ";
}

int ServerException::getErrCode(){
    return _errCode;
}
string ServerException::getErrText(){
    return _errText;
}  /*
    string ServerException::getId(){
        return _id;
    }
    string ServerException::getState(){
        return _state;
    }*/