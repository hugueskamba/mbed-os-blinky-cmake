# Copyright (c) 2020 ARM Limited. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

# Set the system processor depending on the CPU core type
if (MBED_CPU_CORE STREQUAL Cortex-A9)
    set(CMAKE_SYSTEM_PROCESSOR cortex-a9)
elseif (MBED_CPU_CORE STREQUAL Cortex-M0+)
    set(CMAKE_SYSTEM_PROCESSOR cortex-m0plus)
elseif (MBED_CPU_CORE STREQUAL Cortex-M0)
    set(CMAKE_SYSTEM_PROCESSOR cortex-m0)
elseif (MBED_CPU_CORE STREQUAL Cortex-M1)
    set(CMAKE_SYSTEM_PROCESSOR cortex-m1)
elseif (MBED_CPU_CORE STREQUAL Cortex-M23-NS)
    set(CMAKE_SYSTEM_PROCESSOR cortex-m23)
elseif (MBED_CPU_CORE STREQUAL Cortex-M23)
    set(CMAKE_SYSTEM_PROCESSOR cortex-m23)
elseif (MBED_CPU_CORE STREQUAL Cortex-M3)
    set(CMAKE_SYSTEM_PROCESSOR cortex-m3)
elseif (MBED_CPU_CORE STREQUAL Cortex-M33-NS)
    set(CMAKE_SYSTEM_PROCESSOR cortex-m33)
elseif (MBED_CPU_CORE STREQUAL Cortex-M33)
    set(CMAKE_SYSTEM_PROCESSOR cortex-m33)
elseif (MBED_CPU_CORE STREQUAL Cortex-M33F-NS)
    set(CMAKE_SYSTEM_PROCESSOR cortex-m33)
elseif (MBED_CPU_CORE STREQUAL Cortex-M33F)
    set(CMAKE_SYSTEM_PROCESSOR cortex-m33)
elseif (MBED_CPU_CORE STREQUAL Cortex-M33FE-NS)
    set(CMAKE_SYSTEM_PROCESSOR cortex-m33)
elseif (MBED_CPU_CORE STREQUAL Cortex-M33FE)
    set(CMAKE_SYSTEM_PROCESSOR cortex-m33)
elseif (MBED_CPU_CORE STREQUAL Cortex-M4)
    set(CMAKE_SYSTEM_PROCESSOR cortex-m4)
elseif (MBED_CPU_CORE STREQUAL Cortex-M4F)
    set(CMAKE_SYSTEM_PROCESSOR cortex-m4)
elseif (MBED_CPU_CORE STREQUAL Cortex-M7)
    set(CMAKE_SYSTEM_PROCESSOR cortex-m7)
elseif (MBED_CPU_CORE STREQUAL Cortex-M7F)
    set(CMAKE_SYSTEM_PROCESSOR cortex-m7)
elseif (MBED_CPU_CORE STREQUAL Cortex-M7FD)
    set(CMAKE_SYSTEM_PROCESSOR cortex-m7)
endif()

# Compiler setup
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_CROSSCOMPILING TRUE)
set(CMAKE_C_COMPILER_WORKS TRUE)
set(CMAKE_CXX_COMPILER_WORKS TRUE)

# Set the language standard to use per target
function(mbed_set_language_standard target)
    set_target_properties(${target}
        PROPERTIES
            C_STANDARD 11
            C_STANDARD_REQUIRED YES
            C_EXTENSIONS YES
    )

    set_target_properties(${target}
        PROPERTIES
            CXX_STANDARD 14
            CXX_STANDARD_REQUIRED YES
            CXX_EXTENSIONS YES
    )
endfunction()

# Clear toolchains options for all languages as Mbed OS uses
# different initialisation options (such as for optimization and debug symbols)
set(CMAKE_C_FLAGS_DEBUG "" CACHE STRING "" FORCE)
set(CMAKE_C_FLAGS_RELEASE "" CACHE STRING "" FORCE)
set(CMAKE_C_FLAGS_RELWITHDEBINFO "" CACHE STRING "" FORCE)

set(CMAKE_CXX_FLAGS_DEBUG "" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS_RELEASE "" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "" CACHE STRING "" FORCE)

set(CMAKE_ASM_FLAGS_DEBUG "" CACHE STRING "" FORCE)
set(CMAKE_ASM_FLAGS_RELEASE "" CACHE STRING "" FORCE)
set(CMAKE_ASM_FLAGS_RELWITHDEBINFO "" CACHE STRING "" FORCE)

# Use response files always
set(CMAKE_ASM_USE_RESPONSE_FILE_FOR_INCLUDES 1)
set(CMAKE_C_USE_RESPONSE_FILE_FOR_INCLUDES 1)
set(CMAKE_CXX_USE_RESPONSE_FILE_FOR_INCLUDES 1)

set(CMAKE_ASM_USE_RESPONSE_FILE_FOR_OBJECTS 1)
set(CMAKE_C_USE_RESPONSE_FILE_FOR_OBJECTS 1)
set(CMAKE_CXX_USE_RESPONSE_FILE_FOR_OBJECTS 1)

set(CMAKE_ASM_USE_RESPONSE_FILE_FOR_LIBRARIES 1)
set(CMAKE_C_USE_RESPONSE_FILE_FOR_LIBRARIES 1)
set(CMAKE_CXX_USE_RESPONSE_FILE_FOR_LIBRARIES 1)

# Ninja requires to be forced for response files
if ("${CMAKE_GENERATOR}" MATCHES "Ninja")
    set(CMAKE_NINJA_FORCE_RESPONSE_FILE 1 CACHE INTERNAL "") 
endif()

