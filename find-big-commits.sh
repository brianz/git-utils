for br in `git br -r | grep origin\/`; do
    #"`git ls-tree -t -r -l --full-name $br | sort -nr -k4 | head -20 > bigfiles.txt`"
    #"$(git ls-tree -t -r -l --full-name $br | sort -nr -k4 | head -20)"
    #"$(git ls-tree -t -r -l --full-name $br | egrep \"selenium\.log\")"
    res="$(git ls-tree -t -r -l --full-name $br)"
    echo "$res"
done
