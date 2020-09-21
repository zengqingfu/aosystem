 <template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3 style="color:#333">
      支出列表
      <span style="float:right;font-size: 16px">支出金额:{{this.zhongshouru}} / 未付金额:{{this.weishoukuan}}</span>
    </h3>
    <el-dialog title="添加支出" :visible.sync="dialogFormVisible">
      <el-form ref="form" :model="form" :rules="rules"  label-width="80px" class="demo-ruleForm">
        <el-form-item label="付款名称" prop="ReceivablesName">
          <el-input v-model="form.ReceivablesName"></el-input>
        </el-form-item>
        <el-form-item label="付款日期" prop="ReceivablesData">
          <el-input v-model="form.ReceivablesData"></el-input>
        </el-form-item>
        <el-form-item label="付款方式" prop="ReceivablesMode">
          <el-input v-model="form.ReceivablesMode"></el-input>
        </el-form-item>
        <el-form-item label="应付金额" prop="number">
          <el-input type="number"  v-model.number="form.number" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="签约日期" prop="contractdate">
          <el-col :span="11">
            <el-date-picker value-format="yyyy-MM-dd" type="date" placeholder="选择日期" v-model="form.contractdate" style="width: 100%;"></el-date-picker>
          </el-col>
        </el-form-item>
        <el-form-item label="有无合同" prop="contract">
            <el-select v-model="form.contract" placeholder="请选择" style="width:46%" >
            <el-option label="有" value="有"></el-option>
            <el-option label="无" value="无"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="收款方" filterable prop="OtherParty">
            <el-select v-model="form.OtherParty" placeholder="请选择" style="width:46%" >
                <el-option
                v-for="item in optionsOtherParty"
                :key="item.SupplierName"
                :label="item.SupplierName"
                :value="item.SupplierClass">
                </el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="付款类别" prop="projectClass">
            <el-select v-model="form.projectClass" placeholder="请选择" style="width:46%" >
                <el-option
                v-for="item in optionsprojectClass"
                :key="item.expenditureClass"
                :label="item.expenditureClass"
                :value="item.expenditureClass">
                </el-option>
            </el-select>
        </el-form-item>
        <!-- <el-form-item label="到帐金额" >
          <el-input type="number"  v-model.number="form.Receivables" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="开出发票" >
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
        <el-form-item label="付款名称" prop="ReceivablesName">
          <el-input v-model="formModify.ReceivablesName"></el-input>
        </el-form-item>
        <el-form-item label="付款日期" prop="ReceivablesData">
          <el-input v-model="formModify.ReceivablesData"></el-input>
        </el-form-item>
        <el-form-item label="付款方式" prop="ReceivablesMode">
          <el-input v-model="formModify.ReceivablesMode"></el-input>
        </el-form-item>
        <el-form-item label="应付金额" prop="number">
          <el-input type="number"  v-model.number="formModify.number" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="签约日期" prop="contractdate">
          <el-col :span="11">
            <el-date-picker value-format="yyyy-MM-dd" type="date" placeholder="选择日期" v-model="formModify.contractdate" style="width: 100%;"></el-date-picker>
          </el-col>
        </el-form-item>
        <el-form-item label="有无合同" prop="contract">
            <el-select v-model="formModify.contract" placeholder="请选择" style="width:46%" >
            <el-option label="有" value="有"></el-option>
            <el-option label="无" value="无"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="收款方" prop="OtherParty">
            <el-select v-model="formModify.SupplierName" filterable placeholder="请选择" style="width:46%" >
                <el-option
                v-for="item in optionsOtherParty"
                :key="item.SupplierName"
                :label="item.SupplierName"
                :value="item.SupplierClass">
                </el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="付款类别" prop="projectClass">
            <el-select v-model="formModify.projectClass" placeholder="请选择" style="width:46%" >
                <el-option
                v-for="item in optionsprojectClass"
                :key="item.expenditureClass"
                :label="item.expenditureClass"
                :value="item.expenditureClass">
                </el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="支付金额" >
          <el-input type="number"  v-model.number="formModify.Receivables" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="收到发票" >
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
      <el-table-column prop="SupplierName" label="收款方" sortable></el-table-column>
      <el-table-column prop="ReceivablesName" label="款项目名称" sortable></el-table-column>
      <el-table-column prop="number" label="应支付金额" sortable></el-table-column>
      <el-table-column prop="ReceivablesData" label="应支付日期" sortable></el-table-column>
      <el-table-column prop="Receivables" label="已支付金额" sortable></el-table-column>
      <el-table-column prop="invoice" label="收到发票" sortable></el-table-column>
      <el-table-column prop="projectClass" label="支出类别" sortable></el-table-column>
      <el-table-column prop="Remarks" label="备注" sortable></el-table-column>
    </el-table>
  </el-main>
</template>
<script>
// import axios from 'axios'

export default {
  data () {
    return {
      zhongshouru: '',
      weishoukuan: '',
      projectName: '',
      Customerlist: [],
      tableData: [],
      dialogAddVisible: false,
      dialogFormVisible: false,
      formModify: {}, // 添加收到金额
      TransactionList: {},
      formTransactionCon: '',
      formTransactionList: [], // 交易列表
      formTransaction: { // 交易
        MoneyClass: '',
        CollectMoney: '',
        AmountMoney: '',
        invoice: '',
        projectId: this.$route.params.id
      },
      form: {
        ReceivablesName: '',
        projectId: this.$route.params.id,
        number: '',
        ReceivablesData: '',
        contract: '',
        Remarks: '',
        invoice: '0',
        Receivables: '0',
        OtherParty: '',
        ReceivablesMode: '',
        contractdate: '',
        projectClass: ''
      },
      optionsprojectClass: [],
      optionsOtherParty: [],
      rules: {
        ReceivablesName: [
          { required: true, message: '付款名称', trigger: 'blur' }
        ],
        ReceivablesData: [
          { required: true, message: '付款日期', trigger: 'blur' }
        ],
        ReceivablesMode: [
          { required: true, message: '付款方式', trigger: 'blur' }
        ],
        contract: [
          { required: true, message: '请选择', trigger: 'blur' }
        ],
        OtherParty: [
          { required: true, message: '请选择', trigger: 'blur' }
        ],
        projectClass: [
          { required: true, message: '请选择', trigger: 'blur' }
        ],
        formTransactionCon: [
          { required: true, message: '请输入支出金额' }
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
    // this.getFormData('SupplierList')
    // this.getFormDataClass('expenditureClass')
    // this.getFormDataPojname()
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
      if (Number.isInteger(this.formModify.SupplierName)) {
        this.formModify.OtherParty = this.formModify.SupplierName
      }
      this.jsondata.updatpostData('expenditure', this.formModify).then(response => {
        if (response.data === 'OK') {
          this.dialogAddVisible = false
          this.formTransaction.AmountMoney = this.formModify.Receivables
          this.formTransaction.MoneyClass = 1
          this.formTransaction.invoice = this.formModify.invoice
          this.formTransaction.CollectMoney = this.formModify.id
          this.jsondata.postData('transaction', this.formTransaction).then(response => {
            if (response.data === 'OK') {
              this.getdata()
            }
          })
            .catch(error => {
              console.log(error)
            })
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
      this.jsondata.postData('expenditure', this.form).then(response => {
        if (response.data === 'OK') {
          console.log(response.data, this.form)
          this.dialogFormVisible = false
          // this.formTransaction.AmountMoney = this.form.Receivables
          // this.formTransaction.MoneyClass = 1
          // this.formTransaction.invoice = this.form.invoice
          // this.formTransaction.CollectMoney = this.form.id
          // this.postFormData('transaction', this.formTransaction)
          this.getdata()
          this.resetForm('form')
          // this.$router.push('/ProjectDetails')
        }
      })
        .catch(error => {
          console.log(error)
        })
      return false
    },
    getdata () {
      this.jsondata.getData('expenditure').then(response => {
        this.tableData = response.data
        for (let i = 0; i < this.tableData.length; i++) {
          this.zhongshouru = Number(this.zhongshouru) + Number(this.tableData[i].Receivables)
          this.weishoukuan = Number(this.weishoukuan) + Number(this.tableData[i].number)
          this.tableData[i].number = this.jsondata.currency(this.tableData[i].number, '￥', 2)
          this.tableData[i].Receivables = this.jsondata.currency(this.tableData[i].Receivables, '￥', 2)
          this.tableData[i].invoice = this.jsondata.currency(this.tableData[i].invoice, '￥', 2)
        }
        this.weishoukuan = Number(this.weishoukuan) - Number(this.zhongshouru)
        this.zhongshouru = this.jsondata.currency(this.zhongshouru, '￥', 2)
        this.weishoukuan = this.jsondata.currency(this.weishoukuan, '￥', 2)
        console.log(this.zhongshouru, this.weishoukuan)
        this.jsondata.getData('SupplierList').then(response => {
          for (var i = 0; i < this.tableData.length; i++) {
            for (let is = 0; is < response.data.length; is++) {
              if (this.tableData[i].OtherParty == response.data[is].SupplierClass) { //eslint-disable-line
                this.tableData[i].SupplierName = response.data[is].SupplierName
              }
            }
          }
        })
          .catch(error => {
            console.log(error)
          })
      })
        .catch(error => {
          console.log(error)
        })
      return false
    },
    deletepost () { // 删除支出
      this.jsondata.deletepost('expenditure', this.formModify.id).then(response => {
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
    //   console.log(row)
    //   this.dialogAddVisible = true
    //   this.jsondata.getDataId('expenditure', row.id).then(response => {
    //     this.formModify = response.data[0]
    //     this.formModify.SupplierName = row.SupplierName
    //   })
    //     .catch(error => {
    //       console.log(error)
    //     })
    //   return false
    },
    getFormData (formName) { // 加载供应商
      this.jsondata.getData(formName).then(response => {
        this.optionsOtherParty = response.data
      })
        .catch(error => {
          console.log(error)
        })
    },
    getFormDataClass (formName) { // 加载支出分类
      this.jsondata.getData(formName).then(response => {
        this.optionsprojectClass = response.data
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
