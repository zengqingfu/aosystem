
<template>
  <div class="box">
    <el-container>
        <router-view name="Nav"></router-view>
      <el-container>
        <el-header style="text-align: left;background-color:#2396F0; color: #fff;">
          <span class="titlebox">{{comtitle}}</span>
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
      public: [],
      comtitle: 'BigMind 大迈'
    }
  },
  mounted () {
    if (window.location.href.match('mdjz') || window.location.href.match('3100')) {
      this.comtitle = '迈动'
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
  transition: all 1s cubic-bezier(1.0, 0, 0, 0);
}
.slide-fade-leave-active {
  transition: all .3s ease ;
}
.slide-fade-enter, .slide-fade-leave-to
/* .slide-fade-leave-active for below version 2.1.8 */ {
  transform: translateX(10px);
  opacity: 0;
}
</style>
