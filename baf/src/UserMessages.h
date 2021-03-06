/*
 * File:   UserMessages.h
 * Author: Martin Novak, xnovak1c@stud.fit.vutbr.cz
 *
 * Created on 23. March 2016
 */

#ifndef USERMESSAGES_H
#define USERMESSAGES_H

#include <map> //std::map
#include <string> //std::string

enum class USER_MESSAGE_TYPE {
	CREATE, CHANGE, DELETE, GET_INST_IDS, GET_CONF, GET_DATA
};

struct CreateMessage //"msg": "create"
{
	/**
	 * At least 4 bytes. Serial in database (4 bytes).
	 */
	long user_id;
	/**
	 * At least 2 bytes. Smallint in database (2 bytes).
	 */
	short task_id;
	/**
	 * Stored configuration.
	 */
	std::map<std::string /*name*/, std::string /*value*/> config;
};

struct ChangeMessage
{
	/**
	 * At least 4 bytes. Serial in database (4 bytes).
	 */
	long user_id;
	/**
	 * At least 2 bytes. Smallint in database (2 bytes).
	 */
	short task_id;
	/**
	 * At least 4 bytes. Serial in database (4 bytes).
	 */
	long instance_id;
	/** Stored configuration. */
	std::map<std::string /*name*/, std::string /*value*/> config;
};

struct DeleteMessage
{
	/**
	 * At least 4 bytes. Serial in database (4 bytes).
	 */
	long user_id;
	/**
	 * At least 2 bytes. Smallint in database (2 bytes).
	 */
	short task_id;
	/**
	 * At least 4 bytes. Serial in database (4 bytes).
	 */
	long instance_id;
};

struct GetInstIdsMessage
{
	/**
	 * At least 4 bytes. Serial in database (4 bytes).
	 */
	long user_id;
	/**
	 * At least 2 bytes. Smallint in database (2 bytes).
	 */
	short task_id;
};

struct GetConfMessage
{
	/**
	 * At least 4 bytes. Serial in database (4 bytes).
	 */
	long user_id;
	/**
	 * At least 2 bytes. Smallint in database (2 bytes).
	 */
	short task_id;
	/**
	 * At least 4 bytes. Serial in database (4 bytes).
	 */
	long instance_id;
};

struct GetDataMessage
{
	/**
	 * At least 4 bytes. Serial in database (4 bytes).
	 */
	long user_id;
	/**
	 * At least 2 bytes. Smallint in database (2 bytes).
	 */
	short task_id;
	/**
	 * At least 4 bytes. Serial in database (4 bytes).
	 */
	long instance_id;
	/**
	 * Parameters by which task knows what data to return.
	 */
	std::map<std::string /*name*/, std::string /*value*/> parameters;
};

#endif /* USERMESSAGES_H */
