 <template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3>
      进行中项目
      <el-button type="primary" @click="getdata('2020')">2020</el-button>
      <el-button type="primary" @click="getdata('2021')">2021</el-button>
      <el-button type="primary" @click="getdata('2022')">2022</el-button>
      <el-button type="primary" @click="getdata('2023')">2023</el-button>
      <el-button type="primary" @click="getdata()">全部</el-button>
      <el-button type="primary" style="float: right;" @click="dialogFormVisible = true">添加项目</el-button>
      <el-button style="float: right;margin-right:20px" onclick="exportExcel('#projectid')">点击导出</el-button>
      <el-input v-model="inputData" placeholder="请输入搜索内容" @input="play(inputData)" style="width:200px;float: right;;margin-right:0px"></el-input>
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
          <el-input type="number"  v-model="form.ContractAmount" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="预算支出" prop="ExpenditureBudget">
          <el-input type="number" v-model="form.ExpenditureBudget" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="归属区域公司" prop="projectup">
          <el-input v-model="form.Receivables" style="width:46%" ></el-input>
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
    <el-table @row-click="handle" :data="tableData_s" id="projectid" border :summary-method="jsondata.getSummaries" height="90%" show-summary style="width: 100%">
      <el-table-column type="index"></el-table-column>
      <el-table-column prop="ContractDate" label="签约时间" sortable></el-table-column>
      <el-table-column prop="projectName" label="项目名称" sortable></el-table-column>
      <el-table-column prop="ContractAmount" label="项目金额" sortable></el-table-column>
      <el-table-column prop="Receivables" label="已收金额" sortable></el-table-column>
      <el-table-column prop="Receivablesbfb" label="已收比例" sortable></el-table-column>
      <el-table-column prop="Receivablesend" label="未收金额" sortable></el-table-column>
      <el-table-column prop="ExpenditureBudget" label="应付金额" sortable></el-table-column>
      <el-table-column prop="expenditure" label="已付金额" sortable></el-table-column>
      <el-table-column prop="expenditureend" label="未付金额" sortable></el-table-column>
      <el-table-column prop="projectprofit" label="毛利" sortable></el-table-column>
      <el-table-column prop="profit" label="毛利率" sortable></el-table-column>
      <el-table-column prop="projectContent" label="项目说明" sortable></el-table-column>
    </el-table>
  </el-main>
</template>
<script>

export default {
  data () {
    return {
      tableData_s: [],
      table: [],
      inputData: '',
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
        Receivables: '',
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
        // ContractAmount: [
        //   { required: true, message: '请输入合同金额' },
        // ],
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
    this.getFormData('customerlist')
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
      this.jsondata.postData('projectlist', this.form).then(response => {
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
    getdata (yueanint) {
      this.tableData = []
      this.jsondata.getDataClass('projectlist', '0', 'complete').then(responseprojectlist => {
        if (yueanint) {
          responseprojectlist.data.filter(Val => {
            if (Val.ContractDate.includes(yueanint)) {
              this.tableData.push(Val)
            }
          })
        } else {
          this.tableData = responseprojectlist.data
        }
        this.jsondata.getData('receivables').then(response => {
          this.jsondata.getData('revenuecontract').then(responseContract => {
            this.jsondata.getData('expenditure').then(responseexpenditure => { // 已付记录
              this.jsondata.getData('expendituredata').then(responsehetong => { // 已付合同   76,450,549.58
                for (let item in responsehetong.data) {
                  for (let items in responseexpenditure.data) {
                    if (responseexpenditure.data[items].id === responsehetong.data[item].projectId) {
                      responsehetong.data[item].hetongid = responseexpenditure.data[items].projectId
                    }
                  }
                }
                for (var i = 0; i < this.tableData.length; i++) {
                  this.tableData[i].Customerindex = this.tableData[i].Receivables // 乱七八糟的添加~~~~~~~~~~~唉~~~~~~~~~
                  this.tableData[i].Receivables = 0
                  this.tableData[i].expenditure = 0
                  this.tableData[i].Receivablesend = 0
                  this.tableData[i].ExpenditureBudget = 0
                  for (var is = 0; is < responseContract.data.length; is++) {
                    for (var iss = 0; iss < response.data.length; iss++) {
                      if (responseContract.data[is].id === response.data[iss].projectId && Number(responseContract.data[is].projectId) === Number(this.tableData[i].id)) {
                        this.tableData[i].Receivables += Number(response.data[iss].Receivables)
                      }
                    }
                  }
                  for (let item in responsehetong.data) {
                    if (Number(responsehetong.data[item].hetongid) === Number(this.tableData[i].id)) {
                      this.tableData[i].expenditure += Number(responsehetong.data[item].Receivables)
                    }
                  }
                  for (var ie = 0; ie < responseexpenditure.data.length; ie++) {
                    responseexpenditure.data[ie].expenditure = 0
                    if (this.tableData[i].id === responseexpenditure.data[ie].projectId) {
                      this.tableData[i].ExpenditureBudget += Number(responseexpenditure.data[ie].number)
                    }
                    // for (var iee = 0; iee < responsehetong.data.length; iee++) {
                    //   if (responseexpenditure.data[ie].id === responsehetong.data[iee].projectId && Number(responseexpenditure.data[ie].projectId) === Number(this.tableData[i].id)) {
                    //     responseexpenditure.data[ie].expenditure += Number(responsehetong.data[iee].Receivables)
                    //   }
                    // }
                    if (responseexpenditure.data[ie].Receivableslist === '不分期' && Number(responseexpenditure.data[ie].projectId) === Number(this.tableData[i].id)) {
                      this.tableData[i].expenditure += Number(responseexpenditure.data[ie].Receivables)
                    } else {
                      // this.tableData[i].expenditure += responseexpenditure.data[ie].expenditure
                    }
                  }
                  this.tableData[i].profit = (Number(this.tableData[i].ContractAmount) - Number(this.tableData[i].ExpenditureBudget)) / Number(this.tableData[i].ContractAmount)
                  this.tableData[i].profit = (this.tableData[i].profit * 100).toFixed(2) + '%'
                  this.tableData[i].expenditureend = this.jsondata.currency(Number(this.tableData[i].ExpenditureBudget) - Number(this.tableData[i].expenditure), '￥', 2)
                  this.tableData[i].projectprofit = this.jsondata.currency(Number(this.tableData[i].ContractAmount) - Number(this.tableData[i].ExpenditureBudget), '￥', 2)
                  this.tableData[i].ContractDate = this.tableData[i].ContractDate.substr(0, 10)
                  this.tableData[i].Receivablesend = this.jsondata.currency(Number(this.tableData[i].ContractAmount) - Number(this.tableData[i].Receivables), '￥', 2)
                  this.tableData[i].ExpenditureBudget = this.jsondata.currency(this.tableData[i].ExpenditureBudget, '￥', 2)
                  this.tableData[i].expenditure = this.jsondata.currency(this.tableData[i].expenditure, '￥', 2)
                  this.tableData[i].Receivablesbfb = (Number(this.tableData[i].Receivables) / Number(this.tableData[i].ContractAmount) * 100).toFixed(2) + '%'
                  this.tableData[i].Receivables = this.jsondata.currency(this.tableData[i].Receivables, '￥', 2)
                  this.tableData[i].ContractAmount = this.jsondata.currency(Number(this.tableData[i].ContractAmount), '￥', 2)
                }
                this.tableData_s = this.tableData
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
    play (input) {
      let _this = this
      _this.table = _this.tableData.filter(Val => {
        if (Val.Customerindex === 'null' || Val.Customerindex === null) {
          Val.Customerindex = '-'
        }
        // console.log(Val.Customerindex)
        if (Val.ContractDate.includes(input) || Val.projectName.includes(input) || Val.projectContent.includes(input) || Val.Customerindex.includes(input)) {
          _this.table.push(Val)
          return _this.table
        }
      })
      this.tableData_s = _this.table
    }
  }
}
</script>
