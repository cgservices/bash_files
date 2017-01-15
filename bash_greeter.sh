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
    __print_centered_string "-= $(lsb_release -d -s) $(uname -srmo) =-" "0"

    printf "${NORMAL}\n"
    __print_line
}


__print_diskinfo ()
{
    printf ${POWDER_BLUE}
    __print_centered_multiline "$(df -h -x tmpfs -x devtmpfs -x ecryptfs -x fuse.encfs -T)" "0"

    printf "${NORMAL}\n"
    __print_line
}

__print_landscape_info ()
{
    printf ${POWDER_BLUE}
    __print_centered_multiline "$(landscape-sysinfo)" "0"

    printf "${NORMAL}\n"
    __print_line
}

__print_lastlogins ()
{
    printf ${GREY}
    __print_centered_multiline "$(last -in 3 -ad)" "0"

    printf "${NORMAL}\n"
    __print_line
}




# Call functions
__print_hostname

__print_sysinfo

__print_landscape_info

__print_diskinfo

__print_lastlogins

