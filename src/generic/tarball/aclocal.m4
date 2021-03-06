# Copyright 2005,2008 David Roundy

# Redistribution and use in source and binary forms of this file, with or
# without modification, are permitted provided that redistributions of
# source code must retain the above copyright notice.

# TRY_COMPILE_GHC(PROGRAM, [ACTION-IF-TRUE], [ACTION-IF-FALSE])
# -----------
# Compile and link using ghc.
AC_DEFUN([TRY_COMPILE_GHC],[
cat << \EOF > conftest.hs
[$1]
-- this file generated by TRY-COMPILE-GHC
EOF
rm -f Main.hi Main.o
if AC_TRY_COMMAND($GHC -o conftest conftest.hs) && test -s conftest
then
dnl Don't remove the temporary files here, so they can be examined.
  ifelse([$2], , :, [$2])
else
  echo "configure: failed program was:" >&AS_MESSAGE_LOG_FD
  cat conftest.hs >&AS_MESSAGE_LOG_FD
  echo "end of failed program." >&AS_MESSAGE_LOG_FD
ifelse([$3], , , [ rm -f Main.hi Main.o
  $3
])dnl
fi])
