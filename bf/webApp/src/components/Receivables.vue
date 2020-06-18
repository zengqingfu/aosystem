 <template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3>
      <span  @click="goToHome" style="cursor: pointer;color:#409EFF">{{this.projectName}} > </span>收款列表
      <el-button type="primary" style="float: right;" @click="dialogFormVisible = true">添加收款</el-button>
    </h3>
    <el-dialog title="添加收款" :visible.sync="dialogFormVisible">
      <el-form ref="form" :model="form" :rules="rules"  label-width="80px" class="demo-ruleForm">
        <el-form-item label="收款名称" prop="ReceivablesName">
          <el-input v-model="form.ReceivablesName"></el-input>
        </el-form-item>
        <el-form-item label="收款日期" prop="ReceivablesData">
          <el-input v-model="form.ReceivablesData"></el-input>
        </el-form-item>
        <el-form-item label="收款方式" prop="ReceivablesMode">
          <el-input v-model="form.ReceivablesMode"></el-input>
        </el-form-item>
        <el-form-item label="应收金额" prop="number">
          <el-input type="number"  v-model.number="form.number" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="有无合同" prop="contract">
            <el-select v-model="form.contract" placeholder="请选择" style="width:46%" >
            <el-option label="有" value="有"></el-option>
            <el-option label="无" value="无"></el-option>
            </el-select>
        </el-form-item>
        <!-- <el-form-item label="到帐金额" prop="Receivables">
          <el-input type="number"  v-model.number="form.Receivables" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="开出发票" prop="invoice">
          <el-input type="number"  v-model.number="form.invoice" style="width:46%" ></el-input>
        </el-form-item> -->
        <el-form-item label="备注" prop="Remarks">
          <el-input type="textarea" v-model="form.Remarks" ></el-input>
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
        <el-form-item label="收款名称" prop="ReceivablesName">
          <el-input v-model="formModify.ReceivablesName"></el-input>
        </el-form-item>
        <el-form-item label="收款日期" prop="ReceivablesData">
          <el-input v-model="formModify.ReceivablesData"></el-input>
        </el-form-item>
        <el-form-item label="收款方式" prop="ReceivablesMode">
          <el-input v-model="formModify.ReceivablesMode"></el-input>
        </el-form-item>
        <el-form-item label="应收金额" prop="number">
          <el-input type="number"  v-model.number="formModify.number" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="有无合同" prop="contract">
            <el-select v-model="formModify.contract" placeholder="请选择" style="width:46%" >
            <el-option label="有" value="有"></el-option>
            <el-option label="无" value="无"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="到帐金额" >
          <el-col :span="11" style="margin-right:10px">
            <el-date-picker value-format="yyyy-MM-dd" type="date" placeholder="选择日期" v-model="formModify.daozhangdate" style="width: 100%;"></el-date-picker>
          </el-col>
          <el-input type="number"  v-model.number="formModify.Receivables" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="开出发票" >
          <el-col :span="11" style="margin-right:10px">
            <el-date-picker value-format="yyyy-MM-dd" type="date" placeholder="选择日期" v-model="formModify.kaifapiaodate" style="width: 100%;"></el-date-picker>
          </el-col>
          <el-input type="number"  v-model.number="formModify.invoice" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="备注" prop="Remarks">
          <el-input type="textarea" v-model="formModify.Remarks" ></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitFormModify('formModify')">更新</el-button>
          <el-button @click="dialogAddVisible = false">取消</el-button>
          <el-button style="float:right" @click="deletepost">删除收款</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
    <el-table @row-click="handle" :data="tableData" border style="width: 100%">
      <el-table-column prop="ReceivablesName" label="款项名称" sortable></el-table-column>
      <el-table-column prop="number" label="收款金额" sortable></el-table-column>
      <el-table-column prop="ReceivablesData" label="收款日期" sortable></el-table-column>
      <el-table-column prop="contract" label="是否有合同" sortable></el-table-column>
      <el-table-column prop="Receivables" label="到帐金额" sortable></el-table-column>
      <el-table-column prop="invoice" label="开出发票" sortable></el-table-column>
      <el-table-column prop="ReceivablesMode" label="收款方式" sortable></el-table-column>
      <el-table-column prop="Remarks" label="备注" sortable></el-table-column>
    </el-table>
  </el-main>
</template>
<script>
// import axios from 'axios'
export default {
  data () {
    return {
      projectName: '',
      public: [],
      Customerlist: [],
      tableData: [],
      dialogAddVisible: false,
      dialogFormVisible: false,
      formModify: {
        id: '',
        ReceivablesName: '',
        ReceivablesData: '',
        ReceivablesMode: '',
        number: '',
        contract: '',
        Remarks: '',
        projectId: this.$route.params.id,
        invoice: '0',
        Receivables: '0'
      }, // 添加收到金额
      TransactionList: {},
      formTransactionCon: '',
      formTransactionList: [], // 交易列表
      formTransaction: {
        MoneyClass: '',
        CollectMoney: '',
        AmountMoney: '',
        invoice: '',
        projectId: this.$route.params.id
      }, // 交易
      form: {
        ReceivablesName: '',
        ReceivablesData: '',
        ReceivablesMode: '',
        number: '',
        contract: '',
        Remarks: '',
        projectId: this.$route.params.id,
        invoice: '0',
        Receivables: '0'
      },
      rules: {
        ReceivablesName: [
          { required: true, message: '请输入收款名称', trigger: 'blur' }
        ],
        ReceivablesData: [
          { required: true, message: '请输入收款日期', trigger: 'blur' }
        ],
        ReceivablesMode: [
          { required: true, message: '请输入收款方式', trigger: 'blur' }
        ],
        contract: [
          { required: true, message: '请选择', trigger: 'blur' }
        ],
        number: [
          { required: true, message: '请输入收款金额' },
          { type: 'number', message: '金额必需为数额' }
        ],
        formTransactionCon: [
          { required: true, message: '请输入收款金额' }
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
    this.getFormDataPojname()
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
      this.jsondata.updatpostData('Receivables', this.formModify).then(response => {
        // console.log(response)
        this.dialogAddVisible = false
        this.formTransaction.AmountMoney = this.formModify.Receivables
        this.formTransaction.MoneyClass = 1
        this.formTransaction.invoice = this.formModify.invoice
        this.formTransaction.CollectMoney = this.formModify.id
        this.getdata()
        this.postFormData('transaction', this.formTransaction)
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
      this.jsondata.postData('Receivables', this.form).then(response => {
        console.log(response.data, this.form)
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
      this.jsondata.getDataClass('Receivables', this.$route.params.id, 'projectId').then(response => {
        this.tableData = response.data
        for (let i = 0; i < this.tableData.length; i++) {
          this.tableData[i].number = this.jsondata.currency(this.tableData[i].number, '￥', 2)
          this.tableData[i].Receivables = this.jsondata.currency(this.tableData[i].Receivables, '￥', 2)
          this.tableData[i].invoice = this.jsondata.currency(this.tableData[i].invoice, '￥', 2)
        }

        // console.log(this.tableData[i].Receivables)
      })
        .catch(error => {
          console.log(error)
        })
      return false
    },
    deletepost () { // 删除收款
      this.jsondata.deletepost('Receivables', this.formModify.id).then(response => {
        console.log(response.data)
        if (response.data === 'OK') {
          this.dialogAddVisible = false
          this.getdata()
        }
      })
        .catch(error => {
          console.log(error)
        })
    },
    handle (row, event, column) {
      this.dialogAddVisible = true
      this.jsondata.getDataId('Receivables', row.id).then(response => {
        this.formModify = response.data[0]
      })
        .catch(error => {
          console.log(error)
        })
      return false
    },
    postFormData (formName, jsonData) {
      this.jsondata.postData(formName, jsonData).then(response => {
        console.log(response.data)
      })
        .catch(error => {
          console.log(error)
        })
      return false
    },
    getFormData (formName) {
      this.jsondata.getData('getposts').then(response => {
        this.public = response
        return this.public
      })
        .catch(error => {
          console.log(error)
        })
    },
    getFormDataPojname () {
      this.jsondata.getDataId('projectList', this.$route.params.id).then(response => {
        this.projectName = response.data[0].projectName
      })
        .catch(error => {
          console.log(error)
        })
    },
    goToHome () {
      this.$router.push('/ProjectDetails/' + this.$route.params.id)
    }
  }
}
</script>
