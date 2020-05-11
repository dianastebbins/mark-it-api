
//GLOBAL VARIABLES OF USER LOCATION
let userLat;
let userLong;

// ==============================
// OPENING MAP - USER GEOLOCATION
// ==============================

// GET USER LOCATION AND RUN getMap
navigator.geolocation.getCurrentPosition(getMap);

// getMap CREATES MAP WITH USER LOCATION ICON
function getMap(position) {

    userLat = position.coords.latitude;
    userLong = position.coords.longitude;
    mapboxgl.accessToken = 'pk.eyJ1IjoidGhlLW1lZGl1bS1wbGFjZSIsImEiOiJja2EwMHcxOWwwa2ZmM2hvMG9nNHhoZXdrIn0.UBg5PKfAeHOcP_xn2SEkTw';
    var map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v9',
        center: [userLong, userLat],  // [-96, 37.8]
        zoom: 9
    });

    // USER MARKER PULL FROM GLOBAL LOCATION VARIABLE
    var marker = new mapboxgl.Marker()
        .setLngLat([userLong, userLat])
        .addTo(map);
}


$("#market-search-form").on("submit", (event) => {
    event.preventDefault();
    getResults($("#market-search").val().trim());
})

function getResults(zip) {
    // create array to hold geojson objects
    const marketArr = [];
    // or
    // function getResults(lat, lng) {
        
    // =======================================
    // FIRST AJAX REQUEST FOR MARKET NAME & ID
    // =======================================
    $.ajax({
        type: "GET",
        contentType: "application/json; charset=utf-8",
        // submit a get request to the restful service zipSearch or locSearch.
        url: "http://search.ams.usda.gov/farmersmarkets/v1/data.svc/zipSearch?zip=" + zip,
        // or
        // url: "http://search.ams.usda.gov/farmersmarkets/v1/data.svc/locSearch?lat=" + lat + "&lng=" + lng,
        dataType: 'jsonp'
    })
        .then((dat) => {
            // console.log(dat.results)
            // ======================================
            // SECOND AJAX REQUEST FOR MARKET DETAILS
            // ======================================
            function getDetails(id) {
                $.ajax({
                    type: "GET",
                    contentType: "application/json; charset=utf-8",
                    // submit a get request to the restful service mktDetail.
                    url: "http://search.ams.usda.gov/farmersmarkets/v1/data.svc/mktDetail?id=" + id,
                    dataType: 'jsonp'
                })
                    .then((data) => {
                        // CREATE GEOJSON OBJECT
                        const newMarketObj = {
                            'type': 'Feature',
                            'geometry': {
                                'type': 'Point'
                            },
                            'properties': {
                                'title': 'awesome spot',
                                'icon': 'circle'
                            }
                        };

                        // GET LAT AND LONG FROM data.marketdetails.GoogleLink 
                        // AND MAKE ARRAY [long,lat]
                        // console.log(data.marketdetails.GoogleLInk.split('-'))
                        const lat = parseFloat(data.marketdetails.GoogleLink.split('=').pop().split('%')[0])
                        const long = parseFloat("-" + (data.marketdetails.GoogleLink.split('-').pop().split('%')[0]))

                        const coords = [long, lat];
                        console.log(coords);

                        // ADD MARKET DETAILS TO GEOJSON OBJECT newMarketObj
                        newMarketObj.geometry.coordinates = coords;
                        newMarketObj.properties.products = data.marketdetails.Products;
                        newMarketObj.properties.schedule = data.marketdetails.Schedule;
                        newMarketObj.properties.address = data.marketdetails.Address;
                        newMarketObj.properties.googleLink = data.marketdetails.GoogleLink;
                        marketArr.push(newMarketObj);
                    });
            }

            // LOOP THROUGH ARRAY OF MARKET IDS AND NAMES
            // AND RUN getDetails FOR EACH ENTRY - 
            // THIS RUNS THE SECOND AJAX REQUEST
            dat.results.forEach(market => {
                getDetails(market.id);
                console.log(market.marketname)
            });

        })
        .then(() => {
            // FIXME: TIMEOUT CURRENTLY SET TO GIVE ARRAY TIME TO POPULATE
            // FIXME: KINDA HACKY RIGHT NOW, NEED TO FIX LATER
            setTimeout(function () {
                console.log(marketArr);
                displayMap(marketArr);
            }, 1000);
        });
}


function displayMap(locObjArr) {
    mapboxgl.accessToken = 'pk.eyJ1IjoidGhlLW1lZGl1bS1wbGFjZSIsImEiOiJja2EwMHcxOWwwa2ZmM2hvMG9nNHhoZXdrIn0.UBg5PKfAeHOcP_xn2SEkTw';
    const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v9',
        center: locObjArr[0].geometry.coordinates, //[-96, 37.8],
        zoom: 6
    });

    map.on('load', function () {
        // Add a new source from our GeoJSON data and
        // set the 'cluster' option to true. GL-JS will
        // add the point_count property to your source data.
        map.addSource('markets', {
            type: 'geojson',
            // Point to GeoJSON data.
            'data': {
                'type': 'FeatureCollection',
                'features': locObjArr
            },
            cluster: true,
            clusterMaxZoom: 14, // Max zoom to cluster points on
            clusterRadius: 50 // Radius of each cluster when clustering points (defaults to 50)
        });

        map.addLayer({
            id: 'clusters',
            type: 'circle',
            source: 'markets',
            filter: ['has', 'point_count'],
            paint: {
                // Use step expressions (https://docs.mapbox.com/mapbox-gl-js/style-spec/#expressions-step)
                // with three steps to implement three types of circles:
                //   * Blue, 20px circles when point count is less than 100
                //   * Yellow, 30px circles when point count is between 100 and 750
                //   * Pink, 40px circles when point count is greater than or equal to 750
                'circle-color': [
                    'step',
                    ['get', 'point_count'],
                    '#51bbd6',
                    100,
                    '#f1f075',
                    750,
                    '#f28cb1'
                ],
                'circle-radius': [
                    'step',
                    ['get', 'point_count'],
                    20,
                    100,
                    30,
                    750,
                    40
                ]
            }
        });

        map.addLayer({
            id: 'cluster-count',
            type: 'symbol',
            source: 'markets',
            filter: ['has', 'point_count'],
            layout: {
                'text-field': '{point_count_abbreviated}',
                'text-font': ['DIN Offc Pro Medium', 'Arial Unicode MS Bold'],
                'text-size': 12
            }
        });

        map.addLayer({
            id: 'unclustered-point',
            type: 'circle',
            source: 'markets',
            filter: ['!', ['has', 'point_count']],
            paint: {
                'circle-color': '#11b4da',
                'circle-radius': 10,
                'circle-stroke-width': 1,
                'circle-stroke-color': '#fff'
            }
        });

        // inspect a cluster on click
        map.on('click', 'clusters', function (e) {
            const features = map.queryRenderedFeatures(e.point, {
                layers: ['clusters']
            });
            const clusterId = features[0].properties.cluster_id;
            map.getSource('markets').getClusterExpansionZoom(
                clusterId,
                function (err, zoom) {
                    if (err) return;

                    map.easeTo({
                        center: features[0].geometry.coordinates,
                        zoom: zoom
                    });
                }
            );
        });

        // When a click event occurs on a feature in
        // the unclustered-point layer, open a popup at
        // the location of the feature, with
        // description HTML from its properties.
        map.on('click', 'unclustered-point', function (e) {
            const coordinates = e.features[0].geometry.coordinates.slice();
            const address = e.features[0].properties.address.trim();
            const schedule = e.features[0].properties.schedule.trim();
            const products = e.features[0].properties.products.trim();
            const googleLink = e.features[0].properties.googleLink.trim();

            // Ensure that if the map is zoomed out such that
            // multiple copies of the feature are visible, the
            // popup appears over the copy being pointed to.
            while (Math.abs(e.lngLat.lng - coordinates[0]) > 180) {
                coordinates[0] += e.lngLat.lng > coordinates[0] ? 360 : -360;
            }

            new mapboxgl.Popup()
                .setLngLat(coordinates)
                .setHTML(
                    `<h1>Mark-It!</h1><p><strong>Address:</strong> ${address}<br><strong>Schedule:</strong> ${schedule}<strong>Products:</strong> ${products}</p>
                    <br><a href="${googleLink}" target="_blank">click here</a>`
                )
                .addTo(map);
        });

        map.on('mouseenter', 'clusters', function () {
            map.getCanvas().style.cursor = 'pointer';
        });
        map.on('mouseleave', 'clusters', function () {
            map.getCanvas().style.cursor = '';
        });

        // USER MARKER PULLS FROM GLOBAL USER LOCATION VARIABLES
        var marker = new mapboxgl.Marker()
            .setLngLat([userLong, userLat])
            .addTo(map);
    });
    // map.on('load', function () {
    //     map.addSource('points', {
    //         'type': 'geojson',
    //         'data': {
    //             'type': 'FeatureCollection',
    //             'features': locObjArr
    //         }
    //     })
    //     map.addLayer({
    //         'id': 'points',
    //         'type': 'symbol',
    //         'source': 'points',
    //         'layout': {
    //             // get the icon name from the source's "icon" property
    //             // concatenate the name to get an icon from the style's sprite sheet
    //             'icon-image': ['concat', ['get', 'icon'], '-15'],
    //             // get the title name from the source's "title" property
    //             'text-field': ['get', 'title'],
    //             'text-font': ['Open Sans Semibold', 'Arial Unicode MS Bold'],
    //             'text-offset': [0, 0.6],
    //             'text-anchor': 'top'
    //         }
    //     });
    // });
}

//TODO: get lng and lat from market map string for each USDA api result and put into array
//TODO: map through geo info array to create objects for map markers

