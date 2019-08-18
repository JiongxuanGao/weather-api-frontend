<template>
  <div class="hello">
    <h1>{{ helloMsg }} {{ msg }}</h1>
    <el-divider />
    <el-button type="primary" @click="hello()" :loading="loading4Salute">Say Hi</el-button>
    <el-divider />
    <el-select
      v-model="currentCity"
      filterable
      allow-create
      default-first-option
      loading-text="Loading..."
      no-match-text="No data found."
      placeholder="Please choose your city."
      @change="queryWeatherInfo()"
      :loading="loading4Weather"
    >
      <el-option v-for="item in cities" :key="item.value" :label="item.label" :value="item.value"></el-option>
    </el-select>
    <el-divider />
    <div class="weather-info">
      <el-row>
        <el-col :span="2">
          <div class="grid-content bg-purple">City</div>
        </el-col>
        <el-col :span="4">
          <div class="grid-content bg-purple-light">{{ weatherInfo.cityName }}</div>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="2">
          <div class="grid-content bg-purple">Updated time</div>
        </el-col>
        <el-col :span="4">
          <div class="grid-content bg-purple-light">{{ weatherInfo.updatedTime }}</div>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="2">
          <div class="grid-content bg-purple">Weather</div>
        </el-col>
        <el-col :span="4">
          <div class="grid-content bg-purple-light">{{ weatherInfo.weather }}</div>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="2">
          <div class="grid-content bg-purple">Temperature</div>
        </el-col>
        <el-col :span="4">
          <div class="grid-content bg-purple-light">{{ weatherInfo.temperature }}</div>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="2">
          <div class="grid-content bg-purple">Wind</div>
        </el-col>
        <el-col :span="4">
          <div class="grid-content bg-purple-light">{{ weatherInfo.windSpeed }}</div>
        </el-col>
      </el-row>
    </div>
    <el-divider />
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "HelloWorld",
  props: {
    msg: String
  },
  data() {
    return {
      cities: [
        {
          value: "Sydney",
          label: "Sydney"
        },
        {
          value: "Melbourne",
          label: "Melbourne"
        },
        {
          value: "Wollongong",
          label: "Wollongong"
        }
      ],
      errored: false,
      loading4Salute: false,
      loading4Weather: false,
      helloMsg: "",
      currentCity: "",
      weatherInfo: {
        result: false,
        cityName: "",
        updatedTime: "",
        weather: "",
        temperature: "",
        windSpeed: ""
      }
    };
  },
  mounted() {
    // set default timeout and base url
    axios.defaults.timeout = 1000;
    axios.defaults.baseURL = "http://3.15.198.18:8081";
  },
  methods: {
    hello() {
      this.loading4Salute = true;
      axios
        .get("/hello?name=Jiongxuan", {
          timeout: 30000
        })
        .then(response => {
          this.helloMsg = response.data;
          console.log(response.data);
          console.log(this.helloMsg);
        })
        .catch(error => {
          console.log(error);
          this.errored = true;
        })
        .finally(() => (this.loading4Salute = false));
    },
    queryWeatherInfo() {
      this.loading4Weather = true;
      if (this.currentCity) {
        axios
          .get("/weather?city=" + this.currentCity, {
            timeout: 30000
          })
          .then(response => {
            this.weatherInfo = response.data;
            console.log(response.data);
            if (this.weatherInfo.result) {
              this.weatherInfo.temperature += "°C";
              this.weatherInfo.windSpeed += "km/h";
            } else {
              this.resetWeatherInfo();
            }
          })
          .catch(error => {
            console.log(error);
            this.errored = true;
            // reset the weather info
            this.resetWeatherInfo();
          })
          .finally(() => (this.loading4Weather = false));
      } else {
        console.log("No city selected!");
      }
    },

    resetWeatherInfo() {
      this.weatherInfo.result = false;
      this.weatherInfo.cityName = this.currentCity;
      this.weatherInfo.updatedTime = "-";
      this.weatherInfo.weather = "-";
      this.weatherInfo.temperature = "-";
      this.weatherInfo.windSpeed = "-";
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.el-row {
  margin-bottom: 5px;
  &:last-child {
    margin-bottom: 0;
  }
}
.el-col {
  text-align: center;
  border-radius: 4px;
  margin-right: 4px;
}
.bg-purple {
  background: #d3dce6;
}
.bg-purple-light {
  background: #e5e9f2;
}
.grid-content {
  border-radius: 4px;
  min-height: 36px;
  text-align: left;
  line-height: 36px;
  padding-left: 5px;
}
</style>
