[AtomicParsley](http://atomicparsley.sourceforge.net/) is a lightweight command line program for reading, parsing and setting metadata into MPEG-4 files. This is a functional mp4 equivalent of what `i3dv2` is for mp3 files.

# Examples

## Set metadata on multiple files

Unfortunately the syntax of this tool requires you to edit one file at a time, so you have to iterate each item of an album using shell loops or `xargs` or whatever you prefer.

```
for file in *.m4a ; do
  AtomicParsley "${file}" --artist "Various Artists" ;
done ;
```

## Remove Personally Identifiable Information (pii) from files

Useful if you want to remove your personal info from iTunes Match files.

```
for file in *.m4a ; do
  AtomicParsley \
    "$file" \
    --DeepScan \
    --manualAtomRemove "moov.trak.mdia.minf.stbl.mp4a.pinf" \
    --manualAtomRemove "moov.udta.meta.ilst.----.name:[iTunMOVI]" \
    --manualAtomRemove "moov.udta.meta.ilst.apID" \
    --manualAtomRemove "moov.udta.meta.ilst.atID" \
    --manualAtomRemove "moov.udta.meta.ilst.cnID" \
    --manualAtomRemove "moov.udta.meta.ilst.cprt" \
    --manualAtomRemove "moov.udta.meta.ilst.flvr" \
    --manualAtomRemove "moov.udta.meta.ilst.geID" \
    --manualAtomRemove "moov.udta.meta.ilst.plID" \
    --manualAtomRemove "moov.udta.meta.ilst.purd" \
    --manualAtomRemove "moov.udta.meta.ilst.rtng" \
    --manualAtomRemove "moov.udta.meta.ilst.sfID" \
    --manualAtomRemove "moov.udta.meta.ilst.soal" \
    --manualAtomRemove "moov.udta.meta.ilst.stik" \
    --manualAtomRemove "moov.udta.meta.ilst.xid" \
done
```
