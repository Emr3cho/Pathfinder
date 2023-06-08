let data;
window.addEventListener("load", async () => {
    let townName = document.querySelector("#weather > h2").textContent.split(" ")[0];
    data = await getDataForTown(townName);
    setImageLastUpdatedAndCurrentStatus(townName);
    setDetails(townName);
})
function setImageLastUpdatedAndCurrentStatus(){
    const currentData = data[1];
    let lastUpdated = document.createElement("h6");
    lastUpdated.id = "last-updated";
    lastUpdated.textContent = 'last updated: ' + currentData.get('lastUpdated').split(" ")[1];
    let divImage = document.createElement("div");
    divImage.classList.add("image-container");
    let img = document.createElement("img");
    img.src = currentData.get('picURL');
    divImage.appendChild(img);
    let weatherType = document.createElement('h6');
    weatherType.id = "weather-type";
    weatherType.textContent = currentData.get("weatherDesc")
    const elementToAppend = document.querySelector('#weather');
    elementToAppend.appendChild(lastUpdated);
    elementToAppend.appendChild(divImage);
    elementToAppend.appendChild(weatherType);
}
function setDetails(){
    let detailsDiv = document.createElement("div");
    detailsDiv.classList.add("details")
    let currentData =  data[0];
    for (const [key, value] of currentData.entries()) {
        detailsDiv.appendChild(createElement(key, value));
    }
    document.querySelector("#weather").appendChild(detailsDiv);
}
function createElement(label, value) {
    let div = document.createElement("div");
    div.classList.add("item");
    let spanLabel = document.createElement("span");
    spanLabel.classList.add("label");
    spanLabel.textContent = label + ": ";
    let spanValue = document.createElement("span");
    spanValue.classList.add("value");
    spanValue.textContent = value;
    div.appendChild(spanLabel);
    div.appendChild(spanValue);
    return div;
}
async function getDataForTown(townName) {
    const URL = `https://api.weatherapi.com/v1/current.json?key=ebddf8c7e18f4ecfbdd93841231005&q=${townName}&aqi=yes`;
    const response = await fetch(URL);
    const responseJSON = await response.json();
    const pictureURL = responseJSON.current.condition.icon;
    const weatherDescription = responseJSON.current.condition.text;
    const lastUpdated = responseJSON.current.last_updated;
    const temp = responseJSON.current.temp_c + " °C";
    const feelsLike = responseJSON.current.feelslike_c + " °C";
    const humidity = responseJSON.current.humidity;
    const cloudiness = responseJSON.current.cloud;
    const windSpeed = responseJSON.current.wind_kph + " km/h";
    const windDirection = responseJSON.current.wind_dir;
    const pressure = responseJSON.current.pressure_mb + " hPa";
    const visibility = responseJSON.current.vis_km + " km";
    const uvIndex = responseJSON.current.uv;
    const airQuality = Number(responseJSON.current.air_quality.co).toFixed(1);

    const map = new Map();
    const map2 = new Map();

    map2.set('picURL', pictureURL);
    map2.set('weatherDesc', weatherDescription);
    map2.set('lastUpdated', lastUpdated);
    map.set('Temperature', temp);
    map.set('Feels Like', feelsLike);
    map.set('Humidity', humidity);
    map.set('Cloudiness', cloudiness);
    map.set('Wind Speed', windSpeed);
    map.set('Wind Direction', windDirection);
    map.set('Pressure', pressure);
    map.set('Visibility', visibility);
    map.set('UV Index', uvIndex);
    map.set('Air Quality(CO)', airQuality);

    return [map, map2];
}