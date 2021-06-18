/* Demonstrate automatic Conversion */
data convtest;
	Number=4;
	Character='4';
	BigChar='1,234';
	Char2Num=Character*1;
	BigChar2Num=BigChar*1;
run;

proc print data=convtest;
	where number='4';
run;

proc print data=convtest;
	where character=4;
run;
