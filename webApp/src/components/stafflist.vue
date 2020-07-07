 <template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3>
      供应商例表<span style="float:right;font-size: 16px">不计发票:{{this.jsondata.currency(this.biujifapiao, '￥', 2)}}</span>
    </h3>
    <el-table @row-click="handle" :data="fromexpenditure" border :summary-method="jsondata.getSummaries" show-summary  :span-method="objectSpanMethod"  style="width: 100%">
      <el-table-column prop="SupplierName" label="供应商名称"></el-table-column>
      <el-table-column prop="projectId" label="项目名称"></el-table-column>
      <el-table-column prop="ReceivablesName" label="项目内容"></el-table-column>
      <el-table-column prop="number" label="项目金额"></el-table-column>
      <el-table-column prop="Receivables" label="已付金额"></el-table-column>
      <el-table-column prop="kaifapiao" label="已付款未收发票"></el-table-column>
      <el-table-column prop="Receivablesend" label="未付金额"></el-table-column>
      <el-table-column prop="projectClass" label="支出类别"></el-table-column>
      <el-table-column prop="contractdate" label="签约时间"></el-table-column>
    </el-table>
  </el-main>
</template>
<script>
export default {
  data () {
    return {
      biujifapiao: '',
      weikaifapiao: '',
      thisdata: {},
      dataList: [],
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
      this.jsondata.getData('expenditureData').then(response => { // 支出
        this.fromexpenditureData = response.data
        this.jsondata.getDataClass('projectList', '0', 'complete').then(response => { // 项目
          this.fromprojectList = response.data
          this.jsondata.getData('expenditure').then(response => { // 支出合同
            this.jsondata.getData('supplierlist').then(responsegys => { // 供应商例表
              this.jsondata.getData('expenditureclass').then(responselist => { // 支出分类
                for (let i = 0; i < this.fromprojectList.length; i++) {
                  for (let is = 0; is < response.data.length; is++) {
                  if(this.fromprojectList[i].id == response.data[is].projectId){ //eslint-disable-line
                      for (let iss = 0; iss < responsegys.data.length; iss++) { // 收款人分类
                      if(response.data[is].SupplierName == responsegys.data[iss].id && responsegys.data[iss].SupplierClass == 2){  //eslint-disable-line
                          this.thisdata = response.data[is]
                          this.thisdata.SupplierName = responsegys.data[iss].SupplierName
                          this.fromexpenditure.push(this.thisdata) // 进行中项目的所有合同
                        }
                      }
                    }
                  }
                }
                // for (let i = 0; i < this.fromprojectList.length; i++) {
                //   for (let is = 0; is < this.fromexpenditure.length; is++) {
                //     if(this.fromprojectList[i].id == this.fromexpenditure[is].projectId){ //eslint-disable-line
                //       this.fromexpenditure[is].projectId = this.fromprojectList[i].projectName
                //     }
                //   }
                // }
                this.fromexpenditure = this.jsondata.fordata(this.fromprojectList, this.fromexpenditure, 'projectName', 'projectId')
                for (let i = 0; i < this.fromexpenditure.length; i++) {
                  this.fromexpenditure[i].kaifapiao = 0
                  for (let il = 0; il < responselist.data.length; il++) {
                    if(responselist.data[il].id == this.fromexpenditure[i].projectClass){ //eslint-disable-line
                      this.fromexpenditure[i].projectClass = responselist.data[il].expenditureClass
                    }
                  }
                  for (let is = 0; is < this.fromexpenditureData.length; is++) {
                  if(this.fromexpenditure[i].id == this.fromexpenditureData[is].projectId){ //eslint-disable-line
                    if(this.fromexpenditureData[is].invoicebo == '不计发票'){ //eslint-disable-line
                        this.biujifapiao += Number(this.fromexpenditureData[is].Receivables)
                      } else {
                        this.fromexpenditure[i].kaifapiao += Number(this.fromexpenditureData[is].invoice)
                      }
                    if(this.fromexpenditure[i].Receivableslist == '不分期'){ //eslint-disable-line
                      // this.fromexpenditure[i].Receivables += Number(response.data[i].Receivables)
                      } else {
                        this.fromexpenditure[i].Receivables = Number(this.fromexpenditure[i].Receivables) + Number(this.fromexpenditureData[is].Receivables) // 已付金额
                      }
                    // console.log(this.fromexpenditure[is])
                    }
                  }
                  // this.weikaifapiao = Number(this.weikaifapiao) + Number(this.fromexpenditure[i].Receivables) - Number(this.fromexpenditure[i].kaifapiao)
                  if(this.fromexpenditure[i].invoicebo == '不计发票'){ //eslint-disable-line
                    this.fromexpenditure[i].kaifapiao = '不计发票'
                  } else {
                    this.fromexpenditure[i].kaifapiao = this.jsondata.currency(this.fromexpenditure[i].Receivables - this.fromexpenditure[i].kaifapiao, '￥', 2)
                  }
                  this.fromexpenditure[i].Receivablesend = Number(this.fromexpenditure[i].number) - Number(this.fromexpenditure[i].Receivables)
                  this.fromexpenditure[i].Receivablesend = this.jsondata.currency(this.fromexpenditure[i].Receivablesend, '￥', 2)
                  this.fromexpenditure[i].Receivables = this.jsondata.currency(this.fromexpenditure[i].Receivables, '￥', 2)
                  this.fromexpenditure[i].number = this.jsondata.currency(this.fromexpenditure[i].number, '￥', 2)
                }

                this.fromexpenditure.sort(function (a, b) { return (a.SupplierName + '').localeCompare(b.SupplierName + '') })
                this.dataList = this.jsondata.getSpanArr(this.fromexpenditure, 'SupplierName') // 合并表格数组
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
      console.log(row.id)
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
    }
  }
}
</script>
