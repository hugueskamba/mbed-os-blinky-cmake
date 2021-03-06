# Copyright (c) 2020 ARM Limited. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.18.2 FATAL_ERROR)

# TODO: @mbed-os-tools MBED_ROOT and MBED_CONFIG_PATH should probably come from mbedtools
set(MBED_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/mbed-os CACHE INTERNAL "")
set(MBED_CONFIG_PATH ${CMAKE_CURRENT_SOURCE_DIR}/.mbedbuild CACHE INTERNAL "")
set(APP_TARGET mbed-os-example-blinky)

add_subdirectory(${MBED_ROOT})

add_executable(${APP_TARGET})

mbed_configure_app_target(${APP_TARGET})

mbed_set_mbed_target_linker_script(${APP_TARGET})

project(${APP_TARGET})

target_sources(${APP_TARGET}
    PRIVATE
        main.cpp
)

target_link_libraries(${APP_TARGET}
    mbed-os
    # mbed-os-rtos
)

mbed_generate_bin_hex(${APP_TARGET})

option(VERBOSE_BUILD "Have a verbose build process")
if(VERBOSE_BUILD)
    set(CMAKE_VERBOSE_MAKEFILE ON)
endif()
