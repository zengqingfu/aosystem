<template>
  <el-menu
    router
    default-active="1-4-1"
    background-color="#545c64"
    text-color="#fff"
    class="el-menu-vertical-demo"
    :mode="horizontalfn"
    menu-trigger="click"
    @open="handleOpen"
    @close="handleClose"
    :collapse="isCollapse"
    :default-openeds="openeds"
  >
    <el-submenu index="1">
      <template slot="title">
        <i class="el-icon-s-fold"></i>
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
    <el-submenu index="2">
      <template slot="title">
        <i class="el-icon-menu"></i>
        <span slot="title">帐目报表</span>
      </template>
      <el-menu-item-group>
        <el-menu-item index="/Receivableslist">
          <i class="el-icon-menu"></i>项目收入报表
        </el-menu-item>
        <!-- <el-menu-item index="/expenditurelist">
          <i class="el-icon-s-flag"></i>项目支出报表
        </el-menu-item> -->
        <el-menu-item index="/profitlist">
          <i class="el-icon-s-order"></i>项目利润报表
        </el-menu-item>
        <el-menu-item index="/SupplierData">
          <i class="el-icon-s-check"></i>供应商应付表
        </el-menu-item>
        <el-menu-item index="/stafflist">
          <i class="el-icon-s-check"></i>外包应付表
        </el-menu-item>
        <el-menu-item index="/staff">
          <i class="el-icon-s-check"></i>员工应付表
        </el-menu-item>
        <el-menu-item index="/searchpage">
          <i class="el-icon-s-check"></i>表单检索-每期
        </el-menu-item>
        <el-menu-item index="/searchht">
          <i class="el-icon-s-check"></i>表单检索-合同
        </el-menu-item>
        </el-menu-item-group>
      </el-submenu>
      <el-menu-item v-show="hidebox" @click="boxshow">
        <i class="el-icon-arrow-left"></i>
        <span slot="title">收起</span>
      </el-menu-item>
      <el-menu-item v-show="showbox" @click="boxshow">
        <i class="el-icon-arrow-right" ></i>
        <span slot="title">展开</span>
      </el-menu-item>
    </el-menu>
</template>
<script scoped>
export default {
  data () {
    return {
      horizontalfn: 'vertical',
      openeds: ['1', '2'],
      isCollapse: false,
      showbox: false,
      hidebox: true
    }
  },
  mounted () {
    this.boxplay()
  },
  methods: {
    // clickend () {
    //   setTimeout(() => {
    //   }, timeout);
    // }
    boxplay () {
      if (document.body.offsetWidth < 980) {
        this.horizontalfn = 'horizontal'
        this.isCollapse = true
        this.showbox = false
        this.hidebox = false
      }
    },
    boxshow () {
      this.showbox = !this.showbox
      this.hidebox = !this.hidebox
      this.isCollapse = !this.isCollapse
    },
    handleOpen (key, keyPath) {
      // console.log(key, keyPath)
    },
    handleClose (key, keyPath) {
      // console.log(key, keyPath)
    }

  }
}
</script>
