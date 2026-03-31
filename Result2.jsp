<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kết quả thi tuyển sinh</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f0f2f5; }
        .wrapper { width: 550px; margin: 40px auto; background: #fff; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 15px rgba(0,0,0,0.2); }
        .header { background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%); color: white; text-align: center; padding: 20px; }
        .content { padding: 25px; }
        table { width: 100%; border-collapse: collapse; }
        td { padding: 12px 8px; border-bottom: 1px solid #f0f0f0; }
        .title { font-weight: 600; color: #444; width: 45%; }
        .data { color: #111; }
        .pass { color: #2ecc71; font-weight: bold; }
        .fail { color: #e74c3c; font-weight: bold; }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="header"><h2 style="margin:0">THÔNG TIN KẾT QUẢ</h2></div>
        <div class="content">
        <%
            request.setCharacterEncoding("UTF-8");
            String sbd = request.getParameter("sbd");
            String hoten = request.getParameter("hoten");

            if (sbd == null || hoten == null || sbd.trim().isEmpty() || hoten.trim().isEmpty()) {
                out.println("<script>alert('Vui lòng nhập đầy đủ thông tin!'); window.history.back();</script>");
                return;
            }

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/qlsv?useUnicode=true&characterEncoding=UTF-8";
            Connection conn = DriverManager.getConnection(url, "root", "");
            
            // Dùng PreparedStatement - Chuẩn Software Engineer
            String sql = "SELECT t.*, n.Tennganh FROM thisinh t JOIN nganh n ON t.Manganh = n.Manganh WHERE t.SoBD = ? AND t.Hoten = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, sbd.trim());
            pstmt.setString(2, hoten.trim());
            
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                int m1 = rs.getInt("MonCB");
                int m2 = rs.getInt("MonCS");
                int m3 = rs.getInt("Ngoaingu");
                boolean isPass = (m1 >= 5 && m2 >= 5 && m3 >= 50);
        %>
            <table>
                <tr><td class="title">Số báo danh:</td><td class="data"><%= sbd %></td></tr>
                <tr><td class="title">Họ tên thí sinh:</td><td class="data"><%= hoten %></td></tr>
                <tr><td class="title">Giới tính:</td><td class="data"><%= rs.getString("Gioitinh") %></td></tr>
                <tr><td class="title">Ngành thi:</td><td style="font-style: italic;"><%= rs.getString("Tennganh") %></td></tr>
                <tr><td class="title">Môn cơ bản:</td><td><%= m1 %></td></tr>
                <tr><td class="title">Môn cơ sở:</td><td><%= m2 %></td></tr>
                <tr><td class="title">Ngoại ngữ:</td><td><%= m3 %></td></tr>
                <tr>
                    <td class="title">Trạng thái:</td>
                    <td class="<%= isPass ? "pass" : "fail" %>">
                        <%= isPass ? "ĐẠT (TRÚNG TUYỂN)" : "HỎNG (CHƯA ĐẠT)" %>
                    </td>
                </tr>
            </table>
        <%
            } else {
                out.println("<script>alert('Không tìm thấy thí sinh này trong hệ thống!'); window.history.back();</script>");
            }
            // Đã lược bỏ phần đóng resource thủ công theo ý bạn
        %>
        </div>
    </div>
</body>
</html>
               
