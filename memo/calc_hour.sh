 cat sample.org.txt | awk '/\([0-9].* h/ { gsub("[^0-9.]+", "", $0); SUM += $0 } END { print SUM }'
