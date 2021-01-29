
	<style type="text/css">
	/* CSS code to support polylines and polygons in Internet Explorer */
	v\:* {
      behavior:url(#default#VML);
	}
	.hidden {
    	display: none;
	}
	</style>

	<script type="text/javascript" src="http://clients.multimap.com/API/maps/1.2/handy_api12"></script>

	<script type="text/javascript" type="JavaScript ">
      //<![CDATA[
     	var mapviewer, route_finder, route, loading;
var max_zindex = 1000;

function onLoad() {
    mapviewer = new MultimapViewer( document.getElementById( 'mapviewer' ) );
    mapviewer.goToPosition( new MMLocation( new MMLatLon( 42.3508, -71.0717 ) ,15 ) );

    var funcRef = resultsLoaded;
    route_finder = new MMRouteRequester( funcRef );

    loading = document.getElementById( 'loading' );
    loadingStatus( false );
}

function loadingStatus( bool ) {
    document.getElementById('qs1').disabled = bool;
    document.getElementById('qs2').disabled = bool;
    document.getElementById('qs3').disabled = bool;
    document.getElementById('country_code1').disabled = bool;
    document.getElementById('country_code2').disabled = bool;
    document.getElementById('country_code3').disabled = bool;
    document.getElementById('select1').disabled = bool;
    document.getElementById('select2').disabled = bool;
    document.getElementById('select3').disabled = bool;
    document.getElementById('select4').disabled = bool;
    document.getElementById('submitbtn').disabled = bool;
    document.getElementById('submitbtn1').disabled = bool;
    loading.style.display = bool ? 'block' : 'none';
}

function createStepMarker(location, instruction, text, zindex) {
    var marker = mapviewer.createMarker(location, {zIndex: zindex, 'text' : text});
    marker.setInfoBoxContent('<p>' + instruction + '<' + '/p>');
}

function callRoute () {
    cleanUp();

    var locations = new Array();
    addLocation(1, locations)
    addLocation(2, locations)
    addLocation(3, locations)
    addLocation(4, locations)

    loadingStatus( true );
    route = new MMRoute( locations );
    route.optimize_for = 'time';
    route.mode = 'driving';

    var exclude_highways = document.getElementById('exclude_highways').checked;
    if (exclude_highways) {
        route.exclude = 'highways';
    } else {
        route.exclude = '';
    }

    var optimize_intermediates = document.getElementById('optimize_intermediates').checked;
    if (optimize_intermediates) {
        route.optimize_intermediates = 'true';
    } else {
        route.optimize_intermediates = '';
    }


    route.lang = "en_us";
    route_finder.request(route);
}

function cleanUp () {
    var stepsContainer = document.getElementById('routeSteps');
    while (stepsContainer.firstChild) {
        stepsContainer.removeChild(stepsContainer.firstChild);
    }
    stepsContainer.style.display = 'none';
    mapviewer.removeAllOverlays();
    markers = new Array();
}

function resetData () {
    cleanMultipleMatches(1);
    cleanMultipleMatches(2);
    cleanMultipleMatches(3);
    cleanMultipleMatches(4);
    window.location.href = "main.asp";
    window.location.reload( false );

}

function addLocation(num, locations) {
    var qs = document.getElementById('qs' + num);
    var country_code = document.getElementById('country_code' + num);
    var select =  document.getElementById('select' + num);
    var address = new MMAddress();

    if (select.options &&  select.options.length > 1) {
        var coords = select.options[select.selectedIndex].value.split(',');
        locations.push(new MMLocation(new MMLatLon(coords[0], coords[1])));
    } else {
    	if (qs.value != '') {
        	address.qs = qs.value;
        	address.country_code = country_code.value;
        }
        locations.push(new MMLocation(address));
    }
}

function cleanMultipleMatches(num) {
    var qs = document.getElementById('qs' + num);
    var select = document.getElementById('select' + num);
    var addr = document.getElementById('addr' + num);
    var matches = document.getElementById('matches' + num);

    while (select.firstChild) {
        select.removeChild(select.firstChild);
    }
    qs.value = '';
    matches.style.display = 'none';
    addr.style.display = 'block';
}

function resultsLoaded() {
    if (route.error_code) {
        if (route.error_code == 'MM_ROUTE_GEOCODING_ERRORS') {
            processGeocodingErrors (route.geocoding_errors);
        } else {
            alert(route.error_code + ': ' + route.error_explanation);
        }
    } else {
        mapviewer.goToPosition( mapviewer.getAutoScaleLocation( route.bounds ) );
        displayStages(route);
        for( var i = 0, l = route.polyLine.length; i < l; ++i ) {
          mapviewer.addOverlay(route.polyLine[i]);
        }
    }
    loadingStatus( false );
}


function displayStages(route) {
    var curr_step = 1;
    var stages = route.stages;
    var container = document.getElementById('routeSteps');

    var h2 = document.createElement('h2');
    h2.appendChild(document.createTextNode('Result:'));
    container.appendChild(h2);

    var summary = '';
    var  total_mins = route.duration.days*1440 + route.duration.hours*60 + route.duration.minutes;

    if ( total_mins < 25 )

            { summary += 'Distance from our nearest office: ' + total_mins + ' minute(s) '
                                    + '<br> Yes, we do cover your postcode, please continue with booking<br> '

            }

    if ( total_mins >= 25 )

	            { summary += 'Distance from our nearest office: ' + total_mins + ' minute(s) '
	                                    + '<br> Sorry, we do not cover your area, please try us again in a few months :<br> '

	            }


    var p = document.createElement('p');
    p.innerHTML = summary;
    container.appendChild(p);

    for (var count=0; count < stages.length; count++) {

        var stage_summary = '';
        stage_summary += '<strong>Stage ' + (count + 1) + '<' + '/strong>';
        stage_summary += '<br />';
        stage_summary += '<br />';
        stage_summary += '<br />Stage Distance: ' + stages[count].distance.miles + ' mile(s)';
        stage_summary += '<br />Estimated Stage Time: ';
        if (stages[count].duration.days > 0) { stage_summary += stages[count].duration.days + ' day(s) '; }
        if (stages[count].duration.hours > 0) { stage_summary += stages[count].duration.hours + ' hour(s) '; }
        if (stages[count].duration.minutes > 0) { stage_summary += stages[count].duration.minutes + ' minute(s) '; }

        stage_summary += '<br />Summary: ' + stages[count].summary;
        var p = document.createElement('p');
        p.innerHTML = stage_summary;
        //container.appendChild(p);

        var ol = document.createElement('ol');
        ol.id = 'stage_' + count;
        ol.start = curr_step;

        var steps = stages[count].steps;

        for (var stepCount=0; stepCount < steps.length; stepCount++) {
            var text = curr_step;

            var zindex = max_zindex - curr_step + 1;
            if (count == stages.length - 1 && stepCount  == steps.length - 1) {
                zindex = max_zindex;
            }

            var instruction = steps[stepCount].instruction;
            var roadname = steps[stepCount].road_name;
            var roadnumber = steps[stepCount].road_number;

            if (roadname && roadnumber) {
               // instruction += ' ' + roadname + ' (' + roadnumber + ') ';
            } else if (roadname) {
               // instruction += ' ' + roadname + ' ';
            } else if (roadnumber) {
               // instruction += ' ' + roadnumber + ' ';
            }

            var distance = '';
            if (steps[stepCount].distance.miles > 0) {
                //distance += steps[stepCount].distance.miles + ' mile(s) ';

            }
            if (distance != '') {
               // distance = ' - ' + distance
            };

            var li = document.createElement('li');
            //li.innerHTML = instruction + distance;
            //li.innerHTML = '';
            //ol.appendChild(li);

            //createStepMarker(steps[stepCount].start_point, instruction, text, zindex);

            ++curr_step;
        }
        container.appendChild(ol);
    }

    container.style.display = 'block';
    var copyright = '';

    var p = document.createElement('p');
    p.innerHTML = copyright;
    container.appendChild(p);
}

function processGeocodingErrors (errors) {
    for (var i = 0; i < errors.length; i++) {
        if (errors[i].error_code == 'MM_GEOCODE_NO_MATCHES') {
            alert('No matching locations for Location ' + errors[i].input_id);
        } else if (errors[i].error_code == 'MM_GEOCODE_MULTIPLE_MATCHES') {
            var select  = document.getElementById('select' + errors[i].input_id);

            for (var j = 0; j < errors[i].results.length; j++) {
                var displayName = errors[i].results[j].address.display_name;
                var point = errors[i].results[j].coords;
                var option = document.createElement('option');
                option.value = point.lat + ',' +point.lon;
                option.appendChild(document.createTextNode(displayName));
                select.appendChild(option);
                select.selectedIndex=0;
            }

            document.getElementById('matches' + errors[i].input_id).style.display = 'block';
            document.getElementById('addr' + errors[i].input_id).style.display = 'none';
        }
    }
}

MMAttachEvent( window, 'load', onLoad );

     	//]]>
     	</script>



<P>
</P>

<P align=center><BR><BR><!-- The Multimap Map --> </P>
<DIV id=mapviewer style="WIDTH: 1px; HEIGHT: 1px"></DIV><!-- The Search Form -->
<FIELDSET><LEGEND>Area Check: (Make note of available parking and add 8 charge if congestion zone) </LEGEND>
<DIV id=addr1><INPUT id=qs1 type=hidden value="HA8 9LG" name=qs1>
<INPUT id=country_code1 type=hidden value=UK name=country_code1> </DIV>
<DIV class=hidden id=matches1><LABEL for=select1><STRONG>Multiple results found for Location 1. Please select one:</STRONG></LABEL>
<SELECT id=select1></SELECT> </DIV>
<DIV id=addr2><INPUT id=qs2 name=qs2>
<INPUT id=country_code2 type=hidden value=UK name=country_code2> </DIV>
<DIV class=hidden id=matches2><LABEL for=select2><STRONG>Multiple results found for Location 2. Please select one:</STRONG></LABEL>
<SELECT id=select2></SELECT> </DIV>
<DIV id=addr3><LABEL for=qs3></LABEL><INPUT id=qs3 type=hidden name=qs3> <LABEL for=country_code3></LABEL>
<INPUT id=country_code3 type=hidden name=country_codeXXX> </DIV>
<DIV class=hidden id=matches3><LABEL for=select3><STRONG>Multiple results found for Location 3. Please select one:</STRONG></LABEL>
<SELECT id=select3></SELECT> </DIV>
<DIV id=addr4><LABEL for=qs4></LABEL><INPUT id=qs4 type=hidden name=qs4> <LABEL for=country_code4></LABEL>
<INPUT id=country_code4 type=hidden name=country_code4> </DIV>
<DIV class=hidden id=matches4><LABEL for=select4><STRONG>Multiple results found for Location 4. Please select one:</STRONG></LABEL>
<SELECT id=select4></SELECT> </DIV><LABEL for=exclude_highways>
<INPUT id=exclude_highways type=hidden name=exclude_highways> </LABEL><LABEL for=optimize_intermediates>
<INPUT id=optimize_intermediates type=hidden name=optimize_intermediates> </LABEL><BR>
<INPUT id=submitbtn onclick=callRoute() type=button value="Lookup Post Code">
<INPUT id=submitbtn1 type=button onclick="resetData()" value=Clear> </FIELDSET>
<IMG id=loading style="DISPLAY: none" alt="Calculating route..." src="/share/mapviewer/i/loading.gif">
<DIV id=routeSteps></DIV><BR>
