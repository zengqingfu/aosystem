 <template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3>
      供应商例表
    </h3>
    <el-table @row-click="handle" :data="fromsupplierlist" border :summary-method="jsondata.getSummaries" show-summary  style="width: 100%">
      <el-table-column prop="SupplierName" label="供应商名称" width="300"></el-table-column>
      <el-table-column prop="number" label="应付金额"></el-table-column>
      <el-table-column prop="Receivables" label="已付金额"></el-table-column>
      <el-table-column prop="Receivablesend" label="未付金额"></el-table-column>
      <el-table-column prop="kaifapiao" label="已收发票"></el-table-column>
      <el-table-column prop="weishoufapiao" label="已付款未收发票"></el-table-column>
      <!-- <el-table-column prop="biujifapiao" label="不计发票"></el-table-column> -->
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
            this.jsondata.getDataClass('supplierlist', '1', 'SupplierClass').then(responsegys => { // 供应商例表
              this.jsondata.getData('expenditureclass').then(responselist => { // 支出分类
                for (let i = 0; i < this.fromprojectList.length; i++) {
                  for (let is = 0; is < response.data.length; is++) {
                  if(this.fromprojectList[i].id == response.data[is].projectId){ //eslint-disable-line
                      for (let iss = 0; iss < responsegys.data.length; iss++) {
                      if(response.data[is].SupplierName == responsegys.data[iss].id && responsegys.data[iss].SupplierClass == 1){  //eslint-disable-line
                          // this.thisdata = response.data[is]
                          // this.thisdata.SupplierName = responsegys.data[iss].SupplierName
                          this.fromexpenditure.push(response.data[is]) // 进行中项目的所有合同
                        }
                      }
                    }
                  }
                }
                for (let i = 0; i < this.fromexpenditure.length; i++) {
                  this.fromexpenditure[i].kaifapiao = 0
                  this.fromexpenditure[i].biujifapiao = 0
                  for (let il = 0; il < responselist.data.length; il++) {
                    if(responselist.data[il].id == this.fromexpenditure[i].projectClass){ //eslint-disable-line
                      this.fromexpenditure[i].projectClass = responselist.data[il].expenditureClass
                    }
                  }
                  for (let is = 0; is < this.fromexpenditureData.length; is++) {
                  if(this.fromexpenditure[i].id == this.fromexpenditureData[is].projectId){ //eslint-disable-line
                    if(this.fromexpenditureData[is].invoicebo == '不计发票'){ //eslint-disable-line
                        this.fromexpenditure[i].biujifapiao += Number(this.fromexpenditureData[is].Receivables)
                      } else {
                        this.fromexpenditure[i].kaifapiao += Number(this.fromexpenditureData[is].invoice)
                      }
                    if(this.fromexpenditure[i].Receivableslist == '不分期'){ //eslint-disable-line
                      // this.fromexpenditure[i].Receivables += Number(response.data[i].Receivables)
                      } else {
                        this.fromexpenditure[i].Receivables = Number(this.fromexpenditure[i].Receivables) + Number(this.fromexpenditureData[is].Receivables) // 已付金额
                      }
                    }
                  }
                  // this.weikaifapiao = Number(this.weikaifapiao) + Number(this.fromexpenditure[i].Receivables) - Number(this.fromexpenditure[i].kaifapiao)
                  if(this.fromexpenditure[i].invoicebo == '不计发票'){ //eslint-disable-line
                    // this.fromexpenditure[i].kaifapiao = '不计发票'
                    this.fromexpenditure[i].biujifapiao += Number(this.fromexpenditure[i].Receivables)
                  } else {
                    // this.fromexpenditure[i].kaifapiao
                  }
                  this.fromexpenditure[i].Receivablesend = Number(this.fromexpenditure[i].number) - Number(this.fromexpenditure[i].Receivables)
                }
                this.fromsupplierlist = responsegys.data
                for (let i = 0; i < this.fromsupplierlist.length; i++) {
                  this.fromsupplierlist[i].invoice = 0
                  this.fromsupplierlist[i].number = 0
                  this.fromsupplierlist[i].Receivables = 0
                  this.fromsupplierlist[i].kaifapiao = 0
                  this.fromsupplierlist[i].Receivablesend = 0
                  this.fromsupplierlist[i].biujifapiao = 0
                  for (let is = 0; is < this.fromexpenditure.length; is++) {
                    if (this.fromexpenditure[is].SupplierName == this.fromsupplierlist[i].id) { //eslint-disable-line
                      this.fromsupplierlist[i].number += Number(this.fromexpenditure[is].number)
                      this.fromsupplierlist[i].Receivables += Number(this.fromexpenditure[is].Receivables)
                      this.fromsupplierlist[i].kaifapiao += Number(this.fromexpenditure[is].kaifapiao)
                      this.fromsupplierlist[i].Receivablesend += Number(this.fromexpenditure[is].Receivablesend)
                      // this.fromsupplierlist[i].biujifapiao += Number(this.fromexpenditure[i].biujifapiao)
                    }
                  }
                  this.fromsupplierlist[i].weishoufapiao = this.jsondata.currency(this.fromsupplierlist[i].Receivables - this.fromsupplierlist[i].kaifapiao, '￥', 2)
                  this.fromsupplierlist[i].number = this.jsondata.currency(this.fromsupplierlist[i].number, '￥', 2)
                  this.fromsupplierlist[i].Receivables = this.jsondata.currency(this.fromsupplierlist[i].Receivables, '￥', 2)
                  this.fromsupplierlist[i].Receivablesend = this.jsondata.currency(this.fromsupplierlist[i].Receivablesend, '￥', 2)
                  this.fromsupplierlist[i].kaifapiao = this.jsondata.currency(this.fromsupplierlist[i].kaifapiao, '￥', 2)
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
      })
        .catch(error => {
          console.log(error)
        })
      return false
    },
    handle (row, event, column) {
      this.$router.push('/SupplierDatalist/' + row.id)
      console.log(row.id)
      // console.log(row, event, column)
    }
  }
}
</script>
