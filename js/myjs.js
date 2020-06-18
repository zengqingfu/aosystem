var Main = {
    data() {
        return {
            dialogVisible: false,
            value1: '',
            value2: '',
            isCollapse: false,
            tableData: [{
                date: '2016-05-02',
                name: '王小虎',
                address: '上海市普陀区金沙江路 1518 弄',
                tag: '家'
            }, {
                date: '2016-05-04',
                name: '王小虎',
                address: '上海市普陀区金沙江路 1517 弄',
                tag: '公司'
            }, {
                date: '2016-05-01',
                name: '王小虎',
                address: '上海市普陀区金沙江路 1519 弄',
                tag: '家'
            }, {
                date: '2016-05-03',
                name: '王小虎',
                address: '上海市普陀区金沙江路 1516 弄',
                tag: '公司'
            }]
        };
    },

    methods: {

        postData(){

            axios({
                url:"http://localhost:3000/postdata",
                method:"POST",
                data:{
                    projectName:"postosss999966se",
                    projectContent:"postosss999966se",
                    CustomerName:"postosss999966se",
                    ContractAmount:11,
                    ContractDate:"1000-01-01"
                },
                dataType:"JSON",
                headers:{
                    "Content-Type":"application/x-www-form-urlencoded"
                }
            })
            .then((response)=>{
                console.log(response) 
                
            })
            .catch((error)=>{
                console.log(error)
            })
            console.log(this.tableData)
            return false;   
            
        },
        handle(row, event, column) {
             console.log(row, event, column)
        },
        handleOpen(key, keyPath) {
            console.log(key, keyPath);
        },
        handleClose(key, keyPath) {
            console.log(key, keyPath);
        },
        handleClose(done) {
            this.$confirm('确认关闭？')
              .then(_ => {
                done();
              })
              .catch(_ => {});
        }
    }
}
var Ctor = Vue.extend(Main)
new Ctor().$mount('#app')