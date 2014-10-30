git add . && \
git status && \
git commit -m "daily commit" .  && \
(git log | head -20)  && \
git push
