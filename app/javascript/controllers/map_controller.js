import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

// Connects to data-controller="map"
export default class extends Controller {
  static targets = ["mapButton"]

  static values = {
    apiKey: String,
    markers: Array
  }

  // resizeMap() {
  //   console.log("firing")
  //   this.map.resize();
  //   console.log("firing")

  // }



  connect() {
    console.log(this.mapButtonTarget)
    console.log("hello from map controller")

    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/mapbox/streets-v10',
      center: [-0.12765, 51.5073359],
      zoom: 9
    });
      this.map.resize()
      console.log(document.getElementsByClassName('mapboxgl-canvas')[0])
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

  }
