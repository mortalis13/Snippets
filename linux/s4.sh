#!/bin/bash

echo --Embeds--

python -c 'print("python-bash")'

python3 - <<EOF
print("python3 multiline")
a = {'k1': 'v1', 'k2': 'v2', 'k3': 'v3'}
print("a[k1]: " + a['k1'])
EOF
