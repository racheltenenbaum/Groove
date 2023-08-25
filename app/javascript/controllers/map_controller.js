import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'
{/* <script src="path-to-your-map-controller.js"></script> */}

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/mapbox/streets-v12',
      center: [0, 0],
      zoom: 10,
    });
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

    #addMarkersToMap() {
      this.markersValue.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.info_window)
        const customMarker = document.createElement("div")
        customMarker.innerHTML = marker.marker_html
        new mapboxgl.Marker(customMarker)
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(this.map)
      })
    }

    #fitMapToMarkers() {
      const bounds = new mapboxgl.LngLatBounds()
      this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
      this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 5000  })
    }


  //   openMapFullScreen() {
  //     const mapSection = document.getElementById("map");
  //     mapSection.style.position = "fixed";
  //     mapSection.style.width = "100%";
  //     mapSection.style.height = "100%";
  //     mapSection.style.top = "0";
  //     mapSection.style.left = "0";
  //     mapSection.style.zIndex = "9999";

  //     this.map = new mapboxgl.Map({
  //       container: mapSection,
  //       style: 'mapbox://styles/mapbox/streets-v12',
  //       center: [0, 0],
  //       zoom: 10,
  //   });
  // }
}
