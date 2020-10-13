 <template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3>
      <span @click="goToHome" style="cursor: pointer;color:#409EFF">{{this.projectName}}-项目 > </span>合同列表
      <el-button type="primary" style="float: right;" @click="dialogFormVisible = true">添加合同</el-button>
    </h3>
    <el-dialog title="添加收款" :visible.sync="dialogFormVisible">
      <el-form ref="form" :model="form" :rules="rules"  label-width="80px" class="demo-ruleForm">
        <el-form-item label="合同名称" prop="ReceivablesName">
          <el-input v-model="form.ReceivablesName"></el-input>
        </el-form-item>
        <el-form-item label="签约时间" prop="ReceivablesData">
          <el-col :span="11" style="margin-right:10px">
            <el-date-picker value-format="yyyy-MM-dd" type="date" placeholder="选择日期" v-model="form.ReceivablesData" style="width: 100%;"></el-date-picker>
          </el-col>
        </el-form-item>
        <el-form-item label="收款方式" prop="ReceivablesMode">
            <el-select v-model="form.ReceivablesMode" placeholder="请选择" style="width:46%" >
              <el-option label="现金" value="现金"></el-option>
              <el-option label="银行" value="银行"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="应收金额" prop="number">
          <el-input type="number" v-model="form.number" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="有无合同" prop="contract">
            <el-select v-model="form.contract" placeholder="请选择" style="width:46%" >
            <el-option label="有" value="有"></el-option>
            <el-option label="无" value="无"></el-option>
            </el-select>
            <el-select v-model="form.Receivableslist" placeholder="请选择" style="width:46%" >
              <el-option label="1期" value="1期"></el-option>
              <el-option label="2期" value="2期"></el-option>
              <el-option label="3期" value="3期"></el-option>
              <el-option label="4期" value="4期"></el-option>
              <el-option label="5期" value="5期"></el-option>
              <el-option label="6期" value="6期"></el-option>
            </el-select>
        </el-form-item>
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

    <el-dialog title="修改合同" :visible.sync="dialogAddVisible" >
      <el-form ref="formModify" :model="formModify" :rules="rules"  label-width="80px" class="demo-ruleForm">
        <el-form-item label="合同名称" prop="ReceivablesName">
          <el-input v-model="formModify.ReceivablesName"></el-input>
        </el-form-item>
        <el-form-item label="签约时间" prop="ReceivablesData">
          <el-col :span="11" style="margin-right:10px">
            <el-date-picker value-format="yyyy-MM-dd" type="date" placeholder="选择日期" v-model="formModify.ReceivablesData" style="width: 100%;"></el-date-picker>
          </el-col>
        </el-form-item>
        <el-form-item label="收款方式" prop="ReceivablesMode">
            <el-select v-model="formModify.ReceivablesMode" placeholder="请选择" style="width:46%" >
              <el-option label="现金" value="现金"></el-option>
              <el-option label="银行" value="银行"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="应收金额" prop="number">
          <el-input type="number" v-model="formModify.number" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="有无合同" prop="contract">
            <el-select v-model="formModify.contract" placeholder="请选择" style="width:46%" >
            <el-option label="有" value="有"></el-option>
            <el-option label="无" value="无"></el-option>
            </el-select>
            <el-select v-model="formModify.Receivableslist" placeholder="请选择" style="width:46%" >
              <el-option label="1期" value="1期"></el-option>
              <el-option label="2期" value="2期"></el-option>
              <el-option label="3期" value="3期"></el-option>
              <el-option label="4期" value="4期"></el-option>
              <el-option label="5期" value="5期"></el-option>
              <el-option label="6期" value="6期"></el-option>
            </el-select>
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
    <el-table :data="tableData" border :summary-method="jsondata.getSummaries" show-summary style="width: 100%">
      <el-table-column type="index"></el-table-column>
      <el-table-column @cell-click="handle" prop="ReceivablesName" label="合同名称"  width="300" sortable></el-table-column>
      <el-table-column prop="Receivableslist" label="收款分期" sortable></el-table-column>
      <el-table-column prop="number" label="同合金额" sortable></el-table-column>
      <el-table-column prop="ReceivablesData" label="签约时间" sortable></el-table-column>
      <el-table-column prop="Receivables" label="到账金额" sortable></el-table-column>
      <el-table-column prop="Receivablesend" label="未收金额" sortable></el-table-column>
      <el-table-column prop="invoice" label="开出发票" sortable></el-table-column>
      <el-table-column prop="weikaifapiao" label="已开票未收款" sortable></el-table-column>
      <el-table-column prop="" label="操作" >
        <template slot-scope="scope">
          <el-button @click="handleClick(scope.row)" type="text" size="small">收款</el-button>
          <el-button @click="handle(scope.row)" type="text" size="small">编辑</el-button>
        </template>
      </el-table-column>
    </el-table>
  </el-main>
</template>
<script>
// import axios from 'axios'
export default {
  data () {
    return {
      weikaifapiao: 0, // 未收金额
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
        Receivableslist: ''
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
        Receivableslist: ''
      },
      rules: {
        ReceivablesName: [
          { required: true, message: '请输入收款名称', trigger: 'blur' }
        ]
        // ,
        // ReceivablesData: [
        //   { required: true, message: '请输入收款日期', trigger: 'blur' }
        // ],
        // ReceivablesMode: [
        //   { required: true, message: '请输入收款方式', trigger: 'blur' }
        // ],
        // contract: [
        //   { required: true, message: '请选择', trigger: 'blur' }
        // ],
        // number: [
        //   { required: true, message: '请输入收款金额' }
        // ],
        // formTransactionCon: [
        //   { required: true, message: '请输入收款金额' }
        // ]
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
      this.jsondata.updatpostData('revenuecontract', this.formModify).then(response => {
        this.dialogAddVisible = false
        this.getdata()
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
      this.jsondata.postData('revenuecontract', this.form).then(response => {
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
    getdata () { // 初始化数据
      this.weikaifapiao = 0 // 未收初始化
      this.jsondata.getData('receivables').then(responselist => {
        this.formTransactionList = responselist.data
        // console.log(responselist.data)
        this.jsondata.getDataClass('revenuecontract', this.$route.params.id, 'projectId').then(response => {
          this.tableData = response.data
          for (let i = 0; i < this.tableData.length; i++) {
            // this.tableData[i].Receivablesend = this.jsondata.currency(this.tableData[i].number - this.tableData[i].Receivables, '￥', 2)
            this.tableData[i].Receivables = 0
            this.tableData[i].invoice = 0
            this.tableData[i].Receivablesend = 0
            this.tableData[i].weikaifapiao = 0
            for (let is = 0; is < this.formTransactionList.length; is++) {
              if (this.tableData[i].id == this.formTransactionList[is].projectId) { //eslint-disable-line
                this.tableData[i].Receivables += Number(this.formTransactionList[is].Receivables)
                this.tableData[i].invoice += Number(this.formTransactionList[is].invoice)
              }
            }
            if (this.tableData[i].Receivables > this.tableData[i].invoice) {
              this.tableData[i].weikaifapiao = 0
            } else {
              this.tableData[i].weikaifapiao = Number(this.tableData[i].invoice) - Number(this.tableData[i].Receivables)
            }
            this.tableData[i].weikaifapiao = this.jsondata.currency(this.tableData[i].weikaifapiao, '￥', 2)
            this.tableData[i].Receivablesend = this.jsondata.currency(this.tableData[i].number - this.tableData[i].Receivables, '￥', 2)
            this.tableData[i].Receivables = this.jsondata.currency(this.tableData[i].Receivables, '￥', 2)
            this.tableData[i].invoice = this.jsondata.currency(this.tableData[i].invoice, '￥', 2)
            this.tableData[i].number = this.jsondata.currency(this.tableData[i].number, '￥', 2)
            // console.log(this.tableData[i])
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
    deletepost () { // 删除收款
      this.jsondata.deletepost('RevenueContract', this.formModify.id).then(response => {
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

    handleClick (row) {
      this.$router.push('/Receivables/' + row.id)
    },
    handle (row) {
      this.dialogAddVisible = true
      this.jsondata.getDataId('revenuecontract', row.id).then(response => {
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
      this.jsondata.getDataId('projectlist', this.$route.params.id).then(response => {
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
