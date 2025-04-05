
# https://stackoverflow.com/questions/3497123/run-git-pull-over-all-subdirectories


# At directory repos/orgs , pull all repos at repos/orgs/ORGNAME/REPONAME
# orgs could be users, git clone or git ssh.
# & does all in parallel.

for i in */.git; do
  ( echo $i; cd $i/..; git pull; )
done

for i in */*/.git; do
  ( echo $i; cd $i/..; git pull; )
done

for i in */*/*/.git; do
  ( echo $i; cd $i/..; git pull; )
done

for i in */*/*/*/.git; do
  ( echo $i; cd $i/..; git pull; )
done
