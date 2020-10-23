 <template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <el-dialog title="修改项目" :visible.sync="dialogFormVisible">
      <el-form ref="form" :model="form" :rules="rules"  label-width="80px" class="demo-ruleForm">
        <el-form-item label="项目名称" prop="projectName">
          <el-input v-model="form.projectName"></el-input>
        </el-form-item>
        <el-form-item label="签约日期" prop="ContractDate">
          <el-col :span="11">
            <el-date-picker value-format="yyyy-MM-dd" type="date" placeholder="选择日期" v-model="form.ContractDate" style="width: 100%;"></el-date-picker>
          </el-col>
        </el-form-item>
        <el-form-item label="甲方客户" prop="CustomerName">
          <el-select v-model="form.CustomerNameid" filterable placeholder="甲方客户" style="width:46%">
                <el-option
                v-for="item in optionsproject"
                :key="item.CustomerName"
                :label="item.CustomerName"
                :value="item.id">
                </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="合同金额" prop="ContractAmount">
          <el-input type="number"  v-model.number="form.ContractAmount" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="预算支出" prop="ExpenditureBudget">
          <el-input type="number" v-model.number="form.ExpenditureBudget" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="项目说明" prop="projectContent">
          <el-input type="textarea" v-model="form.projectContent" ></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm('form')">修改</el-button>
          <el-button @click="dialogFormVisible = false">取消</el-button>
          <el-button style="float:right" @click="outerVisible = true">删除</el-button>
        </el-form-item>
      </el-form>
      <el-dialog
          width="30%"
          title="确认删除"
          :visible.sync="outerVisible"
          append-to-body>
          <el-button @click="outerVisible = false">取消</el-button>
          <el-button @click="updatpostData_end ()">删除</el-button>
      </el-dialog>
    </el-dialog>
    <h3>
      项目明细
      <el-button type="primary" style="float: right; margin-left:10px;" @click="dialogFormVisible = true">修改</el-button>
      <!-- <el-button type="primary" style="float: right; margin-left:10px;" >结项</el-button> -->
      <el-button type="primary" style="float: right; margin-left:10px;" @click="ReceivablesGo">项目收款</el-button>
      <el-button type="primary" style="float: right; margin-left:10px;" @click="expenditureGo">项目支出</el-button>
      <el-button style="float: right;margin-right:0px" onclick="exportExcel('#projectdate')">点击导出</el-button>
    </h3>
    <div id="projectdate">
    <el-table class="projectdateil" border style="width: 100%; font-weight: bold; display:none">
      <el-table-column prop="" label=""></el-table-column>
      <el-table-column prop="" label=""></el-table-column>
      <el-table-column prop="" label=""></el-table-column>
      <el-table-column prop="" label=""></el-table-column>
      <el-table-column prop="" label=""></el-table-column>
      <el-table-column prop="" label=""></el-table-column>
      <el-table-column prop="" label=""></el-table-column>
      <el-table-column prop="" label=""></el-table-column>
    </el-table>
    <table class="projectdateil" style="width: 100%; background-color:#eee;font-weight: bold;" cellpadding="20" cellspacing="1">
      <tr>
        <th colspan="1" width="120" ><strong>名称</strong></th>
        <th colspan="7" ><strong>内容</strong></th>
      </tr>
      <tr>
        <td colspan="1" >项目名称</td>
        <td colspan="7" >{{this.tableData[0].contents}}</td>
      </tr>
      <tr>
        <td colspan="1" >项目启动时间</td>
        <td colspan="7" >{{this.tableData[1].contents}}</td>
      </tr>
      <tr>
        <td colspan="1" >甲方客户</td>
        <td colspan="7" >{{this.tableData[2].contents}}</td>
      </tr>
      <tr>
        <td colspan="1" >项目收入</td>
        <td colspan="7" >{{this.tableData[3].contents}}</td>
      </tr>
      <tr>
        <td colspan="1" >项目支出</td>
        <td colspan="7" >{{this.tableData[4].contents}}</td>
      </tr>
      <tr>
        <td colspan="1" >项目发票</td>
        <td colspan="7" >{{this.tableData[5].contents}}</td>
      </tr>
      <tr>
        <td colspan="1" >项目利润</td>
        <td colspan="7" >{{this.tableData[6].contents}}</td>
      </tr>
      <tr>
        <td colspan="1" >项目说明</td>
        <td colspan="7" >{{this.tableData[7].contents}}</td>
      </tr>
    </table>
    <table><tr><th colspan="8" ><h3 >收款</h3></th></tr></table>
    <el-row v-for="item in projectContract" :key="item.ReceivablesName">
      <table><tr><th colspan="8"><h3 ><h4>{{item.ReceivablesName}} ---- <span style="float:right"> 签约日期 {{item.ReceivablesData}}</span></h4></h3></th></tr></table>
      <el-table :data="item.projectidlist" show-summary :summary-method="jsondata.getSummaries" :span-method="objectSpanMethod" border style="width: 100%">
        <el-table-column prop="Receivableslist" label="收款分期" ></el-table-column>
        <el-table-column prop="ReceivablesData" label="合同收款时间" ></el-table-column>
        <el-table-column prop="number" label="应收金额" ></el-table-column>
        <el-table-column prop="Receivables" label="到账金额" ></el-table-column>
        <el-table-column prop="invoice" label="开出发票" ></el-table-column>
        <el-table-column prop="daozhangdate" label="日期" ></el-table-column>
        <el-table-column prop="hetongwidthou" label="未收金额" ></el-table-column>
        <el-table-column prop="Remarks" label="备注" ></el-table-column>
      </el-table>
    </el-row>
    <hr style="height: 30px;background-color: #eee;border: 0px;" />
    <el-row v-for="item in ReceivableslistData" :key="item.ReceivablesName">
      <table><tr><th colspan="8" > <h3>{{item.expenditureClass}}</h3></th></tr></table>
      <el-table :data="item.hetongzhichundata" border show-summary :summary-method="jsondata.getSummaries"  style="width: 100%">
        <!-- <el-table-column type="index"></el-table-column> -->
        <el-table-column prop="contractdate" label="签约日期" ></el-table-column>
        <el-table-column prop="SupplierName" label="收款名称" ></el-table-column>
        <el-table-column prop="ReceivablesName" label="应付内容" ></el-table-column>
        <el-table-column prop="number" label="应付总额" ></el-table-column>
        <el-table-column prop="Receivables" label="已支付金额" ></el-table-column>
        <el-table-column prop="Receivablesend" label="未付金额" ></el-table-column>
        <el-table-column prop="invoice" label="收到发票" ></el-table-column>
        <el-table-column prop="" label="" width="1"></el-table-column>
        <!-- <el-table-column prop="invoiceend" label="已付款未收票" ></el-table-column> -->
      </el-table>
    </el-row>
    </div>
  </el-main>
</template>
<style>
</style>

<script>
export default {
  data () {
    return {
      projectdata: '', // 项目例表
      hetongweishou: '',
      projectContractcon: [],
      dataList: [],
      spanArr: [],
      projectContract: [],
      outerVisible: false,
      shoukuan: [],
      gongcheng: [],
      yewu: [],
      optionsprojectClass: [],
      optionsOtherParty: [],
      zhongshouru: '',
      weishoukuan: '',
      projectName: '',
      rules: {
        projectName: [
          { required: true, message: '请输入项目名称', trigger: 'blur' }
        ],
        // CustomerName: [
        //   { required: true, message: '请选择客户名称', trigger: 'blur' }
        // ],
        // ContractAmount: [
        //   { required: true, message: '请输入合同金额' }
        // ],
        ContractDate: [
          { required: true, message: '请选择签约日期', trigger: 'blur' }
        ]
        // ,
        // ExpenditureBudget: [
        //   { required: true, message: '请输入支出预算' },
        //   { type: 'number', message: '金额必需为数额' }
        // ],
        // projectContent: [
        //   { required: true, message: '请输入项目内容', trigger: 'blur' }
        // ]
      },
      Receivables: [],
      expenditure: [],
      optionsproject: [],
      dialogFormVisible: false,
      form: {
        projectName: '无',
        projectContent: '无',
        CustomerName: '无',
        ContractAmount: '',
        ContractDate: '无',
        ExpenditureBudget: '无'
      },
      contentsinvoice: '',
      contentsint: '',
      Receivablesint: '',
      contentsintp: '',
      Receivablesintp: '',
      invoiceint: '',
      invoicebo: '', // 不计发票
      invoiceintp: '',
      tableDatayingjiang: [],
      ReceivableslistData: [],
      hegongzhichun: [],
      tableData: [
        {
          pojname: '项目名称',
          contents: '无'
        },
        {
          pojname: '项目启动时间',
          contents: '无'
        },
        {
          pojname: '甲方客户',
          contents: '无'
        },
        {
          pojname: '项目收入',
          contents: '无'
        },
        {
          pojname: '项目支出',
          contents: '无'
        },
        {
          pojname: '项目发票',
          contents: '无'
        },
        {
          pojname: '项目利润',
          contents: '无'
        },
        {
          pojname: '项目说明',
          contents: '无'
        }
      ]
    }
  },
  mounted () {
    this.getFormData('supplierlist')
    this.getFormDataClass('expenditureclass')
    this.getdata()
  },
  methods: {
    dstaplayb () { // 数据初始化
      this.Receivablesintp = 0
      this.contentsintp = 0
      this.contentsint = 0
      this.Receivablesint = 0
      this.invoiceint = 0
      this.Receivablesint = 0
      this.ReceivableslistData = []
      this.hegongzhichun = []
      this.invoicebo = 0
    },
    getdata () {
      this.dstaplayb()
      this.jsondata.getDataClass('revenuecontract', this.$route.params.id, 'projectId').then(response => {
        this.projectContract = response.data
        this.jsondata.getDataClass('receivables', this.$route.params.id, 'projectlist').then(responseitem => {
          this.projectContractcon = responseitem.data
          for (let irr in this.projectContract) { //eslint-disable-line
            this.projectContract[irr].projectidlist = []
            for (let irp in this.projectContractcon) { //eslint-disable-line
              if (this.projectContract[irr].id == this.projectContractcon[irp].projectId) { //eslint-disable-line
                this.projectContractcon[irp].projectint = irr
                this.projectContract[irr].projectidlist.push(this.projectContractcon[irp])
              }
            }

            for (let iss in this.projectContract[irr].projectidlist) { //eslint-disable-line
              if(this.projectContract[irr].projectidlist[iss].number > 1){ //eslint-disable-line
                this.projectContract[irr].projectidlist[iss].hetongwidthou = Number(this.projectContract[irr].projectidlist[iss].number)
                for (let issr in this.projectContract[irr].projectidlist) {
                  if (this.projectContract[irr].projectidlist[iss].Receivableslist == this.projectContract[irr].projectidlist[issr].Receivableslist){ //eslint-disable-line
                    // console.log(this.projectContract[irr].projectidlist[iss].Receivables, this.projectContract[irr].projectidlist[issr].Receivables)
                    this.projectContract[irr].projectidlist[iss].hetongwidthou -= Number(this.projectContract[irr].projectidlist[issr].Receivables)
                  }
                }
              }
            }

            for (let iss in this.projectContract[irr].projectidlist) { //eslint-disable-line
              this.projectContract[irr].projectidlist[iss].number = this.jsondata.currency(this.projectContract[irr].projectidlist[iss].number, '￥', 2)
              this.projectContract[irr].projectidlist[iss].hetongwidthou = this.jsondata.currency(this.projectContract[irr].projectidlist[iss].hetongwidthou, '￥', 2)
              this.projectContract[irr].projectidlist[iss].Receivables = this.jsondata.currency(this.projectContract[irr].projectidlist[iss].Receivables, '￥', 2)
              this.projectContract[irr].projectidlist[iss].invoice = this.jsondata.currency(this.projectContract[irr].projectidlist[iss].invoice, '￥', 2)
              if(this.projectContract[irr].projectidlist[iss].daozhangdate == ''){ //eslint-disable-line
                this.projectContract[irr].projectidlist[iss].daozhangdate += this.projectContract[irr].projectidlist[iss].kaifapiaodate
              }
            }
            // this.projectContract[irr].projectidlist = this.projectContract[irr].projectidlist.sort(function (a, b) { return (a.id + '').localeCompare(b.id + '') }) // 表格合并数组排序 .reverse()
            this.projectContract[irr].projectidlist = this.projectContract[irr].projectidlist.sort(function (a, b) { return (a.Receivableslist + '').localeCompare(b.Receivableslist + '') })
            // console.log(this.projectContract[irr].projectidlist)
            this.dataList.push(this.jsondata.getSpanArr(this.projectContract[irr].projectidlist, 'Receivableslist'))
          }
        })
          .catch(error => {
            console.log(error)
          })
      })
        .catch(error => {
          console.log(error)
        })
      this.jsondata.getDataId('projectlist', this.$route.params.id).then(response => {
        // console.log(response.data[0].ContractDate)
        this.form = response.data[0]
        this.form.ContractDate = response.data[0].ContractDate.substr(0, 10)
        this.jsondata.getData('customerlist').then(response => { // 客户列表
          this.optionsproject = response.data
          for (let is = 0; is < response.data.length; is++) {
            if (this.form.CustomerName == response.data[is].id) { //eslint-disable-line
              this.form.CustomerNameid = response.data[is].CustomerName // 临时记录客户
              this.tableData[2].contents = this.form.CustomerNameid
            }
          }
          this.getdataReceivables() // 项目明细统计
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
    updatpostData () { // 更新数据
      if (Number.isInteger(this.form.CustomerNameid)) {
        this.form.CustomerName = this.form.CustomerNameid
        console.log(this.form.ContractDate)
      }
      // console.log(this.form)
      this.jsondata.updatpostData('projectlist', this.form).then(response => {
        this.jsondata.postDatabf(response.data, 'updatpostData')
        if (response.data === 'OK') {
          this.dialogAddVisible = false
          this.dialogFormVisible = false
          this.getdata()
        }
      })
        .catch(error => {
          console.log(error)
        })
      return false
    },
    updatpostData_end () { // 更新数据--删除
      this.form.complete = 1
      if (Number.isInteger(this.form.CustomerNameid)) {
        this.form.CustomerName = this.form.CustomerNameid
      }
      // console.log(this.form.CustomerNameid)
      this.jsondata.updatpostData('projectlist', this.form).then(response => {
        if (response.data === 'OK') {
          this.$router.push('/index')
        }
      })
        .catch(error => {
          console.log(error)
        })
      return false
    },
    submitForm (formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.updatpostData()
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    deletepost () { // 删除
      this.jsondata.deletepost('projectlist', this.$route.params.id).then(response => {
        // console.log(response.data)
        if (response.data === 'OK') {
          this.$router.push('/index')
        }
      })
        .catch(error => {
          console.log(error)
        })
    },
    ReceivablesGo () {
      this.$router.push('/RevenueContract/' + this.$route.params.id)
    },
    expenditureGo () {
      this.$router.push('/expenditureContract/' + this.$route.params.id)
    },
    getdataReceivables () {
      this.tableData[0].contents = this.form.projectName
      this.tableData[1].contents = this.form.ContractDate
      this.tableData[3].contents = '合同金额:' + this.jsondata.currency(this.form.ContractAmount, '￥', 2)
      this.tableData[4].contents = '预算支出:' + this.jsondata.currency(this.form.ExpenditureBudget, '￥', 2)
      this.tableData[7].contents = this.form.projectContent
      this.jsondata.getDataClass('receivables', this.$route.params.id, 'projectlist').then(response => {
        this.projectdata = response.data
        for (let i = 0; i < response.data.length; i++) {
          for (let is = 0; is < this.projectContract.length; is++) {
            if (this.projectContract[is].id === response.data[i].projectId) {
              this.contentsint += Number(response.data[i].number)
              this.Receivablesint += Number(response.data[i].Receivables)
              this.invoiceint = Number(this.invoiceint) + Number(response.data[i].invoice)
            }
          }
        }
        // this.tableData[3].contents = '合同金额:' + this.jsondata.currency(this.contentsinvoice, '￥', 2)
        this.tableData[3].contents += ' 　　应收金额:' + this.jsondata.currency(this.contentsint, '￥', 2)
        this.tableData[3].contents += ' 　　到账金额:' + this.jsondata.currency(this.Receivablesint, '￥', 2)
        this.tableData[3].contents += ' 　　未收金额:' + this.jsondata.currency(this.contentsint - this.Receivablesint, '￥', 2)
        this.tableData[5].contents = '开出发票:' + this.jsondata.currency(this.invoiceint, '￥', 2) + ' / (已开票未收款:' + this.jsondata.currency(this.invoiceint - this.Receivablesint, '', 2) + ')'
        this.shoukuan = response.data
        for (let i = 0; i < this.shoukuan.length; i++) {
          this.shoukuan[i].Receivablesend = this.jsondata.currency((this.shoukuan[i].number - this.shoukuan[i].Receivables).toFixed(2), '￥', 2)
          this.shoukuan[i].number = this.jsondata.currency(this.shoukuan[i].number, '￥', 2)
          this.shoukuan[i].Receivables = this.jsondata.currency(this.shoukuan[i].Receivables, '￥', 2)
          this.shoukuan[i].invoice = this.jsondata.currency(this.shoukuan[i].invoice, '￥', 2)
        }
        this.getdataexpenditure()
        // this.tableData[3].contents
      })
        .catch(error => {
          console.log(error)
        })
      return false
    },
    getdataexpenditure () {
      this.jsondata.getDataClass('expendituredata', this.$route.params.id, 'projectlist').then(response => {
        this.invoiceintp = 0
        this.contentsintp = 0
        this.invoicebo = 0
        if (response.data.length == 0) { //eslint-disable-line
          // this.tableData[4].contents += '|项目支出金额: ￥0'
          // console.log(response.data.length)
        } else {
          this.tableData[6].contents = this.jsondata.currency(this.Receivablesint - this.Receivablesintp, '￥', 2)
        }
        this.getdatae1()
      })
        .catch(error => {
          console.log(error)
        })
      return false
    },
    getdatae1 () { // 支出数据
      this.jsondata.getDataClass('expenditure', this.$route.params.id, 'projectId').then(response => {
        this.hegongzhichun = response.data
        this.jsondata.getDataClass('expendituredata', this.$route.params.id, 'projectlist').then(responselist => {
          this.ReceivableslistData = this.optionsprojectClass
          for(let item in this.ReceivableslistData) { //eslint-disable-line
            // console.log(this.ReceivableslistData[item].id)
            this.ReceivableslistData[item].hetongzhichundata = []
            for(let item1 in this.hegongzhichun){ //eslint-disable-line
              this.ReceivableslistData[item].hetongzhichundata.hetongzhichunlist = []
              if(this.ReceivableslistData[item].id == this.hegongzhichun[item1].projectClass){  //eslint-disable-line
                this.hegongzhichun[item1].Receivables = Number(this.hegongzhichun[item1].Receivables)
                this.hegongzhichun[item1].invoice = Number(this.hegongzhichun[item1].invoice)
                if (this.hegongzhichun[item1].Receivableslist !== '不分期') {
                  this.hegongzhichun[item1].Receivables = 0
                  this.hegongzhichun[item1].invoice = 0
                }
                if(this.hegongzhichun[item1].invoicebo == '不计发票'){ //eslint-disable-line
                  this.invoicebo += Number(this.hegongzhichun[item1].Receivables)
                } else {
                  this.invoiceintp += Number(this.hegongzhichun[item1].invoice)
                }
                for(let item2 in responselist.data){  //eslint-disable-line
                  if(this.hegongzhichun[item1].id == responselist.data[item2].projectId){  //eslint-disable-line
                    if (this.hegongzhichun[item1].Receivableslist === '不分期') {
                    } else {
                      this.hegongzhichun[item1].Receivables += Number(responselist.data[item2].Receivables)
                    }
                    this.ReceivableslistData[item].hetongzhichundata.hetongzhichunlist.push(responselist.data[item2])
                    if (responselist.data[item2].invoicebo === '不计发票') {
                      this.invoicebo += Number(responselist.data[item2].Receivables)
                    } else {
                      this.hegongzhichun[item1].invoice += Number(responselist.data[item2].invoice)
                      this.invoiceintp += Number(responselist.data[item2].invoice)
                    }
                  }
                }
                for(let item3 in this.optionsOtherParty){  //eslint-disable-line
                  if (this.optionsOtherParty[item3].id == this.hegongzhichun[item1].SupplierName) { //eslint-disable-line
                    this.hegongzhichun[item1].SupplierName = this.optionsOtherParty[item3].SupplierName
                  }
                }
                this.contentsintp += Number(this.hegongzhichun[item1].number)
                this.Receivablesintp += Number(this.hegongzhichun[item1].Receivables)
                this.hegongzhichun[item1].invoiceend = this.jsondata.currency(Number(this.hegongzhichun[item1].Receivables) - this.hegongzhichun[item1].invoice, '￥', 2)
                this.hegongzhichun[item1].Receivablesend = Number(this.hegongzhichun[item1].number) - this.hegongzhichun[item1].Receivables
                this.hegongzhichun[item1].Receivables = this.jsondata.currency(this.hegongzhichun[item1].Receivables, '￥', 2)
                this.hegongzhichun[item1].invoice = this.jsondata.currency(this.hegongzhichun[item1].invoice, '￥', 2)
                this.hegongzhichun[item1].Receivablesend = this.jsondata.currency(this.hegongzhichun[item1].Receivablesend, '￥', 2)
                this.hegongzhichun[item1].number = this.jsondata.currency(this.hegongzhichun[item1].number, '￥', 2)
                this.ReceivableslistData[item].hetongzhichundata.push(this.hegongzhichun[item1])
              }
            }
          }
          this.tableData[4].contents += ' 　　应付金额:' + this.jsondata.currency(this.contentsintp, '￥', 2)
          this.tableData[4].contents += ' 　　已付金额:' + this.jsondata.currency(this.Receivablesintp, '￥', 2)
          this.tableData[4].contents += ' 　　未支付金额:' + this.jsondata.currency(this.contentsintp - this.Receivablesintp, '￥', 2)
          this.tableData[5].contents += ' 　　收到发票:' + this.jsondata.currency(this.invoiceintp, '￥', 2) + ' / (已付款未收票' + this.jsondata.currency(this.Receivablesintp - this.invoiceintp - this.invoicebo, '', 2) + ') --- 不计发票:' + this.jsondata.currency(this.invoicebo, '￥', 2)
          // this.tableData[6].contents = this.jsondata.currency(this.contentsint - this.contentsintp, '￥', 2)
          this.tableData[6].contents = this.jsondata.currency(this.form.ContractAmount - this.contentsintp, '￥', 2)
        })
          .catch(error => {
            console.log(error)
          })
      })
        .catch(error => {
          console.log(error)
        })
    },
    getFormData (formName) { // 加载供应商
      this.jsondata.getData(formName).then(response => {
        this.optionsOtherParty = response.data
      })
        .catch(error => {
          console.log(error)
        })
    },
    getFormDataClass (formName) { // 加载支出分类
      this.jsondata.getData(formName).then(response => {
        this.optionsprojectClass = response.data
      })
        .catch(error => {
          console.log(error)
        })
    },
    objectSpanMethod ({ row, column, rowIndex, columnIndex }) {
      if (columnIndex === 0 || columnIndex === 1 || columnIndex === 2 || columnIndex === 6) {
        const _row = this.dataList[row.projectint][rowIndex]
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
