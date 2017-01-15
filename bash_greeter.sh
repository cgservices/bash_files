#!/bin/bash

################################################################################
#                                                                              #
# Various greeting information - Needs /.bash_functions                        #
#                                                                              #
# binaryanomaly - v0.1                                                         #
#                                                                              #
################################################################################


source ~/bash_files/bash_print_functions.sh


__print_hostname ()
{
    if [[ -x /usr/bin/figlet ]]; then
       printf ${BLUE}
        __print_ascii_art "-= $COMPANY_NAME =-"
    fi
    printf ${WHITE}
    __print_centered_string "-= $(hostname) =-" "0"

    printf "${NORMAL}\n"
    __print_line
  }


__print_sysinfo ()
{
    printf ${ORANGE}
    __print_centered_string "-= $(uname -srmo) =-" "0"

    printf "${NORMAL}\n"
    __print_line
}


__print_diskinfo ()
{
    # disk usage, minus def and swap
    local DISK_INFO=$(df -h -x tmpfs -x devtmpfs -x ecryptfs -x fuse.encfs -T)

    printf ${POWDER_BLUE}
    __print_centered_multiline "$DISK_INFO" "0"
    # printf "%s\n" "$DISK_INFO" | boxes -d ada-box -ph8v1

    printf "${NORMAL}\n"
    __print_line
}

__print_lastlogins ()
{
    # LAST_LOGINS=$(last -in 3 -ad)
    # printf "%s\n" "$LAST_LOGINS" | boxes -d ada-box -ph8v1
    local LAST_LOGINS=$(last -in 3 -ad)
    #local linecount=$(printf "%s\n" "$LAST_LOGINS" | grep -c '^')

    printf ${GREY}
    __print_centered_multiline "$LAST_LOGINS" "0"

    printf "${NORMAL}\n"
    __print_line
}




# Call functions
__print_hostname

__print_sysinfo

__print_diskinfo

__print_lastlogins

