
#echo "$a">build/boot.bin
#succ_sign=$(../JLinkExe upload.jlink)

cat count.txt | read last_read
if[ $last_read -nq 0 ] then
num=last_read

else 
num=1
done


while[ $num -le 100 ]
do

sed -n "${num}p" TID.txt>tid.bin

../JLinkExe boot.jlink
sleep 3s
../JLinkExe tid.jlink
sleep 3s
../JLinkExe upload.jlink


#echo $succ_sign | grep failed

ret=$?
if [ $ret == 0 ]
then
    echo "fail"
else
    n=`expr n + 1`
    echo "success"
    cat tid.bin
fi
  
echo n>count.txt
done

