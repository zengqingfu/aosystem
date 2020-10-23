 <template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3>
      {{this.Suppliertitle}}<el-button style="float: right;margin-right:0px" onclick="exportExcel('#gongyingshangxiangxi')">点击导出</el-button>
    </h3>
    <el-table @row-click="handle" :data="tableData" border id="gongyingshangxiangxi" :summary-method="jsondata.getSummaries" :span-method="objectSpanMethod"  show-summary height='90%' style="width: 100%">
      <!-- <el-table-column type="index"></el-table-column> -->
      <el-table-column prop="projectlist" label="所属项目"></el-table-column>
      <el-table-column prop="projectname" label="应付内容"></el-table-column>
      <el-table-column prop="projectdata" label="签约日期"></el-table-column>
      <el-table-column prop="projectnumber" label="应付总额"></el-table-column>
      <el-table-column prop="Receivableslist" label="应付分期"></el-table-column>
      <el-table-column prop="ReceivablesData" label="应付时间"></el-table-column>
      <el-table-column prop="number" label="分期应付金额"></el-table-column>
      <el-table-column prop="Receivables" label="已付金额"></el-table-column>
      <el-table-column prop="daozhangdate" label="付款时间"></el-table-column>
      <el-table-column prop="Receivablesend" label="未付金额"></el-table-column>
      <el-table-column prop="invoice" label="已收发票"></el-table-column>
      <el-table-column prop="kaifapiaodate" label="开票时间"></el-table-column>
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
      this.jsondata.getData('expendituredata').then(responseexpenditureData => { // 支出
        this.jsondata.getDataClass('projectlist', '0', 'complete').then(responseprojectList => { // 项目
          this.jsondata.getData('expenditure').then(responseexpenditure => { // 支出合同
            this.jsondata.getDataClass('supplierlist', this.$route.params.id, 'id').then(responsegys => { // 供应商例表
              this.jsondata.getData('expenditureclass').then(responselist => { // 支出分类
                for (let i = 0; i < responseprojectList.data.length; i++) {
                  for (let is = 0; is < responseexpenditure.data.length; is++) {
                    for (let iss = 0; iss < responseexpenditureData.data.length; iss++) {
                      if (responseprojectList.data[i].id === responseexpenditure.data[is].projectId && Number(responseexpenditureData.data[iss].projectId) === Number(responseexpenditure.data[is].id) && responseexpenditure.data[is].SupplierName === this.$route.params.id) {
                        responseexpenditureData.data[iss].hetongid = responseexpenditure.data[is].id
                        responseexpenditureData.data[iss].projectdata = responseexpenditure.data[is].contractdate
                        responseexpenditureData.data[iss].projectlist = responseprojectList.data[i].projectName
                        responseexpenditureData.data[iss].projectname = responseexpenditure.data[is].ReceivablesName
                        responseexpenditureData.data[iss].listid = responseexpenditure.data[is].id
                        responseexpenditureData.data[iss].weikaifapiao = Number(responseexpenditureData.data[iss].Receivables) - Number(responseexpenditureData.data[iss].invoice)
                        responseexpenditureData.data[iss].porjectidset = responseprojectList.data[i].id
                        if (responseexpenditure.data[is].number != '') { //eslint-disable-line
                          responseexpenditureData.data[iss].projectnumber = Number(responseexpenditure.data[is].number)
                          responseexpenditure.data[is].number = '' // 应付总额合并
                        } else {
                          responseexpenditureData.data[iss].projectnumber = 0
                        }
                        if (responseexpenditureData.data[iss].invoicebo === '不计发票') {
                          responseexpenditureData.data[iss].biujifapiao = Number(responseexpenditureData.data[iss].Receivables)
                        } else {
                          responseexpenditureData.data[iss].biujifapiao = 0
                        }
                        if (responseexpenditure.data[is].Receivableslist === '不分期') {
                        } else {
                        }
                        this.tableData.push(responseexpenditureData.data[iss])
                        // console.log(responseexpenditureData.data[iss].invoicebo)
                        // this.tableData[i].Receivables += Number(response.data[iss].Receivables)
                      }
                    }
                    if (responseexpenditure.data[is].Receivableslist === '不分期' && responseexpenditure.data[is].SupplierName === this.$route.params.id && responseprojectList.data[i].id === responseexpenditure.data[is].projectId) {
                      responseexpenditure.data[is].listid = responseexpenditure.data[is].id
                      responseexpenditure.data[is].projectdata = responseexpenditure.data[is].contractdate
                      responseexpenditure.data[is].projectlist = responseprojectList.data[i].projectName
                      responseexpenditure.data[is].projectname = responseexpenditure.data[is].ReceivablesName
                      responseexpenditure.data[is].projectnumber = responseexpenditure.data[is].number
                      responseexpenditure.data[is].weikaifapiao = Number(responseexpenditure.data[is].Receivables) - Number(responseexpenditure.data[is].invoice)
                      responseexpenditure.data[is].porjectidset = responseprojectList.data[i].id
                      responseexpenditure.data[is].hetongid = responseexpenditure.data[is].id
                      this.tableData.push(responseexpenditure.data[is])
                      // console.log(responseexpenditure.data[is].Receivables, responseexpenditure.data[is].projectnumber)
                    }
                  }
                }
                // console.log(this.tableData)
                for (let i = 0; i < this.tableData.length; i++) {
                  // console.log(this.tableData[i].Receivableslist, this.tableData[i].hetongid, this.tableData[i].projectClass, this.tableData[i].listid)
                  // console.log(this.tableData[i].projectId)
                  this.tableData[i].weikaifapiao = 0 // 未开票需要每条记录清0,然后统计到每期主要信息
                  if(this.tableData[i].number > 1){ //eslint-disable-line
                    this.tableData[i].Receivablesend = Number(this.tableData[i].number)
                    for (let is = 0; is < this.tableData.length; is++) {
                      if (this.tableData[i].Receivableslist == this.tableData[is].Receivableslist && this.tableData[i].projectname == this.tableData[is].projectname && this.tableData[i].listid == this.tableData[is].listid ){ //eslint-disable-line
                        // console.log(this.tableData[i].Receivableslist, this.tableData[is].Receivableslist, this.tableData[i].projectname, this.tableData[is].projectname,this.tableData[i].Receivablesend,this.tableData[is].Receivables)
                        this.tableData[i].Receivablesend -= Number(this.tableData[is].Receivables)
                        if (this.tableData[i].invoicebo === '不计发票') {
                          this.tableData[i].biujifapiao = Number(this.tableData[i].Receivables)
                          this.tableData[i].weikaifapiao = 0
                        } else {
                          this.tableData[i].weikaifapiao += Number(this.tableData[is].Receivables) - Number(this.tableData[is].invoice)
                        }
                      }
                    }
                  } else {
                    this.tableData[i].Receivablesend = ''
                  }
                  this.tableData[i].weikaifapiao = this.jsondata.currency(this.tableData[i].weikaifapiao, '￥', 2)
                  this.tableData[i].Receivablesend = this.jsondata.currency(this.tableData[i].Receivablesend, '￥', 2)
                  this.tableData[i].Receivables = this.jsondata.currency(this.tableData[i].Receivables, '￥', 2)
                  this.tableData[i].number = this.jsondata.currency(this.tableData[i].number, '￥', 2)
                  if (this.tableData[i].invoice === '') {
                    this.tableData[i].kaifapiaodate = ''
                  } else {
                    this.tableData[i].invoice = this.jsondata.currency(this.tableData[i].invoice, '￥', 2)
                  }
                  this.tableData[i].projectnumber = this.jsondata.currency(this.tableData[i].projectnumber, '￥', 2)
                  this.tableData[i].biujifapiao = this.jsondata.currency(this.tableData[i].biujifapiao, '￥', 2)
                }
                this.tableData = this.tableData.sort(function (a, b) { return (a.Receivableslist + '').localeCompare(b.Receivableslist + '') }) // 排序.reverse()
                this.tableData = this.tableData.sort(function (a, b) { return (a.listid + '').localeCompare(b.listid + '') }) // 排序.reverse()
                this.tableData = this.tableData.sort(function (a, b) { return (a.projectlist + '').localeCompare(b.projectlist + '') }) // 排序.reverse()
                this.Suppliertitle = responsegys.data[0].SupplierName
                this.dataList = this.jsondata.getSpanArr(this.tableData, 'projectlist')
                this.dataList1 = this.getSpanArrs(this.tableData, 'listid', 'projectId')
                // this.dataList2 = this.getSpanArrs(this.tableData, 'Receivableslist', 'projectname')
                this.dataList2 = this.getSpanArrss(this.tableData, 'Receivableslist', 'listid', 'projectId')
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
      this.$router.push('/expenditureContract/' + row.porjectidset)
      // console.log(row.porjectidset)
    },
    getSpanArrss (data, list, list2, list3) { // 合并表格数组生成
      this.spanArr = []
      for (var i = 0; i < data.length; i++) {
        if (i === 0) {
          this.spanArr.push(1)
          this.pos = 0
        } else {
        // 判断当前元素与上一个元素是否相同,因合并第一个所以[0]
          if (data[i][list] === data[i - 1][list] && data[i][list2] === data[i - 1][list2] && data[i][list3] === data[i - 1][list3]) {
            this.spanArr[this.pos] += 1
            this.spanArr.push(0)
          } else {
            this.spanArr.push(1)
            this.pos = i
          }
        }
      }
      return this.spanArr
    },
    getSpanArrs (data, list, list2) { // 合并表格数组生成
      this.spanArr = []
      for (var i = 0; i < data.length; i++) {
        if (i === 0) {
          this.spanArr.push(1)
          this.pos = 0
        } else {
        // 判断当前元素与上一个元素是否相同,因合并第一个所以[0]
          if (data[i][list] === data[i - 1][list] && data[i][list2] === data[i - 1][list2]) {
            this.spanArr[this.pos] += 1
            this.spanArr.push(0)
          } else {
            this.spanArr.push(1)
            this.pos = i
          }
        }
      }
      return this.spanArr
    },
    objectSpanMethod ({ row, column, rowIndex, columnIndex }) {
      if (columnIndex === 6 || columnIndex === 4 || columnIndex === 5 || columnIndex === 9 || columnIndex === 12) {
        const _row = this.dataList2[rowIndex]
        const _col = _row > 0 ? 1 : 0
        return {
          rowspan: _row,
          colspan: _col
        }
      }
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
    }
  }
}
</script>
