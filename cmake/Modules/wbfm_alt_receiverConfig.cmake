INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_WBFM_ALT_RECEIVER wbfm_alt_receiver)

FIND_PATH(
    WBFM_ALT_RECEIVER_INCLUDE_DIRS
    NAMES wbfm_alt_receiver/api.h
    HINTS $ENV{WBFM_ALT_RECEIVER_DIR}/include
        ${PC_WBFM_ALT_RECEIVER_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    WBFM_ALT_RECEIVER_LIBRARIES
    NAMES gnuradio-wbfm_alt_receiver
    HINTS $ENV{WBFM_ALT_RECEIVER_DIR}/lib
        ${PC_WBFM_ALT_RECEIVER_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
          )

include("${CMAKE_CURRENT_LIST_DIR}/wbfm_alt_receiverTarget.cmake")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(WBFM_ALT_RECEIVER DEFAULT_MSG WBFM_ALT_RECEIVER_LIBRARIES WBFM_ALT_RECEIVER_INCLUDE_DIRS)
MARK_AS_ADVANCED(WBFM_ALT_RECEIVER_LIBRARIES WBFM_ALT_RECEIVER_INCLUDE_DIRS)
