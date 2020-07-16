 <template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3>
      <span  @click="goToHome1" style="cursor: pointer;color:#409EFF">返回项目 > </span>
      <span  @click="goToHome" style="cursor: pointer;color:#409EFF">返回合同 > </span>{{this.titleSupplierName}} ----- {{this.projectName}}
      <span class="colorRed"> ----- 合同金额:{{this.jsondata.currency( this.hetongjiner, '￥', 2)}}</span>
      <el-button type="primary" style="float: right;" @click="dialogFormVisible = true">添加付款</el-button>
    </h3>
    <el-dialog title="添加付款" :visible.sync="dialogFormVisible">
      <el-form ref="form" :model="form" :rules="rules"  label-width="80px" class="demo-ruleForm">
        <el-form-item label="付款名称" prop="ReceivablesName">
          <el-input v-model="form.ReceivablesName"></el-input>
        </el-form-item>
        <el-form-item label="付款时间" prop="ReceivablesData">
          <el-input v-model="form.ReceivablesData"></el-input>
        </el-form-item>
        <el-form-item label="付款方式" prop="ReceivablesMode">
            <el-select v-model="form.ReceivablesMode" placeholder="请选择" style="width:46%" >
              <el-option label="现金" value="现金"></el-option>
              <el-option label="银行" value="银行"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="应付金额" prop="number">
          <el-input type="number"  v-model="form.number" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="有无合同" prop="contract">
            <el-select v-model="form.contract" placeholder="请选择" style="width:46%" >
            <el-option label="有" value="有"></el-option>
            <el-option label="无" value="无"></el-option>
            </el-select>
            <el-select v-model="form.Receivableslist" placeholder="请选择" style="width:46%" >
              <el-option label="第1期" value="第1期"></el-option>
              <el-option label="第2期" value="第2期"></el-option>
              <el-option label="第3期" value="第3期"></el-option>
              <el-option label="第4期" value="第4期"></el-option>
              <el-option label="第5期" value="第5期"></el-option>
              <el-option label="一年质保金" value="一年质保金"></el-option>
              <el-option label="二年质保金" value="二年质保金"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="付款金额" prop="Receivables">
          <el-col :span="11" style="margin-right:10px">
            <el-date-picker value-format="yyyy-MM-dd" type="date" placeholder="选择日期" v-model="form.daozhangdate" style="width: 100%;"></el-date-picker>
          </el-col>
          <el-input type="number"  v-model="form.Receivables" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="收到发票" prop="invoice">
          <el-col :span="11" style="margin-right:10px" v-if="boxvalue" >
            <el-date-picker value-format="yyyy-MM-dd" type="date" placeholder="选择日期" v-model="form.kaifapiaodate" style="width: 100%;"></el-date-picker>
          </el-col>
          <el-input type="number"  v-model="form.invoice" style="width:25%" v-if="boxvalue"  ></el-input>
          <el-select v-model="form.invoicebo" placeholder="请选择" style="width:20%" >
            <el-option label="有" value="有"></el-option>
            <el-option label="不计发票" value="不计发票"></el-option>
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

    <el-dialog :title="formModify.ReceivablesName" :visible.sync="dialogAddVisible" >
      <el-form ref="formModify" :model="formModify" :rules="rules"  label-width="80px" class="demo-ruleForm">
        <el-form-item label="付款名称" prop="ReceivablesName">
          <el-input v-model="formModify.ReceivablesName"></el-input>
        </el-form-item>
        <el-form-item label="付款时间" prop="ReceivablesData">
          <el-input v-model="formModify.ReceivablesData"></el-input>
        </el-form-item>
        <el-form-item label="付款方式" prop="ReceivablesMode">
            <el-select v-model="formModify.ReceivablesMode" placeholder="请选择" style="width:46%" >
              <el-option label="现金" value="现金"></el-option>
              <el-option label="银行" value="银行"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="付款金额" prop="number">
          <el-input type="number"  v-model="formModify.number" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="有无合同" prop="contract">
            <el-select v-model="formModify.contract" placeholder="请选择" style="width:46%" >
            <el-option label="有" value="有"></el-option>
            <el-option label="无" value="无"></el-option>
            </el-select>
            <el-select v-model="formModify.Receivableslist" :disabled="false" placeholder="请选择" style="width:46%" >
              <el-option label="第1期" value="第1期"></el-option>
              <el-option label="第2期" value="第2期"></el-option>
              <el-option label="第3期" value="第3期"></el-option>
              <el-option label="第4期" value="第4期"></el-option>
              <el-option label="第5期" value="第5期"></el-option>
              <el-option label="一年质保金" value="一年质保金"></el-option>
              <el-option label="二年质保金" value="二年质保金"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="付款金额" prop="Receivables">
          <el-col :span="11" style="margin-right:10px">
            <el-date-picker value-format="yyyy-MM-dd" type="date" placeholder="选择日期" v-model="formModify.daozhangdate" style="width: 100%;"></el-date-picker>
          </el-col>
          <el-input type="number"  v-model="formModify.Receivables" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="收到发票" prop="invoice">
          <el-col :span="11" style="margin-right:10px" v-if="boxvalue" >
            <el-date-picker value-format="yyyy-MM-dd" type="date" placeholder="选择日期" v-model="formModify.kaifapiaodate" style="width: 100%;" ></el-date-picker>
          </el-col>
          <el-input type="number"  v-model="formModify.invoice" style="width:25%" v-if="boxvalue" ></el-input>
          <el-select v-model="formModify.invoicebo" placeholder="请选择" style="width:20%" >
            <el-option label="有" value="有"></el-option>
            <el-option label="不计发票" value="不计发票"></el-option>
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
    <el-table @row-click="handle" :data="tableData" border highligth-current-row :summary-method="jsondata.getSummaries" show-summary height='90%' :span-method="objectSpanMethod" style="width: 100%">
      <!-- <el-table-column prop="ReceivablesName" label="收款名称" sortable></el-table-column> -->
      <el-table-column prop="Receivableslist" label="付款分期" ></el-table-column>
      <el-table-column prop="number" label="应付金额" ></el-table-column>
      <el-table-column prop="ReceivablesData" label="付款时间" ></el-table-column>
      <el-table-column prop="Receivables" label="付款金额" ></el-table-column>
      <el-table-column prop="invoice" label="收到发票" ></el-table-column>
      <el-table-column prop="daozhangdate" label="时间" ></el-table-column>
      <el-table-column prop="weikaifapiao" label="已付款未开票" ></el-table-column>
      <el-table-column prop="Receivablesend" label="未付金额" ></el-table-column>
      <!-- <el-table-column prop="Remarks" label="备注" sortable></el-table-column> -->
    </el-table>
    <p style="text-align:left; font-size:15px; color:#555;font-weight: bold;" type="error">
    </p>
  </el-main>
</template>
<script>
// import axios from 'axios'
export default {
  data () {
    return {
      boxvalue: true,
      titleSupplierName: '',
      hetongjiner: 0, // 合同金额
      yingshou: 0, // 应收金额
      zongshouru: 0, // 到账金额
      weishou: 0, // 未收金额
      weikaifapiao: 0, // 已付款未收票
      projectNameid: '',
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
        Receivablesend: '',
        projectId: '',
        daozhangdate: '',
        kaifapiaodate: '',
        invoice: '',
        invoicebo: '',
        supplielist: '',
        Receivables: ''
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
      income: {},
      form: {
        ReceivablesName: '',
        ReceivablesData: '',
        ReceivablesMode: '',
        number: '',
        contract: '',
        Remarks: '',
        projectId: this.$route.params.id,
        invoice: '',
        Receivableslist: '',
        Receivables: '',
        daozhangdate: '',
        kaifapiaodate: '',
        supplielist: '',
        projectlist: ''
      },
      dataList: [],
      rules: {
        // ReceivablesName: [
        //   { required: true, message: '请输入收款名称', trigger: 'blur' }
        // ]
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
    form: {// 深度监听，可监听到对象、数组的变化
      handler (val, oldVal) {
        // console.log(val.invoicebo)
        if(val.invoicebo == '不计发票'){ //eslint-disable-line
          this.boxvalue = false
        } else {
          this.boxvalue = true
        }
      },
      deep: true // true 深度监听
    },
    formModify: {// 深度监听，可监听到对象、数组的变化
      handler (val, oldVal) {
        // console.log(val.invoicebo)
        if(val.invoicebo == '不计发票'){ //eslint-disable-line
          this.boxvalue = false
        } else {
          this.boxvalue = true
        }
      },
      deep: true // true 深度监听
    }
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
      this.jsondata.updatpostData('expenditureData', this.formModify).then(response => {
        // console.log(response)
        // this.formTransaction.AmountMoney = this.formModify.Receivables
        // this.formTransaction.MoneyClass = 1
        // this.formTransaction.invoice = this.formModify.invoice
        // this.formTransaction.CollectMoney = this.formModify.id
        this.getdata()
        this.dialogAddVisible = false
        // this.postFormData('transaction', this.formTransaction)
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
      // this.form.daozhangdate = ''
      // this.form.kaifapiaodate = ''
      // this.form.Receivableslist = ''
    },
    postData () { // 添加数据
      this.jsondata.postData('expenditureData', this.form).then(response => {
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
    getdataincome () {
      this.jsondata.getDataClass('expenditure', this.$route.params.id, 'id').then(response => {
        // this.tableData = response.data
        this.projectName = response.data[0].ReceivablesName
        this.projectNameid = response.data[0].projectId
        this.hetongjiner = response.data[0].number
        this.form.supplielist = response.data[0].SupplierName
        this.income = response.data
        this.form.projectlist = response.data[0].projectId
        this.jsondata.getDataClass('supplierlist', response.data[0].SupplierName, 'id').then(responsename => {
          this.titleSupplierName = responsename.data[0].SupplierName
        })
          .catch(error => {
            console.log(error)
          })
        if(Number(this.hetongjiner) == Number(this.yingshou)){  //eslint-disable-line
          document.querySelector('.colorRed').style.color = '#555'
        } else {
          document.querySelector('.colorRed').style.color = '#f00'
        }
      })
        .catch(error => {
          console.log(error)
        })
      return false
    },
    getdata () {
      this.hetongjiner = 0 // 合同金额初始化
      this.yingshou = 0 //
      this.zongshouru = 0 //
      this.weishou = 0 //
      this.weikaifapiao = 0
      this.jsondata.getDataClass('expenditureData', this.$route.params.id, 'projectId').then(response => {
        this.tableData = response.data.sort(function (a, b) { return (a.id + '').localeCompare(b.id + '') }) // 根据期数排序
        this.tableData = this.tableData.sort(function (a, b) { return (a.Receivableslist + '').localeCompare(b.Receivableslist + '') }) // 根据期数排序.reverse()
        // console.log(this.tableData)
        for (let i = 0; i < this.tableData.length; i++) {
          this.tableData[i].weikaifapiao = 0
          if(this.tableData[i].daozhangdate === '' || this.tableData[i].daozhangdate == null){  //eslint-disable-line
            this.tableData[i].daozhangdate = this.tableData[i].kaifapiaodate
          }
          if(this.tableData[i].number == ''){ //eslint-disable-line
            this.tableData[i].Receivablesend = ''
          } else {
            this.tableData[i].Receivablesend = Number(this.tableData[i].number)
            for (let is = 0; is < this.tableData.length; is++) {
              if (this.tableData[i].Receivableslist == this.tableData[is].Receivableslist){ //eslint-disable-line
                // console.log(this.tableData[i].Receivableslist, this.tableData[i].number, this.tableData[is].Receivables)
                this.tableData[i].Receivablesend -= Number(this.tableData[is].Receivables)
                if (this.tableData[is].invoicebo !== '不计发票') {
                  this.tableData[i].weikaifapiao += Number(this.tableData[is].Receivables) - Number(this.tableData[is].invoice)
                } else {
                  // this.tableData[i].weikaifapiao += Number(this.tableData[is].number)
                }
              }
            }
          }
          this.tableData[i].weikaifapiao = this.jsondata.currency(this.tableData[i].weikaifapiao, '￥', 2)
          this.tableData[i].Receivablesend = this.jsondata.currency(this.tableData[i].Receivablesend, '￥', 2)
        }
        this.dataList = this.jsondata.getSpanArr(this.tableData, 'Receivableslist') // 按期数合并表格数组
        for (let i = 0; i < this.tableData.length; i++) {
          this.yingshou += Number(this.tableData[i].number)
          this.zongshouru += Number(this.tableData[i].Receivables)
          this.tableData[i].number = this.jsondata.currency(this.tableData[i].number, '￥', 2)
          if(this.tableData[i].invoicebo != '不计发票'){ //eslint-disable-line
            this.weikaifapiao += Number(this.tableData[i].invoice)
            this.tableData[i].invoice = this.jsondata.currency(this.tableData[i].invoice, '￥', 2)
          } else {
            this.tableData[i].invoice = '不计发票'
            this.weikaifapiao += Number(this.tableData[i].Receivables)
          }
          this.tableData[i].Receivables = this.jsondata.currency(this.tableData[i].Receivables, '￥', 2)
        }
        // console.log(Number(this.hetongjiner), Number(this.yingshou))
        this.weishou = Number(this.yingshou) - Number(this.zongshouru)
        this.weikaifapiao = Number(this.zongshouru) - Number(this.weikaifapiao)
        this.getdataincome()// 请求交易例表
      })
        .catch(error => {
          console.log(error)
        })
      return false
    },
    deletepost () { // 删除收款
      this.jsondata.deletepost('expenditureData', this.formModify.id).then(response => {
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

    handle (row) {
      this.dialogAddVisible = true
      this.jsondata.getDataId('expenditureData', row.id).then(response => {
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
      this.$router.push('/expenditureContract/' + this.projectNameid)
    },
    goToHome1 () {
      this.$router.push('/ProjectDetails/' + this.projectNameid)
    },
    objectSpanMethod ({ row, column, rowIndex, columnIndex }) {
      if (columnIndex === 0 || columnIndex === 1 || columnIndex === 2 || columnIndex === 6 || columnIndex === 7) {
        const _row = this.dataList[rowIndex]
        const _col = _row > 0 ? 1 : 0
        return {
          rowspan: _row,
          colspan: _col
        }
      }
    }
  }
}
</script>
