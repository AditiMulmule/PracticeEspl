.hidden{
   display:none;
}

#planningView{
	width: 100%;
}

.planningViewTables{
	width: 100%;
	border-collapse: collapse;
}

.planningViewTables tr th{
	background: none repeat scroll 0 0 transparent;
	border: medium none;
	border-collapse: collapse;
	color: #444444;
	font-size: 1.1em;
	font-weight: bold;
	text-align: center;
	/*text-transform: lowercase;*/
	overflow: visible;
	width: 5%;
}

.planningViewTables tr td{	
	border: 1px solid #aaaaaa;
	border-collapse: collapse;
	text-align: center;
	font-size: 1em;
	padding: 1px 0;
	width: 5%;
}

#planningViewTable_month tr td{
	width: 2%;
}

#planningViewTable_month tr th{
	width: 2%;
}

.planningViewTables tr th.wide{
	min-width: 175px;
}
.planningViewTables tr td.click{
	border-right: none;
	min-width: 175px;
}
.planningViewTables tr td.name {
	border-left: none;
	min-width: 175px;
}

input {
    padding: 0;
    margin: 0 .5em 1px 0;
    vertical-align: text-bottom;
    position: relative;

}
/* Not sure what this applies to, can't notice a difference with it in or out, removing for now
label {
    display: block;
    padding-left: 15px;
    text-indent: -15px;
}*/


.click, .name{
	cursor: pointer;
	padding-left: 1em;
	padding-right: 1em;
}

.click {
	border: none;
}

.click:hover{
	color: #015ba7;
}

.name:hover{
	color: #015ba7;
}

.tdWrapper{
	width: 100%;
	height: 100%;
	position: relative;
	margin: 0;
	padding: 0;
	user-select: none;
	-moz-user-select: none;
	-webkit-user-select: none;
}

.campaignStart, .campaignMid, .campaignEnd, .campaignOne{
	position: absolute;
	top: 0;
	bottom: 0;
	font-size: 1em !important;
	background-color: #0eb918;
	cursor: pointer;
	padding: 0;
	z-index: 10;
	min-width:7px;
}

.campaignOne{
	border-radius: 10px 10px 10px 10px;
	-moz-border-radius: 10px 10px 10px 10px;
	-webkit-border-radius: 10px 10px 10px 10px;
}

.campaignStart{
	border-radius: 10px 0 0 10px;
	-moz-border-radius: 10px 0 0 10px;
	-webkit-border-radius: 10px 0 0 10px;
	right: 0px;
}

.campaignMid{
	left: -1px;
	right: -1px;
}

.campaignEnd{
	border-radius: 0 10px 10px 0;
	-moz-border-radius: 0 10px 10px 0;
	-webkit-border-radius: 0 10px 10px 0;
	left: -1px;
}

/* IE Specific for filter */
.textDate{
	background-color: white;
	padding: 0 2px;
	position: absolute;
	width: 3.5em;
	top: 1;
}

.inlineTextDate{
}

.datesOff{
}

.textDateStart{
	right: 100%;
}

.textDateEnd{
	left: 100%;
}

.planningViewTable_yearTheadFixed{
	position: fixed;
	background: white;
	top: 0px;
	z-index: 20;
	border: 1px solid #aaa;
	left: 20px;
	right: 19px; /*1 for border*/
}
.planningViewTable_quarterTheadFixed{
    position: fixed;
    background: white;
    top: 0px;
    z-index: 20;
    border: 1px solid #aaa;
    left: 20px;
    right: 19px; /*1 for border*/
}
.planningViewTable_monthTheadFixed{
    position: fixed;
    background: white;
    top: 0px;
    z-index: 20;
    border: 1px solid #aaa;
    left: 20px;
    right: 19px; /*1 for border*/
}

.readMore{
	color: #015ba7;
}

#pvRadioFilters, #ccViewSelect{
	display:none;
}
	
.planningViewTables{
	display:none;
}

.incrementedValue{
	display:none;
}

.planningMonth_previous{
	width:5% !important;
}
.planningMonth_next{
	width:5% !important;
}

.hiddenPlanningViewValues{
	display:none;
}

.toolbarButton{
	cursor:pointer;
}

.toolbarButton:hover{
	color:#2983B7;
}

.bPageBlock{
	border-top: 1px solid #E5E5E5 !important;
}

.pv_QuarterViewMonth{
	width: 11% !important;
}
/*Targeted CSS for ie7*/
*+html .previousIncrement, .nextIncrement{
	max-width:25px;
}
*+html .showDates{
	max-width: 105px;
}
*+html .currentIncrementSelect, .rightToolbar .toolbarButton{
	max-width:32px;
}

.icsDownloadButton{
    margin-right:0 !important;
    margin-top:1px;
}
