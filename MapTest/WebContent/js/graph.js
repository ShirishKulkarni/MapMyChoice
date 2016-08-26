$(document).ready(function(){
	$('#incomeCoverage').hide();
	$('#areaCoverage').hide();
	var querystring = window.location.search.substring(1);
	//alert(querystring);
	var testStr=querystring.split('&');
	var paramVal=testStr[0].split('=');
	var nanZipCode=testStr[1].split('=')[1];
	//alert(paramVal[1]);
	var tempArr=paramVal[1]+"";
	//alert(tempArr.split(','));
	var storeCodeArrayForGraph=tempArr.split(',');
	var printReadyFlag=0;
	/**
	 * function generates the string req for pie chart
	 */
	tempRetailTypes= new Array();
	var storeVolumeArray=new Array();
	var strtAddArray=new Array();
	function generatePiChartModel()
	{
		//alert(nanZipCode);
		var storDetail;
		var obj = null;
		for (var i = 0; i < storeCodeArrayForGraph.length; i++) {
			
			
			//alert(storeCodeArrayForGraph[i]);
			storDetail = getStoreDetailsGivenStoreCode(storeCodeArrayForGraph[i]);
			//alert(storDetail);
			obj = $.parseJSON(storDetail);
			//alert(obj);
			//alert(JSON.stringify(obj.StoreInfo.Characteristics[0].LATITUDE));
			
			storeDetailArray.push(obj);
			
			
		
			
		}
		page='graph';
		tempRetailTypes=fetchStoreDetailArray(storeDetailArray,0,null);
		
		
	}
	
	//alert(storeCodeArrayForGraph);
	var Store=new Object();
	var avgIncomeArray=new Array();
	var areaArray=new Array();
	var unitArea=0;
	for(var i=0;i<storeCodeArrayForGraph.length;i++)
	{
		
		var avgIncome=0;
		var storeVol='';
		Store=$.parseJSON(getStoreDetailsGivenStoreCode(storeCodeArrayForGraph[i]));
		unitArea=Store.StoreInfo.Characteristics[0].AREA_OF_SELLING_SPACE;
		strtAddArray.push(Store.StoreInfo.Characteristics[0].STREET_ADDRESS);
	//	alert(Store);
		areaArray.push(parseInt(unitArea));
		storeVol=Store.StoreInfo.Characteristics[0].STORE_VOLUME;
		avgIncome=calAvgIncome(storeVol);
		avgIncomeArray.push(avgIncome);
		
	}
	//alert('no of ele>'+avgIncomeArray.length);
	generatePiChartModel();
	var retailTypesArray=new Array();
	var retailNameArray=new Array();
	for(var i=1;i<tempRetailTypes.length;i++)
	{
		//alert(tempRetailTypes[i]);
		
		for(var j=0;j<tempRetailTypes[i].mainObject.length;j++)
		{
			
			retailNameArray.push(tempRetailTypes[i].mainObject[j].STORE_NAME+"<br/> ("+tempRetailTypes[i].mainObject[j].STREET_ADDRESS+")");
			
		}
		retailTypesArray.push(tempRetailTypes[i].type);
	}
	var tempSum=0.0;
	var tempNumOfChec=0;
	for(var i=0;i<avgIncomeArray.length-1;i++)
	{
		tempSum=tempSum+parseFloat(avgIncomeArray[i]);
	}
	for(var i=0;i<areaArray.length-1;i++)
	{
		tempNumOfChec=tempNumOfChec+parseInt(areaArray[i]);
	}
	//alert('--'+retailTypesArray.length+'>>'+avgIncomeArray.length);
	
	generatePieChartForIncome();
	generateBarChart();
	$('#incomeCoverage').show();
	$('#areaCoverage').show();
	/**
	 * function calculate avg income from storeVol
	 */
	function calAvgIncome(str)
	{
		var vval1=str.split(' ');
	//	alert(vval1[0]+'>>'+vval1[2]);
		vval1[0]=vval1[0].replace(/\,/g, '');
		vval1[2]=vval1[2].replace(/\,/g, '');
	//	alert(vval1[0]+'>>'+vval1[2]);
	//	alert(vval1[0].length+'>>'+vval1[2].length);
		vval1[0]=vval1[0].substr(1,vval1[0].length-1);
		vval1[2]=vval1[2].substr(1,vval1[2].length-1);
		var avg=(parseInt(vval1[0],10)+parseInt(vval1[2],10))/2;
	//	alert(vval1[0]+'>>'+vval1[2]);

		//alert('avg>>'+avg);
		return avg;
	}
	/**
	 * pie-highcharts
	 */
	$('#container').hide();
	
	function generatePieChartForIncome()
	{
		//alert('>>'+areaArray);
        var colors = Highcharts.getOptions().colors,
          categories =['Retail'],
            name = 'Retail brands',
            data = [{
                    y: 55.11,
                    color: colors[4],
                    drilldown:
                    {
                        name: 'Retail',
                        categories:retailNameArray,
                        data: areaArray,
                        color: colors[8]
                    }
                }];
    
    
        // Build the data arrays
        var browserData = [];
        var versionsData = [];
        for (var i = 0; i < data.length; i++) {
    
            // add browser data
            browserData.push({
                name: categories[i],
                y: data[i].y,
                color: data[i].color
            });
    
            // add version data
            for (var j = 0; j < data[i].drilldown.data.length; j++) {
                var brightness = 0.2 - (j / data[i].drilldown.data.length) / 5 ;
                versionsData.push({
                    name: data[i].drilldown.categories[j],
                    y: data[i].drilldown.data[j],
                    color: Highcharts.Color(data[i].color).brighten(brightness).get()
                });
            }
        }
    
        // Create the chart
        $('#container').highcharts({
            chart: {
                type: 'pie'
            },
            title: {
                text: 'Retail Area of Selling Space'
            },
            yAxis: {
                title: {
                    text: 'Total percent market Area'
                }
            },
            plotOptions: {
                pie: {
                    shadow: false,
                    center: ['50%', '50%']
                }
            },
            tooltip: {
        	    valueSuffix: ''
            },
            series: [{
                name: 'Browsers',
                data: browserData,
                size: '60%',
                dataLabels: {
                    formatter: function() {
                        return this.y > 5 ? this.point.name : null;
                    },
                    color: 'white',
                    distance: -30
                }
            }, {
                name: 'Versions',
                data: versionsData,
                size: '80%',
                innerSize: '60%',
                dataLabels: {
                    formatter: function() {
                        // display only if larger than 1
                        return this.y > 1 ? '<b>'+ this.point.name +':</b> '+ this.y+'<br/><b style="color:red">'+((parseInt(this.y*100))/parseInt(tempNumOfChec)).toFixed(2)+'%</b>': null;
                    }
                }
            }]
        });
	}
	
	
	function generateBarChart()
	 {
		//alert(numOfCheckOuts);
        $('#container1').highcharts({
            chart: {
                type: 'bar'
            },
            title: {
            	 text: 'Bar Chart for Zipcode:'+nanZipCode
            },
            subtitle: {
               
            text: 'Stores v/s Average Annual Income'
            },
            xAxis: {
            	title: {
                    text: 'Stores'
                },
                categories: retailNameArray
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Average Annual Sales Volume'
                }
            },
            legend: {
                backgroundColor: '#FFFFFF',
                reversed: true
            },
            plotOptions: {
                series: {
                    stacking: 'normal'
                }
            },
                series: [{
                name: 'Income',
                data:avgIncomeArray
            }]
        });
    }
	$('button').css('z-index','100');
	$('#hiddenDiv').hide();
	//$('#areaCoverage').css('margin-top','0%');
	//$('#incomeCoverage').css('margin-top','1%');
	$('#incomeCoverage').hide();
	$('#areaCoverage').click(function(){
		$('#container').show();
		$('#container1').hide();
		$('#areaCoverage').hide();
		$('#incomeCoverage').show();
	});
	
	$('#incomeCoverage').click(function(){
		$('#container1').show();
		$('#container').hide();
		$('#incomeCoverage').hide();
		$('#areaCoverage').show();
	});
	
	
	/**
	 * PDF
	 */
	$('#exportButton').click(function(){
		
        
        //$('#staticMap').attr("src");
        if(printReadyFlag==0)
        {
        	if(retailNameArray.length == 3)
        		{
        		 var url='http://maps.googleapis.com/maps/api/staticmap?center=33.491278,-112.246763&markers=color:red|33.491278,-112.246763'
                     +'&markers=icon:http://maps.google.com/mapfiles/kml/pal3/icon31.png|33.4936,-112.2909'
                     +'&markers=icon:http://maps.google.com/mapfiles/kml/pal3/icon31.png|33.508,-112.255'
                     +'&markers=icon:http://maps.google.com/mapfiles/kml/pal3/icon31.png|33.4655,-112.2551&zoom=12&size=1000x400&sensor=false';
        		}
        	else
        		{
                var url='http://maps.googleapis.com/maps/api/staticmap?center=33.491278,-112.246763&markers=color:green|33.491278,-112.246763'
                        +'&markers=icon:http://maps.google.com/mapfiles/kml/pal3/icon31.png|33.4936,-112.2909'
                        +'&markers=icon:http://maps.google.com/mapfiles/kml/pal3/icon31.png|33.508,-112.255'
                        +'&markers=icon:http://maps.google.com/mapfiles/kml/pal3/icon31.png|33.4655,-112.2551'
                        +'&markers=icon:http://maps.google.com/mapfiles/kml/pal3/icon31.png|33.4937,-112.2912'
                        +'&markers=icon:http://maps.google.com/mapfiles/kml/pal3/icon31.png|33.4941,-112.2401'
                        +'&markers=icon:http://maps.google.com/mapfiles/kml/pal3/icon31.png|33.4798,-112.2529'
                        +'&markers=icon:http://maps.google.com/mapfiles/kml/pal3/icon31.png|33.4941,-112.2535'
                        +'&markers=icon:http://maps.google.com/mapfiles/kml/pal3/icon31.png|33.5086,-112.2382&zoom=12&size=1000x400&sensor=false';
        		}
                
                /*http://maps.googleapis.com/maps/api/staticmap?center=33.491278,-112.246763&markers=color:red|33.465424,-86.956435
                        &markers=icon:http://maps.google.com/mapfiles/kml/pal3/icon31.png|33.491278,-112.246763&size=800x400&format=jpg&zoom=9&sensor=false
*/                var img = $('<img id="staticMap">'); //Equivalent: $(document.createElement('img'))
                img.attr('src', url);
                img.appendTo('#hiddenDiv');
        }
        printReadyFlag=1;
        $('#container1').show();
        $('#container').show();
        $('#hiddenDiv').show();
        $('#incomeCoverage').hide();
        $('#areaCoverage').hide();
        $('#exportButton').hide();
        $('#footerSection').css('margin-top','62%');
        window.print();
	
	});	
	$('#incomeCoverage').show();
	$('#areaCoverage').show();
});