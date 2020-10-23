
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
  html{
    overflow: hidden !important;
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
    padding: 5px 15px !important;
    text-align: left !important;
    background-color: #fff;
    font-size: 14px;
    color: #666;
    line-height: 24px;
  }
  /* .el-table__footer-wrapper {
    font-weight: bold;
    position: absolute;
    bottom: -35px;
} */
.el-table__body-wrapper{
  height: auto !important;
  max-height: 93%;
}
.el-table {
  border: none !important;
  overflow: visible !important;
  border-bottom: 1px solid #eee !important;
}
.el-table--border::after, .el-table--group::after, .el-table::before {
    content: '';
    position: absolute;
    background-color: #fff !important;
    z-index: 1;
}
.el-table__body-wrapper, .el-table__header-wrapper {
  border: 1px solid #eee;
  box-sizing: border-box;
  width: 99.9% !important;
}
.el-table .gutter{
  border-right: 1px solid #eee !important;
  background-color: #ebeef5 !important;
}
.el-table__footer-wrapper {
    z-index: 9 !important;
    position: relative !important;
    width: 99.9% !important;
}
.el-table .cell{
  min-height: 24px;
}

@media screen and (max-width: 780px) {
  .el-menu--collapse {
    position: absolute !important;
    z-index: 999 !important;
    top: 0px !important;
    left: 0px !important;
    background-color:rgb(35, 150, 240) !important;
    width: 130px !important;
  }
  .el-submenu__title{
    background-color:rgb(35, 150, 240) !important;
  }
  .el-menu .el-icon-s-fold, .el-menu .el-icon-menu {
    color: #fff !important;
  }
  .el-menu--collapse .el-submenu{
    display: inline-block;
    width: 60px;
  }
  .titlebox{
    display: inline-block;
    padding-left: 140px;
  }
  .el-menu--vertical{
    margin-top: 60px !important;
    margin-left: -60px !important;
  }
  .el-table .cell{
    white-space: nowrap;
  }
}
</style>
