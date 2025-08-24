    .data
prompt_a: .asciiz "Nhap a: "
prompt_b: .asciiz "Nhap b: "
result:   .asciiz "Ket qua a + b = "

    .text
    .globl main

main:
    # In prompt a
    li $v0, 4
    la $a0, prompt_a
    syscall

    # Nhập a
    li $v0, 5
    syscall
    move $t0, $v0       # t0 = a

    # In prompt b
    li $v0, 4
    la $a0, prompt_b
    syscall

    # Nhập b
    li $v0, 5
    syscall
    move $t1, $v0       # t1 = b

    # Gọi hàm add_func(t0, t1)
    move $a0, $t0
    move $a1, $t1
    jal add_func
    move $t2, $v0       # t2 = return value

    # In result string
    li $v0, 4
    la $a0, result
    syscall

    # In kết quả
    li $v0, 1
    move $a0, $t2
    syscall

    # Xuống dòng
    li $v0, 11
    li $a0, 10
    syscall

    # Thoát
    li $v0, 10
    syscall



# int add_func(int a, int b)
add_func:
    add $v0, $a0, $a1   # v0 = a0 + a1
    jr $ra              # return v0
