key_a=$(cat wallet.key_a | tr '[:lower:]' '[:upper:]')
key_b=$(cat wallet.key_b | tr '[:lower:]' '[:upper:]')

sum_expression="($key_a + $key_b) % FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFC2F"

key=$(echo "obase=16;ibase=16;$sum_expression" | bc | tr '[:upper:]' '[:lower:]')

key_padded=$(printf "%64s" $key | tr ' ' '0')

echo $key_padded > wallet.key
