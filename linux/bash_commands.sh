# Multiline variable with quotes used in a command
# create an array and extract all arguments in the command

CONFIG=(
--enable-shared
--extra-cflags="-O3 -fPIC -w"
)
./configure "${CONFIG[@]}"
