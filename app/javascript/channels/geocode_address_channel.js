import consumer from "channels/consumer"

document.addEventListener("turbo:load", () => {
  consumer.subscriptions.create("GeocodeAddressChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {    
      if (data.latitude && data.longitude) {
        document.getElementById("latitude_value").innerText = data.latitude;
        document.getElementById("longitude_value").innerText = data.longitude;
      }
    }
  });
});