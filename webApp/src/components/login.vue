
<template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3 style="text-align:center">
      登录
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
export default {
  data () {
    return {
      infoLogin: false,
      form: {
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
      // console.log(CryptoJS.AES.encrypt('1111', '123456'))
      // var jiami = CryptoJS.AES.encrypt(this.form.password, 'bigmind').toString() // 加密码
      // var bytes = CryptoJS.AES.decrypt(jiami, 'bigmind').toString(CryptoJS.enc.Utf8) // 解密码
      this.form.password = CryptoJS.AES.encrypt(this.form.password, 'bigmind').toString() // 加密
      this.jsondata.postlogin(this.form).then(response => {
        sessionStorage.setItem('Token', response.data)
        if (response.data === '登陆失败') {
          this.infoLogin = true
          document.getElementById('infoLogin').innerHTML = '登陆失败'
        } else {
          // console.log(sessionStorage.getItem('Token'))
          this.$router.push('/index')
        }
      })
        .catch(error => {
          console.log(error)
        })
    }
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
