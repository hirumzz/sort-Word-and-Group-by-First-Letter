if [[ "$1" != "" ]]; then
        sed 's/\([0-9]\)/;\1/' $1 | sort -n -t\; -k2,2 | tr -d ';' >> .list
        IFS=$'\r\n' GLOBIGNORE='*' command eval  'word=($(cat .list))'
        countArray=${#word[@]}
        a="0"
        for (( c = 0; c<$countArray; c++ ))
        do
                b="$(echo ${word[$c]} | head -c 1)"
                if [ "$a" == "$b" ]
                then
                        echo ${word[$c]}
                else
                        a=$b
                        echo -e
                        echo -e
                        echo "---${a^}---"
                        echo ${word[$c]}
                fi;
        done
        echo -e
        rm -r .list
else
        echo ""
        echo "what file? please type name off file"
        echo ""
        echo "Example: "
        echo ""
        echo "sortWord.sh example.txt"  
        echo ""
fi;
