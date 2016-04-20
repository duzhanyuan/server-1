/* 
 * File:   Session.cpp
 * Author: Martin Novak, xnovak1c@stud.fit.vutbr.cz
 *
 * Created on 15. March 2016
 */

#include "Session.h"

#include <stdexcept>

#include "Logger.h"

Session::Session(asio::io_service& io_service):
    m_socket(io_service)
{
}

Session::~Session()
{
    try {
        if (m_socket.is_open()) {
            m_socket.close();            
        }
    }
    catch (asio::system_error const& e) {
        
        logger.LOGFILE("session", "ERROR") << "Socket couldn't be closed: " << e.what() << std::endl;
    }
}

asio::ip::tcp::socket& Session::getSocket()
{
    return m_socket;
}

std::string Session::convertMessage(int msg_length) {
    
    asio::streambuf::const_buffers_type bufstream = m_buffer.data();
    std::string message(asio::buffers_begin(bufstream), asio::buffers_begin(bufstream) + msg_length);
    
    // Clear message from buffer.
    m_buffer.consume(msg_length);
    return message;
}

void Session::onStart()
{
    async_read(m_socket, m_buffer, boost::bind(&Session::handleRead, shared_from_this(),
               asio::placeholders::error, asio::placeholders::bytes_transferred)); 
}

void Session::handleRead(const asio::error_code& error, size_t bytes_transferred)
{
    if (error && error != asio::error::eof) {

        logger.LOGFILE("session", "ERROR") << "Read was not successful: " << error.message() << std::endl;;
    }
    else {
        // If read was successful then process received message.
        std::string message = convertMessage(bytes_transferred);
        processMessage(message);
    }
}

void Session::sendResponse(std::string message)
{
    size_t message_length = message.length();
    // Send the message to client.
    asio::async_write(m_socket, asio::buffer(message, message_length),
          boost::bind(&Session::handleWrite, shared_from_this(), asio::placeholders::error));        
}

void Session::handleWrite(const asio::error_code& error)
{
    if (error) {
        // If responding to client was not successful.
        logger.LOGFILE("session", "WARN") << "Writing to socket was not successful: " << error.message() << std::endl;
    }
}
