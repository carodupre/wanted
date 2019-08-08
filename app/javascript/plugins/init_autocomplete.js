import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('booking_address');
  if (addressInput) {
    places({ container: addressInput });
  }

  const locationInput = document.getElementById('service_location');
  if (locationInput) {
    places({ container: locationInput });
  }
};

export { initAutocomplete };
