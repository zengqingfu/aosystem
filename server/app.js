const express = require('express');
const mysql = require('mysql');
const app = express();
const bodyParser = require('body-parser');

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'qq785805',
  database: 'ao_system1'
});

// Connect
db.connect(err => {
  if (err) throw err;
  console.log('MySql connected....'); 
});


//web页面
app.use(express.static('dist'));

//post数据添加内容
app.use('/postdata/:form',function(req, res, next){
  var result = "";
  req.on("data", (chuck) => { 
    result += chuck
  })
  req.on("end", () => {
    res.writeHead(200, {"Content-Type": "text/html;charset=utf8","Access-Control-Allow-Origin": "*"})
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

app.use('/updatpost/:id', (req, res) => {
  var result = ""; 
  req.on("data", (chuck) => {
    result += chuck
  })
  req.on("end", () => {
    res.writeHead(200, {"Content-Type": "text/html;charset=utf8","Access-Control-Allow-Origin": "*"})  
    let post = JSON.parse(result);
    console.log(post);
    let sql = `UPDATE Receivables SET 
      ReceivablesName = '${post.ReceivablesName}',
      ReceivablesData = '${post.ReceivablesData}',
      Remarks = '${post.Remarks}',
      invoice = '${post.invoice}',
      Receivables = '${post.Receivables}',
      ReceivablesMode = '${post.ReceivablesMode}',
      contract = '${post.contract}'
    WHERE id = 
'${post.id}'`;

    db.query(sql, (err, result) => {
      if (err) throw err;
      console.log(result);
    });
    res.end('OK')
  })
});


app.get('/updateget/:id', (req, res) => {
  let newTitle = 'update title';
  let sql = `UPDATE posts SET title = ${newTitle} WHERE id = ${req.params.id}`;
  db.query(sql, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.json('更新成功...');
  });
});

app.use(bodyParser.json() );
app.use(bodyParser.urlencoded());

// 创建表
app.get('/createpoststable', (req, res) => {
  let sql =
    'CREATE TABLE posts(id int AUTO_INCREMENT,title VARCHAR(255),body VARCHAR(255), PRIMARY KEY(id))';
  db.query(sql, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send('posts表已经建立...');
  });
}); 
 
// 插入内容
app.get('/addpost/:con', (req, res) => {
  
  let post = { title: 'post one', body: req.params.con };
  let sql = 'INSERT INTO posts SET ?';
  db.query(sql, post, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send('post 1 added....');
  });
});

// 查询内容
app.get('/getposts/:form', (req, res) => {
  res.setHeader("Access-Control-Allow-Origin", "*"); // 设置可访问的源
  let sql = `SELECT * FROM ${req.params.form} ORDER BY id ASC`;
  db.query(sql, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send(result); 
  });
});

// 查询多条内容
app.get('/getDataClass/:form/:id/:class', (req, res) => {
  res.setHeader("Access-Control-Allow-Origin", "*"); // 设置可访问的源
  let sql = `SELECT * FROM ${req.params.form} WHERE ${req.params.class} = ${req.params.id} ORDER BY id ASC`;
  db.query(sql, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.json(result);
  });
});


// 查询单条内容
app.get('/getpost/:form/:id', (req, res) => {
  res.setHeader("Access-Control-Allow-Origin", "*"); // 设置可访问的源
  let sql = `SELECT * FROM ${req.params.form} WHERE id = ${req.params.id}`;
  db.query(sql, (err, result) => {
    if (err) throw err; 
    console.log(result);
    res.json(result);
  });
});

// 删除内容
app.get('/deletepost/:form/:id', (req, res) => {
  res.setHeader("Access-Control-Allow-Origin", "*"); // 设置可访问的源
  let sql = `DELETE FROM ${req.params.form} WHERE id = ${req.params.id}`;
  db.query(sql, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.json('OK');
  });
});

app.listen('3000', () => {
  console.log('Server started on port 3000');
});
