# push latest file
scp -i test.pem *.tex cloud-user@mse.mewx.org:~/mse2017-buoy/Reports/Sem2Final-Yuanzhong/
scp -i test.pem *.bib cloud-user@mse.mewx.org:~/mse2017-buoy/Reports/Sem2Final-Yuanzhong/

# compile first
ssh -i test.pem cloud-user@mse.mewx.org "cd ~/mse2017-buoy/Reports/Sem2Final-Yuanzhong/ && sh -x remote.sh"

# drag back
scp -i test.pem cloud-user@mse.mewx.org:~/mse2017-buoy/Reports/Sem2Final-Yuanzhong/*.pdf .

