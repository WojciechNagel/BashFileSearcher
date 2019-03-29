TEST=$1
if ! [[ "$TEST" != ?(-)+([0-7]) ]]; then
  echo "VALID"
else
  echo "INVALID"
fi
