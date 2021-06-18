ods excel file='/folders/myfolders/stat604/multitablefinal.xlsx'
/* 	options (sheet_interval="bygroup" */
/* 		suppress_bylines="yes" */
/* 		sheet_label='Manager' */
/* 		embedded_titles='yes') */
		;
	title 'Wages by Manager';
	
	proc means data=cert.usa;
		by manager;
		var wagerate;
	run;
	
ods excel close;