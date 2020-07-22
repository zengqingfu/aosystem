
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
      <div id='infoLogin'  v-bind:class="{'class1': infoLogin}" style="display:none">
        登陆失败
      </div>
    </el-main>
</template>
<script scoped>
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
          { min: 4, max: 20, message: '长度在 8 到 20 个字符', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '密码不能为空', trigger: 'blur' },
          { min: 4, max: 20, message: '长度在 8 到 20 个字符', trigger: 'blur' }
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
      this.jsondata.postlogin(this.form).then(response => {
        sessionStorage.setItem('Token', response.data)
        if (response.data === '登陆失败') {
          this.infoLogin = true
        } else {
          console.log(sessionStorage.getItem('Token'))
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
