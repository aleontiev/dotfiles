inspire

# setup dependencies

BREW_INSTALLED=`which brew`
if [[ "$BREW_INSTALLED" == "" ]]
then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
for data in `cat $HOME/.dependencies`
do
  INSTALLED=`which $data`
  if [[ "$INSTALLED" == "" ]]
  then
    brew install $data
  fi
done

