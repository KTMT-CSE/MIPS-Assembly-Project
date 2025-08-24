# Từ C đến MIPS và CPU

## 1. Tổng quan
Chương trình bạn viết bằng ngôn ngữ bậc cao (C, Java, Python, …) **không chạy trực tiếp trên CPU**, mà phải trải qua nhiều bước dịch xuống mức thấp hơn.  

Hình minh họa bên dưới mô tả **quá trình chuyển đổi từ C → Assembly → Machine Code → Hardware**:

![MIPS Pipeline](https://user-images.githubusercontent.com/12626454/55367336-2d11d000-551f-11e9-9e81-78d0d0e01ba6.png)

---

## 2. Các mức trừu tượng

### 🔹 High Level Language (Ngôn ngữ bậc cao)
- Code dễ hiểu cho con người.  
- Ví dụ (C):  
```c
temp = v[k];
v[k] = v[k+1];
v[k+1] = temp;
```

### 🔹 Compiler (Trình biên dịch)
- Dịch từ ngôn ngữ bậc cao sang Assembly.

### 🔹 Assembly Language (Ngôn ngữ hợp ngữ — MIPS)
- Gần với mã máy, dễ đọc hơn nhị phân.
- Ví dụ (MIPS assembly):
```mips
lw   $t0, 0($s2)   # load v[k]
lw   $t1, 4($s2)   # load v[k+1]
sw   $t1, 0($s2)   # v[k] = v[k+1]
sw   $t0, 4($s2)   # v[k+1] = temp
```

## 🔹 Assembler
- Biến Assembly thành Machine Code (nhị phân).
- Ví dụ:
```mips
0000 1001 1100 0110 0010 1010 1111 0101 ...
```

## 🔹 Machine Interpretation
- CPU đọc mã nhị phân và thực hiện lệnh.

## 🔹 Hardware Architecture
- Ở mức khối: CPU gồm
- Register File (tập thanh ghi)
- ALU (Arithmetic Logic Unit)
- Bộ nhớ, bus, …

## 🔹 Logic Circuit
- Mức thấp nhất: các cổng logic (AND, OR, NOT) tạo thành ALU và CPU.

## 3. Các loại Assembly phổ biến hiện nay  

Mỗi kiến trúc CPU có **Assembly Language** riêng (vì tập lệnh khác nhau). 4 loại phổ biến nhất:  

---

### 🔹 x86 / x86-64 (Intel, AMD)  
- Được dùng rộng rãi trên **PC, laptop, server**.  
- Có 2 cú pháp chính: **Intel syntax** và **AT&T syntax**.  
- Ví dụ (Intel syntax): `mov eax, 5` ; `add eax, 3`  

![](https://assets.euromoneydigital.com/dims4/default/d29160e/2147483647/strip/true/crop/840x472+0+0/resize/840x472!/quality/90/?url=http%3A%2F%2Feuromoney-brightspot.s3.amazonaws.com%2Ff2%2F1d%2F77a3b6c34db8b30b896648320b5a%2Fnews-images-2024-10-17t171643-837.png)

---

### 🔹 ARM Assembly  
- Dùng trên **điện thoại, tablet, IoT, Apple M1/M2, Raspberry Pi**.  
- Ưu điểm: **tiết kiệm điện, hiệu năng cao**, rất phổ biến trên di động.  
- Ví dụ: `MOV R0, #5` ; `ADD R0, R0, #3`  

![](https://cellphones.com.vn/sforum/wp-content/uploads/2022/06/apple-arm-4-1.jpg)

---

### 🔹 RISC-V Assembly
- Kiến trúc mở (open source), ngày càng được dùng trong nghiên cứu và chip mới.
- Đơn giản như MIPS nhưng hiện đại hơn.
- RISC-V là ISA mở, giúp Trung Quốc thoát phụ thuộc công nghệ Mỹ. Với lực lượng nhân sự lớn, hệ sinh thái mạnh, và chính sách hỗ trợ toàn diện, Trung Quốc đang vươn lên dẫn đầu RISC-V, khiến phương Tây lo ngại cả về kinh tế lẫn an ninh.
- Ví dụ: `add x5, x6, x7`

![](https://techovedas.com/wp-content/uploads/2025/03/RISC-V-China-US.webp)


---

### 🔹 MIPS Assembly  
- Thường dùng trong **giảng dạy** và một số hệ nhúng cũ (router, console PS1/PS2).  
- Cú pháp gọn gàng, dễ học cho người mới bắt đầu.  
- Ví dụ: `li $t0, 5` ; `addi $t0, $t0, 3`  
