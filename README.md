mapconvert
==========

Small utility to convert dfhack generated .dfmap files into .png formatted images.


***NOTE***

Currently the `protocol-buffers` library used to read google protobuffers does
not compile with GHC 7.8.* due to a breaking change introduced in `Data.Typeable`
Additionally the mapexport dfhack plugin used to produce the map files to be decoded
does not currently work, and so this program is useless, even with an older version
of GHC.
