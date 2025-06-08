// cấu hình tập server
const express = require("express");
const mysql = require("mysql");
const cors = require("cors");
const path = require("path");

const app = express();

// Sử dụng thư mục "public" để chứa các file tĩnh (HTML, CSS, JS, hình ảnh, v.v.)
// Người dùng có thể truy cập các file này trực tiếp qua URL
app.use(express.static(path.join(__dirname, "public")));

// Kích hoạt CORS (Cross-Origin Resource Sharing) để cho phép các domain khác gọi API của bạn
app.use(cors());

// Cho phép server đọc dữ liệu JSON từ body của các request HTTP (POST, PUT, v.v.)
app.use(express.json());

// Đặt cổng mà server sẽ lắng nghe (ở đây là cổng 5000)
const port = 5000;

const data = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "cuahanggame",
});

app.listen(port, () => {
  console.log("listening");
});
