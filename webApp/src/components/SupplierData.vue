 <template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3>
      进行中项目
    </h3>

    <el-table @row-click="handle" :data="fromexpenditure" border :summary-method="jsondata.getSummaries" show-summary style="width: 100%">
      <el-table-column prop="SupplierName" label="供应商名称" sortable></el-table-column>
      <el-table-column prop="projectId" label="项目名称" sortable></el-table-column>
      <el-table-column prop="ReceivablesName" label="项目内容" sortable></el-table-column>
      <el-table-column prop="number" label="项目金额" sortable></el-table-column>
      <el-table-column prop="Receivables" label="已付金额" sortable></el-table-column>
      <el-table-column prop="ExpenditureBudget" label="未付金额" sortable></el-table-column>
      <el-table-column prop="projectClass" label="支出类别" sortable></el-table-column>
      <el-table-column prop="contractdate" label="签约时间" sortable></el-table-column>
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
      fromexpenditureData: [],
      fromprojectList: [],
      fromexpenditure: [],
      fromsupplierlist: [],
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
        this.fromexpenditureData = response.data
        this.jsondata.getDataClass('projectList', '0', 'complete').then(response => {
          this.fromprojectList = response.data
          this.jsondata.getData('expenditure').then(response => {
            for (let i = 0; i < this.fromprojectList.length; i++) {
              for (let is = 0; is < response.data.length; is++) {
                if(this.fromprojectList[i].id == response.data[is].projectId){ //eslint-disable-line
                  this.fromexpenditure.push(response.data[is])
                }
              }
            }
            for (let i = 0; i < this.fromprojectList.length; i++) {
              for (let is = 0; is < this.fromexpenditure.length; is++) {
                if(this.fromprojectList[i].id == this.fromexpenditure[is].projectId){ //eslint-disable-line
                  this.fromexpenditure[is].projectId = this.fromprojectList[i].projectName
                }
              }
            }
            this.jsondata.getData('supplierlist').then(response => { // 供应商例表
              this.fromsupplierlist = response.data
              for (let i = 0; i < this.fromexpenditure.length; i++) {
                for (let is = 0; is < response.data.length; is++) {
                  if(response.data[is].SupplierClass != '1' && this.fromexpenditure[i].SupplierName == response.data[is].id){ //eslint-disable-line
                    this.fromexpenditure.splice(i, 1)
                  }
                  if(this.fromexpenditure[i].SupplierName == response.data[is].id){ //eslint-disable-line
                    this.fromexpenditure[i].SupplierName = response.data[is].SupplierName
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
    handle (row, event, column) {
      this.$router.push('/ProjectDetails/' + row.id)
      console.log(row.id)
      // console.log(row, event, column)
    }
  }
}
</script>
