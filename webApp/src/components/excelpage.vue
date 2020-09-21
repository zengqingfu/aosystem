
<template>
  <section class="search-table">
    <el-form :model="dynamicValidateForm" ref="dynamicValidateForm" class="dynamic-table" label-width="0">
      <el-table :data="dynamicValidateForm.domains" :span-method="objectSpanMethod" v-loading.body="listLoading" 
        element-loading-text="拼命加载中" border fit highlight-current-row>
        <el-table-column label="序号" type="index" align="center" width="60%" />
        <el-table-column label="指标" prop="NAME" min-width="15%" />
        <el-table-column label="分值" prop="SCORE" min-width="8%" />
        <el-table-column label="考核内容" prop="CONTENT" min-width="15%" />
        <el-table-column label="扣分标准" prop="STANDARD" min-width="52%" />
 
        <el-table-column label="扣分" prop="MINUS_SCORE" min-width="10%">
          <template slot-scope="scope">
            <el-form-item :prop="'domains.' + scope.$index + '.MINUS_SCORE'" 
              :rules="[{pattern: validator('number'), message: '请输入数字', trigger: 'blur'} ]">
              <nv-input v-model.number="scope.row.MINUS_SCORE" :disabled="!isView" />
            </el-form-item>
          </template>
        </el-table-column>
      </el-table>
    </el-form>
  </section>
</template>
<script>
import { getProjectDeductDatas } from "./api";
export default {
  name: "ProjectDeduct",
  props: {},
  data() {
    return {
      list: [],
      listLoading: true,
      dynamicValidateForm: {
        domains: []
      },
      spanArr: [], // 一个空的数组，用于存放每一行记录的合并数
      pos: 0, // spanArr 的索引
      contentSpanArr: [],
      position: 0
    };
  },
 
  computed: {},
  created() {
    this.getList();
  },
  methods: {
    // 合并单元格
    objectSpanMethod({ row, column, rowIndex, columnIndex }) {
      if (columnIndex === 1 || columnIndex === 2) {
        const _row = this.spanArr[rowIndex];
        const _col = _row > 0 ? 1 : 0;
        return {
          rowspan: _row,
          colspan: _col
        };
      } else if (columnIndex === 3) {
        const _row = this.contentSpanArr[rowIndex];
        const _col = _row > 0 ? 1 : 0;
        return {
          rowspan: _row,
          colspan: _col
        };
      }
    },
    // 获取列表数据
    getList() {
      const self = this;
      const { SCORE_ID, searchForm } = self;
      self.listLoading = true;
      getProjectDeductDatas({
        SCORE_ID: scoreId,
        NAME: searchForm.NAME
      })
        .then(({ data }) => {
          self.listLoading = false;
          this.dynamicValidateForm.domains = data || [];
 
          // 设定一个数组spanArr/contentSpanArr来存放要合并的格数，同时还要设定一个变量pos/position来记录
          this.spanArr = [];
          this.contentSpanArr = [];
          for (var i = 0; i < data.length; i++) {
            if (i === 0) {
              this.spanArr.push(1);
              this.pos = 0;
              this.contentSpanArr.push(1);
              this.position = 0;
            } else {
              // 判断当前元素与上一个元素是否相同(第1和第2列)
              if (data[i].INDEX_ID === data[i - 1].INDEX_ID) {
                this.spanArr[this.pos] += 1;
                this.spanArr.push(0);
              } else {
                this.spanArr.push(1);
                this.pos = i;
              }
              // 判断当前元素与上一个元素是否相同(第3列)
              if (data[i].CONTENT === data[i - 1].CONTENT) {
                this.contentSpanArr[this.position] += 1;
                this.contentSpanArr.push(0);
              } else {
                this.contentSpanArr.push(1);
                this.position = i;
              }
            }
          }
        })
        .catch(err => {
          self.listLoading = false;
          console.log(err);
        });
    }
  },
  watch: {}
};
</script>