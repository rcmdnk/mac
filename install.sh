#!/usr/bin/env bash

if [[ ! "$OSTYPE" =~ darwin ]];then
  echo Can be used only in Mac.
  exit
fi

files=()
#files=(karabiner.json)
#karabiner="$HOME/.config/karabiner"
#instdirs=("$karabiner" "$karabiner")
exclude=("." ".." "LICENSE" "README.md" "install.sh")

backup=""
overwrite=1
dryrun=0
newlink=()
exist=()
curdir=$(pwd -P)

# help
HELP="Usage: $0 [-ndsh] [-b <backup file postfix>] [-e <exclude file>]

Make links of Mac related files/directories

Arguments:
      -b  Set backup postfix, like \"bak\" (default: \"\": no back up is made)
      -e  Set additional exclude file (default: ${exclude[*]})
      -n  Don't overwrite if file is already exist
      -d  Dry run, don't install anything
      -s  Use 'pwd' instead of 'pwd -P' to make a symbolic link
      -h  Print Help (this message) and exit
"
while getopts b:e:ndsh OPT;do
  case $OPT in
    "b" ) backup=$OPTARG ;;
    "e" ) exclude=("${exclude[@]}" "$OPTARG") ;;
    "n" ) overwrite=0 ;;
    "d" ) dryrun=1 ;;
    "s" ) curdir=$(pwd) ;;
    "h" ) echo "$HELP" 1>&2; exit ;;
    * ) echo "$HELP" 1>&2; exit 1;;
  esac
done

echo "**********************************************"
echo "Install mac setting files"
echo "**********************************************"
echo
if [ $dryrun -ne 0 ];then
  echo "*** This is dry run, not install anything ***"
fi
i=0
while [ $i -lt "${#files[@]}" ];do
  f=${files[$i]}
  d=${instdirs[$i]}
  i=$((i+1))
  for e in "${exclude[@]}";do
    flag=0
    if [ "$f" = "$e" ];then
      flag=1
      break
    fi
  done
  if [ $flag = 1 ];then
    continue
  fi
  echo "install $f to $d"
  install=1
  if [ $dryrun -eq 1 ];then
    install=0
  fi
  if [ "$(ls "$d/$f" 2>/dev/null)" != "" ];then
    exist=(${exist[@]} "$f")
    if [ $dryrun -eq 1 ];then
      echo -n ""
    elif [ $overwrite -eq 0 ];then
      install=0
    elif [ "$backup" != "" ];then
      rm -rf "$d/${f}.$backup"
      mv "$d/$f" "$d/${f}.$backup"
    else
      rm "$d/$f"
    fi
  else
    newlink=(${newlink[@]} "$f")
  fi
  if [ $install -eq 1 ];then
    mkdir -p "$d"
    echo ln -s "$curdir/$f" "$d/$f"
    ln -s "$curdir/$f" "$d/$f"
  fi
done
echo ""
if [ $dryrun -eq 1 ];then
  echo "Following files don't exist:"
else
  echo "Following files were newly installed:"
fi
echo "  ${newlink[*]}"
echo
echo -n "Following files existed"
if [ $dryrun -eq 1 ];then
  echo "Following files exist:"
elif [ $overwrite -eq 0 ];then
  echo "Following files exist, remained as is:"
elif [ "$backup" != "" ];then
  echo "Following files existed, backups (*.$backup) were made:"
else
  echo "Following files existed, replaced old one:"
fi
echo "  ${exist[*]}"
echo
