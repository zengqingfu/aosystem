 <template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3>
      外包例表<el-button style="float: right;margin-left:20px" onclick="exportExcel('#gongyingshangliebiao')">点击导出</el-button>
      <el-input v-model="inputData" placeholder="请输入搜索内容" @input="play(inputData)" style="width:200px;float: right;"></el-input>
      <!-- <el-input
        placeholder="请输入内容"
        v-model="inputSearchS"
        clearable style="width:300px;">
      </el-input>
      <el-button type="primary">提交</el-button> -->
    </h3>
    <el-table @row-click="handle" :data="tableData_s" id="gongyingshangliebiao" border :summary-method="jsondata.getSummaries" show-summary height='90%' style="width: 100%">
      <el-table-column type="index"></el-table-column>
      <el-table-column prop="SupplierName" label="供应商名称" width="300"></el-table-column>
      <el-table-column prop="number" label="应付金额" sortable></el-table-column>
      <el-table-column prop="Receivables" label="已付金额" sortable></el-table-column>
      <el-table-column prop="Receivablesend" label="未付金额" sortable></el-table-column>
      <el-table-column prop="kaifapiao" label="已收发票" sortable></el-table-column>
      <el-table-column prop="weishoufapiao" label="已付款未收发票" sortable></el-table-column>
      <!-- <el-table-column prop="biujifapiao" label="不计发票"></el-table-column> -->
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
      inputSearchS: '',
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
      this.jsondata.getData('expendituredata').then(responsedata => { // 支出
        this.fromexpenditureData = responsedata.data
        this.jsondata.getDataClass('projectlist', '0', 'complete').then(responseproject => { // 项目
          this.fromprojectList = responseproject.data
          this.jsondata.getData('expenditure').then(response => { // 支出合同
            this.jsondata.getDataClass('supplierlist', '3', 'supplierClass').then(responsegys => { // 供应商例表
              this.jsondata.getData('expenditureclass').then(responselist => { // 支出分类
                for (let i = 0; i < this.fromprojectList.length; i++) {
                  for (let is = 0; is < response.data.length; is++) {
                    if(this.fromprojectList[i].id == response.data[is].projectId){ //eslint-disable-line
                      for (let iss = 0; iss < responsegys.data.length; iss++) {
                        if(response.data[is].SupplierName == responsegys.data[iss].id){ //eslint-disable-line
                          // this.thisdata = response.data[is]
                          // this.thisdata.SupplierName = responsegys.data[iss].SupplierName
                          this.fromexpenditure.push(response.data[is]) // 进行中项目的所有合同
                        }
                      }
                    }
                  }
                }
                for (let i = 0; i < this.fromexpenditure.length; i++) {
                  // if (this.fromexpenditure[i].SupplierName === '20' && this.fromexpenditure[i].Receivableslist != '不分期') {  //eslint-disable-line
                  //   console.log(this.fromexpenditure[i].Receivables, this.fromexpenditure[i].projectId)
                  // }
                  this.fromexpenditure[i].kaifapiao = 0
                  this.fromexpenditure[i].biujifapiao = 0
                  if(this.fromexpenditure[i].Receivableslist != '不分期'){ //eslint-disable-line
                    this.fromexpenditure[i].number = 0 // 应收款~~~~~~~~~~~不确定,最后选择用收款列表计算,原本是用收款合同计算
                    this.fromexpenditure[i].Receivables = 0
                  }
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
                      if (this.fromexpenditure[i].Receivableslist == '不分期') { //eslint-disable-line
                      } else {
                        this.fromexpenditure[i].number += Number(this.fromexpenditureData[is].number) // 应收款~~~~~~~~~~~不确定,最后选择用收款列表计算,原本是用收款合同计算
                        this.fromexpenditure[i].Receivables += Number(this.fromexpenditureData[is].Receivables) // 已付金额
                      }
                    }
                  }
                  if(this.fromexpenditure[i].Receivableslist == '不分期'){ //eslint-disable-line
                    // this.fromexpenditure[i].Receivables = Number(this.fromexpenditure[i].Receivables) + Number(response.data[i].Receivables)
                    // this.fromexpenditure[i].number += Number(this.fromexpenditureData[is].Receivables)
                    this.fromexpenditure[i].kaifapiao = this.fromexpenditure[i].invoice
                  }
                  // this.weikaifapiao = Number(this.weikaifapiao) + Number(this.fromexpenditure[i].Receivables) - Number(this.fromexpenditure[i].kaifapiao)
                  if(this.fromexpenditure[i].invoicebo == '不计发票' && this.fromexpenditure[i].Receivableslist == '不分期'){ //eslint-disable-line
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
                      this.fromsupplierlist[i].biujifapiao += Number(this.fromexpenditure[is].biujifapiao)
                      // if (this.fromsupplierlist[i].SupplierName === '广州市科驰广告制作有限公司') {
                      //   console.log(this.fromexpenditure[is].Receivables, this.fromsupplierlist[i].Receivables)
                      // }
                    }
                  }
                  this.fromsupplierlist[i].weishoufapiao = this.jsondata.currency(this.fromsupplierlist[i].Receivables - this.fromsupplierlist[i].kaifapiao - this.fromsupplierlist[i].biujifapiao, '￥', 2)
                  this.fromsupplierlist[i].number = this.jsondata.currency(this.fromsupplierlist[i].number, '￥', 2)
                  this.fromsupplierlist[i].Receivables = this.jsondata.currency(this.fromsupplierlist[i].Receivables, '￥', 2)
                  this.fromsupplierlist[i].Receivablesend = this.jsondata.currency(this.fromsupplierlist[i].Receivablesend, '￥', 2)
                  this.fromsupplierlist[i].kaifapiao = this.jsondata.currency(this.fromsupplierlist[i].kaifapiao, '￥', 2)
                }
                this.tableData_s = this.fromsupplierlist
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
    },
    play (input) {
      let _this = this
      _this.table = _this.fromsupplierlist.filter(Val => {
        if (Val.SupplierName.includes(input) || Val.number.includes(input) || Val.Receivables.includes(input)) {
          _this.table.push(Val)
          return _this.table
        }
      })
      this.tableData_s = _this.table
    }
  }
}
</script>
