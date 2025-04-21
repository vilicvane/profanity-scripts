key=$(openssl ecparam -genkey -name secp256k1 -text -noout -outform DER | xxd -p -c 1000)

echo $key | grep -oP '41534e31204f49443a20736563703235366b310a30740201010420\K.+(?=a00706052b8104000aa144034200)' > wallet_a.key
echo $key | grep -oP 'a00706052b8104000aa144034200\K.+' > wallet_a.pub
