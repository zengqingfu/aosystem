import axios from 'axios'
export default {
  getSpanArr (data) {
    this.spanArr = []
    for (var i = 0; i < data.length; i++) {
      if (i === 0) {
        this.spanArr.push(1)
        this.pos = 0
      } else {
        // 判断当前元素与上一个元素是否相同,因合并第一个所以[0]
        if (data[i].Receivableslist === data[i - 1].Receivableslist) {
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
    if (columnIndex === 0 || columnIndex === 1 || columnIndex === 2) {
      const _row = this.dataList[row.projectint][rowIndex]
      const _col = _row > 0 ? 1 : 0
      return {
        rowspan: _row,
        colspan: _col
      }
    }
  },
  getDataId (form, listid) {
    return axios({
      url: 'http://localhost:3000/getpost/' + form + '/' + listid,
      method: 'GET',
      dataType: 'JSON',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    })
  },
  getData (form) {
    return axios({
      url: 'http://localhost:3000/getposts/' + form,
      method: 'GET',
      dataType: 'JSON',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    })
  },
  getDataClass (form, id, dataclass) {
    return axios({
      url: 'http://localhost:3000/getDataClass/' + form + '/' + id + '/' + dataclass,
      method: 'GET',
      dataType: 'JSON',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    })
  },
  postData (form, jsondata) {
    return axios({
      url: 'http://localhost:3000/postdata/' + form,
      method: 'POST',
      data: jsondata,
      dataType: 'JSON',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    })
  },
  deletepost (form, listid) { // 删除收款
    return axios({
      url: 'http://localhost:3000/deletepost/' + form + '/' + listid,
      method: 'GET',
      dataType: 'JSON',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    })
  },
  updatpostData (form, jsondata) {
    return axios({
      url: 'http://localhost:3000/deletepost/' + form + '/' + jsondata.id,
      method: 'GET',
      dataType: 'JSON',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    }).then(response => {
      if (response.data === 'OK') {
        return axios({
          url: 'http://localhost:3000/postdata/' + form,
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
  currency (value, currency, decimals) {
    const digitsRE = /(\d{3})(?=\d)/g
    value = parseFloat(value)
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
  }
}
