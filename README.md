# Công cụ Đánh giá Sức khỏe Tinh thần (PERMA · GHQ-12 · DASS-21)

Web tĩnh một file (`index.html`), deploy trên Netlify. Kết quả được gửi qua Google Apps Script vào Google Sheets.

## Đường dẫn và nơi lưu dữ liệu

| Phòng khám | Link cho bệnh nhân | Google Sheet lưu kết quả |
|---|---|---|
| Sức khỏe tổng quát (SKTQ) | https://bsnghia-vinmec-mentalhealth.netlify.app/?clinic=sktq | [BsNghia_Mentalheath_Report_SKTQ](https://docs.google.com/spreadsheets/d/1Dzi0n5valJL0VpHz6VGWGexKMKvktnD6Yi7IYFWL-fw/edit) |
| Tâm thần | https://bsnghia-vinmec-mentalhealth.netlify.app/?clinic=tamthan | [BsNghia_Mentalheath_Report_TamThan](https://docs.google.com/spreadsheets/d/1gBRoGfgQmC4mhCFwsBiojuQelaRI28RPR_7Qbdibijs/edit?gid=126127484#gid=126127484) |
| Link gốc (form cũ) | https://bsnghia-vinmec-mentalhealth.netlify.app/ | [BsNghia_Mentalheath_Report](https://docs.google.com/spreadsheets/d/1QZyVpIEeENn5k1QQdIH0AeDeHNGp9qbtzfd2TIQslkc/edit) |

- Phải giữ nguyên `?clinic=...` ở cuối link. Thiếu phần này, bệnh nhân sẽ làm form cũ và dữ liệu vào file cũ.
- Link phòng khám có thêm: ô **PID** (bắt buộc), câu hỏi thu nhập/hôn nhân mới, câu hỏi bệnh lý thể chất mạn tính.
- Mỗi file Sheet có 5 tab: `Demographics`, `General`, `PERMA-Profiler`, `GHQ-12`, `DASS-21`. Script tự tạo tab và tiêu đề ở lần gửi đầu tiên.
- Các file Sheet chứa dữ liệu bệnh nhân: để chế độ chia sẻ **Restricted**, chỉ thêm người cần xem.

## Apps Script

Mỗi phòng khám có một project Apps Script riêng, cùng code [`apps-script/Code.gs`](apps-script/Code.gs), khác nhau ở `SPREADSHEET_ID`:

| Project | Web app URL (khai báo trong `CLINIC_CONFIG`, `index.html`) |
|---|---|
| SKTQ-Collector | `https://script.google.com/macros/s/AKfycbwCxd40x2vhjrTF_1m4sxG7wKHf0xi1d_6iXdZQmLE91z9hOERRcGjZmV0LuTE2eYo/exec` |
| TamThan-Collector | `https://script.google.com/macros/s/AKfycbw7P8oMvFfLu4m5IjY_db_c99LG1aWH8raujn8DbTsAQ0ChHr_lLNzlCOWPQtqNC3kR/exec` |

Khi sửa code script: **Triển khai → Quản lý bản triển khai → ✏️ → Phiên bản mới → Triển khai** để giữ nguyên URL.

## Deploy

Netlify deploy thủ công: chép `index.html` vào một thư mục trống, kéo thả thư mục đó vào trang **Deploys** của project `bsnghia-vinmec-mentalhealth`. Không cần đưa `apps-script/` lên Netlify.
