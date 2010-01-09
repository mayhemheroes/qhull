# -------------------------------------------------
# libqhullcpp.pro -- Qt project for Qhull cpp shared library
# -------------------------------------------------

DESTDIR = ../..
TEMPLATE = lib
CONFIG += shared warn_on
CONFIG -= app_bundle
LIBS += -L../..
build_pass:CONFIG(debug, debug|release):{
   TARGET = qhullcppd
   LIBS += libqhulld
   PRE_TARGETDEPS += ../../libqhulld.a
   OBJECTS_DIR = ../../tmp/libqhullcpp/Debug
}else:build_pass:CONFIG(release, debug|release):{
   TARGET = qhullcpp
   LIBS += libqhull
   PRE_TARGETDEPS += ../../libqhull.a
   OBJECTS_DIR = ../../tmp/libqhullcpp/Release
}
QT -= gui
MOC_DIR = ../../tmp/moc
RCC_DIR = ../../tmp/rcc
INCLUDEPATH = ../../cpp;../../cpp/road;../../tmp
#FIXUP QMAKE_CXXFLAGS_DEBUG += -Wall -Wextra -Wshadow -Wcast-qual -Wwrite-strings
#QMAKE_CXXFLAGS_DEBUG += -Wno-sign-conversion # Many size_t vs. int errors
#QMAKE_CXXFLAGS_DEBUG += -Wconversion # no workaround for bit-field conversion errors

VPATH = ../..
SOURCES += cpp/Coordinates.cpp
SOURCES += cpp/QhullVertexSet.cpp
SOURCES += cpp/QhullHyperplane.cpp
SOURCES += cpp/PointCoordinates.cpp
SOURCES += cpp/Qhull.cpp
SOURCES += cpp/QhullError.cpp
SOURCES += cpp/QhullEvent.cpp
SOURCES += cpp/QhullFacet.cpp
SOURCES += cpp/QhullFacetList.cpp
SOURCES += cpp/QhullFacetSet.cpp
SOURCES += cpp/QhullPoint.cpp
SOURCES += cpp/QhullPoints.cpp
SOURCES += cpp/QhullPointSet.cpp
SOURCES += cpp/QhullQh.cpp
SOURCES += cpp/QhullRidge.cpp
SOURCES += cpp/QhullSet.cpp
SOURCES += cpp/QhullStat.cpp
SOURCES += cpp/QhullVertex.cpp
SOURCES += cpp/RboxPoints.cpp
SOURCES += cpp/UsingLibQhull.cpp
SOURCES += cpp/road/RoadError.cpp
SOURCES += cpp/road/RoadLogEvent.cpp
HEADERS += cpp/Coordinates.h
HEADERS += cpp/QhullHyperplane.h
HEADERS += cpp/functionObjects.h
HEADERS += cpp/PointCoordinates.h
HEADERS += cpp/Qhull.h
HEADERS += cpp/QhullError.h
HEADERS += cpp/QhullEvent.h
HEADERS += cpp/QhullFacet.h
HEADERS += cpp/QhullFacetList.h
HEADERS += cpp/QhullFacetSet.h
HEADERS += cpp/QhullIterator.h
HEADERS += cpp/QhullLinkedList.h
HEADERS += cpp/QhullPoint.h
HEADERS += cpp/QhullPoints.h
HEADERS += cpp/QhullPointSet.h
HEADERS += cpp/QhullQh.h
HEADERS += cpp/QhullRidge.h
HEADERS += cpp/QhullSet.h
HEADERS += cpp/QhullSets.h
HEADERS += cpp/QhullStat.h
HEADERS += cpp/QhullVertex.h
HEADERS += cpp/RboxPoints.h
HEADERS += cpp/UsingLibQhull.h
HEADERS += cpp/road/RoadError.h
HEADERS += cpp/road/RoadLogEvent.h
