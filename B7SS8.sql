CREATE DATABASE BAI_SO7;
USE BAI_SO7;

CREATE TABLE ChiTietDonHang (
ma_chi_tiet INT,
ma_don_hang INT,
ten_san_pham VARCHAR(100),
so_luong INT,
don_gia DECIMAL(10, 2),
thanh_tien DECIMAL(10, 2)
);
INSERT INTO ChiTietDonHang (ma_chi_tiet, ma_don_hang, ten_san_pham, so_luong, don_gia, thanh_tien) VALUES
(1, 1001, 'Cà Phê Sữa', 2, 29000.00, 58000.00),
(2, 1001, 'Bạc Xỉu', 1, 35000.00, 35000.00),
(3, 1002, 'Trà Đào Cam Sả', 1, 45000.00, 45000.00),
(4, 1003, 'Cà Phê Sữa', 1, 29000.00, 29000.00),
(5, 1004, 'Trà Sữa Trân Châu Đường Đen', 2, 55000.00, 110000.00),
(6, 1005, 'Bạc Xỉu', 1, 35000.00, 35000.00),
(7, 1006, 'Cà Phê Sữa', 3, 29000.00, 87000.00),
(8, 1006, 'Trà Chanh Gừng Mật Ong', 1, 42000.00, 42000.00),
(9, 1007, 'Trà Đào Cam Sả', 2, 45000.00, 90000.00),
(10, 1008, 'Trà Sữa Trân Châu Đường Đen', 1, 55000.00, 55000.00),
(11, 1009, 'Cà Phê Sữa', 1, 29000.00, 29000.00),
(12, 1010, 'Trà Chanh Gừng Mật Ong', 1, 42000.00, 42000.00);

SELECT 
    ten_san_pham,
    SUM(so_luong) AS tong_so_ly_ban,
    SUM(thanh_tien) AS tong_doanh_thu,
    COUNT(DISTINCT ma_don_hang) AS so_don_hang_chua_sp
FROM ChiTietDonHang
GROUP BY ten_san_pham;

/* 
===================== PHÂN TÍCH HIỆU SUẤT SẢN PHẨM =====================

Dựa trên kết quả từ Nhiệm vụ 1, ta có thể tổng hợp như sau:

1. KẾT QUẢ HIỆU SUẤT (tóm tắt)
------------------------------------------------------------
Sản phẩm                         | Số ly | Doanh thu | Số đơn hàng
------------------------------------------------------------
Cà Phê Sữa                       |   7   | 146,000   |    4
Trà Sữa Trân Châu Đường Đen     |   3   | 165,000   |    2
Trà Đào Cam Sả                   |   3   | 135,000   |    2
Bạc Xỉu                          |   2   |  70,000   |    2
Trà Chanh Gừng Mật Ong          |   2   |  84,000   |    2

==========================================================================

2. PHÂN LOẠI SẢN PHẨM
Sản phẩm "NGÔI SAO" (hiệu suất tốt nhất):
   → Dựa trên tiêu chí: doanh thu CAO + độ phổ biến (số đơn hàng) LỚN.
   → Hai sản phẩm nổi bật nhất:

   1) Cà Phê Sữa  
      - 7 ly (cao nhất)
      - 146,000 doanh thu (top 2)
      - Xuất hiện trong 4 đơn hàng (cao nhất)
      → ➜ Đây là sản phẩm phổ biến nhất + ổn định nhất.

   2) Trà Sữa Trân Châu Đường Đen  
      - 165,000 doanh thu (cao nhất)
      - 3 ly trong 2 đơn
      → ➜ Dù không phổ biến bằng Cà Phê Sữa nhưng giá trị hóa đơn cao vượt trội.

Sản phẩm "CẦN XEM XÉT" (hiệu suất thấp nhất):
   → Dựa trên tiêu chí: doanh thu thấp + không phổ biến.
   → Hai sản phẩm yếu nhất:

   1) Bạc Xỉu  
      - Doanh thu thấp nhất: 70,000  
      - Chỉ 2 đơn hàng  
      → ➜ Không hút khách, ít doanh thu.

   2) Trà Chanh Gừng Mật Ong  
      - Doanh thu chỉ 84,000  
      - Xuất hiện trong 2 đơn  
      → ➜ Gần như không tạo ra ảnh hưởng đáng kể.

==========================================================================

3. ĐỀ XUẤT CHIẾN LƯỢC
CHO SẢN PHẨM "NGÔI SAO":
   → Sản phẩm chọn: Cà Phê Sữa
   → Đề xuất chiến lược:
       - Chạy combo: "Mua 2 Cà Phê Sữa – Giảm 10%"
       - Hoặc tặng topping miễn phí vào giờ cao điểm.
       - Mục đích: tăng lượng mua lặp lại và khuyến khích mua nhiều ly.
CHO SẢN PHẨM "CẦN XEM XÉT":
   → Sản phẩm chọn: Bạc Xỉu
   → Hành động đề xuất:
       - Chạy chương trình dùng thử: giảm 20% trong 3 ngày.
       - Thu thập feedback để xem có vấn đề về vị – công thức – hình ảnh.
       - Nếu doanh số vẫn thấp → cân nhắc loại khỏi menu.

==========================================================================

KẾT LUẬN:
- Cà Phê Sữa và Trà Sữa Trân Châu Đường Đen là hai sản phẩm chủ lực.
- Bạc Xỉu và Trà Chanh Gừng Mật Ong cần được đánh giá lại để tối ưu menu.
*/

 