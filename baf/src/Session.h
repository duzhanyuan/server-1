/*
 * File:   Session.h
 * Author: Martin Novak, xnovak1c@stud.fit.vutbr.cz
 *
 * Created on 15. March 2016
 */

#ifndef SESSION_H
#define SESSION_H

#include <memory>
#include <string>

#include <boost/bind.hpp>
#include <asio.hpp>
#include <asio/steady_timer.hpp>

class Session: public std::enable_shared_from_this<Session>
{
public:
	/**
	 * Constructor of class Session.
	 */
	Session(asio::io_service& io_service);
	/**
	 * Destructor of class Session. If socket is open on
	 * destruction it's closed.
	 */
	virtual ~Session();
	/**
	 * Getter of m_socket member variable.
	 * @return Adress of socket of session.
	 */
	asio::ip::tcp::socket& getSocket();
	/**
	 * Converts received message from buffer to string.
	 * @param msg_length Length of received message.
	 * @return Converted received message.
	 */
	std::string convertMessage(int msg_length);
	/**
	 * Called when connection is made. Reads received message.
	 */
	void onStart();
	/**
	 * Function in which received message is
	 * @param bytes_transferred
	 */
	virtual void processMessage(std::string message) = 0;

protected:
	/**
	 * Enables to send a message back to client.
	 * @param message Message which will be send.
	 */
	void sendResponse(std::string message);
	/**
	 * Handler after asynchronous read was made.
	 */
	void handleRead(const asio::error_code& error, size_t bytes_transferred);
	/**
	 * Handler after asynchronous write was made.
	 */
	void handleWrite(const asio::error_code& error);
	/**
	 * Sets deadline timeout of connection to 2 seconds.
	 */
	void startTimeout();
	/**
	 * Restarts deadline timeout to be able to send message.
	 */
	void restartTimeout();
	/*
	 * Handler in which is handled timeout of connection.
	 */
	void timeoutExpired(const asio::error_code& error);
	/**
	 * Stops connection. Called when it times out.
	 */
	void stopConnection();
	/**
	 * Socket object for communication.
	 */
	asio::ip::tcp::socket m_socket;
	/**
	 * Buffer in which is stored received message.
	 */
	asio::streambuf m_buffer;
	/**
	 * If this deadline is met, connection times out.
	 */
	asio::steady_timer m_deadline;
	/**
	 * Variable which indicates if deadline was met.
	 */
	bool m_expired;
};

#endif /* SESSION_H */
