#.rst:
# FindICONV
# --------
# Finds the ICONV library
#
# This will will define the following variables::
#
# ICONV_FOUND - system has ICONV
# ICONV_INCLUDE_DIRS - the ICONV include directory
# ICONV_LIBRARIES - the ICONV libraries
#
# and the following imported targets::
#
#   ICONV::ICONV   - The ICONV library

find_path(ICONV_INCLUDE_DIR NAMES iconv.h)

find_library(ICONV_LIBRARY NAMES iconv libiconv)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(iconv
                                  REQUIRED_VARS ICONV_LIBRARY ICONV_INCLUDE_DIR)

if(ICONV_FOUND)
  set(ICONV_LIBRARIES ${ICONV_LIBRARY})
  set(ICONV_INCLUDE_DIRS ${ICONV_INCLUDE_DIR})

  if(NOT TARGET ICONV::ICONV)
    add_library(ICONV::ICONV UNKNOWN IMPORTED)
    set_target_properties(ICONV::ICONV PROPERTIES
                                     IMPORTED_LOCATION "${ICONV_LIBRARY}"
                                     INTERFACE_INCLUDE_DIRECTORIES "${ICONV_INCLUDE_DIR}")
  endif()
endif()

mark_as_advanced(ICONV_INCLUDE_DIR ICONV_LIBRARY)
