org() {
  v -c "/$1" -p $(rg -l $1)
}

