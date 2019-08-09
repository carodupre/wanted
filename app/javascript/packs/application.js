// CSS
import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

// Functions

import { initMapbox } from '../plugins/init_mapbox';
initMapbox();

import { initAutocomplete } from '../plugins/init_autocomplete';
initAutocomplete();
