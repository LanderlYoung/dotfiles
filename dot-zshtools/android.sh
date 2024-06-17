export ANDROID_SDK=${HOME}/Applications/Android/sdk

export ANDROID_HOME=${ANDROID_SDK}
#export android_home=${ANDROID_SDK}

if [[ -d "${ANDROID_SDK}/ndk" ]]; then
  local ndkversion=$(env ls -tr $ANDROID_HOME/ndk|cut -d" " -f 1 | tail -n 1)
  if [[ "x${ndkversion}" != x ]]; then
    export ANDROID_NDK="${ANDROID_SDK}/ndk/${ndkversion}"
     export NDK_HOME=${ANDROID_NDK}
  fi
fi

export PATH=$PATH:$ANDROID_SDK/platform-tools:$ANDROID_NDK

alias adb-crash='adb logcat --buffer=crash'

alias addr2line=$NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/bin/llvm-addr2line
alias sss='$ANDROID_SDK/platform-tools/systrace/systrace.py -t 10 -b 40960 -a com.tencent.radio.debug -o trace-`date +%s`.html'

ADB=${ANDROID_HOME}/platform-tools/adb
HPROF_CONV=${ANDROID_HOME}/platform-tools/hprof-conv
# customized functions
# dump droid heap
function droid_hd() {
    PACKAGE_NAME=$1
    if [[ -z $PACKAGE_NAME ]]; then
        PACKAGE_NAME="com.tencent.radio.debug"
    fi

    TIME=$(date +"%Y%m%d_%H%M%S")
    FILE_NAME="${PACKAGE_NAME}-${TIME}-heap.hprof"
    PATH_IN_PHONE="/data/local/tmp/${FILE_NAME}"

    ${ADB} shell rm ${PATH_IN_PHONE} 2> /dev/null

    echo "cause GC for ${PACKAGE_NAME}"
    ${ADB} shell pkill -l 10 ${PACKAGE_NAME}

    echo "> dump heap for ${PACKAGE_NAME}"
    ${ADB} shell "am dumpheap ${PACKAGE_NAME} ${PATH_IN_PHONE}"
    if [[ $? != 0 ]]; then
        echo
        ${ADB} devices
        echo "run command:"
        echo "\e[38;5;82mexport ANDROID_SERIAL="
        return
    fi
    # I don't want to... But it smees adb shell can't block untils it's done!
    sleep 3

    echo "> list heap for ${PATH_IN_PHONE}"
    ${ADB} shell ls -lh ${PATH_IN_PHONE}

    echo "> pull to computer"
    ${ADB} pull ${PATH_IN_PHONE} ./

    echo "> delete device copy"
    ${ADB} shell rm ${PATH_IN_PHONE}

    echo "> hprof-conv it"
    ${HPROF_CONV} -z ${FILE_NAME} droid-${FILE_NAME}

    echo "> remove tmp hprof"
    mv -f droid-${FILE_NAME} ${FILE_NAME}
    ls -lh ${FILE_NAME}
    echo "done! file: \e[38;5;82m ${FILE_NAME}"
}

function droid_mm() {
    PACKAGE_NAME=$1
    if [[ -z $PACKAGE_NAME ]]; then
        PACKAGE_NAME="com.tencent.radio.debug"
    fi

    ${ADB} shell dumpsys meminfo ${PACKAGE_NAME}
}
