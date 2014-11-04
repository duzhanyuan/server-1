/* 
 * File:   MsgInReinit.h
 * Author: pavel
 *
 * Created on 22. červenec 2014, 10:40
 */

#ifndef MSGINREINIT_H
#define	MSGINREINIT_H

#include "IMsgInLoginAndAdapterAccessRequired.h"


class MsgInReinitAdapter : public IMsgInLoginAndAdapterAccessRequired{
public:
    MsgInReinitAdapter(char* msg, pugi::xml_document* doc);
    virtual ~MsgInReinitAdapter();
private:
    string _oldAdapter;
    string _newAdapter;
};

#endif	/* MSGINREINIT_H */

