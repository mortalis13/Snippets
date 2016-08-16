#-------------------------------------------------
#
# Project created by QtCreator 2015-05-09T21:03:58
#
#-------------------------------------------------

QT       += core sql widgets

QT       -= gui

TARGET = Test
CONFIG   += console
CONFIG   -= app_bundle
CONFIG += c++11

TEMPLATE = app


SOURCES += main.cpp \
    timer.cpp \
    a.cpp \
    b.cpp

HEADERS += \
    timer.h \
    a.h \
    b.h

OTHER_FILES += \
    main_old.txt
