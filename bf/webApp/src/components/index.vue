
<template>
  <div class="box">
    <el-container>
        <router-view name="Nav"></router-view>
      <el-container>
        <el-header style="text-align: left;background-color:#2396F0; color: #fff;">
          <span @click="getdataform ()"> 公司名称</span>
        </el-header>
        <router-view name="content"></router-view>
      </el-container>
    </el-container>
  </div>

</template>

<script scoped>
export default {
  data () {
    return {
      public: []
    }
  },
  methods: {
    getdataform () {

    }
  }

}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
