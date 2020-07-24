
<template>
  <div class="box">
    <el-container>
        <router-view name="Nav"></router-view>
      <el-container>
        <el-header style="text-align: left;background-color:#2396F0; color: #fff;">
          <span>BigMing 大迈</span>
          <span @click="exitloign()" style="float:right ;cursor: pointer;" >退出登录</span>
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
    exitloign () {
      this.$router.push('/login')
      // sessionStorage.removeItem('Token')
      if (sessionStorage.getItem('Token') === 'bigmind') {
        sessionStorage.removeItem('Token')
      }
    }
  }
}
</script>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
</style>
