# UPDATE 2026/2/26
# WINDOWS

🌟 Hướng dẫn hoàn thành nhanh Discord Quests
**Discord Quests**: Nhiệm vụ nhận thưởng (Orbs/Decor) như 🎮 chơi game, 📺 xem video, 🖥️ stream, 🎲 dùng Activity.

🚀 Cách “làm nhanh” Quests bằng script (không cần thực sự chơi/xem/stream)
⚠️ Cách này chỉ áp dụng cho một số loại Quests (chơi game, stream, xem video, Activity).

Bước 1: Mở Discord Desktop App (không dùng bản web/điện thoại)

Bước 2: Nhận Quest: **Discover → Quests → Claim Reward** 

Bước 3: Bật công cụ DevTools
- Thử **Ctrl+Shift+I** → nếu mở được thì tiếp tục bước tiếp theo.
- Nếu không:
- Mở **Win+R → gõ** `%APPDATA%\Discord` **→ Enter → mở file settings.json** thêm dòng:
```"DANGEROUS_ENABLE_DEVTOOLS_ONLY_ENABLE_IF_YOU_KNOW_WHAT_YOURE_DOING": true```

Bước 4: Chạy Script
- Vào tab **Console ** trong DevTools → Copy nội dung file `discord_quest_completer.js` → dán vào **Console → Enter**
- Đợi quest đó chạy nền (treo discord tự động hoàn thành) → nhận thưởng  🎉

📌 Lưu ý
Lưu ý: Đây là cách “lách”, không chính thức từ Discord. Hãy chắc chắn script lấy từ nguồn tin cậy.

[discord_quest_completer.js](https://github.com/dohuios/Discord-Quests-Tools/blob/main/discord_quest_completer.js)


