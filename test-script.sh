set -o errexit
script/deploy
diff -u <(script/deploy) - << EOF
Linux precise32 3.2.0-23-generic-pae #36-Ubuntu SMP Tue Apr 10 22:19:09 UTC 2012 i686 i686 i386 GNU/Linux
EOF
