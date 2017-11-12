# push latest file
scp *.tex a1700831@uss.cs.adelaide.edu.au:~/Documents/Crypto4RFID-1/Reports/yuanzhong/
scp *.bib a1700831@uss.cs.adelaide.edu.au:~/Documents/Crypto4RFID-1/Reports/yuanzhong/

# compile first
ssh a1700831@uss.cs.adelaide.edu.au "cd ~/Documents/Crypto4RFID-1/Reports/yuanzhong/ && sh -x remote.sh"

# drag back
scp a1700831@uss.cs.adelaide.edu.au:~/Documents/Crypto4RFID-1/Reports/yuanzhong/*.pdf .

