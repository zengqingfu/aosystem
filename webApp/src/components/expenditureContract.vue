 <template>
  <el-main style="text-align:left; line-height: 1.8em;">
    <h3 style="color:#333">
      <span  @click="goToHome" style="cursor: pointer;color:#409EFF">{{this.projectName}}</span> > 支出列表
      <el-button type="primary" style="float: right;" @click="dialogFormVisible = true;imageUrlbo = false;form.ReceivablesData = ''">添加支出</el-button>
      <el-button style="float: right;margin-right:20px" onclick="exportExcel('#expenditureContractlist')">点击导出</el-button>
      <el-input v-model="inputData" placeholder="请输入搜索内容" @input="play(inputData)" style="width:200px;float: right;;margin-right:0px"></el-input>
    </h3>
    <el-dialog title="添加支出" :visible.sync="dialogFormVisible">
      <el-form ref="form" :model="form" :rules="rules"  label-width="80px" class="demo-ruleForm">
        <el-form-item label="付款名称" prop="ReceivablesName">
          <el-input v-model="form.ReceivablesName"></el-input>
        </el-form-item>
        <el-form-item label="应付金额" prop="number" style="width:46%;display: inline-block;vertical-align: top;margin-right:7%">
          <el-input type="number"  v-model="form.number" ></el-input>
        </el-form-item>
        <el-form-item label="签约日期" prop="contractdate" style="width:46%;display: inline-block;vertical-align: top;">
          <el-col>
            <el-date-picker value-format="yyyy-MM-dd" type="date" placeholder="选择日期" v-model="form.contractdate" style="width: 100%;"></el-date-picker>
          </el-col>
        </el-form-item>
        <el-form-item label="付款方式" prop="ReceivablesMode" style="width:46%;display: inline-block;vertical-align: top;margin-right:7%">
            <el-select v-model="form.ReceivablesMode" placeholder="请选择" style="width:100%">
              <el-option label="现金" value="现金"></el-option>
              <el-option label="银行" value="银行"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="有无合同" prop="contract" style="width:46%;display: inline-block;vertical-align: top;">
            <el-select v-model="form.contract" placeholder="请选择" style="width:100%" >
            <el-option label="有" value="有"></el-option>
            <el-option label="无" value="无"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="分期" prop="Receivableslist" style="width:46%;display: inline-block;vertical-align: top;margin-right:7%">
            <el-select v-model="form.Receivableslist" placeholder="请选择" style="width:100%" >
              <el-option label="1期" value="1期"></el-option>
              <el-option label="2期" value="2期"></el-option>
              <el-option label="3期" value="3期"></el-option>
              <el-option label="4期" value="4期"></el-option>
              <el-option label="5期" value="5期"></el-option>
              <el-option label="6期" value="6期"></el-option>
              <el-option label="不分期" value="不分期"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="付款金额" prop="Receivables" v-if="boxvalue1" >
          <el-col :span="11" style="margin-right:10px;width:30%">
            <el-date-picker value-format="yyyy-MM-dd" type="date" placeholder="选择日期" v-model="form.daozhangdate" style="width: 100%;"></el-date-picker>
          </el-col>
          <el-input type="number"  v-model="form.Receivables" style="width:46%" ></el-input>
          <el-button type="primary" @click="form.Receivables = form.number" style="width:15%" >付款</el-button>
        </el-form-item>
        <el-form-item label="收到发票" prop="invoice" v-if="boxvalue1">
          <el-col :span="11" style="margin-right:10px;width:30%" v-if="boxvalue" >
            <el-date-picker value-format="yyyy-MM-dd" type="date" placeholder="选择日期" v-model="form.kaifapiaodate" style="width: 100%;"></el-date-picker>
          </el-col>
          <el-input type="number"  v-model="form.invoice" style="width:25.5%" v-if="boxvalue" ></el-input>
          <el-select v-model="form.invoicebo" placeholder="请选择" style="width:20%" >
            <el-option label="有" value="有"></el-option>
            <el-option label="不计发票" value="不计发票"></el-option>
          </el-select>
          <el-button type="primary" @click="form.invoice = form.number" v-if="boxvalue" style="width:15%" >开发票</el-button>
        </el-form-item>
        <el-form-item label="收款方" filterable prop="SupplierName">
            <el-select v-model="form.SupplierName" filterable placeholder="请选择" style="width:46%" >
                <el-option
                v-for="item in optionsOtherParty"
                :key="item.SupplierName"
                :label="item.SupplierName"
                :value="item.id">
                </el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="付款类别" prop="projectClass">
            <el-select v-model="form.projectClass" placeholder="请选择" style="width:46%" >
                <el-option
                v-for="item in optionsprojectClass"
                :key="item.expenditureClass"
                :label="item.expenditureClass"
                :value="item.id">
                </el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="备注" prop="Remarks">
          <el-input type="textarea" v-model="form.Remarks" ></el-input>
        </el-form-item>
        <el-form-item label="原件" >
          <el-upload
            class="avatar-uploader"
            :action="upimgaction"
            :show-file-list="false"
            :on-success="handleAvatarSuccess"
            :before-upload="beforeAvatarUpload">
              <img v-if="false" class="avatar">
              <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>
          <el-button style="vertical-align: top; margin-left:20px" @click="getimgurl()" v-if="imageUrlbo">查看原件</el-button>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm('form')">确定添加</el-button>
          <el-button @click="resetForm('form')">重置</el-button>
          <el-button @click="dialogFormVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>

    <el-dialog title="支出内容" :visible.sync="dialogAddVisible" >
      <el-form ref="formModify" :model="formModify" :rules="rules"  label-width="80px" class="demo-ruleForm">
        <el-form-item label="付款名称" prop="ReceivablesName">
          <el-input v-model="formModify.ReceivablesName"></el-input>
        </el-form-item>
        <el-form-item label="应付金额" prop="number" style="width:46%;display: inline-block;vertical-align: top;margin-right:7%">
          <el-input type="number"  v-model="formModify.number" ></el-input>
        </el-form-item>
        <el-form-item label="签约日期" prop="contractdate" style="width:46%;display: inline-block;vertical-align: top;">
          <el-col>
            <el-date-picker value-format="yyyy-MM-dd" type="date" placeholder="选择日期" v-model="formModify.contractdate" style="width: 100%;"></el-date-picker>
          </el-col>
        </el-form-item>
        <el-form-item label="付款方式" prop="ReceivablesMode" style="width:46%;display: inline-block;vertical-align: top;margin-right:7%">
            <el-select v-model="formModify.ReceivablesMode" placeholder="请选择" style="width:100%">
              <el-option label="现金" value="现金"></el-option>
              <el-option label="银行" value="银行"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="有无合同" prop="contract" style="width:46%;display: inline-block;vertical-align: top;">
            <el-select v-model="formModify.contract" placeholder="请选择" style="width:100%" >
            <el-option label="有" value="有"></el-option>
            <el-option label="无" value="无"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="分期" prop="Receivableslist" style="width:46%;display: inline-block;vertical-align: top;margin-right:7%">
            <el-select v-model="formModify.Receivableslist" placeholder="请选择" style="width:100%" >
              <el-option label="1期" value="1期"></el-option>
              <el-option label="2期" value="2期"></el-option>
              <el-option label="3期" value="3期"></el-option>
              <el-option label="4期" value="4期"></el-option>
              <el-option label="5期" value="5期"></el-option>
              <el-option label="6期" value="6期"></el-option>
              <el-option label="不分期" value="不分期"></el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="付款金额" prop="Receivables" v-if="boxvalue1" >
          <el-col style="margin-right:10px;width:37%">
            <el-date-picker value-format="yyyy-MM-dd" type="date" placeholder="选择日期" v-model="formModify.daozhangdate" style="width: 100%;"></el-date-picker>
          </el-col>
          <el-input type="number"  v-model="formModify.Receivables" style="width:46%" ></el-input>
          <el-button type="primary" @click="formModify.Receivables = formModify.number" style="width:15%" >付款</el-button>
        </el-form-item>
        <el-form-item label="收到发票" prop="invoice" v-if="boxvalue1">
          <el-col style="margin-right:10px;width:37%" v-if="boxvalue" >
            <el-date-picker value-format="yyyy-MM-dd" type="date" placeholder="选择日期" v-model="formModify.kaifapiaodate" style="width: 100%;"></el-date-picker>
          </el-col>
          <el-input type="number"  v-model="formModify.invoice" style="width:25.5%" v-if="boxvalue" ></el-input>
          <el-select v-model="formModify.invoicebo" placeholder="请选择" style="width:20%" >
            <el-option label="有" value="有"></el-option>
            <el-option label="不计发票" value="不计发票"></el-option>
          </el-select>
          <el-button type="primary" @click="formModify.invoice = formModify.number" v-if="boxvalue" style="width:15%" >开发票</el-button>
        </el-form-item>
        <el-form-item label="收款方" prop="SupplierName">
            <el-select v-model="formModify.SupplierName" filterable placeholder="请选择" style="width:46%" >
                <el-option
                v-for="item in optionsOtherParty"
                :key="item.SupplierName"
                :label="item.SupplierName"
                :value="item.id">
                </el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="付款类别" prop="projectClass">
            <el-select v-model="formModify.projectClass" placeholder="请选择" style="width:46%" >
                <el-option
                v-for="item in optionsprojectClass"
                :key="item.expenditureClass"
                :label="item.expenditureClass"
                :value="item.id">
                </el-option>
            </el-select>
        </el-form-item>
        <!-- <el-form-item label="支付金额" >
          <el-input type="number"  v-model="formModify.Receivables" style="width:46%" ></el-input>
        </el-form-item>
        <el-form-item label="收到发票" >
          <el-input type="number"  v-model="formModify.invoice" style="width:46%" ></el-input>
        </el-form-item> -->
        <el-form-item label="备注" prop="Remarks">
          <el-input type="textarea" v-model="formModify.Remarks" ></el-input>
        </el-form-item>
        <el-form-item label="原件" >
          <el-upload
            class="avatar-uploader"
            :action="upimgaction"
            :show-file-list="false"
            :on-success="handleAvatarSuccess"
            :before-upload="beforeAvatarUpload">
              <img v-if="false" class="avatar">
              <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>
          <el-button style="vertical-align: top; margin-left:20px" @click="getimgurl()" v-if="imageUrlbo">查看原件</el-button>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitFormModify('formModify')">更新</el-button>
          <el-button @click="dialogAddVisible = false">取消</el-button>
          <el-button style="float:right" @click="outerVisible = true">删除收款</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
    <el-dialog
        width="30%"
        title="确认删除"
        :visible.sync="outerVisible"
        append-to-body>
        <el-button @click="outerVisible = false">取消</el-button>
        <el-button @click="deletepost">删除</el-button>
    </el-dialog>
    <el-table :data="tableData_s" border :summary-method="jsondata.getSummaries" show-summary id="expenditureContractlist" height='90%' style="width: 100%">
      <el-table-column type="index"></el-table-column>
      <el-table-column prop="SupplierName" label="付款名称"  width="300" sortable></el-table-column>
      <el-table-column prop="ReceivablesName" label="应付内容" sortable></el-table-column>
      <!-- <el-table-column prop="Receivableslist" label="付款分期" sortable></el-table-column> -->
      <el-table-column prop="number" label="应支付金额" sortable></el-table-column>
      <el-table-column prop="contractdate" label="签约时间" sortable></el-table-column>
      <el-table-column prop="Receivables" label="已支付金额" sortable></el-table-column>
      <el-table-column prop="Receivablesend" label="未支付金额" sortable></el-table-column>
      <el-table-column prop="invoice" label="收到发票" sortable></el-table-column>
      <el-table-column prop="weikaifapiao" label="已付未收票" sortable></el-table-column>
      <el-table-column prop="projectClass" label="支出类别" sortable></el-table-column>
      <el-table-column prop="" label="操作" >
        <template slot-scope="scope">
          <el-button @click="handleClick(scope.row)" type="text" size="small">{{scope.row.Receivableslistbo}}</el-button>
          <el-button @click="handle(scope.row)" type="text" size="small">编辑</el-button>
        </template>
      </el-table-column>
    </el-table>
  </el-main>
</template>
<script>
// import axios from 'axios'

export default {
  data () {
    return {
      imageUrlbo: false,
      imageUrl: '',
      upimgaction: 'http://localhost:3000/uploads',
      outerVisible: false,
      tableData_s: [],
      table: [],
      inputData: '',
      boxvalue: true,
      boxvalue1: false,
      hetongjiner: 0, // 合同金额
      yingshou: 0, // 应收金额
      zongshouru: 0, // 到账金额
      weishou: 0, // 未收金额
      biujifapiao: 0, // 不计发河北村
      weikaifapiao: 0, // 已付款未收票
      formbf: [],
      projectName: '',
      Customerlist: [],
      tableData: [],
      dialogAddVisible: false,
      dialogFormVisible: false,
      formModify: {}, // 添加收到金额
      TransactionList: {},
      formTransactionCon: '',
      formTransactionList: [], // 交易列表
      formTransaction: { // 交易
        MoneyClass: '',
        CollectMoney: '',
        AmountMoney: '',
        invoice: '',
        projectId: this.$route.params.id
      },
      form: {
        ReceivablesName: '',
        projectId: this.$route.params.id,
        number: '',
        ReceivablesData: '',
        contract: '',
        Remarks: '',
        invoice: '',
        invoicebo: '',
        kaifapiaodate: '',
        daozhangdate: '',
        Receivables: '',
        OtherParty: '',
        ReceivablesMode: '',
        contractdate: '',
        projectClass: ''
      },
      optionsprojectClass: [],
      optionsOtherParty: [],
      rules: {
        ReceivablesName: [
          { required: true, message: '付款名称', trigger: 'blur' }
        ],
        Receivableslist: [
          { required: true, message: '付款分期', trigger: 'blur' }
        ]
        // ,
        // ReceivablesMode: [
        //   { required: true, message: '付款方式', trigger: 'blur' }
        // ],
        // contract: [
        //   { required: true, message: '请选择', trigger: 'blur' }
        // ],
        // OtherParty: [
        //   { required: true, message: '请选择', trigger: 'blur' }
        // ],
        // projectClass: [
        //   { required: true, message: '请选择', trigger: 'blur' }
        // ],
        // formTransactionCon: [
        //   { required: true, message: '请输入支出金额' }
        // ]
      }
    }
  },
  props: { // 接收父组件传递过来的参数
    map: {
      // type:String
    }
  },
  watch: {
    form: {// 深度监听，可监听到对象、数组的变化
      handler (val, oldVal) {
        // console.log(val.invoicebo)
        if(val.invoicebo == '不计发票'){ //eslint-disable-line
          this.form.invoice = ''
          this.boxvalue = false
        } else {
          this.boxvalue = true
        }
        if(val.Receivableslist == '不分期'){ //eslint-disable-line
          this.boxvalue1 = true
        } else {
          this.boxvalue1 = false
          this.form.Receivables = ''
        }
      },
      deep: true // true 深度监听
    },
    formModify: {// 深度监听，可监听到对象、数组的变化
      handler (val, oldVal) {
        // console.log(val.invoicebo)
        if(val.invoicebo == '不计发票'){ //eslint-disable-line
          this.formModify.invoice = ''
          this.boxvalue = false
        } else {
          this.boxvalue = true
        }
        if(val.Receivableslist == '不分期'){ //eslint-disable-line
          this.boxvalue1 = true
        } else {
          this.formModify.Receivables = ''
          this.boxvalue1 = false
        }
      },
      deep: true // true 深度监听
    }
  },
  mounted () {
    // 开发环境~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    if (window.location.host.match('localhost')) {
      this.upimgaction = 'http://localhost:3000/uploads'
    } else {
      this.upimgaction = '/uploads'
    }
    this.getdata()
    this.getFormData('supplierlist')
    this.getFormDataClass('expenditureclass')
    this.getFormDataPojname()
  },
  methods: {
    getimgurl () {
      window.open('http://' + window.location.host + '/uploads/' + this.formModify.ReceivablesData, 'target', '')
    },
    handleAvatarSuccess (res, file) {
      // this.imageUrl = URL.createObjectURL(file.raw)
      this.form.ReceivablesData = res.filename
      this.formModify.ReceivablesData = res.filename
      this.imageUrlbo = true
      this.$message.success('上传资料成功,请保存修改!')
    },
    beforeAvatarUpload (file) {
      const isJPG = file.type === 'image/jpeg' || file.type === 'image/png' || file.type === 'application/pdf'
      // const isLt2M = file.size / 1024 / 1024 < 2
      if (!isJPG) {
        this.$message.error('上传资料格式错误!')
      }
      // const isJPG = file.type === 'image/jpeg'
      // const isLt2M = file.size / 1024 / 1024 < 2
      // if (!isJPG) {
      //   this.$message.error('上传头像图片只能是 JPG 格式!')
      // }
      // if (!isLt2M) {
      //   this.$message.error('上传头像图片大小不能超过 2MB!')
      // }
      return isJPG
    },
    submitFormModify (formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.updatpostData()
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    updatpostData () { // 更新数据
      if ( Number(this.formModify.SupplierName) < 99999) { //eslint-disable-line
      } else {
        this.formModify.SupplierName = this.formbf.SupplierName
      }
      if ( Number(this.formModify.projectClass) < 99999) { //eslint-disable-line
      } else {
        this.formModify.projectClass = this.formbf.projectClass
      }
      // console.log(this.formModify)
      this.jsondata.updatpostData('expenditure', this.formModify).then(response => {
        // this.jsondata.postDatabf(response.data, 'updatpostData')
        if (response.data === 'OK') {
          this.dialogAddVisible = false
          this.getdata()
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
    postData () { // 添加数据
      this.jsondata.postData('expenditure', this.form).then(response => {
        if (response.data === 'OK') {
          this.dialogFormVisible = false
          this.getdata()
          this.resetForm('form')
        }
      })
        .catch(error => {
          console.log(error)
        })
      return false
    },
    getdata () {
      this.hetongjiner = 0 // 合同金额初始化
      this.yingshou = 0 //
      this.zongshouru = 0 //
      this.weishou = 0 //
      this.weikaifapiao = 0
      this.biujifapiao = 0
      this.jsondata.getDataClass('expenditure', this.$route.params.id, 'projectId').then(response => {
        this.tableData = response.data
        this.jsondata.getData('expendituredata').then(responselist => {
          this.formTransactionList = responselist.data
          for (let i = 0; i < this.tableData.length; i++) {
            if(this.tableData[i].invoicebo == '不计发票'){ //eslint-disable-line
              this.biujifapiao += Number(this.tableData[i].Receivables)
              this.tableData[i].invoice = this.tableData[i].invoicebo
              this.tableData[i].weikaifapiao = this.tableData[i].invoicebo
            }
            this.tableData[i].Receivableslistbo = ''
            if(this.tableData[i].Receivableslist == '不分期'){ //eslint-disable-line
            } else {
              this.tableData[i].Receivableslistbo = '分' + this.tableData[i].Receivableslist + '付款'
              this.tableData[i].Receivables = 0
              this.tableData[i].invoice = 0
              this.tableData[i].weikaifapiao = 0
              this.tableData[i].Receivablesend = 0
              for (let is = 0; is < this.formTransactionList.length; is++) {
                if (this.tableData[i].id == this.formTransactionList[is].projectId) { //eslint-disable-line
                  if(this.formTransactionList[is].invoicebo == '不计发票'){ //eslint-disable-line
                    this.biujifapiao += Number(this.formTransactionList[is].Receivables)
                  } else {
                    this.tableData[i].invoice += Number(this.formTransactionList[is].invoice)
                  }
                  this.tableData[i].Receivables += Number(this.formTransactionList[is].Receivables)
                }
              }
            }
            this.tableData[i].weikaifapiao = this.jsondata.currency(Number(this.tableData[i].Receivables) - Number(this.tableData[i].invoice), '￥', 2)
            this.tableData[i].invoice = this.jsondata.currency(this.tableData[i].invoice, '￥', 2)
            // console.log(Number(this.tableData[i].Receivables).toFixed(2))
            this.tableData[i].Receivablesend = this.jsondata.currency((this.tableData[i].number - this.tableData[i].Receivables).toFixed(2), '￥', 2)
            this.tableData[i].number = this.jsondata.currency(this.tableData[i].number, '￥', 2)
            this.tableData[i].Receivables = this.jsondata.currency(this.tableData[i].Receivables, '￥', 2)
          }
          this.tableData_s = this.tableData
          this.jsondata.getData('supplierlist').then(response => { // 客户例表
            this.tableData = this.jsondata.fordata(response.data, this.tableData, 'SupplierName', 'SupplierName')
            this.jsondata.getData('expenditureclass').then(response => { // 支出类别例表
              this.tableData = this.jsondata.fordata(response.data, this.tableData, 'expenditureClass', 'projectClass')
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
    deletepost () { // 删除支出
      this.jsondata.deletepost('expenditure', this.formModify.id).then(response => {
        if (response.data === 'OK') {
          this.dialogAddVisible = false
          this.outerVisible = false
          this.getdata()
        }
      })
        .catch(error => {
          console.log(error)
        })
    },
    handleClick (row) {
      this.$router.push('/expenditure/' + row.id)
    },
    handle (row, event, column) { // 点击列表
      // console.log(row)
      this.dialogAddVisible = true
      this.jsondata.getDataId('expenditure', row.id).then(response => {
        this.formModify = response.data[0]
        this.formModify.SupplierName = row.SupplierName
        this.formModify.projectClass = row.projectClass
        if (this.formModify.ReceivablesData === '') {
          this.imageUrlbo = false
        } else {
          this.imageUrlbo = true
        }
      })
        .catch(error => {
          console.log(error)
        })
      this.jsondata.getDataId('expenditure', row.id).then(response => {
        this.formbf = response.data[0]
      })
        .catch(error => {
          console.log(error)
        })
      return false
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
    getFormDataPojname () {
      this.jsondata.getDataId('projectlist', this.$route.params.id).then(response => {
        this.projectName = response.data[0].projectName
      })
        .catch(error => {
          console.log(error)
        })
    },
    goToHome () {
      this.$router.push('/projectdetails/' + this.$route.params.id)
    },
    play (input) {
      let _this = this
      _this.table = _this.tableData.filter(Val => {
        if (Val.SupplierName.includes(input) || Val.ReceivablesName.includes(input) || Val.projectClass.includes(input) || Val.contractdate.includes(input)) {
          _this.table.push(Val)
          return _this.table
        }
      })
      this.tableData_s = _this.table
    }
  }
}
</script>
