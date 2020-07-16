
<template>
  <div id="app">
    <index></index>
  </div>
</template>

<script>
import index from './components/index'

export default {
  name: 'Appweb',
  components: {
    index
  },
  methods: {
    fatherMethod () {
      // console.log('测试')
    }
  }

}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 0px;
}
  .el-dialog{
    margin-top: 50px !important;
  }
  body {
    margin: 0px;
  }

  html,
  body,
  #app,
  .box,
  section.el-container {
    height: 100%;
  }

  .el-menu-vertical-demo:not(.el-menu--collapse) {
    width: 200px;
    min-height: 400px;
    text-align: left;
  }

  .el-header,
  .el-footer {
    background-color: #B3C0D1;
    color: #333;
    text-align: center;
    line-height: 60px;
  }

  .el-aside {
    background-color: #D3DCE6;
    color: #333;
    text-align: center;
    line-height: 200px;
  }

  .el-main {
    background-color: #ffffff;
    color: #333;
    text-align: left;
    line-height: 160px;
  }

  body>.el-container {
    margin-bottom: 40px;
  }

  .el-container:nth-child(5) .el-aside,
  .el-container:nth-child(6) .el-aside {
    line-height: 260px;
  }

  .el-container:nth-child(7) .el-aside {
    line-height: 320px;
  }
  .el-table th, .el-table tr{
    cursor: pointer;
  }
  .el-row {
    margin-bottom: 20px;

  }
  .el-col {
    border-radius: 4px;
  }
  .bg-purple-dark {
    background: #fff;
  }
  .bg-purple {
    background: #fff;
  }
  .bg-purple-light {
    background: #fff;
  }
  .grid-content {
    border-radius: 4px;
    min-height: 36px;
  }
  .row-bg {
    padding: 10px 0;
    background-color: #f9fafc;
  }
  .el-dialog__body{
    padding:10px 20px;
  }
  .TransactionSizebox {
    margin: 0px 10px;
    padding-bottom: 10px;

  }
  .el-table td, .el-table th{
    padding: 5px 0px !important;
    text-align: center !important;
  }
  .projectdateil td, .projectdateil th{
    padding: 5px 0px !important;
    text-align: left !important;
  }
  .el-table__footer-wrapper {
    font-weight: bold;
}
.el-table__body-wrapper{
  height: auto !important;
  max-height: 85%;
}
</style>
