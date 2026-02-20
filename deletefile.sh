#!/bin/bash

# Tên file chứa danh sách đường dẫn
LIST_FILE="list.txt"

# Kiểm tra xem file danh sách có tồn tại không
if [ ! -f "$LIST_FILE" ]; then
    echo "❌ Lỗi: Không tìm thấy file $LIST_FILE trong thư mục hiện tại."
    exit 1
fi

echo "Bắt đầu dọn dẹp file..."
echo "---------------------------"

# Đọc từng dòng trong file list.txt
while IFS= read -r line || [ -n "$line" ]; do
    # Bỏ qua các dòng trống
    if [ -z "$line" ]; then
        continue
    fi

    # 1. Xóa bỏ ký tự \r ở cuối dòng (tránh lỗi nếu list.txt được tạo từ Windows)
    clean_line="${line//$'\r'/}"
    
    # 2. Đổi toàn bộ dấu backslash (\) thành forward slash (/)
    unix_path="${clean_line//\\//}"
    
    # 3. Xóa dấu '/' ở đầu chuỗi (nếu có) để biến nó thành đường dẫn tương đối (so với thư mục hiện tại)
    relative_path="${unix_path#/}"

    # Kiểm tra xem file có tồn tại không và tiến hành xóa
    if [ -f "$relative_path" ]; then
        rm "$relative_path"
        echo "✅ Đã xóa: $relative_path"
    else
        echo "⚠️ Không tìm thấy: $relative_path"
    fi
done < "$LIST_FILE"

echo "---------------------------"
echo "Hoàn tất!"
