
 xfv release 1
===============

This kit contains the tools to extract files from an EFI firmware
image.

 Step 1: Getting the image
---------------------------
You can get a firmware image for an Intel Mac either from inside
Apple's firmware updater packages, or by using the 'dumpfv.efi'
program from rEFIt (latest Subversion HEAD, included in this
package). The extension of the image is ".fd". This version of xfv
also has the ability to unpack intels .bio efi capsules, which
can be downloaded from the intel site under each specific 
motherboard.

 Step 2: Extracting the image
------------------------------
Make a new folder and populate it with the firmware image, the
"xfv.py" script and the "efidecomp" executable. There are two
binaries in this release of the efidecomp executable. You will need
to delete one based on which architecture you are on, then rename
it to efidecomp. Run "xfv.py" with the image file name as a parameter.
You may want to capture output from xfv for later reference:

  ./xfv.py MBP11_0044_02B.fd | tee mbp11-output.txt

 Some notes
------------
Early firmware images (e.g. the original images for the iMac, MBP and
Mac mini models as present on the Firmware Restoration CD) include
file names for drivers and applications. Later images (e.g. the Boot
Camp firmware updates) don't. However, the GUID of the files is fixed,
so a future version of xfv may support building a dictionary of file
names and using them for images that don't have embedded file names.

The current version only supports one "firmware volume" per file. The
firmware images actually contain 4 parts:

  Offset   Size   Content
  000000  1A0000  Main firmware volume: DXE core, DXE drivers
  1A0000  010000  Firmware volume, use unknown
  1B0000  030000  Contents unknown
  1E0000  020000  Firmware volume: PEI core, PEI drivers


EOF
