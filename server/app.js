const express = require('express');
const mysql = require('mysql');
const app = express();
const bodyParser = require('body-parser');
const CryptoJS = require("crypto-js");
const multer = require('multer');
const fs = require("fs");
const path = require("path");

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'aosystem'
});

// Connect
db.connect(err => {
  if (err) throw err;
  console.log('MySql connected....'); 
});

//web页面
app.use(express.static('dist'));

// elem上传图片
// app.use('/uploads', express.static('uploads'))
// app.post('/uploads', multer({dest: 'uploads'}).single('file'), function (req, res, next) {
// if (req.file.length === 0) {  //判断一下文件是否存在，也可以在前端代码中进行判断。
//     res.render("error", {message: "上传文件不能为空！"});
//     return
// } else {
//    let file = req.file;
//    let fileInfo = {};
//    console.log(file);
//    fs.renameSync('./uploads/' + file.filename, './uploads/' + file.originalname);//这里修改文件名字，比较随意。
//    // 获取文件信息
//    fileInfo.mimetype = file.mimetype;
//    fileInfo.originalname = file.originalname;
//    fileInfo.size = file.size;
//    fileInfo.path = file.path;

//    // 设置响应类型及编码
//    res.set({
//      'content-type': 'application/json; charset=utf-8'
//   });
//    res.send(fileInfo);
// }
// });

//登录数据
app.use('/loigndata/',function(req, res, next){
  res.header("Access-Control-Allow-Origin", "*");
  var resdata = "";
  req.on("data", (chuck) => { 
    resdata += chuck
  })
  req.on("end", () => {
    var token = Date.now()
    var post = JSON.parse(resdata);
    post.password = CryptoJS.AES.decrypt(post.password, 'bigmind').toString(CryptoJS.enc.Utf8) // 解密码
    let sql = `SELECT * FROM login WHERE user = '${post.username}' and password = '${post.password}'`;
    db.query(sql, (err, result) => {
      if (err || result.length == 0) {
        res.end("登陆失败")
      } else {
        let sqls = `UPDATE login SET token = '${token}' WHERE user = '${post.username}'`;
        db.query(sqls, (err, result) => {
          if (err) throw err;
          // console.log(result);
          res.end(""+token)
        });
      }
    });
  })
});

// 查询token
app.get('/getDatalogin/:token', (req, res) => {
  res.header("Access-Control-Allow-Origin", "*");
  let sql = `SELECT * FROM login WHERE token = ${req.params.token}`;
  db.query(sql, (err, result) => {
    if (err || result.length == 0) {
      // console.log(result);
      res.json('NO');
    }else{
      // console.log(result);
      res.json('OK');
    }
  });
});

app.all('*', function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With");
  res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
  res.header("Content-Type", "application/json;charset=utf-8");
  let token = req.params[0].split("/")[req.params[0].split("/").length-1]
  // console.log(token)
  let sql = `SELECT * FROM login WHERE token = ${token}`;
  db.query(sql, (err, result) => {
    if (err || result.length == 0) {
      // console.log(result);
      res.json('NO');
    }else{
      // console.log(result);
      next();
    }
  });
}); 

//post数据添加内容
app.use('/postdata/:form/:token',function(req, res, next){
  var result = "";
  req.on("data", (chuck) => { 
    result += chuck
  })
  req.on("end", () => {
    //console.log(JSON.parse(result))
    let post = JSON.parse(result);
    let sql = `INSERT INTO ${req.params.form} SET ?`;
    db.query(sql, post, (err, result) => {
      if (err) throw err;
      //res.end(result)
    });
    res.end('OK')
  })
});

// 更新内容
app.use('/updatpost/:form/:token', (req, res) => {
  var result = ""; 
  req.on("data", (chuck) => {
    result += chuck
  })
  req.on("end", () => {
    let post = JSON.parse(result);
    let posttext = "UPDATE "+ req.params.form +" SET "
    let postfuhao = ","
    let postint = 0
    for (let index in post) {
      postint++
      if (Object.keys(post).length == postint) {
        postfuhao = ""
      }
      console.log(post[index], index, postfuhao)
      posttext += index + " = '"+post[index]+"'" + postfuhao
    }
    posttext += "WHERE id ='" + post.id + "'"
    let sql = `${posttext}`;
    // console.log(sql, "----" + posttext);
    db.query(sql, (err, result) => {
      if (err) throw err;
      // console.log(result);
    });
    res.end('OK')
  })
});




app.get('/updateget/:id/:token', (req, res) => {
  let newTitle = 'update title';
  let sql = `UPDATE posts SET title = ${newTitle} WHERE id = ${req.params.id}`;
  db.query(sql, (err, result) => {
    if (err) throw err;
    // console.log(result);
    res.json('更新成功...');
  });
});

// 创建表
app.get('/createpoststable', (req, res) => {
  let sql =
    'CREATE TABLE posts(id int AUTO_INCREMENT,title VARCHAR(255),body VARCHAR(255), PRIMARY KEY(id))';
  db.query(sql, (err, result) => {
    if (err) throw err;
    // console.log(result);
    res.send('posts表已经建立...');
  });
}); 
 
// 插入内容
app.get('/addpost/:con/:token', (req, res) => {
  let post = { title: 'post one', body: req.params.con };
  let sql = 'INSERT INTO posts SET ?';
  db.query(sql, post, (err, result) => {
    if (err) throw err;
    // console.log(result);
    res.send('post 1 added....');
  });
});

// 查询内容
app.get('/getposts/:form/:token', (req, res) => {
  let sql = `SELECT * FROM ${req.params.form} ORDER BY id ASC`;
  db.query(sql, (err, result) => {
    if (err) throw err;
    // console.log(result);
    res.send(result); 
  });
});

// 查询多条内容
app.get('/getDataClass/:form/:id/:class/:token', (req, res) => {
  console.log(req.params.class);
  let sql = `SELECT * FROM ${req.params.form} WHERE ${req.params.class} = ${req.params.id} ORDER BY id ASC`;
  db.query(sql, (err, result) => {
    if (err) throw err;
    // console.log(result);
    res.json(result);
  });
});

// 查询单条内容
app.get('/getpost/:form/:id/:token', (req, res) => {
  let sql = `SELECT * FROM ${req.params.form} WHERE id = ${req.params.id}`;
  db.query(sql, (err, result) => {
    if (err) throw err; 
    // console.log(result);
    res.json(result);
  });
});

// 删除内容
app.get('/deletepost/:form/:id/:user/:token', (req, res) => {
  let sql = `DELETE FROM ${req.params.form} WHERE id = ${req.params.id}`;
  db.query(sql, (err, result) => {
    let postdata = {'data': JSON.stringify(req.params), 'projectId': req.params.token + "-" + req.params.user, 'invoice': Date()};
    let sqlx = 'INSERT INTO transaction SET ?';
    db.query(sqlx, postdata, (err, result) => {
      if (err) throw err;
    });
    if (err) throw err;
    // console.log(result);
    res.json('OK');
  });
});

app.listen('3000', () => {
  console.log('Server started on port 3000');
});
