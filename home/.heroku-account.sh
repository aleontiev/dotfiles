export NETRC="$HOME/.netrc"

function heroku-current() {
    if [ -f "$NETRC" ]
    then
        echo "Current user:" $(cat $NETRC | grep login | uniq | sed -E s/login// | xargs)
    else
        echo "Could not find $NETRC, try running 'heroku-account login'"
    fi
}

function heroku-login() {
    if [ -f "$NETRC" ]
    then
        mv $NETRC $NETRC.bak
    fi
    heroku login
    if [ $? -eq 0 ]
    then
        rm -f $NETRC.bak
        NAME=$1
        if [ -z "$NAME" ]
        then
            cp $NETRC $NETRC.$USER
        else
            cp $NETRC $NETRC.$NAME
        fi
        heroku-current
    else
        if [ -f "$NETRC.bak" ]
        then
            mv $NETRC.bak $NETRC
        fi
    fi
}

function heroku-switch() {
    TO_NETRC="$NETRC.$1"
    if [ -f "$TO_NETRC" ] 
    then
        cp $TO_NETRC $NETRC
        heroku-current
    else
        echo "Cannot find $TO_NETRC, try running 'heroku-account login $1'"
    fi
}

function heroku-list() {
    PREFIX=$HOME/.netrc.
    for f in $PREFIX*
    do
        if [[ "$f" == *"*"* ]]
        then
            echo "Could not find anything like $NETRC.*, try running 'heroku-account login'"
        else
            SHORT_NAME=$(echo $f | sed s#$PREFIX## | xargs)
            LOGIN_NAME=$(cat $f | grep login | uniq | sed -E s/login// | xargs)
            echo $SHORT_NAME ":" $LOGIN_NAME
        fi
    done
}

function heroku-account() {
    if [ -z "$1" ] 
    then
        heroku-current
    else
        if [ "$1" = "login" ]
        then
            heroku-login $2
        else
            if [ "$1" = "list" ]
            then
                heroku-list
            else
                heroku-switch $1
            fi
        fi
    fi
}
