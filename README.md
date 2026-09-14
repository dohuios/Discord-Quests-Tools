# ⚠️ CẢNH BÁO NẶNG ⚠️
Token Discord = mật khẩu cấp cao nhất – ai có token thì control acc hoàn toàn (đổi pass, bật/tắt 2FA, xóa bạn bè, spam...).
→ KHÔNG BAO GIỜ share token, paste vào tool lạ, bot tự chế, webhook... → mất acc vĩnh viễn ngay lập tức!
Chỉ dùng cho acc của bạn, test cá nhân. Tốt nhất: tạo bot token chính thức tại https://discord.com/developers/applications.

## Cách lấy User Token Discord (update 2026 – vẫn hoạt động)
- PC / Web (Chrome/Edge/Firefox)
- Mở https://discord.com/app → đăng nhập
- Nhấn F12 (hoặc Ctrl+Shift+I) → tab Console
- Dán code này rồi Enter:

```cmd
(() => {
  let token;
  window.webpackChunkdiscord_app.push([[Symbol()], {}, req => {
    for (let m of Object.values(req.c)) {
      try {
        if (!m.exports || m.exports === window) continue;
        if (m.exports?.getToken) {
          token = m.exports.getToken();
          break;
        }
        for (let key in m.exports) {
          if (m.exports?.[key]?.getToken && m.exports[key][Symbol.toStringTag] !== 'IntlMessagesProxy') {
            token = m.exports[key].getToken();
            break;
          }
        }
        if (token) break;
      } catch {}
    }
  }]);
  window.webpackChunkdiscord_app.pop();
  return token;
})();

