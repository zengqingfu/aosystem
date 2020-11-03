 <template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3>
      客户列表{{this.$route.params.id}}
      <el-button type="primary" style="float: right;" @click="dialogFormVisible = true">添加</el-button>
      <el-button style="float: right;margin-right:20px" onclick="exportExcel('#Customerlist')">点击导出</el-button>
      <!-- <el-button style="float: right;margin-right:20px" @click="jsondata.exportExcel('#Customerlist')">点击导出</el-button> -->
    </h3>
    <el-dialog title="添加客户" :visible.sync="dialogFormVisible">
      <el-form ref="form" :model="form" :rules="rules"  label-width="80px" class="demo-ruleForm">
        <el-form-item label="客户名称" prop="CustomerName">
          <el-input v-model="form.CustomerName"></el-input>
        </el-form-item>
        <el-form-item label="备注" prop="CustomerContent">
          <el-input type="textarea" v-model="form.CustomerContent" ></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm('form')">确定添加</el-button>
          <el-button @click="resetForm('form')">重置</el-button>
          <el-button @click="dialogFormVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
    <el-dialog :title="formModify.ReceivablesName" :visible.sync="dialogAddVisible" >
      <el-form ref="formModify" :model="formModify" :rules="rules"  label-width="80px" class="demo-ruleForm">
        <el-form-item label="客户名称" prop="CustomerName">
          <el-input v-model="formModify.CustomerName"></el-input>
        </el-form-item>
        <el-form-item label="备注" prop="CustomerContent">
          <el-input type="textarea" v-model="formModify.CustomerContent" ></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitFormModify('formModify')">更新</el-button>
          <el-button @click="dialogAddVisible = false">取消</el-button>
          <el-button style="float:right" @click="deletepost">删除</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
    <el-table id="Customerlist" @row-click="handle" :data="tableData" border style="width: 100%">
      <el-table-column type="index"></el-table-column>
      <el-table-column prop="CustomerName" label="客户名称" sortable ></el-table-column>
      <!-- <el-table-column prop="number" label="应支付金额" sortable></el-table-column>
      <el-table-column prop="Receivables" label="到帐金额" sortable></el-table-column>
      <el-table-column prop="invoice" label="开出发票" sortable></el-table-column> -->
      <el-table-column prop="CustomerContent" label="备注" sortable></el-table-column>
    </el-table>
  </el-main>
</template>
<script>
// import axios from 'axios'

export default {
  data () {
    return {
      public: [],
      Customerlist: [],
      tableData: [],
      dialogAddVisible: false,
      dialogFormVisible: false,
      formModify: {}, // 添加收到金额
      TransactionList: {},
      formTransactionCon: '',
      formTransactionList: [], // 交易列表
      form: {
        CustomerName: '',
        CustomerContent: ''
      },
      rules: {
        CustomerName: [
          { required: true, message: '请输入名称', trigger: 'blur' }
        ]
      }
    }
  },
  props: { // 接收父组件传递过来的参数
    map: {
      // type:String
    }
  },
  watch: {
  },
  mounted () {
    this.getdata()
  },
  methods: {
    submitFormModify (formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.updatpostData()
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    updatpostData () { // 更新数据
      this.jsondata.updatpostData('customerlist', this.formModify).then(response => {
        if (response.data === 'OK') {
          this.dialogAddVisible = false
          this.getdata()
        }
      })
        .catch(error => {
          console.log(error)
        })
      return false
    },
    submitForm (formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.postData()
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    resetForm (formName) {
      this.$refs[formName].resetFields()
    },
    postData () { // 添加数据
      this.jsondata.postData('customerlist', this.form).then(response => {
        if (response.data === 'OK') {
          console.log(response.data, this.form)
          this.dialogFormVisible = false
          this.getdata()
          this.resetForm('form')
        }
      })
        .catch(error => {
          console.log(error)
        })
      return false
    },
    getdata () {
      this.jsondata.getData('customerlist').then(response => {
        this.tableData = response.data
      })
        .catch(error => {
          console.log(error)
        })
      return false
    },
    deletepost () { // 删除
      this.jsondata.deletepost('customerlist', this.formModify.id).then(response => {
        if (response.data === 'OK') {
          this.dialogAddVisible = false
          this.getdata()
        }
      })
        .catch(error => {
          console.log(error)
        })
    },
    handle (row, event, column) { // 点击列表
      this.dialogAddVisible = true
      this.jsondata.getDataId('customerlist', row.id).then(response => {
        this.formModify = response.data[0]
        console.log(this.formModify)
      })
        .catch(error => {
          console.log(error)
        })
      return false
    }
  }
}
</script>
