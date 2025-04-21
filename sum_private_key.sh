key_a=$(cat wallet_a.key | tr '[:lower:]' '[:upper:]')
key_b=$(cat wallet_b.key | tr '[:lower:]' '[:upper:]')

sum_expression="($key_a + $key_b) % FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFC2F"

key=$(echo "obase=16;ibase=16;$sum_expression" | bc)

key_padded=$(printf "%64s" $key | tr ' ' '0')

echo $key_padded > wallet.key
