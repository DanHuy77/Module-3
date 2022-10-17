USE quan_ly_ban_hang;
--- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order ---
SELECT o_ID, o_date, o_total_price FROM `order`;

--- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách ---
SELECT * FROM customer JOIN `order` ON customer.c_ID = `order`.c_ID JOIN order_detail ON `order`.o_id = order_detail.o_id JOIN product ON order_detail.p_id = product.p_id;

--- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào ---
SELECT c_name FROM customer WHERE NOT EXISTS (SELECT * FROM `order` WHERE customer.c_id = `order`.c_id);

--- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice) ---
SELECT `order`.o_ID, o_date, od_QTY*p_price FROM `order` JOIN order_detail ON `order`.o_ID = order_detail.o_ID JOIN product ON order_detail.p_ID = product.p_ID;