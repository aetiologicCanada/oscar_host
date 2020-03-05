# README

The purpose of this repo is to create an R package that would live on each 
OSCAR host.  The plan is that there is a standing docker image that is always active,
and it contains a) an inotify script which sets watches over the OSCAR_DOCUMENT folder for
files named teleplanremit*. When that occurs, inotify launches a batch file.

The batch file will call R, which will run the script prototype.R. 
Prototype either generates and ships a tarball file from ./data/outbound or 
it does nothing. It would do nothing when there was a new file, but it had
neither S nor C12 records - just messages.

Along the way, we rename the remittance files into something sensible.

In the more likely scenario where there are C12 or S records, 
the system will generate a tarball - 
either for a single file (containing "just" C12 records) or if the newest file had 
S0* records, then the tarball would hold all the claims and all the remittanceadvice
files that it can find in OSCAR_DOCUMENTS.

If there is a tarball in outbound at the end of the script, then 
we have choices -- either the R script itself, or a separate inotify process sees the 
tarball file, and moves it to the inbound folder of parse.evidently.ca


## Things not here yet, not done, not thought through...

In the next couple of days we'll get the inotify scripts working (in draft), 
and then we'll lift it all into Docker, and try start to sort out  how we 
are going to deliver the Docker container to Clark (via harbour?)


