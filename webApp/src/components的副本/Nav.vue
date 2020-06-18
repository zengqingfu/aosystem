<template>
  <el-menu
    router
    default-active="1-4-1"
    background-color="#545c64"
    text-color="#fff"
    class="el-menu-vertical-demo"
    @open="handleOpen"
    @close="handleClose"
    :collapse="isCollapse"
    :default-openeds="openeds"
  >
    <el-submenu index="1" :collapse="true">
      <template slot="title">
        <i class="el-icon-location"></i>
        <span slot="title">项目管理</span>
      </template>
      <el-menu-item-group>
        <el-menu-item index="/index">
          <i class="el-icon-menu"></i>进行中项目
        </el-menu-item>
        <!-- <el-menu-item index="1">
          <i class="el-icon-s-flag"></i>已归档项目
        </el-menu-item> -->
        <el-menu-item index="/Customerlist">
          <i class="el-icon-user-solid"></i>客户管理
        </el-menu-item>
        <el-menu-item index="/SupplierList">
          <i class="el-icon-s-shop"></i>供应商管理
        </el-menu-item>
      </el-menu-item-group>
    </el-submenu>
    <el-submenu index="2" :collapse="true">
      <template slot="title">
        <i class="el-icon-location"></i>
        <span slot="title">帐目报表</span>
      </template>
      <el-menu-item-group>
        <el-menu-item index="/Receivableslist">
          <i class="el-icon-menu"></i>收入报表
        </el-menu-item>
        <el-menu-item index="/expenditurelist">
          <i class="el-icon-s-flag"></i>支出报表
        </el-menu-item>
        <!-- <el-menu-item index="2-3">
          <i class="el-icon-user-solid"></i>利润报表
        </el-menu-item> -->
      </el-menu-item-group>
    </el-submenu>
    <el-menu-item index="3">
      <i class="el-icon-setting"></i>
      <span slot="title">暂无内容</span>
    </el-menu-item>
  </el-menu>
</template>
<script scoped>
export default {
  data () {
    return {
      openeds: ['1'],
      isCollapse: false
    }
  },
  methods: {
    handleOpen (key, keyPath) {
      console.log(key, keyPath)
    },
    handleClose (key, keyPath) {
      console.log(key, keyPath)
    }

  }
}
</script>
