#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux-x86
CND_DLIB_EXT=so
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/ComTable.o \
	${OBJECTDIR}/Config.o \
	${OBJECTDIR}/DBConnector.o \
	${OBJECTDIR}/IMsgIn.o \
	${OBJECTDIR}/IMsgInLoginAndAdapterAccessRequired.o \
	${OBJECTDIR}/IMsgInLoginRequired.o \
	${OBJECTDIR}/IMsgInLoginUnwanted.o \
	${OBJECTDIR}/Logger.o \
	${OBJECTDIR}/MsgInAdapterListen.o \
	${OBJECTDIR}/MsgInAddAccount.o \
	${OBJECTDIR}/MsgInAddAdapter.o \
	${OBJECTDIR}/MsgInAddRoom.o \
	${OBJECTDIR}/MsgInAddView.o \
	${OBJECTDIR}/MsgInConditionPlusAction.o \
	${OBJECTDIR}/MsgInDelAction.o \
	${OBJECTDIR}/MsgInDelConAccount.o \
	${OBJECTDIR}/MsgInDelCondition.o \
	${OBJECTDIR}/MsgInDelDevice.o \
	${OBJECTDIR}/MsgInDelRoom.o \
	${OBJECTDIR}/MsgInDelView.o \
	${OBJECTDIR}/MsgInFactory.o \
	${OBJECTDIR}/MsgInGetAction.o \
	${OBJECTDIR}/MsgInGetActions.o \
	${OBJECTDIR}/MsgInGetAdapters.o \
	${OBJECTDIR}/MsgInGetAllDevices.o \
	${OBJECTDIR}/MsgInGetConAccount.o \
	${OBJECTDIR}/MsgInGetConditions.o \
	${OBJECTDIR}/MsgInGetDevices.o \
	${OBJECTDIR}/MsgInGetLog.o \
	${OBJECTDIR}/MsgInGetNewDevices.o \
	${OBJECTDIR}/MsgInGetRooms.o \
	${OBJECTDIR}/MsgInGetTimeZone.o \
	${OBJECTDIR}/MsgInGetViews.o \
	${OBJECTDIR}/MsgInReinitAdapter.o \
	${OBJECTDIR}/MsgInSetAction.o \
	${OBJECTDIR}/MsgInSetConAccount.o \
	${OBJECTDIR}/MsgInSetCondition.o \
	${OBJECTDIR}/MsgInSetDevices.o \
	${OBJECTDIR}/MsgInSetRooms.o \
	${OBJECTDIR}/MsgInSetTimeZone.o \
	${OBJECTDIR}/MsgInSignIn.o \
	${OBJECTDIR}/MsgInSignUp.o \
	${OBJECTDIR}/MsgInSwitch.o \
	${OBJECTDIR}/MsgInUnknown.o \
	${OBJECTDIR}/MsgInUpdateAction.o \
	${OBJECTDIR}/MsgInUpdateCondition.o \
	${OBJECTDIR}/MsgInUpdateView.o \
	${OBJECTDIR}/MsgRightsChecker.o \
	${OBJECTDIR}/ServerException.o \
	${OBJECTDIR}/SocketClient.o \
	${OBJECTDIR}/ccolor.o \
	${OBJECTDIR}/communication.o \
	${OBJECTDIR}/gTokenChecker.o \
	${OBJECTDIR}/msgInGetCondition.o \
	${OBJECTDIR}/pugixml.o \
	${OBJECTDIR}/testHelper.o \
	${OBJECTDIR}/ui_server.o

# Test Directory
TESTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}/tests

# Test Files
TESTFILES= \
	${TESTDIR}/TestFiles/f21 \
	${TESTDIR}/TestFiles/f15 \
	${TESTDIR}/TestFiles/f3 \
	${TESTDIR}/TestFiles/f20 \
	${TESTDIR}/TestFiles/f8 \
	${TESTDIR}/TestFiles/f4 \
	${TESTDIR}/TestFiles/f31 \
	${TESTDIR}/TestFiles/f16 \
	${TESTDIR}/TestFiles/f9 \
	${TESTDIR}/TestFiles/f26 \
	${TESTDIR}/TestFiles/f5 \
	${TESTDIR}/TestFiles/f19 \
	${TESTDIR}/TestFiles/f29 \
	${TESTDIR}/TestFiles/f28 \
	${TESTDIR}/TestFiles/f18 \
	${TESTDIR}/TestFiles/f17 \
	${TESTDIR}/TestFiles/f24 \
	${TESTDIR}/TestFiles/f7 \
	${TESTDIR}/TestFiles/f14 \
	${TESTDIR}/TestFiles/f11 \
	${TESTDIR}/TestFiles/f27 \
	${TESTDIR}/TestFiles/f22 \
	${TESTDIR}/TestFiles/f13 \
	${TESTDIR}/TestFiles/f1 \
	${TESTDIR}/TestFiles/f2 \
	${TESTDIR}/TestFiles/f10 \
	${TESTDIR}/TestFiles/f12 \
	${TESTDIR}/TestFiles/f30 \
	${TESTDIR}/TestFiles/f25 \
	${TESTDIR}/TestFiles/f6

# C Compiler Flags
CFLAGS=`cppunit-config --cflags` 

# CC Compiler Flags
CCFLAGS=-std=c++0x -D_GLIBCXX_USE_NANOSLEEP `cppunit-config --cflags` 
CXXFLAGS=-std=c++0x -D_GLIBCXX_USE_NANOSLEEP `cppunit-config --cflags` 

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=-L/usr/local/lib -L/usr/local/lib64 -L/opt/centos/devtoolset-1.1/root/usr/lib/gcc/x86_64-redhat-linux/4.7.2 -Wl,-rpath,/usr/local/lib -Wl,-rpath,/usr/local/lib64 -lsoci_core -lsoci_empty -lsoci_postgresql -lpq -ljansson `cppunit-config --libs` `cppunit-config --libs` `cppunit-config --libs`  

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${TESTDIR}/TestFiles/f34

${TESTDIR}/TestFiles/f34: ${OBJECTFILES}
	${MKDIR} -p ${TESTDIR}/TestFiles
	g++ -o ${TESTDIR}/TestFiles/f34 ${OBJECTFILES} ${LDLIBSOPTIONS} -lpq -lsoci_core -lsoci_empty -lsoci_postgresql -lcppunit -lssl -lcrypto -ljansson -lstdc++

${OBJECTDIR}/ComTable.o: ComTable.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/ComTable.o ComTable.cpp

${OBJECTDIR}/Config.o: Config.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Config.o Config.cpp

${OBJECTDIR}/DBConnector.o: DBConnector.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/DBConnector.o DBConnector.cpp

${OBJECTDIR}/IMsgIn.o: IMsgIn.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/IMsgIn.o IMsgIn.cpp

${OBJECTDIR}/IMsgInLoginAndAdapterAccessRequired.o: IMsgInLoginAndAdapterAccessRequired.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/IMsgInLoginAndAdapterAccessRequired.o IMsgInLoginAndAdapterAccessRequired.cpp

${OBJECTDIR}/IMsgInLoginRequired.o: IMsgInLoginRequired.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/IMsgInLoginRequired.o IMsgInLoginRequired.cpp

${OBJECTDIR}/IMsgInLoginUnwanted.o: IMsgInLoginUnwanted.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/IMsgInLoginUnwanted.o IMsgInLoginUnwanted.cpp

${OBJECTDIR}/Logger.o: Logger.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Logger.o Logger.cpp

${OBJECTDIR}/MsgInAdapterListen.o: MsgInAdapterListen.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInAdapterListen.o MsgInAdapterListen.cpp

${OBJECTDIR}/MsgInAddAccount.o: MsgInAddAccount.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInAddAccount.o MsgInAddAccount.cpp

${OBJECTDIR}/MsgInAddAdapter.o: MsgInAddAdapter.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInAddAdapter.o MsgInAddAdapter.cpp

${OBJECTDIR}/MsgInAddRoom.o: MsgInAddRoom.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInAddRoom.o MsgInAddRoom.cpp

${OBJECTDIR}/MsgInAddView.o: MsgInAddView.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInAddView.o MsgInAddView.cpp

${OBJECTDIR}/MsgInConditionPlusAction.o: MsgInConditionPlusAction.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInConditionPlusAction.o MsgInConditionPlusAction.cpp

${OBJECTDIR}/MsgInDelAction.o: MsgInDelAction.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInDelAction.o MsgInDelAction.cpp

${OBJECTDIR}/MsgInDelConAccount.o: MsgInDelConAccount.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInDelConAccount.o MsgInDelConAccount.cpp

${OBJECTDIR}/MsgInDelCondition.o: MsgInDelCondition.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInDelCondition.o MsgInDelCondition.cpp

${OBJECTDIR}/MsgInDelDevice.o: MsgInDelDevice.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInDelDevice.o MsgInDelDevice.cpp

${OBJECTDIR}/MsgInDelRoom.o: MsgInDelRoom.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInDelRoom.o MsgInDelRoom.cpp

${OBJECTDIR}/MsgInDelView.o: MsgInDelView.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInDelView.o MsgInDelView.cpp

${OBJECTDIR}/MsgInFactory.o: MsgInFactory.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInFactory.o MsgInFactory.cpp

${OBJECTDIR}/MsgInGetAction.o: MsgInGetAction.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetAction.o MsgInGetAction.cpp

${OBJECTDIR}/MsgInGetActions.o: MsgInGetActions.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetActions.o MsgInGetActions.cpp

${OBJECTDIR}/MsgInGetAdapters.o: MsgInGetAdapters.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetAdapters.o MsgInGetAdapters.cpp

${OBJECTDIR}/MsgInGetAllDevices.o: MsgInGetAllDevices.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetAllDevices.o MsgInGetAllDevices.cpp

${OBJECTDIR}/MsgInGetConAccount.o: MsgInGetConAccount.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetConAccount.o MsgInGetConAccount.cpp

${OBJECTDIR}/MsgInGetConditions.o: MsgInGetConditions.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetConditions.o MsgInGetConditions.cpp

${OBJECTDIR}/MsgInGetDevices.o: MsgInGetDevices.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetDevices.o MsgInGetDevices.cpp

${OBJECTDIR}/MsgInGetLog.o: MsgInGetLog.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetLog.o MsgInGetLog.cpp

${OBJECTDIR}/MsgInGetNewDevices.o: MsgInGetNewDevices.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetNewDevices.o MsgInGetNewDevices.cpp

${OBJECTDIR}/MsgInGetRooms.o: MsgInGetRooms.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetRooms.o MsgInGetRooms.cpp

${OBJECTDIR}/MsgInGetTimeZone.o: MsgInGetTimeZone.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetTimeZone.o MsgInGetTimeZone.cpp

${OBJECTDIR}/MsgInGetViews.o: MsgInGetViews.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetViews.o MsgInGetViews.cpp

${OBJECTDIR}/MsgInReinitAdapter.o: MsgInReinitAdapter.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInReinitAdapter.o MsgInReinitAdapter.cpp

${OBJECTDIR}/MsgInSetAction.o: MsgInSetAction.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInSetAction.o MsgInSetAction.cpp

${OBJECTDIR}/MsgInSetConAccount.o: MsgInSetConAccount.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInSetConAccount.o MsgInSetConAccount.cpp

${OBJECTDIR}/MsgInSetCondition.o: MsgInSetCondition.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInSetCondition.o MsgInSetCondition.cpp

${OBJECTDIR}/MsgInSetDevices.o: MsgInSetDevices.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInSetDevices.o MsgInSetDevices.cpp

${OBJECTDIR}/MsgInSetRooms.o: MsgInSetRooms.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInSetRooms.o MsgInSetRooms.cpp

${OBJECTDIR}/MsgInSetTimeZone.o: MsgInSetTimeZone.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInSetTimeZone.o MsgInSetTimeZone.cpp

${OBJECTDIR}/MsgInSignIn.o: MsgInSignIn.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInSignIn.o MsgInSignIn.cpp

${OBJECTDIR}/MsgInSignUp.o: MsgInSignUp.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInSignUp.o MsgInSignUp.cpp

${OBJECTDIR}/MsgInSwitch.o: MsgInSwitch.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInSwitch.o MsgInSwitch.cpp

${OBJECTDIR}/MsgInUnknown.o: MsgInUnknown.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInUnknown.o MsgInUnknown.cpp

${OBJECTDIR}/MsgInUpdateAction.o: MsgInUpdateAction.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInUpdateAction.o MsgInUpdateAction.cpp

${OBJECTDIR}/MsgInUpdateCondition.o: MsgInUpdateCondition.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInUpdateCondition.o MsgInUpdateCondition.cpp

${OBJECTDIR}/MsgInUpdateView.o: MsgInUpdateView.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInUpdateView.o MsgInUpdateView.cpp

${OBJECTDIR}/MsgRightsChecker.o: MsgRightsChecker.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgRightsChecker.o MsgRightsChecker.cpp

${OBJECTDIR}/ServerException.o: ServerException.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/ServerException.o ServerException.cpp

${OBJECTDIR}/SocketClient.o: SocketClient.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/SocketClient.o SocketClient.cpp

${OBJECTDIR}/ccolor.o: ccolor.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/ccolor.o ccolor.cpp

${OBJECTDIR}/communication.o: communication.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/communication.o communication.cpp

${OBJECTDIR}/gTokenChecker.o: gTokenChecker.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/gTokenChecker.o gTokenChecker.cpp

${OBJECTDIR}/msgInGetCondition.o: msgInGetCondition.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/msgInGetCondition.o msgInGetCondition.cpp

${OBJECTDIR}/pugixml.o: pugixml.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/pugixml.o pugixml.cpp

${OBJECTDIR}/testHelper.o: testHelper.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/testHelper.o testHelper.cpp

${OBJECTDIR}/ui_server.o: ui_server.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/ui_server.o ui_server.cpp

# Subprojects
.build-subprojects:

# Build Test Targets
.build-tests-conf: .build-conf ${TESTFILES}
${TESTDIR}/TestFiles/f21: ${TESTDIR}/newtestClass.o ${TESTDIR}/tests/newtestclass.o ${TESTDIR}/tests/newtestrunner.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f21 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f15: ${TESTDIR}/tests/testChangeConAccount.o ${TESTDIR}/tests/testrunnerChangeConAccount.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f15 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f3: ${TESTDIR}/tests/testGlobal.o ${TESTDIR}/tests/testrunnerGlobal.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f3 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f20: ${TESTDIR}/tests/testMsgInAddAdapter.o ${TESTDIR}/tests/testrunnerMsgInAddAdapter.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f20 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f8: ${TESTDIR}/tests/testMsgInAddConAcc.o ${TESTDIR}/tests/testrunnerMsgInAddConAcc.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f8 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f4: ${TESTDIR}/tests/testMsgInAddRooms.o ${TESTDIR}/tests/testrunnerMsgInAddRooms.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f4 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs` `cppunit-config --libs`   

${TESTDIR}/TestFiles/f31: ${TESTDIR}/tests/testMsgInDelAction.o ${TESTDIR}/tests/testrunnerMsgInDelAction.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f31 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f16: ${TESTDIR}/tests/testMsgInDelConAcc.o ${TESTDIR}/tests/testrunnerMsgInDelConAcc.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f16 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f9: ${TESTDIR}/tests/testMsgInDelDevice.o ${TESTDIR}/tests/testrunnerMsgInDelDevice.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f9 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f26: ${TESTDIR}/tests/testMsgInDeleteCondition.o ${TESTDIR}/tests/testrunnerMsgInDeleteCondition.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f26 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f5: ${TESTDIR}/tests/testMsgInDelRoom.o ${TESTDIR}/tests/testrunnerMsgInDelRoom.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f5 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f19: ${TESTDIR}/tests/testMsgInPartial.o ${TESTDIR}/tests/testrunnerMsgInPartial.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f19 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f29: ${TESTDIR}/tests/testMsgInGetAction.o ${TESTDIR}/tests/testrunnerMsgInGetAction.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f29 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f28: ${TESTDIR}/tests/testMsgInGetActions.o ${TESTDIR}/tests/testrunnerMsgInGetActions.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f28 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f18: ${TESTDIR}/tests/testMsgInGetAdapters.o ${TESTDIR}/tests/testrunnerMsgInGetAdapters.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f18 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f17: ${TESTDIR}/tests/testMsgInGetConAcc.o ${TESTDIR}/tests/testrunnerMsgInGetConAcc.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f17 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f24: ${TESTDIR}/tests/testMsgInGetConditions.o ${TESTDIR}/tests/testrunnerMsgInGetConditions.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f24 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f7: ${TESTDIR}/tests/testMsgInGetRooms.o ${TESTDIR}/tests/testrunnerMsgInGetRooms.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f7 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f14: ${TESTDIR}/tests/testMsgInGetTimeZone.o ${TESTDIR}/tests/testrunnerMsgInGetTimeZone.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f14 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f11: ${TESTDIR}/tests/testMsgInLogName.o ${TESTDIR}/tests/testrunnerMsgInLogName.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f11 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs` `cppunit-config --libs`   

${TESTDIR}/TestFiles/f27: ${TESTDIR}/tests/testMsgInSetAction.o ${TESTDIR}/tests/testrunnerMsgInSetAction.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f27 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f22: ${TESTDIR}/tests/testMsgInSetCondition.o ${TESTDIR}/tests/testrunnerMsgInSetCondition.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f22 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f13: ${TESTDIR}/tests/testMsgInSetTimeZone.o ${TESTDIR}/tests/testrunnerMsgInSetTimeZone.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f13 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f1: ${TESTDIR}/tests/testMsgInSignIn.o ${TESTDIR}/tests/testrunnerMsgInSignIn.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f1 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs` `cppunit-config --libs`   

${TESTDIR}/TestFiles/f2: ${TESTDIR}/tests/testMsgInSignUp.o ${TESTDIR}/tests/testrunnerMsgInSignUp.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f2 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs` `cppunit-config --libs`   

${TESTDIR}/TestFiles/f10: ${TESTDIR}/tests/testMsgInSwitch.o ${TESTDIR}/tests/testrunnerMsgInSwitch.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f10 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f12: ${TESTDIR}/tests/testMsgInUpdate.o ${TESTDIR}/tests/testrunnerMsgInUpdate.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f12 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f30: ${TESTDIR}/tests/testMsgInUpdateAction.o ${TESTDIR}/tests/testrunnerMsgInUpdateAction.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f30 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f25: ${TESTDIR}/tests/testMsgInUpdateCondition.o ${TESTDIR}/tests/testrunnerMsgInUpdateCondition.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f25 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   

${TESTDIR}/TestFiles/f6: ${TESTDIR}/tests/testMsgInUpdateRooms.o ${TESTDIR}/tests/testrunnerMsgInUpdateRooms.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f6 $^ ${LDLIBSOPTIONS} -L/usr/local/lib64 -L/usr/local/lib -Wl,-rpath,/usr/local/lib64 -Wl,-rpath,/usr/local/lib -lsoci_core `cppunit-config --libs`   


${TESTDIR}/newtestClass.o: newtestClass.cpp 
	${MKDIR} -p ${TESTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/newtestClass.o newtestClass.cpp


${TESTDIR}/tests/newtestclass.o: tests/newtestclass.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/newtestclass.o tests/newtestclass.cpp


${TESTDIR}/tests/newtestrunner.o: tests/newtestrunner.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/newtestrunner.o tests/newtestrunner.cpp


${TESTDIR}/tests/testChangeConAccount.o: tests/testChangeConAccount.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testChangeConAccount.o tests/testChangeConAccount.cpp


${TESTDIR}/tests/testrunnerChangeConAccount.o: tests/testrunnerChangeConAccount.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerChangeConAccount.o tests/testrunnerChangeConAccount.cpp


${TESTDIR}/tests/testGlobal.o: tests/testGlobal.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testGlobal.o tests/testGlobal.cpp


${TESTDIR}/tests/testrunnerGlobal.o: tests/testrunnerGlobal.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerGlobal.o tests/testrunnerGlobal.cpp


${TESTDIR}/tests/testMsgInAddAdapter.o: tests/testMsgInAddAdapter.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInAddAdapter.o tests/testMsgInAddAdapter.cpp


${TESTDIR}/tests/testrunnerMsgInAddAdapter.o: tests/testrunnerMsgInAddAdapter.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInAddAdapter.o tests/testrunnerMsgInAddAdapter.cpp


${TESTDIR}/tests/testMsgInAddConAcc.o: tests/testMsgInAddConAcc.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInAddConAcc.o tests/testMsgInAddConAcc.cpp


${TESTDIR}/tests/testrunnerMsgInAddConAcc.o: tests/testrunnerMsgInAddConAcc.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInAddConAcc.o tests/testrunnerMsgInAddConAcc.cpp


${TESTDIR}/tests/testMsgInAddRooms.o: tests/testMsgInAddRooms.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInAddRooms.o tests/testMsgInAddRooms.cpp


${TESTDIR}/tests/testrunnerMsgInAddRooms.o: tests/testrunnerMsgInAddRooms.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInAddRooms.o tests/testrunnerMsgInAddRooms.cpp


${TESTDIR}/tests/testMsgInDelAction.o: tests/testMsgInDelAction.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInDelAction.o tests/testMsgInDelAction.cpp


${TESTDIR}/tests/testrunnerMsgInDelAction.o: tests/testrunnerMsgInDelAction.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInDelAction.o tests/testrunnerMsgInDelAction.cpp


${TESTDIR}/tests/testMsgInDelConAcc.o: tests/testMsgInDelConAcc.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInDelConAcc.o tests/testMsgInDelConAcc.cpp


${TESTDIR}/tests/testrunnerMsgInDelConAcc.o: tests/testrunnerMsgInDelConAcc.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInDelConAcc.o tests/testrunnerMsgInDelConAcc.cpp


${TESTDIR}/tests/testMsgInDelDevice.o: tests/testMsgInDelDevice.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInDelDevice.o tests/testMsgInDelDevice.cpp


${TESTDIR}/tests/testrunnerMsgInDelDevice.o: tests/testrunnerMsgInDelDevice.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInDelDevice.o tests/testrunnerMsgInDelDevice.cpp


${TESTDIR}/tests/testMsgInDeleteCondition.o: tests/testMsgInDeleteCondition.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInDeleteCondition.o tests/testMsgInDeleteCondition.cpp


${TESTDIR}/tests/testrunnerMsgInDeleteCondition.o: tests/testrunnerMsgInDeleteCondition.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInDeleteCondition.o tests/testrunnerMsgInDeleteCondition.cpp


${TESTDIR}/tests/testMsgInDelRoom.o: tests/testMsgInDelRoom.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInDelRoom.o tests/testMsgInDelRoom.cpp


${TESTDIR}/tests/testrunnerMsgInDelRoom.o: tests/testrunnerMsgInDelRoom.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInDelRoom.o tests/testrunnerMsgInDelRoom.cpp


${TESTDIR}/tests/testMsgInPartial.o: tests/testMsgInPartial.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInPartial.o tests/testMsgInPartial.cpp


${TESTDIR}/tests/testrunnerMsgInPartial.o: tests/testrunnerMsgInPartial.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInPartial.o tests/testrunnerMsgInPartial.cpp


${TESTDIR}/tests/testMsgInGetAction.o: tests/testMsgInGetAction.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInGetAction.o tests/testMsgInGetAction.cpp


${TESTDIR}/tests/testrunnerMsgInGetAction.o: tests/testrunnerMsgInGetAction.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInGetAction.o tests/testrunnerMsgInGetAction.cpp


${TESTDIR}/tests/testMsgInGetActions.o: tests/testMsgInGetActions.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInGetActions.o tests/testMsgInGetActions.cpp


${TESTDIR}/tests/testrunnerMsgInGetActions.o: tests/testrunnerMsgInGetActions.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInGetActions.o tests/testrunnerMsgInGetActions.cpp


${TESTDIR}/tests/testMsgInGetAdapters.o: tests/testMsgInGetAdapters.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInGetAdapters.o tests/testMsgInGetAdapters.cpp


${TESTDIR}/tests/testrunnerMsgInGetAdapters.o: tests/testrunnerMsgInGetAdapters.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInGetAdapters.o tests/testrunnerMsgInGetAdapters.cpp


${TESTDIR}/tests/testMsgInGetConAcc.o: tests/testMsgInGetConAcc.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInGetConAcc.o tests/testMsgInGetConAcc.cpp


${TESTDIR}/tests/testrunnerMsgInGetConAcc.o: tests/testrunnerMsgInGetConAcc.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInGetConAcc.o tests/testrunnerMsgInGetConAcc.cpp


${TESTDIR}/tests/testMsgInGetConditions.o: tests/testMsgInGetConditions.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInGetConditions.o tests/testMsgInGetConditions.cpp


${TESTDIR}/tests/testrunnerMsgInGetConditions.o: tests/testrunnerMsgInGetConditions.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInGetConditions.o tests/testrunnerMsgInGetConditions.cpp


${TESTDIR}/tests/testMsgInGetRooms.o: tests/testMsgInGetRooms.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInGetRooms.o tests/testMsgInGetRooms.cpp


${TESTDIR}/tests/testrunnerMsgInGetRooms.o: tests/testrunnerMsgInGetRooms.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInGetRooms.o tests/testrunnerMsgInGetRooms.cpp


${TESTDIR}/tests/testMsgInGetTimeZone.o: tests/testMsgInGetTimeZone.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInGetTimeZone.o tests/testMsgInGetTimeZone.cpp


${TESTDIR}/tests/testrunnerMsgInGetTimeZone.o: tests/testrunnerMsgInGetTimeZone.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInGetTimeZone.o tests/testrunnerMsgInGetTimeZone.cpp


${TESTDIR}/tests/testMsgInLogName.o: tests/testMsgInLogName.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInLogName.o tests/testMsgInLogName.cpp


${TESTDIR}/tests/testrunnerMsgInLogName.o: tests/testrunnerMsgInLogName.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInLogName.o tests/testrunnerMsgInLogName.cpp


${TESTDIR}/tests/testMsgInSetAction.o: tests/testMsgInSetAction.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInSetAction.o tests/testMsgInSetAction.cpp


${TESTDIR}/tests/testrunnerMsgInSetAction.o: tests/testrunnerMsgInSetAction.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInSetAction.o tests/testrunnerMsgInSetAction.cpp


${TESTDIR}/tests/testMsgInSetCondition.o: tests/testMsgInSetCondition.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInSetCondition.o tests/testMsgInSetCondition.cpp


${TESTDIR}/tests/testrunnerMsgInSetCondition.o: tests/testrunnerMsgInSetCondition.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInSetCondition.o tests/testrunnerMsgInSetCondition.cpp


${TESTDIR}/tests/testMsgInSetTimeZone.o: tests/testMsgInSetTimeZone.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInSetTimeZone.o tests/testMsgInSetTimeZone.cpp


${TESTDIR}/tests/testrunnerMsgInSetTimeZone.o: tests/testrunnerMsgInSetTimeZone.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInSetTimeZone.o tests/testrunnerMsgInSetTimeZone.cpp


${TESTDIR}/tests/testMsgInSignIn.o: tests/testMsgInSignIn.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInSignIn.o tests/testMsgInSignIn.cpp


${TESTDIR}/tests/testrunnerMsgInSignIn.o: tests/testrunnerMsgInSignIn.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInSignIn.o tests/testrunnerMsgInSignIn.cpp


${TESTDIR}/tests/testMsgInSignUp.o: tests/testMsgInSignUp.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInSignUp.o tests/testMsgInSignUp.cpp


${TESTDIR}/tests/testrunnerMsgInSignUp.o: tests/testrunnerMsgInSignUp.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInSignUp.o tests/testrunnerMsgInSignUp.cpp


${TESTDIR}/tests/testMsgInSwitch.o: tests/testMsgInSwitch.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInSwitch.o tests/testMsgInSwitch.cpp


${TESTDIR}/tests/testrunnerMsgInSwitch.o: tests/testrunnerMsgInSwitch.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInSwitch.o tests/testrunnerMsgInSwitch.cpp


${TESTDIR}/tests/testMsgInUpdate.o: tests/testMsgInUpdate.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInUpdate.o tests/testMsgInUpdate.cpp


${TESTDIR}/tests/testrunnerMsgInUpdate.o: tests/testrunnerMsgInUpdate.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInUpdate.o tests/testrunnerMsgInUpdate.cpp


${TESTDIR}/tests/testMsgInUpdateAction.o: tests/testMsgInUpdateAction.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInUpdateAction.o tests/testMsgInUpdateAction.cpp


${TESTDIR}/tests/testrunnerMsgInUpdateAction.o: tests/testrunnerMsgInUpdateAction.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInUpdateAction.o tests/testrunnerMsgInUpdateAction.cpp


${TESTDIR}/tests/testMsgInUpdateCondition.o: tests/testMsgInUpdateCondition.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInUpdateCondition.o tests/testMsgInUpdateCondition.cpp


${TESTDIR}/tests/testrunnerMsgInUpdateCondition.o: tests/testrunnerMsgInUpdateCondition.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInUpdateCondition.o tests/testrunnerMsgInUpdateCondition.cpp


${TESTDIR}/tests/testMsgInUpdateRooms.o: tests/testMsgInUpdateRooms.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testMsgInUpdateRooms.o tests/testMsgInUpdateRooms.cpp


${TESTDIR}/tests/testrunnerMsgInUpdateRooms.o: tests/testrunnerMsgInUpdateRooms.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -I. `cppunit-config --cflags` -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/testrunnerMsgInUpdateRooms.o tests/testrunnerMsgInUpdateRooms.cpp


${OBJECTDIR}/ComTable_nomain.o: ${OBJECTDIR}/ComTable.o ComTable.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/ComTable.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/ComTable_nomain.o ComTable.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/ComTable.o ${OBJECTDIR}/ComTable_nomain.o;\
	fi

${OBJECTDIR}/Config_nomain.o: ${OBJECTDIR}/Config.o Config.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/Config.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Config_nomain.o Config.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/Config.o ${OBJECTDIR}/Config_nomain.o;\
	fi

${OBJECTDIR}/DBConnector_nomain.o: ${OBJECTDIR}/DBConnector.o DBConnector.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/DBConnector.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/DBConnector_nomain.o DBConnector.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/DBConnector.o ${OBJECTDIR}/DBConnector_nomain.o;\
	fi

${OBJECTDIR}/IMsgIn_nomain.o: ${OBJECTDIR}/IMsgIn.o IMsgIn.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/IMsgIn.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/IMsgIn_nomain.o IMsgIn.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/IMsgIn.o ${OBJECTDIR}/IMsgIn_nomain.o;\
	fi

${OBJECTDIR}/IMsgInLoginAndAdapterAccessRequired_nomain.o: ${OBJECTDIR}/IMsgInLoginAndAdapterAccessRequired.o IMsgInLoginAndAdapterAccessRequired.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/IMsgInLoginAndAdapterAccessRequired.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/IMsgInLoginAndAdapterAccessRequired_nomain.o IMsgInLoginAndAdapterAccessRequired.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/IMsgInLoginAndAdapterAccessRequired.o ${OBJECTDIR}/IMsgInLoginAndAdapterAccessRequired_nomain.o;\
	fi

${OBJECTDIR}/IMsgInLoginRequired_nomain.o: ${OBJECTDIR}/IMsgInLoginRequired.o IMsgInLoginRequired.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/IMsgInLoginRequired.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/IMsgInLoginRequired_nomain.o IMsgInLoginRequired.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/IMsgInLoginRequired.o ${OBJECTDIR}/IMsgInLoginRequired_nomain.o;\
	fi

${OBJECTDIR}/IMsgInLoginUnwanted_nomain.o: ${OBJECTDIR}/IMsgInLoginUnwanted.o IMsgInLoginUnwanted.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/IMsgInLoginUnwanted.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/IMsgInLoginUnwanted_nomain.o IMsgInLoginUnwanted.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/IMsgInLoginUnwanted.o ${OBJECTDIR}/IMsgInLoginUnwanted_nomain.o;\
	fi

${OBJECTDIR}/Logger_nomain.o: ${OBJECTDIR}/Logger.o Logger.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/Logger.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Logger_nomain.o Logger.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/Logger.o ${OBJECTDIR}/Logger_nomain.o;\
	fi

${OBJECTDIR}/MsgInAdapterListen_nomain.o: ${OBJECTDIR}/MsgInAdapterListen.o MsgInAdapterListen.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInAdapterListen.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInAdapterListen_nomain.o MsgInAdapterListen.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInAdapterListen.o ${OBJECTDIR}/MsgInAdapterListen_nomain.o;\
	fi

${OBJECTDIR}/MsgInAddAccount_nomain.o: ${OBJECTDIR}/MsgInAddAccount.o MsgInAddAccount.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInAddAccount.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInAddAccount_nomain.o MsgInAddAccount.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInAddAccount.o ${OBJECTDIR}/MsgInAddAccount_nomain.o;\
	fi

${OBJECTDIR}/MsgInAddAdapter_nomain.o: ${OBJECTDIR}/MsgInAddAdapter.o MsgInAddAdapter.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInAddAdapter.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInAddAdapter_nomain.o MsgInAddAdapter.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInAddAdapter.o ${OBJECTDIR}/MsgInAddAdapter_nomain.o;\
	fi

${OBJECTDIR}/MsgInAddRoom_nomain.o: ${OBJECTDIR}/MsgInAddRoom.o MsgInAddRoom.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInAddRoom.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInAddRoom_nomain.o MsgInAddRoom.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInAddRoom.o ${OBJECTDIR}/MsgInAddRoom_nomain.o;\
	fi

${OBJECTDIR}/MsgInAddView_nomain.o: ${OBJECTDIR}/MsgInAddView.o MsgInAddView.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInAddView.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInAddView_nomain.o MsgInAddView.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInAddView.o ${OBJECTDIR}/MsgInAddView_nomain.o;\
	fi

${OBJECTDIR}/MsgInConditionPlusAction_nomain.o: ${OBJECTDIR}/MsgInConditionPlusAction.o MsgInConditionPlusAction.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInConditionPlusAction.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInConditionPlusAction_nomain.o MsgInConditionPlusAction.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInConditionPlusAction.o ${OBJECTDIR}/MsgInConditionPlusAction_nomain.o;\
	fi

${OBJECTDIR}/MsgInDelAction_nomain.o: ${OBJECTDIR}/MsgInDelAction.o MsgInDelAction.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInDelAction.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInDelAction_nomain.o MsgInDelAction.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInDelAction.o ${OBJECTDIR}/MsgInDelAction_nomain.o;\
	fi

${OBJECTDIR}/MsgInDelConAccount_nomain.o: ${OBJECTDIR}/MsgInDelConAccount.o MsgInDelConAccount.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInDelConAccount.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInDelConAccount_nomain.o MsgInDelConAccount.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInDelConAccount.o ${OBJECTDIR}/MsgInDelConAccount_nomain.o;\
	fi

${OBJECTDIR}/MsgInDelCondition_nomain.o: ${OBJECTDIR}/MsgInDelCondition.o MsgInDelCondition.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInDelCondition.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInDelCondition_nomain.o MsgInDelCondition.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInDelCondition.o ${OBJECTDIR}/MsgInDelCondition_nomain.o;\
	fi

${OBJECTDIR}/MsgInDelDevice_nomain.o: ${OBJECTDIR}/MsgInDelDevice.o MsgInDelDevice.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInDelDevice.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInDelDevice_nomain.o MsgInDelDevice.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInDelDevice.o ${OBJECTDIR}/MsgInDelDevice_nomain.o;\
	fi

${OBJECTDIR}/MsgInDelRoom_nomain.o: ${OBJECTDIR}/MsgInDelRoom.o MsgInDelRoom.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInDelRoom.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInDelRoom_nomain.o MsgInDelRoom.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInDelRoom.o ${OBJECTDIR}/MsgInDelRoom_nomain.o;\
	fi

${OBJECTDIR}/MsgInDelView_nomain.o: ${OBJECTDIR}/MsgInDelView.o MsgInDelView.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInDelView.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInDelView_nomain.o MsgInDelView.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInDelView.o ${OBJECTDIR}/MsgInDelView_nomain.o;\
	fi

${OBJECTDIR}/MsgInFactory_nomain.o: ${OBJECTDIR}/MsgInFactory.o MsgInFactory.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInFactory.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInFactory_nomain.o MsgInFactory.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInFactory.o ${OBJECTDIR}/MsgInFactory_nomain.o;\
	fi

${OBJECTDIR}/MsgInGetAction_nomain.o: ${OBJECTDIR}/MsgInGetAction.o MsgInGetAction.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInGetAction.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetAction_nomain.o MsgInGetAction.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInGetAction.o ${OBJECTDIR}/MsgInGetAction_nomain.o;\
	fi

${OBJECTDIR}/MsgInGetActions_nomain.o: ${OBJECTDIR}/MsgInGetActions.o MsgInGetActions.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInGetActions.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetActions_nomain.o MsgInGetActions.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInGetActions.o ${OBJECTDIR}/MsgInGetActions_nomain.o;\
	fi

${OBJECTDIR}/MsgInGetAdapters_nomain.o: ${OBJECTDIR}/MsgInGetAdapters.o MsgInGetAdapters.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInGetAdapters.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetAdapters_nomain.o MsgInGetAdapters.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInGetAdapters.o ${OBJECTDIR}/MsgInGetAdapters_nomain.o;\
	fi

${OBJECTDIR}/MsgInGetAllDevices_nomain.o: ${OBJECTDIR}/MsgInGetAllDevices.o MsgInGetAllDevices.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInGetAllDevices.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetAllDevices_nomain.o MsgInGetAllDevices.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInGetAllDevices.o ${OBJECTDIR}/MsgInGetAllDevices_nomain.o;\
	fi

${OBJECTDIR}/MsgInGetConAccount_nomain.o: ${OBJECTDIR}/MsgInGetConAccount.o MsgInGetConAccount.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInGetConAccount.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetConAccount_nomain.o MsgInGetConAccount.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInGetConAccount.o ${OBJECTDIR}/MsgInGetConAccount_nomain.o;\
	fi

${OBJECTDIR}/MsgInGetConditions_nomain.o: ${OBJECTDIR}/MsgInGetConditions.o MsgInGetConditions.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInGetConditions.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetConditions_nomain.o MsgInGetConditions.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInGetConditions.o ${OBJECTDIR}/MsgInGetConditions_nomain.o;\
	fi

${OBJECTDIR}/MsgInGetDevices_nomain.o: ${OBJECTDIR}/MsgInGetDevices.o MsgInGetDevices.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInGetDevices.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetDevices_nomain.o MsgInGetDevices.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInGetDevices.o ${OBJECTDIR}/MsgInGetDevices_nomain.o;\
	fi

${OBJECTDIR}/MsgInGetLog_nomain.o: ${OBJECTDIR}/MsgInGetLog.o MsgInGetLog.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInGetLog.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetLog_nomain.o MsgInGetLog.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInGetLog.o ${OBJECTDIR}/MsgInGetLog_nomain.o;\
	fi

${OBJECTDIR}/MsgInGetNewDevices_nomain.o: ${OBJECTDIR}/MsgInGetNewDevices.o MsgInGetNewDevices.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInGetNewDevices.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetNewDevices_nomain.o MsgInGetNewDevices.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInGetNewDevices.o ${OBJECTDIR}/MsgInGetNewDevices_nomain.o;\
	fi

${OBJECTDIR}/MsgInGetRooms_nomain.o: ${OBJECTDIR}/MsgInGetRooms.o MsgInGetRooms.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInGetRooms.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetRooms_nomain.o MsgInGetRooms.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInGetRooms.o ${OBJECTDIR}/MsgInGetRooms_nomain.o;\
	fi

${OBJECTDIR}/MsgInGetTimeZone_nomain.o: ${OBJECTDIR}/MsgInGetTimeZone.o MsgInGetTimeZone.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInGetTimeZone.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetTimeZone_nomain.o MsgInGetTimeZone.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInGetTimeZone.o ${OBJECTDIR}/MsgInGetTimeZone_nomain.o;\
	fi

${OBJECTDIR}/MsgInGetViews_nomain.o: ${OBJECTDIR}/MsgInGetViews.o MsgInGetViews.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInGetViews.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInGetViews_nomain.o MsgInGetViews.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInGetViews.o ${OBJECTDIR}/MsgInGetViews_nomain.o;\
	fi

${OBJECTDIR}/MsgInReinitAdapter_nomain.o: ${OBJECTDIR}/MsgInReinitAdapter.o MsgInReinitAdapter.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInReinitAdapter.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInReinitAdapter_nomain.o MsgInReinitAdapter.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInReinitAdapter.o ${OBJECTDIR}/MsgInReinitAdapter_nomain.o;\
	fi

${OBJECTDIR}/MsgInSetAction_nomain.o: ${OBJECTDIR}/MsgInSetAction.o MsgInSetAction.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInSetAction.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInSetAction_nomain.o MsgInSetAction.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInSetAction.o ${OBJECTDIR}/MsgInSetAction_nomain.o;\
	fi

${OBJECTDIR}/MsgInSetConAccount_nomain.o: ${OBJECTDIR}/MsgInSetConAccount.o MsgInSetConAccount.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInSetConAccount.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInSetConAccount_nomain.o MsgInSetConAccount.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInSetConAccount.o ${OBJECTDIR}/MsgInSetConAccount_nomain.o;\
	fi

${OBJECTDIR}/MsgInSetCondition_nomain.o: ${OBJECTDIR}/MsgInSetCondition.o MsgInSetCondition.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInSetCondition.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInSetCondition_nomain.o MsgInSetCondition.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInSetCondition.o ${OBJECTDIR}/MsgInSetCondition_nomain.o;\
	fi

${OBJECTDIR}/MsgInSetDevices_nomain.o: ${OBJECTDIR}/MsgInSetDevices.o MsgInSetDevices.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInSetDevices.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInSetDevices_nomain.o MsgInSetDevices.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInSetDevices.o ${OBJECTDIR}/MsgInSetDevices_nomain.o;\
	fi

${OBJECTDIR}/MsgInSetRooms_nomain.o: ${OBJECTDIR}/MsgInSetRooms.o MsgInSetRooms.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInSetRooms.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInSetRooms_nomain.o MsgInSetRooms.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInSetRooms.o ${OBJECTDIR}/MsgInSetRooms_nomain.o;\
	fi

${OBJECTDIR}/MsgInSetTimeZone_nomain.o: ${OBJECTDIR}/MsgInSetTimeZone.o MsgInSetTimeZone.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInSetTimeZone.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInSetTimeZone_nomain.o MsgInSetTimeZone.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInSetTimeZone.o ${OBJECTDIR}/MsgInSetTimeZone_nomain.o;\
	fi

${OBJECTDIR}/MsgInSignIn_nomain.o: ${OBJECTDIR}/MsgInSignIn.o MsgInSignIn.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInSignIn.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInSignIn_nomain.o MsgInSignIn.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInSignIn.o ${OBJECTDIR}/MsgInSignIn_nomain.o;\
	fi

${OBJECTDIR}/MsgInSignUp_nomain.o: ${OBJECTDIR}/MsgInSignUp.o MsgInSignUp.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInSignUp.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInSignUp_nomain.o MsgInSignUp.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInSignUp.o ${OBJECTDIR}/MsgInSignUp_nomain.o;\
	fi

${OBJECTDIR}/MsgInSwitch_nomain.o: ${OBJECTDIR}/MsgInSwitch.o MsgInSwitch.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInSwitch.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInSwitch_nomain.o MsgInSwitch.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInSwitch.o ${OBJECTDIR}/MsgInSwitch_nomain.o;\
	fi

${OBJECTDIR}/MsgInUnknown_nomain.o: ${OBJECTDIR}/MsgInUnknown.o MsgInUnknown.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInUnknown.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInUnknown_nomain.o MsgInUnknown.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInUnknown.o ${OBJECTDIR}/MsgInUnknown_nomain.o;\
	fi

${OBJECTDIR}/MsgInUpdateAction_nomain.o: ${OBJECTDIR}/MsgInUpdateAction.o MsgInUpdateAction.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInUpdateAction.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInUpdateAction_nomain.o MsgInUpdateAction.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInUpdateAction.o ${OBJECTDIR}/MsgInUpdateAction_nomain.o;\
	fi

${OBJECTDIR}/MsgInUpdateCondition_nomain.o: ${OBJECTDIR}/MsgInUpdateCondition.o MsgInUpdateCondition.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInUpdateCondition.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInUpdateCondition_nomain.o MsgInUpdateCondition.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInUpdateCondition.o ${OBJECTDIR}/MsgInUpdateCondition_nomain.o;\
	fi

${OBJECTDIR}/MsgInUpdateView_nomain.o: ${OBJECTDIR}/MsgInUpdateView.o MsgInUpdateView.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgInUpdateView.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgInUpdateView_nomain.o MsgInUpdateView.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgInUpdateView.o ${OBJECTDIR}/MsgInUpdateView_nomain.o;\
	fi

${OBJECTDIR}/MsgRightsChecker_nomain.o: ${OBJECTDIR}/MsgRightsChecker.o MsgRightsChecker.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/MsgRightsChecker.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MsgRightsChecker_nomain.o MsgRightsChecker.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/MsgRightsChecker.o ${OBJECTDIR}/MsgRightsChecker_nomain.o;\
	fi

${OBJECTDIR}/ServerException_nomain.o: ${OBJECTDIR}/ServerException.o ServerException.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/ServerException.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/ServerException_nomain.o ServerException.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/ServerException.o ${OBJECTDIR}/ServerException_nomain.o;\
	fi

${OBJECTDIR}/SocketClient_nomain.o: ${OBJECTDIR}/SocketClient.o SocketClient.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/SocketClient.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/SocketClient_nomain.o SocketClient.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/SocketClient.o ${OBJECTDIR}/SocketClient_nomain.o;\
	fi

${OBJECTDIR}/ccolor_nomain.o: ${OBJECTDIR}/ccolor.o ccolor.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/ccolor.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/ccolor_nomain.o ccolor.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/ccolor.o ${OBJECTDIR}/ccolor_nomain.o;\
	fi

${OBJECTDIR}/communication_nomain.o: ${OBJECTDIR}/communication.o communication.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/communication.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/communication_nomain.o communication.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/communication.o ${OBJECTDIR}/communication_nomain.o;\
	fi

${OBJECTDIR}/gTokenChecker_nomain.o: ${OBJECTDIR}/gTokenChecker.o gTokenChecker.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/gTokenChecker.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/gTokenChecker_nomain.o gTokenChecker.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/gTokenChecker.o ${OBJECTDIR}/gTokenChecker_nomain.o;\
	fi

${OBJECTDIR}/msgInGetCondition_nomain.o: ${OBJECTDIR}/msgInGetCondition.o msgInGetCondition.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/msgInGetCondition.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/msgInGetCondition_nomain.o msgInGetCondition.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/msgInGetCondition.o ${OBJECTDIR}/msgInGetCondition_nomain.o;\
	fi

${OBJECTDIR}/pugixml_nomain.o: ${OBJECTDIR}/pugixml.o pugixml.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/pugixml.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/pugixml_nomain.o pugixml.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/pugixml.o ${OBJECTDIR}/pugixml_nomain.o;\
	fi

${OBJECTDIR}/testHelper_nomain.o: ${OBJECTDIR}/testHelper.o testHelper.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/testHelper.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/testHelper_nomain.o testHelper.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/testHelper.o ${OBJECTDIR}/testHelper_nomain.o;\
	fi

${OBJECTDIR}/ui_server_nomain.o: ${OBJECTDIR}/ui_server.o ui_server.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/ui_server.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Wall -I/usr/include/postgresql -I/usr/include/postgresql/libpq -I/usr/include -I/usr/local/include/soci -Iusr/include/openssl -I../Server -I. -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/ui_server_nomain.o ui_server.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/ui_server.o ${OBJECTDIR}/ui_server_nomain.o;\
	fi

# Run Test Targets
.test-conf:
	@if [ "${TEST}" = "" ]; \
	then  \
	    ${TESTDIR}/TestFiles/f21 || true; \
	    ${TESTDIR}/TestFiles/f15 || true; \
	    ${TESTDIR}/TestFiles/f3 || true; \
	    ${TESTDIR}/TestFiles/f20 || true; \
	    ${TESTDIR}/TestFiles/f8 || true; \
	    ${TESTDIR}/TestFiles/f4 || true; \
	    ${TESTDIR}/TestFiles/f31 || true; \
	    ${TESTDIR}/TestFiles/f16 || true; \
	    ${TESTDIR}/TestFiles/f9 || true; \
	    ${TESTDIR}/TestFiles/f26 || true; \
	    ${TESTDIR}/TestFiles/f5 || true; \
	    ${TESTDIR}/TestFiles/f19 || true; \
	    ${TESTDIR}/TestFiles/f29 || true; \
	    ${TESTDIR}/TestFiles/f28 || true; \
	    ${TESTDIR}/TestFiles/f18 || true; \
	    ${TESTDIR}/TestFiles/f17 || true; \
	    ${TESTDIR}/TestFiles/f24 || true; \
	    ${TESTDIR}/TestFiles/f7 || true; \
	    ${TESTDIR}/TestFiles/f14 || true; \
	    ${TESTDIR}/TestFiles/f11 || true; \
	    ${TESTDIR}/TestFiles/f27 || true; \
	    ${TESTDIR}/TestFiles/f22 || true; \
	    ${TESTDIR}/TestFiles/f13 || true; \
	    ${TESTDIR}/TestFiles/f1 || true; \
	    ${TESTDIR}/TestFiles/f2 || true; \
	    ${TESTDIR}/TestFiles/f10 || true; \
	    ${TESTDIR}/TestFiles/f12 || true; \
	    ${TESTDIR}/TestFiles/f30 || true; \
	    ${TESTDIR}/TestFiles/f25 || true; \
	    ${TESTDIR}/TestFiles/f6 || true; \
	else  \
	    ./${TEST} || true; \
	fi

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${TESTDIR}/TestFiles/f34

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
