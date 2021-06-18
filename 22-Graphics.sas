title 'Price vs. Sq. Feet by Location';
proc sgplot data=bcs;
	scatter x=sqft y=price /group=location;
run;
	reg x=sqft y=price ; 

proc sgpanel data=bcs;
	*panelby location;
	scatter x=sqft y=price;
run;

title 'Histogram of Sqft with Distribution';
proc sgplot data=bcs;
	histogram sqft / binwidth=500 ;
	density sqft;
run;
proc sgplot data=bcs;
	histogram sqft /nbins=8 ;
	density sqft;
run;

title 'Number of Bathrooms';
proc sgplot data=bcs;
	vbar baths;
run;

title 'Real Estate Sales Prices';
proc sgplot data=bcs;
	vbox price /group=location;
run;

title 'Power Generation by Year';
proc sgplot data=sashelp.electric;
where year >= 2001 and customer="Residential";
series x=year y=coal / datalabel;
run;

title 'Price vs. Sq. Feet by Location';
proc sgpanel data=bcs;
	panelby location;
	scatter x=sqft y=price;
run;


/* Create model of storm data */
*PC SAS;
%let path=C:\Users\kinchelf\Documents\SASUniversityEdition\myfolders\prg1_19\;
libname pg1 "&path.data";
title "Model of Minimum Pressure and Maximum Wind";
proc reg data=pg1.storm_final(obs=1500);
	model maxwindmph=minpressure;
	code file="stormmodel.sas";
run;quit;
title; 
