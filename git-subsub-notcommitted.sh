# Show all subsub directories that have modifications, not committed yet

for i in */git/.git; do
  ( echo $i; cd $i/..; git status | grep modified; )
done

