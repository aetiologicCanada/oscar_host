#!/bin/bash

#
# Run this script from the command line to run an example encryption/decryption operation.
#
# Here are some other, helpful OpenSSL Commands
#
# man openssl
# man enc 
#
# openssl enc -ciphers
# 
# Note that the openssl manual advises beginners to use a strong block cipher such as AES in CBC mode.
#

file_clear_text=/tmp/test_open_ssl.txt
file_cypher_text=$file_clear_text.enc
file_decrypted=$file_clear_text.dec
file_passphrase=/tmp/test_open_ssl_passphrase

echo "This is some clear text content to encrypt." > $file_clear_text
echo "This is the passphrase and could be the OpenSSH RSA private key." > $file_passphrase

echo "Encrypting and decrypting $file_clear_text"

# Encrypt a file using a passphrase from a file.
openssl enc -aes-256-cbc -in $file_clear_text -out $file_cypher_text -pbkdf2 -pass file:$file_passphrase

# Decrypt a file using a passphrase from a file.
openssl enc -d -aes-256-cbc -in $file_cypher_text -out $file_decrypted -pbkdf2 -pass file:$file_passphrase

echo "Done. See the results in /tmp".

