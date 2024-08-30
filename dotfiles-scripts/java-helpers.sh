# Helper functions for switching JDKs in a shell.
# Assumes macOS.

PATH_JAVA_PREFIX_MACOS="/Library/Java/JavaVirtualMachines"
list-java() {
    if [ -e "$PATH_JAVA_PREFIX_MACOS" ]; then
        ls "$PATH_JAVA_PREFIX_MACOS"
    fi
}

set-java() {
    jdk_name="$1"
    original_path="$PATH"
    mac_jdk_home="$PATH_JAVA_PREFIX_MACOS/$jdk_name/Contents/Home"
    mac_jdk_path="$mac_jdk_home/bin"
    if [ -e "$mac_jdk_path" ]; then 
        while [ ! $(which java) = "$mac_jdk_path/java" ]; do
            echo "Cleaning up $(which java) from PATH"
            unset-path "$(which java)"
            unset-path "mac_jdk_path"
            export PATH="$mac_jdk_path":$PATH
            export JAVA_HOME="$mac_jdk_home"
        done
        echo "JAVA_HOME: $JAVA_HOME"
        echo "JDK in use: $(which java)"
        echo "java -version"
        echo "-------------"
        echo "$(java -version)"
    fi
}

unset-path() {
    # Remove from PATH environment variable
    path_to_remove="$1"
    path_to_remove=${path_to_remove%/java}
    PATH=${PATH//$:path_to_remove/}
}
