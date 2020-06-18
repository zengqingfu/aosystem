 <template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3>
      供应商及收款人列表{{this.$route.params.id}}
      <el-button type="primary" style="float: right;" @click="dialogFormVisible = true">添加</el-button>
    </h3>
    <el-dialog title="添加收款方" :visible.sync="dialogFormVisible">
      <el-form ref="form" :model="form" :rules="rules"  label-width="80px" class="demo-ruleForm">
        <el-form-item label="付款名称" prop="SupplierName">
          <el-input v-model="form.SupplierName"></el-input>
        </el-form-item>
        <el-form-item label="收款分类" prop="SupplierClass">
            <el-select v-model="form.SupplierClass" placeholder="请选择" style="width:46%" >
            <el-option label="供应商" value="1"></el-option>
            <el-option label="员工" value="2"></el-option>
            <el-option label="外包人员" value="3"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="备注" prop="SupplierCon">
          <el-input type="textarea" v-model="form.SupplierCon" ></el-input>
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
        <el-form-item label="付款名称" prop="SupplierName">
          <el-input v-model="formModify.SupplierName"></el-input>
        </el-form-item>
        <el-form-item label="备注" prop="SupplierCon">
          <el-input type="textarea" v-model="formModify.SupplierCon" ></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitFormModify('formModify')">更新</el-button>
          <el-button @click="dialogAddVisible = false">取消</el-button>
          <el-button style="float:right" @click="deletepost">删除</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
    <el-table @row-click="handle" :data="tableData" border style="width: 100%">
      <el-table-column prop="SupplierName" label="收款方名称" sortable width="200"></el-table-column>
      <!-- <el-table-column prop="number" label="应支付金额" sortable></el-table-column>
      <el-table-column prop="Receivables" label="已支付金额" sortable></el-table-column>
      <el-table-column prop="invoice" label="收到发票" sortable></el-table-column> -->
      <el-table-column prop="SupplierCon" label="备注" sortable></el-table-column>
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
        SupplierName: '',
        SupplierClass: '',
        SupplierCon: ''
      },
      rules: {
        SupplierName: [
          { required: true, message: '请输入收款方名称', trigger: 'blur' }
        ],
        SupplierClass: [
          { required: true, message: '请选择', trigger: 'blur' }
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
      this.jsondata.updatpostData('SupplierList', this.formModify).then(response => {
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
      this.jsondata.postData('SupplierList', this.form).then(response => {
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
      this.jsondata.getData('SupplierList').then(response => {
        this.tableData = response.data
      })
        .catch(error => {
          console.log(error)
        })
      return false
    },
    deletepost () { // 删除
      this.jsondata.deletepost('SupplierList', this.formModify.id).then(response => {
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
      this.formModify = row
      // this.jsondata.getDataId('SupplierList', row.id).then(response => {
      //   this.formModify = response.data[0]
      //   console.log(this.formModify)
      // })
      //   .catch(error => {
      //     console.log(error)
      //   })
      // return false
    }
  }
}
</script>
