
# https://stackoverflow.com/questions/3497123/run-git-pull-over-all-subdirectories


ls | xargs -P10 -I{} git -C {} pull
