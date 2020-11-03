 <template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3>
      <el-input v-model="inputData" placeholder="请输入内容" @input="play(inputData)"></el-input>
    </h3>
    <el-table id="expendituredata" :data="tableData_s" border height='90%' style="width: 100%">
      <!-- <el-table-column prop="ReceivablesName" label="收款名称" sortable></el-table-column> -->
      <!-- <el-table-column type="index"></el-table-column> -->
      <el-table-column prop="ReceivablesName" label="付款名称" ></el-table-column>
      <el-table-column prop="number" label="应付金额" ></el-table-column>
      <el-table-column prop="Receivables" label="付款金额" ></el-table-column>
      <el-table-column prop="invoice" label="收到发票" ></el-table-column>
      <el-table-column prop="invoicebo" label="发票" ></el-table-column>
      <el-table-column prop="contractdate" label="时间" ></el-table-column>
      <el-table-column prop="Receivableslist" label="合同" ></el-table-column>
      <el-table-column prop="ReceivablesMode" label="" ></el-table-column>
      <el-table-column prop="Remarks" label="备注" sortable></el-table-column>
    </el-table>
    <p style="text-align:left; font-size:15px; color:#555;font-weight: bold;" type="error">
    </p>
  </el-main>
</template>
<script>
// import axios from 'axios'
export default {
  data () {
    return {
      boxvalue2: true,
      boxvalue: true,
      titleSupplierName: '',
      hetongjiner: 0, // 合同金额
      zongshouru: 0, // 到账金额
      weishou: 0, // 未收金额
      weikaifapiao: 0, // 已付款未收票
      projectNameid: '',
      projectName: '',
      table: [],
      Customerlist: [],
      inputData: '',
      tableData_s: [],
      tableData: [],
      dialogAddVisible: false,
      dialogFormVisible: false,
      formModify: {
        id: '',
        ReceivablesName: '',
        ReceivablesData: '',
        ReceivablesMode: '',
        number: '',
        contract: '',
        Remarks: '',
        Receivablesend: '',
        projectId: '',
        daozhangdate: '',
        kaifapiaodate: '',
        invoice: '',
        invoicebo: '',
        supplielist: '',
        Receivables: ''
      }, // 添加收到金额
      TransactionList: {},
      formTransactionCon: '',
      formTransactionList: [], // 交易列表
      formTransaction: {
        MoneyClass: '',
        CollectMoney: '',
        AmountMoney: '',
        invoice: '',
        projectId: this.$route.params.id
      }, // 交易
      income: {},
      form: {
        ReceivablesName: '',
        ReceivablesData: '',
        ReceivablesMode: '',
        number: '',
        contract: '',
        Remarks: '',
        projectId: this.$route.params.id,
        invoice: '',
        Receivableslist: '',
        Receivables: '',
        daozhangdate: '',
        kaifapiaodate: '',
        supplielist: '',
        projectlist: ''
      },
      dataList: [],
      rules: {
        // ReceivablesName: [
        //   { required: true, message: '请输入收款名称', trigger: 'blur' }
        // ]
        // ,
        // ReceivablesData: [
        //   { required: true, message: '请输入收款日期', trigger: 'blur' }
        // ],
        // ReceivablesMode: [
        //   { required: true, message: '请输入收款方式', trigger: 'blur' }
        // ],
        // contract: [
        //   { required: true, message: '请选择', trigger: 'blur' }
        // ],
        // number: [
        //   { required: true, message: '请输入收款金额' }
        // ],
        // formTransactionCon: [
        //   { required: true, message: '请输入收款金额' }
        // ]
      }
    }
  },
  props: { // 接收父组件传递过来的参数
    map: {
      // type:String
    }
  },
  mounted () {
    this.getdata()
  },
  methods: {
    getdata () {
      this.jsondata.getData('expenditure').then(response => {
        this.tableData = response.data
        this.tableData = this.tableData.sort(function (a, b) { return (a.Receivableslist + '').localeCompare(b.Receivableslist + '') }) // 根据期数排序.reverse()
      })
        .catch(error => {
          console.log(error)
        })
      return false
    },
    play (input) {
      let _this = this
      _this.table = _this.tableData.filter(Val => {
        if (Val.number.includes(input) || Val.invoice.includes(input) || Val.Receivables.includes(input) || Val.Remarks.includes(input) || Val.ReceivablesName.includes(input)) {
          _this.table.push(Val)
          return _this.table
        }
      })
      this.tableData_s = _this.table
    }
  }
}
</script>
