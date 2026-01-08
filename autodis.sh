#!/usr/bin/env bash
set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

TARGET="$HOME/Library/Application Support/discord/settings.json"
KEY="DANGEROUS_ENABLE_DEVTOOLS_ONLY_ENABLE_IF_YOU_KNOW_WHAT_YOURE_DOING"

banner() {
echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════╗"
echo "║                                                  ║"
echo "║            Discord DevTools Enabler Tool         ║"
echo "║              Bật/Tắt DevTools Discord            ║"
echo "║                                                  ║"
echo -e "║            Tool by ${MAGENTA}CTDOTEAM${CYAN}                      ║"
echo "║                                                  ║"
echo "║      Features / Chức năng                        ║"
echo "║   1. Bật DevTools Discord                        ║"
echo "║   2. Tắt DevTools Discord                        ║"
echo "╚══════════════════════════════════════════════════╝"
echo -e "${NC}"
}

check_devtools_status() {
status=$(python3 - <<PY
import json, os
target = os.path.expanduser("$TARGET")
try:
    with open(target,"r",encoding="utf-8") as f:
        data=json.load(f)
    print("true" if data.get("$KEY",False) else "false")
except:
    print("false")
PY
)
echo "$status"
}

restart_discord() {
if pgrep -x "Discord" >/dev/null 2>&1; then
  echo -e "${YELLOW}Đang tắt Discord / Quitting Discord...${NC}"
  pkill -x "Discord"
  sleep 2
fi
echo -e "${YELLOW}Đang mở lại Discord / Starting Discord...${NC}"
open -a Discord
sleep 5
}

enable_devtools() {
echo -e "${YELLOW}Bật DevTools / Enabling DevTools...${NC}"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
BACKUP="${TARGET}.bak.${TIMESTAMP}"
cp -a "$TARGET" "$BACKUP" 2>/dev/null || true
python3 - <<PY
import json, os
target = os.path.expanduser("$TARGET")
key = "$KEY"
with open(target,"r",encoding="utf-8") as f:
    try: data=json.load(f)
    except: data={}
data[key]=True
tmp=target+".tmp"
with open(tmp,"w",encoding="utf-8") as f:
    json.dump(data,f,indent=2,ensure_ascii=False)
    f.write("\n")
os.replace(tmp,target)
PY
[ -n "${SUDO_USER:-}" ] && chown "$SUDO_USER" "$TARGET"
restart_discord
echo -e "${GREEN}✅ DevTools đã bật! / DevTools enabled!${NC}"
echo -e "${MAGENTA}👉 Mở DevTools: nhấn Command + Option + I / Press Command + Option + I${NC}"
}

disable_devtools() {
echo -e "${YELLOW}Tắt DevTools / Disabling DevTools...${NC}"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
BACKUP="${TARGET}.bak.${TIMESTAMP}"
cp -a "$TARGET" "$BACKUP" 2>/dev/null || true
python3 - <<PY
import json, os
target = os.path.expanduser("$TARGET")
key = "$KEY"
with open(target,"r",encoding="utf-8") as f:
    try: data=json.load(f)
    except: data={}
data[key]=False
tmp=target+".tmp"
with open(tmp,"w",encoding="utf-8") as f:
    json.dump(data,f,indent=2,ensure_ascii=False)
    f.write("\n")
os.replace(tmp,target)
PY
[ -n "${SUDO_USER:-}" ] && chown "$SUDO_USER" "$TARGET"
restart_discord
echo -e "${GREEN}✅ DevTools đã tắt / DevTools disabled!${NC}"
}

banner

if [ "$(id -u)" -ne 0 ]; then
  echo -e "${YELLOW}Running with sudo / Chạy với quyền sudo...${NC}"
  exec sudo bash "$0" "$@"
fi

USER_HOME=$(eval echo "~$SUDO_USER")
[ -n "$SUDO_USER" ] && TARGET="$USER_HOME/Library/Application Support/discord/settings.json"

status=$(check_devtools_status)

echo -e "${CYAN}Bạn muốn làm gì? / What do you want to do?${NC}"
echo -e "${BLUE}1. Bật DevTools / Enable DevTools${NC}"
echo -e "${BLUE}2. Tắt DevTools / Disable DevTools${NC}"
echo -e "${BLUE}3. Thoát / Exit${NC}"
read -rp "Chọn / Choose (1/2/3): " choice

case "$choice" in
1)
  if [ "$status" == "true" ]; then
    echo -e "${GREEN}DevTools đã bật sẵn / Already enabled.${NC}"
    echo -e "${MAGENTA}👉 Mở DevTools: nhấn Command + Option + I / Press Command + Option + I${NC}"
  else
    enable_devtools
  fi
  ;;
2)
  disable_devtools
  ;;
3)
  echo -e "${GREEN}Thoát / Exit${NC}"
  ;;
*)
  echo -e "${RED}Lựa chọn không hợp lệ / Invalid choice${NC}"
  ;;
esac
