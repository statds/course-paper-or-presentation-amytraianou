DATA Egypt;
INPUT age cancer HCV Count;
DATALINES;
1 1 1 17
1 1 0 110
1 0 1 2
1 0 0 91
2 1 1 71
2 1 0 207
2 0 1 13
2 0 0 39
RUN;

PROC FREQ;
WEIGHT count;
TABLES cancer*HCV /norow nocol nopercent exact;
FORMAT cancer cancerfm. HCV HCVfm.;
RUN;

PROC FREQ data=Egypt order=data;
WEIGHT count;
TABLES age*cancer*HCV/norow nocol relrisk cmh;
RUN;