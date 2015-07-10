
#include "UserRegister.h"
#include "ServerException.h"
#include "../DAO/DAOUsers.h"
#include <iostream>
#include <unistd.h>
#include <fcntl.h>
#include <sstream>
const std::string UserRegister::state = "signup";


UserRegister::UserRegister(pugi::xml_document* doc): IMsgInFreeAccess(doc)
{
}

UserRegister::~UserRegister(void)
{
}

int UserRegister::getMsgAuthorization() {
    return EVERYONE;
}

string UserRegister::createResponseMsgOut()
{
    pugi::xml_node parametersNode =  _doc->child(P_COMMUNICATION).child(P_SIGN_PARAMS);
    
    string service = _doc->child(P_COMMUNICATION).attribute(P_SIGN_SERVICE).value();
    
    User user;
    
    if(service == "google")
    {
        string gToken = parametersNode.attribute(P_GOOGLE_TOKEN).value();       
                
        googleInfo gInfo;

        if( !isGTokenOk(gToken, gInfo) )
        {
            _outputMainNode.append_attribute(P_ERRCODE) = ServerException::TOKEN_EMAIL;
            return genOutputXMLwithVersionAndState(R_FALSE);
        }

        user.familyName = gInfo.family_name;
        user.gender = gInfo.gender;
        user.givenName = gInfo.given_name;
        user.googleId = gInfo.id;
        user.mail = gInfo.email;
        user.picture = gInfo.picture;
    }
    else  if(service == "facebook")
    {
        
        facebookInfo fInfo;
                
        string fbToken = parametersNode.attribute(P_FACEBOOK_TOKEN).value();   
        if ( !isFTokenOkay(fbToken, fInfo))
            throw ServerException(ServerException::TOKEN_EMAIL);

        user.familyName = fInfo.last_name;
        //user.gender = fInfo.gender;
        user.givenName = fInfo.first_name;
        user.googleId = fInfo.id;
        user.mail = fInfo.email;
        //user.picture = fInfo.picture;
        
    }
    else if(service == "beeeon")
    {
        
        //string userName = parametersNode.attribute("name").value();       
        //string userPassword = parametersNode.attribute("pswd").value();     
        
    }
    else
    {
        Logger::error() << "unsupported provider : " << service <<endl;
        _outputMainNode.append_attribute(P_ERRCODE) = ServerException::WRONG_AUTH_PROVIDER;
        return genOutputXMLwithVersionAndState(R_FALSE);
    }
              
    if(DAOUsers::getInstance().add(user) == 0)
    {
        _outputMainNode.append_attribute(P_ERRCODE) = ServerException::IDENTIFICATION_TAKEN;
        return genOutputXMLwithVersionAndState(R_FALSE);
    }

    return genOutputXMLwithVersionAndState(R_TRUE);
}