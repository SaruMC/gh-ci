###
#
#  @file check_ci.sh
#  @copyright 2023-2024 SaruMC. All rights reserved.
#
#  @version 1.2.3
#  @author SaruMC
#  @date 2024-03-15
###

success=1

check_rebase()
{
    hash_main=$(git show-ref -s origin/main)
    hash_common=$(git merge-base origin/main ${CI_COMMIT_SHA})

    if [ "${hash_main}" = "${hash_common}" ]
    then
        echo "check_rebase: SUCCESS"
        return 0
    else
        echo "check_rebase: FAILED"
        success=0
        return 1
    fi
}

check_header()
{
    echo " Checking file headers: "
    TOOLSDIR=$(dirname $0)/../.github
    $TOOLSDIR/check_header.sh
    rc=$?
    if [ $rc -eq 0 ]
    then
        echo "Check header: SUCCESS"
        return 0
    else
        echo "Check header: FAILED"
        success=0
        return 1
    fi
}

if [ $# -lt 1 ]
then
    echo "Usage: $0 [rebase|header]"
    exit 1
fi

echo ""
echo "----------------------------------------------------"
case $1 in
    rebase)
	check_rebase
	;;
    header)
	check_header
	;;
    *)
        echo "Usage: $0 [rebase|header]"
	exit 1
	;;
esac

if [ $success -eq 0 ]
then
    exit 1
    # We could cancel the job, but then the log is not pushed in time to the web interface
fi