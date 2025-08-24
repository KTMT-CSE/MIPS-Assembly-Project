# MIPS Assembly

## 1. Giới thiệu
**MIPS (Microprocessor without Interlocked Pipeline Stages)** là một kiến trúc RISC (Reduced Instruction Set Computer) được phát triển từ thập niên 1980.  
MIPS nổi tiếng nhờ **thiết kế đơn giản, gọn gàng**, thường được dùng trong:
- Giảng dạy kiến trúc máy tính (nhiều giáo trình Computer Architecture sử dụng MIPS).  
- Các hệ thống nhúng cũ: router, console game (PS1, PS2, PSP, Nintendo 64).  
- Một số thiết bị điện tử tiêu dùng trước khi ARM thống trị.  

---

## 2. Đặc điểm của MIPS Assembly
- **RISC architecture**: tập lệnh đơn giản, cố định độ dài (32 bit).  
- **Load/Store architecture**: chỉ có lệnh ```lw``` (load) và ```sw``` (store) để truy cập bộ nhớ, còn lại thao tác trên thanh ghi.  
- **32 thanh ghi đa dụng**: ```$t0 - $t9```, ```$s0 - $s7```, ```$a0 - $a3```, ```$v0 - $v1```, …  
- **Dễ học**: cú pháp rõ ràng, gần với C.  

![MIPS Pipeline](https://www.c-jump.com/bcc/c262c/MIPSAssembly/const_images/mips_assembly.png)

---

## 3. Ví dụ cơ bản

### C code
```c
temp = v[k];
v[k] = v[k+1];
v[k+1] = temp;
```

### MIPS Assembly
```asm
lw   $t0, 0($s2)    # load v[k]
lw   $t1, 4($s2)    # load v[k+1]
sw   $t1, 0($s2)    # v[k] = v[k+1]
sw   $t0, 4($s2)    # v[k+1] = temp
```

---