THIS_DIR=$(dirname $0)
pushd $THIS_DIR
git add . && \
git status && \
git commit -m "daily commit" .  && \
(git log | head -20)  && \
git push
echo ES $?
read
