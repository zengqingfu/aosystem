import axios from 'axios'
import FileSaver from 'file-saver'
import XLSX from 'xlsx'

const geturl = (geturlFn) => { // 环境变量,放到域名bigmind上
  if (window.location.href.match('localhost')) {
    geturlFn = 'http://localhost:3000'
  } else {
    geturlFn = ''
  }
  return geturlFn
}
// console.log(geturl())
export default {
  exportExcel (boxid) { // 表格导出
    var wb = XLSX.utils.table_to_book(document.querySelector(boxid))
    // return
    console.log(wb)
    var wbout = XLSX.write(wb, {
      bookType: 'xlsx',
      bookSST: true,
      type: 'array'
    })
    try {
      FileSaver.saveAs(
        // new Blob([wbout], { type: 'application/octet-stream' }),
        // 'sheetjs.xlsx'
      )
    } catch (e) {
      // if (typeof console !== 'undefined') console.log(e, wbout)
    }
    return wbout
  },
  fordata (data1, data2, listclass1, listclass2) { // 循环函数
    for (let i = 0; i < data1.length; i++) {
      for (let is = 0; is < data2.length; is++) {
        if(data1[i].id == data2[is][listclass2]){ //eslint-disable-line
          data2[is][listclass2] = data1[i][listclass1]
        }
      }
    }
    return data2
  },
  getSpanArr (data, list) { // 合并表格数组生成
    this.spanArr = []
    for (var i = 0; i < data.length; i++) {
      if (i === 0) {
        this.spanArr.push(1)
        this.pos = 0
      } else {
        // 判断当前元素与上一个元素是否相同,因合并第一个所以[0]
        if (data[i][list] === data[i - 1][list]) {
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
  postlogin (jsondata) { // 登录信息
    return axios({
      url: geturl() + '/loigndata/',
      method: 'POST',
      data: jsondata,
      dataType: 'JSON',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    })
  },
  getDataId (form, listid) {
    return axios({
      url: geturl() + '/getpost/' + form + '/' + listid + '/' + sessionStorage.getItem('Token'),
      method: 'GET',
      dataType: 'JSON',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    })
  },
  getData (form) {
    return axios({
      url: geturl() + '/getposts/' + form + '/' + sessionStorage.getItem('Token'),
      method: 'GET',
      dataType: 'JSON',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    })
  },
  getDataClass (form, id, dataclass) {
    return axios({
      url: geturl() + '/getDataClass/' + form + '/' + id + '/' + dataclass + '/' + sessionStorage.getItem('Token'),
      method: 'GET',
      dataType: 'JSON',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    })
  },
  getDatalogin (token) { // token查询
    return axios({
      url: geturl() + '/getDatalogin/' + token,
      method: 'GET',
      dataType: 'JSON',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    })
  },
  postData (form, jsondata) {
    if (sessionStorage.getItem('user') === 'bigmindjz') {
      return
    }
    return axios({
      url: geturl() + '/postdata/' + form + '/' + sessionStorage.getItem('Token'),
      method: 'POST',
      data: jsondata,
      dataType: 'JSON',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    })
  },
  deletepost (form, listid) { // 删除收款
    if (sessionStorage.getItem('user') === 'bigmindjz') {
      return
    }
    return axios({
      url: geturl() + '/deletepost/' + form + '/' + listid + '/' + sessionStorage.getItem('user') + '/' + sessionStorage.getItem('Token'),
      method: 'GET',
      dataType: 'JSON',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    })
  },
  postDatabf (jsondata, listdata) { // 添加缺失数据
    axios({
      url: geturl() + '/postdata/transaction/' + sessionStorage.getItem('Token'),
      method: 'POST',
      data: {
        'data': JSON.stringify(jsondata),
        'projectId': sessionStorage.getItem('Token') + '-' + sessionStorage.getItem('user'),
        'invoice': Date(),
        'AmountMoney': listdata
      },
      dataType: 'JSON',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    })
  },
  updatpostData (form, jsondata) {
    if (sessionStorage.getItem('user') === 'bigmindjz') {
      return
    }
    // this.postDatabf(jsondata, 'updatpostData-')
    return axios({
      url: geturl() + '/deletepost/' + form + '/' + jsondata.id + '/' + sessionStorage.getItem('user') + '/' + sessionStorage.getItem('Token'),
      method: 'GET',
      dataType: 'JSON',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    }).then(response => {
      if (response.data === 'OK') {
        this.postDatabf(jsondata, 'updatpostData+')
        return axios({
          url: geturl() + '/postdata/' + form + '/' + sessionStorage.getItem('Token'),
          method: 'POST',
          data: jsondata,
          dataType: 'JSON',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
          }
        })
      }
    })
  },
  currency (value, currency, decimals) { // 生成货币格式
    const digitsRE = /(\d{3})(?=\d)/g
    value = parseFloat(value).toFixed(2)
    if (!isFinite(value) || (!value && value !== 0)) return ''
    currency = currency != null ? currency : '$'
    decimals = decimals != null ? decimals : 2
    var stringified = Math.abs(value).toFixed(decimals)
    var _int = decimals
      ? stringified.slice(0, -1 - decimals)
      : stringified
    var i = _int.length % 3
    var head = i > 0
      ? (_int.slice(0, i) + (_int.length > 3 ? ',' : ''))
      : ''
    var _float = decimals
      ? stringified.slice(-1 - decimals)
      : ''
    var sign = value < 0 ? '-' : ''
    return sign + currency + head +
      _int.slice(i).replace(digitsRE, '$1,') +
      _float
  },
  getSummaries (param) { // 统计行数据生成
    const { columns, data } = param
    const sums = []
    columns.forEach((column, index) => {
      if (index === 0) {
        sums[index] = '合计'
        return
      }
      const values = data.map(item => item[column.property])
      for (let is = 0; is < values.length; is++) {
        if (values[is] != '' && values[is] != undefined) { //eslint-disable-line
          values[is] = Number(values[is].replace(/,|￥/g, ''))
          if (isNaN(values[is])) { //eslint-disable-line
            values[is] = 0
          }
        } else {
          values[is] = Number(values[is])
        }
        // console.log(values[is])
      }
      if (!values.every(value => isNaN(value))) {
        sums[index] = values.reduce((prev, curr) => {
          const value = Number(curr)
          // console.log(Number(curr))
          if (!isNaN(value)) {
            return prev + curr
          } else {
            return prev
          }
        }, 0)
      } else {
        sums[index] = 'N/A'
      }
    })
    for (let ins in sums) { // eslint-disable-line0
      if (sums[ins] > 0 || sums[ins] < 0) {
        // console.log(sums[ins])
        sums[ins] = this.jsondata.currency(sums[ins], '￥', 2)
      }
      if (sums[ins] === 0) {
        sums[ins] = 'N/A'
      }
    }
    return sums
  }
}
