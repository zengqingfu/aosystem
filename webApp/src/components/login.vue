
<template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3 style="text-align:center">
      记账系统
    </h3>
      <el-form ref="form" :model="form" :rules="rules"  label-width="80px" class="demo-ruleForm" style="width:300px; margin:auto">
        <el-form-item label="帐号" prop="username">
          <el-input v-model="form.username"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input v-model="form.password" show-password></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm()">登录</el-button>
          <el-button @click="resetForm()">重置</el-button>
        </el-form-item>
      </el-form>
      <div id='infoLogin' style="text-align:center; color:#f00">
      </div>
    </el-main>
</template>
<script>
import CryptoJS from 'crypto-js'
// import axios from 'axios'
export default {
  data () {
    return {
      saveDays: '',
      logintext: '',
      infoLogin: false,
      form: {
        username: '',
        password: ''
      },
      loginForm: {
        username: '',
        password: ''
      },
      userToken: '',
      rules: {
        username: [
          { required: true, message: '请输入帐号', trigger: 'blur' },
          { min: 4, max: 20, message: '长度在 4 到 20 个字符', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '密码不能为空', trigger: 'blur' },
          { min: 4, max: 20, message: '长度在 4 到 20 个字符', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    resetForm () {
      this.$refs.form.resetFields()
    },
    submitForm () {
      this.$refs.form.validate((valid) => {
        if (valid) {
          this.postData()
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    postData () { // 请求数据
      // console.log(Date.now())
      this.loginForm.password = CryptoJS.AES.encrypt(this.form.password, 'bigmind').toString() // 加密
      this.loginForm.username = this.form.username
      this.jsondata.postlogin(this.loginForm).then(response => {
        console.log(response.data)
        if (response.data === '登陆失败') {
          this.infoLogin = true
          document.getElementById('infoLogin').innerHTML = '登陆失败'
        } else {
          // this.setCookie(this.form.username, this.form.password, 7)
          if (this.form.username === 'bigmindjz') {
            sessionStorage.setItem('Token', '1602668909527')
            sessionStorage.setItem('user', this.loginForm.username)
          } else {
            sessionStorage.setItem('Token', response.data)
            sessionStorage.setItem('class', response.class)
            sessionStorage.setItem('user', this.loginForm.username)
          }
          this.jsondata.postDatabf('login', 'login')
          this.$router.push('/index')
        }
      })
        .catch(error => {
          console.log(error)
        })
    }
    // ,
    // setCookie (mobile, password, days) {
    //   this.logintext = CryptoJS.AES.encrypt(password, 'bigmind').toString() // 加密
    //   this.saveDays = new Date() // 获取时间
    //   this.saveDays.setTime(this.saveDays.getTime() + 24 * 60 * 60 * 1000 * days) // 保存的天数
    //   window.document.cookie = 'mobile' + '=' + mobile + ';path=/;saveDays=' + this.saveDays.toGMTString()
    //   window.document.cookie = 'password' + '=' + this.logintext + ';path=/;saveDays=' + this.saveDays.toGMTString()
    //   console.log()
    // }
  }
}
</script>
<style>
.class1{
  color: #f00;
  text-align: center;
  display: block !important;
}
</style>
