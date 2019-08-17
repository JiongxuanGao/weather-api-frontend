<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <el-divider />
    <el-button type="primary" @click="hello()">Say Hi!</el-button>
    <el-divider />
    <el-select v-model="currentCity" filterable placeholder="Please choose your city">
      <el-option v-for="item in cities" :key="item.value" :label="item.label" :value="item.value"></el-option>
    </el-select>
    <el-divider />
    <div class="weather-info">
      <el-row>
        <el-col :span="2">
          <div class="grid-content bg-purple">City</div>
        </el-col>
        <el-col :span="4">
          <div class="grid-content bg-purple-light">{{ currentCity }}</div>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="2">
          <div class="grid-content bg-purple">Updated time</div>
        </el-col>
        <el-col :span="4">
          <div class="grid-content bg-purple-light">{{ currentCity }}</div>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="2">
          <div class="grid-content bg-purple">Weather</div>
        </el-col>
        <el-col :span="4">
          <div class="grid-content bg-purple-light">{{ currentCity }}</div>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="2">
          <div class="grid-content bg-purple">Temperature</div>
        </el-col>
        <el-col :span="4">
          <div class="grid-content bg-purple-light">{{ currentCity }}</div>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="2">
          <div class="grid-content bg-purple">Wind</div>
        </el-col>
        <el-col :span="4">
          <div class="grid-content bg-purple-light">{{ currentCity }}</div>
        </el-col>
      </el-row>
    </div>
    <el-divider />
  </div>
</template>

<script>
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
      loading: false,
      helloMsg: "",
      currentCity: ""
    };
  },
  methods: {
    hello() {
      // axios
      //   .get('http://3.15.198.18:8081/hello?name=Jiongxuan')
      //   .then(response => {
      //     this.helloMsg = response.data;
      //     console.log(response.data);
      //     console.log(helloMsg);
      //   })
      //   .catch(error => {
      //     console.log(error)
      //     this.errored = true
      //   })
      //   .finally(() => this.loading = false)
    },
    queryWeatherInfo() {
      // TODO
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
li {
  display: inline-block;
  margin: 0 10px;
}
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
