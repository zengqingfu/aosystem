 <template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3>
      收入列表
      <!-- <el-button type="primary" style="float: right;" @click="dialogFormVisible = true">添加收款</el-button> -->
    </h3>
    <el-table @row-click="handle" :data="tableData" border highligth-current-row :summary-method="jsondata.getSummaries" show-summary :span-method="objectSpanMethod" fixed style="width: 100%">
      <el-table-column prop="CustomerName" label="签约公司"></el-table-column>
      <el-table-column prop="projectId" label="项目名称"></el-table-column>
      <el-table-column prop="ReceivablesName" label="项目内容"></el-table-column>
      <el-table-column prop="number" label="合同金额"></el-table-column>
      <el-table-column prop="Receivables" label="到帐金额"></el-table-column>
      <el-table-column prop="Receivablesend" label="未收金额"></el-table-column>
      <el-table-column prop="invoice" label="已开发票未收款"></el-table-column>
      <el-table-column prop="ReceivablesData" label="签约时间"></el-table-column>
    </el-table>
  </el-main>
</template>
<script>
// import axios from 'axios'
export default {
  data () {
    return {
      Receivablesnb: 0,
      kaifapiao: 0,
      projectcon: {
        CustomerName: '',
        projectId: '',
        ReceivablesName: '',
        number: '',
        Receivables: 0,
        Receivablesend: '',
        kaifapiao: '',
        ReceivablesData: ''
      },
      zhongshouru: '',
      weishoukuan: '',
      public: [],
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
    // this.getFormDataPojname()
  },
  methods: {
    getdata () {
      this.jsondata.getDataClass('projectList', '0', 'complete').then(responserojectList => { // 项目
        this.jsondata.getData('RevenueContract').then(responserRevenueContract => { // 收款合同
          this.jsondata.getData('Receivables').then(responserReceivables => { // 收款
            this.jsondata.getData('customerlist').then(responsegys => { // 客户
              for (let i = 0; i < responserojectList.data.length; i++) {
                for (let is = 0; is < responserRevenueContract.data.length; is++) {
                  if(responserojectList.data[i].id == responserRevenueContract.data[is].projectId){ //eslint-disable-line
                    for (let iss = 0; iss < responserReceivables.data.length; iss++) {
                      if (responserReceivables.data[iss].projectId == responserRevenueContract.data[is].id) { //eslint-disable-line
                        this.Receivablesnb += Number(responserReceivables.data[iss].Receivables)
                        this.kaifapiao += Number(responserReceivables.data[iss].invoice)
                      }
                    }
                    this.projectcon = responserRevenueContract.data[is]
                    this.projectcon.Receivablesend = this.jsondata.currency(Number(responserRevenueContract.data[is].number) - Number(this.Receivablesnb), '￥', 2)
                    this.projectcon.CustomerName = responserojectList.data[i].CustomerName
                    this.projectcon.number = this.jsondata.currency(this.projectcon.number, '￥', 2)
                    this.projectcon.invoice = this.jsondata.currency(this.kaifapiao - this.Receivablesnb, '￥', 2)
                    this.projectcon.Receivables = this.jsondata.currency(this.Receivablesnb, '￥', 2)
                    this.projectcon.projectId = responserojectList.data[i].projectName
                    this.tableData.push(this.projectcon)
                    this.Receivablesnb = 0
                    this.kaifapiao = 0
                  }
                }
              }
              this.tableData = this.jsondata.fordata(responsegys.data, this.tableData, 'CustomerName', 'CustomerName')
              this.dataList = this.jsondata.getSpanArr(this.tableData, 'projectId')
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
      // this.dialogAddVisible = true
      // this.jsondata.getDataId('Receivables', row.id).then(response => {
      //   this.formModify = response.data[0]
      // })
      //   .catch(error => {
      //     console.log(error)
      //   })
      // return false
    },
    objectSpanMethod ({ row, column, rowIndex, columnIndex }) {
      if (columnIndex === 0 || columnIndex === 1) {
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
