# ใช้ image เบื้องต้นเป็น nginx แบบ lightweight
FROM nginx:alpine

# ตั้ง working directory ภายใน container
WORKDIR /usr/share/nginx/html

# ลบไฟล์ default ของ nginx ออก
RUN rm -rf ./*

# คัดลอกไฟล์โปรเจกต์เข้าไป
# สมมติว่าไฟล์โปรเจกต์อยู่ในโฟลเดอร์เดียวกับ Dockerfile
COPY . .

# (ถ้ามี) ตั้งค่า permissions ให้เหมาะสม
RUN chown -R nginx:nginx /usr/share/nginx/html

# เปิดพอร์ต 80
EXPOSE 80

# คำสั่งเริ่มต้นเมื่อ container รัน
CMD ["nginx", "-g", "daemon off;"]
