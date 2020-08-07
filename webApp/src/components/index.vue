
<template>
  <div class="box">
    <el-container>
        <router-view name="Nav"></router-view>
      <el-container>
        <el-header style="text-align: left;background-color:#2396F0; color: #fff;">
          <span>BigMind 大迈</span>
          <span @click="exitloign()" style="float:right ;cursor: pointer;" >退出登录</span>
        </el-header>
        <transition name="slide-fade" mode="out-in">
          <router-view name="content"></router-view>
        </transition>
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
      // console.log(window.location.href.match('login'))
      sessionStorage.clear()
      if (window.location.href.match('login')) {
      } else {
        this.$router.push('/login')
      }
    }
  }
}
</script>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
.slide-fade-enter-active {
  transition: all .5s ease;
}
.slide-fade-leave-active {
  transition: all .5s ease;
}
.slide-fade-enter, .slide-fade-leave-to
/* .slide-fade-leave-active for below version 2.1.8 */ {
  transform: translateX(10px);
  opacity: 0;
}
</style>
