 <template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3>
      进行中项目
    </h3>

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
      formReceivables: []
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
      this.jsondata.getData('expenditureData').then(response => {
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
        for (var i = 0; i < this.tableData.length; i++) {
          for (let iee in this.formexpenditureData) { //eslint-disable-line
            if (this.tableData[i].id == this.formexpenditureData[iee].projectlist) { //eslint-disable-line
              this.tableData[i].expenditure += Number(this.formexpenditureData[iee].Receivables)
            }
          }
          for (let is = 0; is < response.data.length; is++) {
            if(this.tableData[i].id == response.data[is].projectlist){ //eslint-disable-line
              this.tableData[i].Receivables += Number(response.data[is].Receivables)
              // console.log(this.tableData[i].Receivables, response.data[is], is)
            }
          }
          this.tableData[i].Receivables = this.jsondata.currency(Number(this.tableData[i].Receivables), '￥', 2)
          this.tableData[i].expenditure = this.jsondata.currency(Number(this.tableData[i].expenditure), '￥', 2)
        }
      })
        .catch(error => {
          console.log(error)
        })
      return false
    }
  }
}
</script>
