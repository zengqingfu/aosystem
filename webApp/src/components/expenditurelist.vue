 <template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3 style="color:#333">
      支出列表
    </h3>
    <el-table @row-click="handle" :data="tableData" border :span-method="objectSpanMethod"  :summary-method="jsondata.getSummaries" show-summary  style="width: 100%">
      <el-table-column prop="projectId" label="项目名称"></el-table-column>
      <el-table-column prop="SupplierName" label="收款方"></el-table-column>
      <el-table-column prop="ReceivablesName" label="项目内容"></el-table-column>
      <el-table-column prop="number" label="应支付金额"></el-table-column>
      <el-table-column prop="Receivables" label="已支付金额"></el-table-column>
      <el-table-column prop="Receivablesend" label="未支付金额"></el-table-column>
      <el-table-column prop="invoice" label="已付款未收发票"></el-table-column>
      <el-table-column prop="projectClass" label="支出类别"></el-table-column>
      <el-table-column prop="contractdate" label="签约日期"></el-table-column>
    </el-table>
  </el-main>
</template>
<script>
// import axios from 'axios'

export default {
  data () {
    return {
      Receivablesnb: 0,
      bujikaifapiao: 0,
      kaifapiao: 0,
      zhongshouru: '',
      weishoukuan: '',
      projectName: '',
      Customerlist: [],
      tableData: []
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
    getdata () {
      this.jsondata.getDataClass('projectlist', '0', 'complete').then(responserojectList => { // 项目
        this.jsondata.getData('expenditure').then(responsErexpenditure => { // 付款合同
          this.jsondata.getData('expendituredata').then(responserExpenditureData => { // 付款
            this.jsondata.getData('supplierlist').then(responsesupplierlist => { // 供应商例表
              this.jsondata.getData('expenditureclass').then(responexpenditureclass => { // 支出分类
                for (let i = 0; i < responserojectList.data.length; i++) {
                  for (let is = 0; is < responsErexpenditure.data.length; is++) {
                    if(responserojectList.data[i].id == responsErexpenditure.data[is].projectId){ //eslint-disable-line
                      for (let iss = 0; iss < responserExpenditureData.data.length; iss++) {
                      if (responserExpenditureData.data[iss].projectId == responsErexpenditure.data[is].id) { //eslint-disable-line
                        if(responserExpenditureData.data[iss].invoicebo == '不计发票'){ //eslint-disable-line
                            this.bujikaifapiao += Number(responserExpenditureData.data[iss].number)
                          } else {
                            this.kaifapiao += Number(responserExpenditureData.data[iss].invoice)
                          }
                          this.Receivablesnb += Number(responserExpenditureData.data[iss].Receivables)
                        }
                      }
                      this.projectcon = responsErexpenditure.data[is]
                      if(responsErexpenditure.data[is].invoicebo == '不计发票'){ //eslint-disable-line
                        this.projectcon.invoice = '不计发票'
                      } else {
                        this.projectcon.invoice = this.jsondata.currency(this.Receivablesnb - this.kaifapiao, '￥', 2)
                      }
                      this.projectcon.Receivablesend = this.jsondata.currency(Number(responsErexpenditure.data[is].number) - Number(this.Receivablesnb), '￥', 2)
                      // this.projectcon.CustomerName = responserojectList.data[i].CustomerName
                      this.projectcon.number = this.jsondata.currency(this.projectcon.number, '￥', 2)
                      // this.projectcon.invoice = this.jsondata.currency(this.kaifapiao - this.Receivablesnb, '￥', 2)
                      this.projectcon.Receivables = this.jsondata.currency(this.Receivablesnb, '￥', 2)
                      this.projectcon.projectId = responserojectList.data[i].projectName
                      this.tableData.push(this.projectcon)
                      this.Receivablesnb = 0
                      this.kaifapiao = 0
                    }
                  }
                }
                this.dataList = this.jsondata.getSpanArr(this.tableData, 'projectId') // 获得合并表格数组
                this.tableData = this.jsondata.fordata(responsesupplierlist.data, this.tableData, 'SupplierName', 'SupplierName')
                this.tableData = this.jsondata.fordata(responexpenditureclass.data, this.tableData, 'expenditureClass', 'projectClass')
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
    handle (row, event, column) { // 点击列表

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
