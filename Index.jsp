<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tra cứu kết quả</title>
    <style>
        .container { width: 700px; margin: 0 auto; border: 1px dashed #000; padding: 20px; }
        h2, h3 { text-align: center; margin: 5px 0; }
        .form-group { display: flex; justify-content: center; align-items: center; gap: 10px; margin-top: 20px; }
        .notes { margin-top: 20px; }
        .notes p { font-weight: bold; text-decoration: underline; margin-bottom: 5px; }
    </style>
</head>
<body>
    <div class="container">
        <h2>TRA CỨU KẾT QUẢ</h2>
        <h3>KỲ THI TUYỂN SINH SAU ĐẠI HỌC NĂM 2016 (ĐỢT 1)</h3>
        
        <form action="result.jsp" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label><b>Số báo danh:</b></label>
                <input type="text" name="sbd" id="sbd">
                
                <label><b>Họ và tên thí sinh:</b></label>
                <input type="text" name="hoten" id="hoten">
                
                <button type="submit">Xem kết quả</button>
            </div>
        </form>

        <div class="notes">
            <p>Lưu ý:</p>
            <ul>
                <li>Thí sinh nhập thông tin vào cả 2 ô trên mới xem được kết quả</li>
                <li>Họ và tên vui lòng viết có dấu và viết hoa chữ cái đầu tiên</li>
                <li>Số báo danh nhập cả phần chữ và phần số</li>
                <li>Môn cơ bản và môn cơ sở thang điểm 10, môn ngoại ngữ thang điểm 100</li>
                <li>Xin cảm ơn! Chúc bạn thành công!</li>
            </ul>
        </div>
    </div>

    <script>
        function validateForm() {
            var sbd = document.getElementById("sbd").value.trim();
            var hoten = document.getElementById("hoten").value.trim();
            if (sbd === "" || hoten === "") {
                alert("Vui lòng không để trống số báo danh và họ tên!");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>

