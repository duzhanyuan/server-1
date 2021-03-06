/**
 * @file DBHandler.h
 * 
 * @brief definition of DBHandler class
 *
 * @author Matus Blaho 
 * @version 1.0
 */

#include <soci.h>
#include <postgresql/soci-postgresql.h>
#include <string>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <vector>
#include "structures.h"
#include "loger.h"
#include "sqlCommands.h"

#ifndef DBHANDLER_H_
#define DBHANDLER_H_


/** @class DBHandler
 *  @brief Class responsible for database interface
 */

class DBHandler
{
	private:
		const std::string _Name="DBHandler"; /**< name of class*/
		const int DEVICE_INITIALIZED = 1; /**< device is paired in the database*/
		soci::session *_sql;  /**< conncetion to dabase*/
		std::string _DBName;  /**< name of database*/
		Loger *_log; /**<reference to loger used for logging */
	public:
		~DBHandler();
		DBHandler(soci::session *SQL, Loger *l);
		bool DeleteFacility(std::string ID, long long int gateway_id);
		bool IsInDB(std::string tableName,std::string columnName,std::string record);
		/** Method for creating new adapter in database
		 * @param message - pointer to message content
		 * @return bool on success/failure true/false
		    */
		bool InsertGateway(tmessageV1_0 *message);
		/** Method for inserting new facility and device to database
		 * @param message - pointer to message content
		 * @return bool on success/failure true/false
			*/
		bool InsertSenAct(tmessageV1_0 *message);
		/** Method for updating adapter in database
		 * @param message - pointer to message content
		 * @return bool on success/failure true/false
			*/
		bool UpdateGateway(tmessageV1_0 *message);
		/** Method for updating facility and device in database
		 * @param message - pointer to message content
		 * @return bool on success/failure true/false
			*/
		bool UpdateSenAct(tmessageV1_0 *message);
		/** Method for obtaining wakeup time from database
		 * @param record - record which time are we looking for
		 * @return number of seconds to next wakeup on failure/missing record returns default value 5
			*/
		unsigned int GetWakeUpTime(std::string record, long long int gateway_id);
		std::string GetXmlDeviceParameters(std::string device_euid, long long int adapterid);
    /** Method for creating history row in database
		 * @param message - pointer to message content
			*/
		void LogValue (tmessageV1_0 *message);
		/** Method for obtaining socket number from DB
		 * @param soc - pointer to int where is returned value
		 * @param long int ID of adapter
			*/
		void GetAdapterData(int *soc, long int ID);
		/** Method updating socket number in database
		 * @param message - pointer to message content
		 * @param long int ID of adapter
			*/
		bool UpdateAdapterPort(tmessageV1_0 *message);

		/** Method for obtaining last timestamp
		* @param long long unsigned int containing device identification
		* @return time_t value of the timestamp from database*/
		time_t GetLastTimestamp(long long unsigned int dev_euid);
        bool GetDevices(tmessageV1_1 *message);
        bool GetLastModuleValue(tmessageV1_1 *message);
        bool GetUserLabelForDevice(tmessageV1_1 *message);
        bool GetUserRoomForDevice(tmessageV1_1 *message);
};


#endif /* DBHANDLER_H_ */
