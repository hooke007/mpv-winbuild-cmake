ExternalProject_Add(aom
    GIT_REPOSITORY https://aomedia.googlesource.com/aom
    GIT_SHALLOW 1
    UPDATE_COMMAND ""
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${MINGW_INSTALL_PREFIX}
        -DCMAKE_FIND_ROOT_PATH=${CMAKE_INSTALL_PREFIX}
        -DCMAKE_TOOLCHAIN_FILE=<SOURCE_DIR>/build/cmake/toolchains/${TARGET_CPU_FAMILY}-mingw-gcc.cmake
        -DBUILD_SHARED_LIBS=OFF
        -DENABLE_EXAMPLES=OFF
        -DENABLE_DOCS=OFF
        -DENABLE_TOOLS=OFF
        -DENABLE_NASM=ON
        -DENABLE_TESTS=OFF
        -DENABLE_TESTDATA=OFF
        -DCONFIG_UNIT_TESTS=0
        -DCMAKE_BUILD_TYPE=Release
    BUILD_COMMAND ${CMAKE_MAKE_PROGRAM}
    INSTALL_COMMAND ${CMAKE_MAKE_PROGRAM} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(aom)
extra_step(aom)
