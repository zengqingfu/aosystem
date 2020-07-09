 <template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3>
      {{this.Suppliertitle}}
    </h3>
    <el-table :data="tableData" border :span-method="objectSpanMethod" :summary-method="jsondata.getSummaries" show-summary  style="width: 100%">
      <el-table-column prop="projectlist" label="所属项目"></el-table-column>
      <el-table-column prop="projectname" label="应付内容"></el-table-column>
      <el-table-column prop="projectdata" label="签约日期"></el-table-column>
      <el-table-column prop="projectnumber" label="应付总额"></el-table-column>
      <el-table-column prop="Receivableslist" label="应付分期"></el-table-column>
      <el-table-column prop="ReceivablesData" label="应付时间"></el-table-column>
      <el-table-column prop="number" label="应付金额"></el-table-column>
      <el-table-column prop="Receivables" label="已付金额"></el-table-column>
      <el-table-column prop="daozhangdate" label="付款时间"></el-table-column>
      <el-table-column prop="Receivablesend" label="未付金额"></el-table-column>
      <el-table-column prop="invoice" label="已收发票"></el-table-column>
      <el-table-column prop="kaifapiaodate" label="已票时间"></el-table-column>
      <el-table-column prop="weikaifapiao" label="已付款未收票"></el-table-column>
      <el-table-column prop="biujifapiao" label="不计发票"></el-table-column>
    </el-table>
  </el-main>
</template>
<script>
export default {
  data () {
    return {
      Suppliertitle: '',
      biujifapiao: '',
      weikaifapiao: '',
      thisdata: {},
      dataList: [],
      dataList1: [],
      dataList2: [],
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
      this.biujifapiao = 0
      this.weikaifapiao = 0
      this.jsondata.getData('expenditureData').then(responseexpenditureData => { // 支出
        this.jsondata.getDataClass('projectList', '0', 'complete').then(responseprojectList => { // 项目
          this.jsondata.getData('expenditure').then(responseexpenditure => { // 支出合同
            this.jsondata.getDataClass('supplierlist', this.$route.params.id, 'id').then(responsegys => { // 供应商例表
              this.jsondata.getData('expenditureclass').then(responselist => { // 支出分类
                for (let i = 0; i < responseprojectList.data.length; i++) {
                  for (let is = 0; is < responseexpenditure.data.length; is++) {
                    for (let iss = 0; iss < responseexpenditureData.data.length; iss++) {
                      if (responseprojectList.data[i].id === responseexpenditure.data[is].projectId && Number(responseexpenditureData.data[iss].projectId) === Number(responseexpenditure.data[is].id) && responseexpenditure.data[is].SupplierName === this.$route.params.id) {
                        responseexpenditureData.data[iss].projectdata = responseexpenditure.data[is].contractdate
                        responseexpenditureData.data[iss].projectlist = responseprojectList.data[i].projectName
                        responseexpenditureData.data[iss].projectname = responseexpenditure.data[is].ReceivablesName
                        responseexpenditureData.data[iss].weikaifapiao = Number(responseexpenditureData.data[iss].Receivables) - Number(responseexpenditureData.data[iss].invoice)
                        if (responseexpenditure.data[is].number != '') { //eslint-disable-line
                          responseexpenditureData.data[iss].projectnumber = Number(responseexpenditure.data[is].number)
                          responseexpenditure.data[is].number = ''
                        } else {
                          responseexpenditureData.data[iss].projectnumber = 0
                        }
                        if (responseexpenditureData.data[iss].invoicebo === '不计发票') {
                          responseexpenditureData.data[iss].biujifapiao = Number(responseexpenditureData.data[iss].Receivables)
                        } else {
                          responseexpenditureData.data[iss].biujifapiao = 0
                        }
                        this.tableData.push(responseexpenditureData.data[iss])
                        // this.tableData[i].Receivables += Number(response.data[iss].Receivables)
                      }
                    }
                  }
                }
                for (let i = 0; i < this.tableData.length; i++) {
                  if(this.tableData[i].number == ''){ //eslint-disable-line
                    this.tableData[i].Receivablesend = ''
                  } else {
                    this.tableData[i].Receivablesend = Number(this.tableData[i].number)
                    this.tableData[i].weikaifapiao = 0
                    for (let is = 0; is < this.tableData.length; is++) {
                      if (this.tableData[i].Receivableslist == this.tableData[is].Receivableslist && this.tableData[i].projectname == this.tableData[is].projectname){ //eslint-disable-line
                        this.tableData[i].Receivablesend -= Number(this.tableData[is].Receivables)
                        this.tableData[i].weikaifapiao += Number(this.tableData[is].Receivables) - Number(this.tableData[is].invoice)
                      }
                    }
                  }
                  this.tableData[i].weikaifapiao = this.jsondata.currency(this.tableData[i].weikaifapiao, '￥', 2)
                  this.tableData[i].Receivablesend = this.jsondata.currency(this.tableData[i].Receivablesend, '￥', 2)
                  this.tableData[i].Receivables = this.jsondata.currency(this.tableData[i].Receivables, '￥', 2)
                  this.tableData[i].number = this.jsondata.currency(this.tableData[i].number, '￥', 2)
                  this.tableData[i].invoice = this.jsondata.currency(this.tableData[i].invoice, '￥', 2)
                  this.tableData[i].projectnumber = this.jsondata.currency(this.tableData[i].projectnumber, '￥', 2)
                }
                this.tableData = this.tableData.sort(function (a, b) { return (a.Receivableslist + '').localeCompare(b.Receivableslist + '') }) // 排序.reverse()
                this.tableData = this.tableData.sort(function (a, b) { return (a.projectname + '').localeCompare(b.projectname + '') }) // 排序.reverse()
                this.tableData = this.tableData.sort(function (a, b) { return (a.projectlist + '').localeCompare(b.projectlist + '') }) // 排序.reverse()
                this.Suppliertitle = responsegys.data[0].SupplierName
                this.dataList = this.jsondata.getSpanArr(this.tableData, 'projectlist')
                this.dataList1 = this.jsondata.getSpanArr(this.tableData, 'projectname')
                this.dataList2 = this.jsondata.getSpanArr(this.tableData, 'Receivableslist')
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
    handle (row, event, column) {
      this.$router.push('/ProjectDetails/' + row.id)
      // console.log(row, event, column)
    },
    objectSpanMethod ({ row, column, rowIndex, columnIndex }) {
      if (columnIndex === 0) {
        const _row = this.dataList[rowIndex]
        const _col = _row > 0 ? 1 : 0
        return {
          rowspan: _row,
          colspan: _col
        }
      }
      if (columnIndex === 1 || columnIndex === 2 || columnIndex === 3) {
        const _row = this.dataList1[rowIndex]
        const _col = _row > 0 ? 1 : 0
        return {
          rowspan: _row,
          colspan: _col
        }
      }
      if (columnIndex === 6 || columnIndex === 4 || columnIndex === 5 || columnIndex === 9 || columnIndex === 12) {
        const _row = this.dataList2[rowIndex]
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
