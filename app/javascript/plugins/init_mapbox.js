import mapboxgl from 'mapbox-gl';
import { mapTab } from './map_tab';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: [103.8310042, 1.3061959],
      zoom: 5,
    });
    const markers = JSON.parse(mapElement.dataset.markers);
      markers.forEach((marker) => {
        const popup = new mapboxgl.Popup({ 'anchor': 'top' }).setHTML(marker.infoWindow);
        new mapboxgl.Marker()
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(map);
      });

    // Addding a fix user marker
    // el.className = 'marker';
    // el.style.backgroundImage =
    // 'url(https://placekitten.com/g/' +
    // marker.properties.iconSize.join('/') +
    // '/)';
    // el.style.width = marker.properties.iconSize[0] + 'px';
    // el.style.height = marker.properties.iconSize[1] + 'px';
    const el = document.createElement('div');
    el.className = 'marker';
    el.style.backgroundImage = `url(${mapElement.dataset.profileUrl})`;
    // make a marker for each feature and add to the map
    const marker = new mapboxgl.Marker(el)
      .setLngLat([103.8310042, 1.3061959])
      .addTo(map);

    fitMapToMarkers(map, markers);
    mapTab(map);
    // setTimeout(()=>{
    //   map.resize()
    // },1000)

    // This geolocate works only on browser level so far
    // map.addControl(
    //   new mapboxgl.GeolocateControl({
    //   positionOptions: {
    //     enableHighAccuracy: true
    //   },
    //   trackUserLocation: true
    //   })
    // );

    // This flyTo should help locate the user with fixed location
    // const flyMe = document.getElementById('fly')
    // flyMe.addEventListener('click', () =>  {
    //   // Fly to LeWagon SG location
    //   map.flyTo({
    //     // -1.3061959,103.8310042
    //     // center: [103.8310042, 1.3061959],
    //     essential: true // this animation is considered essential with respect to prefers-reduced-motion
    //   });
    // });
  }
};


const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 30, maxZoom: 15, duration: 0 });
};

export { initMapbox };
