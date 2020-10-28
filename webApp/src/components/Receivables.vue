 <template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3>
      <span  @click="goToHome1" style="cursor: pointer;color:#409EFF">返回项目 > </span>
      <span  @click="goToHome" style="cursor: pointer;color:#409EFF">{{this.projectName}} > </span>收款明细收入列表
      <span class="colorRed"> ----- 合同金额:{{this.jsondata.currency( this.hetongjiner, '￥', 2)}}</span>
      <el-button type="primary" style="float: right;" @click="dialogFormVisible = true, boxvalue2 = true">添加收款</el-button>
      <el-button style="float: right;margin-right:20px" onclick="exportExcel('#Receivables')">点击导出</el-button>
    </h3>
    <el-dialog title="添加收款" :visible.sync="dialogFormVisible">
      <el-form ref="form" :model="form" :rules="rules"  label-width="80px" class="demo-ruleForm">
        <el-form-item label="收款名称" prop="ReceivablesName"  v-if="boxvalue2">
          <el-input v-model="form.ReceivablesName"></el-input>
        </el-form-item>
        <el-form-item label="收款时间" prop="ReceivablesData"  v-if="boxvalue2">
          <el-input v-model="form.ReceivablesData"></el-input>
        </el-form-item>
        <el-form-item label="收款方式" prop="ReceivablesMode"  v-if="boxvalue2">
            <el-select v-model="form.ReceivablesMode" placeholder="请选择" style="width:46%" >
              <el-option label="现金" value="现金"></el-option>
              <el-option label="银行" value="银行"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="应收金额" prop="number"  v-if="boxvalue2">
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
              <el-option label="第6期" value="第6期"></el-option>
              <el-option label="一年质保金" value="一年质保金"></el-option>
              <el-option label="二年质保金" value="二年质保金"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="开出发票" prop="invoice">
          <el-col :span="11" style="margin-right:10px">
            <el-date-picker value-format="yyyy-MM-dd" type="date" placeholder="选择日期" v-model="form.kaifapiaodate" style="width: 100%;"></el-date-picker>
          </el-col>
          <el-input type="number"  v-model="form.invoice" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="到账金额"  prop="Receivables" >
          <el-col :span="11" style="margin-right:10px">
            <el-date-picker value-format="yyyy-MM-dd" type="date" placeholder="选择日期" v-model="form.daozhangdate" style="width: 100%;"></el-date-picker>
          </el-col>
          <el-input type="number" v-model="form.Receivables" style="width:46%" ></el-input>
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
        <el-form-item label="收款名称" prop="ReceivablesName" v-if="boxvalue2">
          <el-input v-model="formModify.ReceivablesName"></el-input>
        </el-form-item>
        <el-form-item label="收款时间" prop="ReceivablesData" v-if="boxvalue2">
          <el-input v-model="formModify.ReceivablesData"></el-input>
        </el-form-item>
        <el-form-item label="收款方式" prop="ReceivablesMode" v-if="boxvalue2">
            <el-select v-model="formModify.ReceivablesMode" placeholder="请选择" style="width:46%" >
              <el-option label="现金" value="现金"></el-option>
              <el-option label="银行" value="银行"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="应收金额" prop="number" v-if="boxvalue2">
          <el-input type="number"  v-model="formModify.number" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="有无合同" prop="contract" v-if="boxvalue2">
            <el-select v-model="formModify.contract" placeholder="请选择" style="width:46%" >
            <el-option label="有" value="有"></el-option>
            <el-option label="无" value="无"></el-option>
            </el-select>
            <el-select v-model="formModify.Receivableslist" placeholder="请选择" :disabled="true" style="width:46%"  v-if="boxvalue2">
              <el-option label="第1期" value="第1期"></el-option>
              <el-option label="第2期" value="第2期"></el-option>
              <el-option label="第3期" value="第3期"></el-option>
              <el-option label="第4期" value="第4期"></el-option>
              <el-option label="第5期" value="第5期"></el-option>
              <el-option label="第6期" value="第6期"></el-option>
              <el-option label="一年质保金" value="一年质保金"></el-option>
              <el-option label="二年质保金" value="二年质保金"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="开出发票" >
          <el-col :span="11" style="margin-right:10px">
            <el-date-picker value-format="yyyy-MM-dd" type="date" placeholder="选择日期" v-model="formModify.kaifapiaodate" style="width: 100%;"></el-date-picker>
          </el-col>
          <el-input type="number"  v-model="formModify.invoice" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="到账金额" >
          <el-col :span="11" style="margin-right:10px">
            <el-date-picker value-format="yyyy-MM-dd" type="date" placeholder="选择日期" v-model="formModify.daozhangdate" style="width: 100%;"></el-date-picker>
          </el-col>
          <el-input type="number"  v-model="formModify.Receivables" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="备注" prop="Remarks">
          <el-input type="textarea" v-model="formModify.Remarks" ></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitFormModify('formModify')">更新</el-button>
          <el-button @click="dialogAddVisible = false">取消</el-button>
          <el-button style="float:right" @click="deletepost" v-if="!boxvalue2">删除收款</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
    <el-table id="Receivables" @row-click="handle" :data="tableData" border highligth-current-row :summary-method="jsondata.getSummaries" show-summary height="90%" :span-method="objectSpanMethod" style="width: 100%">
      <!-- <el-table-column prop="ReceivablesName" label="收款名称" sortable></el-table-column> -->
      <!-- <el-table-column type="index"></el-table-column> -->
      <el-table-column prop="Receivableslist" label="收款分期" ></el-table-column>
      <el-table-column prop="number" label="应收金额" ></el-table-column>
      <el-table-column prop="ReceivablesData" label="收款时间" ></el-table-column>
      <el-table-column prop="Receivables" label="到账金额" ></el-table-column>
      <el-table-column prop="invoice" label="开出发票" ></el-table-column>
      <el-table-column prop="daozhangdate" label="到账时间" ></el-table-column>
      <el-table-column prop="weikaifapiao" label="已开票未收款" ></el-table-column>
      <el-table-column prop="Receivablesend" label="未收金额" ></el-table-column>
    </el-table>
    <!-- <p style="text-align:left; font-size:15px; color:#555;font-weight: bold;" type="error"><span class="colorRed">
      合同金额:{{this.jsondata.currency( this.hetongjiner, '￥', 2)}}</span>
      / 已开发票未收款: {{this.jsondata.currency(Number(this.weikaifapiao) - Number(this.zongshouru), '￥', 2)}}
    </p> -->
  </el-main>
</template>
<script>
// import axios from 'axios'
export default {
  data () {
    return {
      boxvalue2: true,
      hetongjiner: 0, // 合同金额
      yingshou: 0, // 应收金额
      zongshouru: 0, // 到账金额
      weishou: 0, // 未收金额
      weikaifapiao: 0, // 未收金额
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
        invoice: '',
        Receivables: '',
        daozhangdate: '',
        kaifapiaodate: ''
      }, // 添加收到金额
      TransactionList: {},
      formTransactionCon: '',
      formTransactionList: {}, // 交易列表
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
        for (let i = 0; i < this.tableData.length; i++) {
          if(val.Receivableslist == this.tableData[i].Receivableslist){ //eslint-disable-line
            this.boxvalue2 = false
            this.form.number = 0
            return
          }
          this.boxvalue2 = true
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
      this.jsondata.updatpostData('receivables', this.formModify).then(response => {
        this.jsondata.postDatabf(response.data, 'updatpostData')
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
      this.form.daozhangdate = ''
      this.form.kaifapiaodate = ''
      this.form.Receivableslist = ''
    },
    postData () { // 添加数据
      this.jsondata.postData('receivables', this.form).then(response => {
        // console.log(response.data, this.form)
        if (response.data === 'OK') {
          // console.log(response.data, this.form)
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
      this.jsondata.getDataClass('revenuecontract', this.$route.params.id, 'id').then(response => {
        // this.tableData = response.data
        this.projectName = response.data[0].ReceivablesName
        this.projectNameid = response.data[0].projectId
        this.hetongjiner = response.data[0].number
        this.income = response.data
        this.form.projectlist = response.data[0].projectId
        if(Number(this.hetongjiner) == Number(this.yingshou)){  //eslint-disable-line
          document.querySelector('.colorRed').style.color = '#555'
        } else {
          document.querySelector('.colorRed').style.color = '#f00'
        }
        // console.log(response.data)
      })
        .catch(error => {
          console.log(error)
        })
      return false
    },
    getdata () {
      this.hetongjiner = 0 // 合同金额初始化
      this.yingshou = 0 // 应收金额初始化
      this.zongshouru = 0 // 到账金额初始化
      this.weishou = 0 // 未收金额初始化
      this.weikaifapiao = 0 // 未收金额初始化
      this.jsondata.getDataClass('receivables', this.$route.params.id, 'projectId').then(response => {
        // this.tableData = response.data.sort(function (a, b) { return (a.id + '').localeCompare(b.id + '') }) // 排序
        // this.tableData = this.tableData.reverse(function (a, b) { return (a.ReceivablesData + '').localeCompare(b.ReceivablesData + '') }) // 排序
        this.tableData = response.data.sort(function (a, b) { return (a.Receivableslist + '').localeCompare(b.Receivableslist + '') }) // 根据期数排序.reverse()
        // console.log(this.tableData)
        for (let i = 0; i < this.tableData.length; i++) {
          this.tableData[i].weikaifapiao = 0
          if(this.tableData[i].daozhangdate === ''){  //eslint-disable-line
            this.tableData[i].daozhangdate = this.tableData[i].kaifapiaodate
          }
          if(this.tableData[i].number > 1){ //eslint-disable-line
            this.tableData[i].Receivablesend = Number(this.tableData[i].number)
            for (let is = 0; is < this.tableData.length; is++) {
              if (this.tableData[i].Receivableslist == this.tableData[is].Receivableslist){ //eslint-disable-line
                // console.log(this.tableData[i].Receivableslist, this.tableData[i].number, this.tableData[is].Receivables)
                this.tableData[i].Receivablesend -= Number(this.tableData[is].Receivables)
                this.tableData[i].weikaifapiao += Number(this.tableData[is].invoice) - Number(this.tableData[is].Receivables)
              }
            }
          } else {
            this.tableData[i].Receivablesend = ''
          }
          console.log(this.tableData[i].weikaifapiao)
          if (this.tableData[i].weikaifapiao < 0) {
            this.tableData[i].weikaifapiao = 0
          }
          this.tableData[i].weikaifapiao = this.jsondata.currency(this.tableData[i].weikaifapiao, '￥', 2)
          this.tableData[i].Receivablesend = this.jsondata.currency(this.tableData[i].Receivablesend, '￥', 2)
        }
        this.dataList = this.jsondata.getSpanArr(this.tableData, 'Receivableslist')
        for (let i = 0; i < this.tableData.length; i++) {
          this.yingshou += Number(this.tableData[i].number)
          this.zongshouru += Number(this.tableData[i].Receivables)
          this.weikaifapiao += Number(this.tableData[i].invoice)
          // this.tableData[i].Receivablesend = this.jsondata.currency(this.tableData[i].number - this.tableData[i].Receivables, '￥', 2)
          this.tableData[i].number = this.jsondata.currency(this.tableData[i].number, '￥', 2)
          this.tableData[i].Receivables = this.jsondata.currency(this.tableData[i].Receivables, '￥', 2)
          this.tableData[i].invoice = this.jsondata.currency(this.tableData[i].invoice, '￥', 2)
        }
        // console.log(Number(this.hetongjiner), Number(this.yingshou))
        this.weishou = Number(this.yingshou) - Number(this.zongshouru)
        // this.weikaifapiao = Number(this.weikaifapiao) - Number(this.zongshouru)
        this.getdataincome()// 请求交易例表
      })
        .catch(error => {
          console.log(error)
        })
      return false
    },
    deletepost () { // 删除收款
      this.jsondata.deletepost('receivables', this.formModify.id).then(response => {
        // console.log(response.data)
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
      // console.log(row)
      if (row.number.length > 4) { // 应付金额大于0的  是每期主要信息,不能删,可修改
        this.boxvalue2 = true
      } else {
        this.boxvalue2 = false
      }
      this.dialogAddVisible = true
      this.jsondata.getDataId('receivables', row.id).then(response => {
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
      this.$router.push('/RevenueContract/' + this.projectNameid)
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
