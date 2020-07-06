 <template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3 style="color:#333">
      支出列表
    </h3>
    <el-table @row-click="handle" :data="tableData" border style="width: 100%">
      <el-table-column prop="SupplierName" label="收款方" sortable></el-table-column>
      <el-table-column prop="ReceivablesName" label="款项目名称" sortable></el-table-column>
      <el-table-column prop="number" label="应支付金额" sortable></el-table-column>
      <el-table-column prop="ReceivablesData" label="应支付日期" sortable></el-table-column>
      <el-table-column prop="Receivables" label="已支付金额" sortable></el-table-column>
      <el-table-column prop="invoice" label="收到发票" sortable></el-table-column>
      <el-table-column prop="projectClass" label="支出类别" sortable></el-table-column>
      <el-table-column prop="Remarks" label="备注" sortable></el-table-column>
    </el-table>
  </el-main>
</template>
<script>
// import axios from 'axios'

export default {
  data () {
    return {
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
      this.jsondata.getDataClass('projectList', '0', 'complete').then(responserojectList => { // 项目
        this.jsondata.getData('expenditure').then(responsErexpenditure => { // 付款合同
          this.jsondata.getData('expenditureData').then(responserExpenditureData => { // 付款
            this.jsondata.getData('supplierlist').then(responsesupplierlist => { // 供应商例表
              this.tableData = responsErexpenditure.data
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

    }
  }
}
</script>
