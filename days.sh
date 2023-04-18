while getopts :m:tw: DAYS 
do
    case $DAYS in 
    m) echo "$OPTARG is Monday"
    ;;

    t) echo "$OPTARG is Tuesday"
    ;;
    w) echo "$OPTARG is Wednesday"
    ;;
    *) echo "Default";
    ;;

    esac
done
  