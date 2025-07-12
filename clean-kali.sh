#!/bin/bash

# Define Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

clear
echo -e "${GREEN}🧹 Starting Kali Linux Fancy Cleanup...${NC}"

# Before Cleanup: Show disk space
echo -e "\n${GREEN}📊 Disk space before cleanup:${NC}"
df -h /

# 1. Clean APT cache
echo -e "\n${GREEN}➤ Cleaning APT cache...${NC}"
sudo apt clean
sudo apt autoclean
sudo apt autoremove -y

# 2. Clean Docker junk
echo -e "\n${GREEN}➤ Cleaning Docker unused data...${NC}"
docker system prune -a -f

# 3. Clean System Logs (keep only last 3 days)
echo -e "\n${GREEN}➤ Cleaning old system logs...${NC}"
sudo journalctl --vacuum-time=3d

# 4. Empty Trash
echo -e "\n${GREEN}➤ Emptying Trash...${NC}"
rm -rf ~/.local/share/Trash/*

# 5. Clear Thumbnail Cache
echo -e "\n${GREEN}➤ Clearing thumbnail cache...${NC}"
rm -rf ~/.cache/thumbnails/*

# After Cleanup: Show disk space
echo -e "\n${GREEN}📊 Disk space after cleanup:${NC}"
df -h /

echo -e "\n${GREEN}✅ Fancy Cleanup Completed Successfully!${NC}"
