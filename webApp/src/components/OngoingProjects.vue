 <template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3>
      进行中项目
      <el-button type="primary" style="float: right;" @click="dialogFormVisible = true">添加项目</el-button>
    </h3>
    <el-dialog title="添加项目" :visible.sync="dialogFormVisible">
      <el-form ref="form" :model="form" :rules="rules"  label-width="120px" class="demo-ruleForm">
        <el-form-item label="签约日期" prop="ContractDate">
          <el-col :span="11">
            <el-date-picker value-format="yyyy-MM-dd" type="date" placeholder="选择日期" v-model="form.ContractDate" style="width: 100%;"></el-date-picker>
          </el-col>
        </el-form-item>
        <el-form-item label="项目名称" prop="projectName">
          <el-input v-model="form.projectName"></el-input>
        </el-form-item>
        <el-form-item label="甲方客户" prop="CustomerName">
          <el-select v-model="form.CustomerName" filterable placeholder="甲方客户" style="width:46%">
                <el-option
                v-for="item in optionsproject"
                :key="item.CustomerName"
                :label="item.CustomerName"
                :value="item.id">
                </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="项目金额" prop="ContractAmount">
          <el-input type="number"  v-model.number="form.ContractAmount" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="预算支出" prop="ExpenditureBudget">
          <el-input type="number" v-model.number="form.ExpenditureBudget" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="项目说明" prop="projectContent">
          <el-input type="textarea" v-model="form.projectContent" ></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm('form')">立即创建</el-button>
          <el-button @click="resetForm('form')">重置</el-button>
          <el-button @click="dialogFormVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
    <el-table @row-click="handle" :data="tableData" border :summary-method="jsondata.getSummaries" show-summary style="width: 100%">
      <el-table-column prop="ContractDate" label="签约时间" sortable></el-table-column>
      <el-table-column prop="projectName" label="项目名称" sortable></el-table-column>
      <!-- <el-table-column prop="CustomerName" label="甲方" sortable></el-table-column> -->
      <el-table-column prop="ContractAmount" label="项目金额" sortable></el-table-column>
      <el-table-column prop="Receivables" label="已收金额" sortable></el-table-column>
      <el-table-column prop="ExpenditureBudget" label="应付金额" sortable></el-table-column>
      <el-table-column prop="expenditure" label="已付金额" sortable></el-table-column>
      <el-table-column prop="projectContent" label="项目说明" sortable></el-table-column>
    </el-table>
  </el-main>
</template>
<script>
export default {
  data () {
    return {
      contentsint: '',
      contentsintp: '',
      Customerlist: [],
      tableData: [],
      optionsproject: [],
      dialogTableVisible: false,
      dialogFormVisible: false,
      form: {
        projectName: '',
        projectContent: '',
        CustomerName: '',
        ContractAmount: '',
        ContractDate: '',
        ExpenditureBudget: ''
      },
      formexpenditureData: [],
      formReceivables: [],
      rules: {
        projectName: [
          { required: true, message: '请输入项目名称', trigger: 'blur' }
        ],
        // CustomerName: [
        //   { required: true, message: '请选择客户名称', trigger: 'blur' }
        // ],
        ContractAmount: [
          { required: true, message: '请输入合同金额' },
          { type: 'number', message: '金额必需为数额' }
        ],
        ContractDate: [
          { required: true, message: '请选择签约日期', trigger: 'blur' }
        ]
        // projectContent: [
        //   { required: true, message: '请输入项目内容', trigger: 'blur' }
        // ],        // ,

        // ExpenditureBudget: [
        //   { required: true, message: '请输入支出预算' },
        //   { type: 'number', message: '金额必需为数额' }
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
    this.getFormData('Customerlist')
  },
  methods: {
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
    onSubmit () {
      console.log(this.form)
    },
    postData () {
      this.jsondata.postData('projectList', this.form).then(response => {
        if (response.statusText === 'OK') {
          this.getdata()
          this.dialogFormVisible = false
        }
      })
        .catch(error => {
          console.log(error)
        })
      return false
    },
    getdata () {
      this.jsondata.getData('expenditureData').then(response => { // 已付
        this.formexpenditureData = response.data
      })
        .catch(error => {
          console.log(error)
        })
      this.jsondata.getDataClass('projectList', '0', 'complete').then(response => {
        this.tableData = response.data
        // console.log(this.tableData)
        for (let i = 0; i < this.tableData.length; i++) {
          this.tableData[i].ContractDate = response.data[0].ContractDate.substr(0, 10)
          this.tableData[i].ContractAmount = this.jsondata.currency(Number(this.tableData[i].ContractAmount), '￥', 2)
          this.tableData[i].ExpenditureBudget = this.jsondata.currency(this.tableData[i].ExpenditureBudget, '￥', 2)
          this.tableData[i].Receivables = 0
        }
        this.getdataReceivables()
      })
        .catch(error => {
          console.log(error)
        })
      return false
    },
    handle (row, event, column) {
      this.$router.push('/ProjectDetails/' + row.id)
      console.log(row.id)
      // console.log(row, event, column)
    },
    getFormData (formName) { // 加载客户例表
      this.jsondata.getData(formName).then(response => {
        this.optionsproject = response.data
      })
        .catch(error => {
          console.log(error)
        })
    },
    getdataReceivables () {
      this.jsondata.getData('Receivables').then(response => {
        this.jsondata.getData('RevenueContract').then(responseContract => {
          this.jsondata.getData('expenditure').then(responseexpenditure => { // 已付合同
            for (var i = 0; i < this.tableData.length; i++) {
              this.tableData[i].Receivables = 0
              this.tableData[i].expenditure = 0
              for (var is = 0; is < responseContract.data.length; is++) {
                for (var iss = 0; iss < response.data.length; iss++) {
                  if (responseContract.data[is].id === response.data[iss].projectId && Number(responseContract.data[is].projectId) === Number(this.tableData[i].id)) {
                    this.tableData[i].Receivables += Number(response.data[iss].Receivables)
                  }
                }
              }
              for (var ie = 0; ie < responseexpenditure.data.length; ie++) {
                responseexpenditure.data[ie].expenditure = 0
                for (var iee = 0; iee < this.formexpenditureData.length; iee++) {
                  if (responseexpenditure.data[ie].id === this.formexpenditureData[iee].projectId && Number(responseexpenditure.data[ie].projectId) === Number(this.tableData[i].id)) {
                    responseexpenditure.data[ie].expenditure += Number(this.formexpenditureData[iee].Receivables)
                  }
                }
                if (responseexpenditure.data[ie].Receivableslist === '不分期' && Number(responseexpenditure.data[ie].projectId) === Number(this.tableData[i].id)) {
                  this.tableData[i].expenditure += Number(responseexpenditure.data[ie].Receivables)
                } else {
                  this.tableData[i].expenditure += responseexpenditure.data[ie].expenditure
                }
              }
              this.tableData[i].expenditure = this.jsondata.currency(this.tableData[i].expenditure, '￥', 2)
              this.tableData[i].Receivables = this.jsondata.currency(this.tableData[i].Receivables, '￥', 2)
            }
          })
            .catch(error => {
              console.log(error)
            })
        })
          .catch(error => {
            console.log(error)
          })
      })
        .catch(error => {
          console.log(error)
        })
      return false
    }
  }
}
</script>
