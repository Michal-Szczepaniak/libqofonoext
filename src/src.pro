TARGET = qofonoext
CONFIG += create_pc create_prl no_install_prl static
QT += dbus
QT -= gui
QMAKE_CXXFLAGS += -Wno-unused-parameter -Wno-psabi

include(version.pri)

TEMPLATE = lib

DEFINES += QOFONOEXT_LIBRARY

isEmpty(PREFIX) {
  PREFIX=/usr
}

OTHER_FILES += \
    qofonoext.prf \
    version.pri

SOURCES += \
    qofonoext.cpp \
    qofonoextcell.cpp \
    qofonoextmodemmanager.cpp

PUBLIC_HEADERS += \
    qofonoextcell.h \
    qofonoextmodemmanager.h \
    qofonoext_types.h

HEADERS += \
    $$PUBLIC_HEADERS \
    qofonoext_p.h

target.path = $$[QT_INSTALL_LIBS]

headers.files = $$PUBLIC_HEADERS
headers.path = $$INSTALL_ROOT$$PREFIX/include/qofonoext

pkgconfig.files = qofonoext.pc
pkgconfig.path = $$[QT_INSTALL_LIBS]/pkgconfig

QMAKE_PKGCONFIG_NAME = $$TARGET
QMAKE_PKGCONFIG_DESTDIR = pkgconfig
QMAKE_PKGCONFIG_INCDIR = $$headers.path
QMAKE_PKGCONFIG_DESCRIPTION = Qt bindings for ofono extensions
QMAKE_PKGCONFIG_PREFIX = $$PREFIX
QMAKE_PKGCONFIG_VERSION = $$VERSION

INSTALLS += target headers pkgconfig
