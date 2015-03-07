MACHINE check1
SEES LibraryStrings
CONSTANTS data
PROPERTIES
 data : seq(STRING) & data = ["abc", "defg", "hi", "jklgm"]
VARIABLES prop_1, process
INVARIANT
 prop_1 : POW(STRING*INT) & process:NAT
INITIALISATION 
	prop_1:={} || process:=0
OPERATIONS
	compute_prop_1=
	SELECT process=0 THEN
	prop_1:={dd,nn |dd:ran(data) & nn=length(dd) & not(nn<=4)}||
	process:=1
	END;
rule_1= ANY dd,nn WHERE dd|->nn : prop_1 THEN
	prop_1:=prop_1 - { dd|->nn}
END

END

