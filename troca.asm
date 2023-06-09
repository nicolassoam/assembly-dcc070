.data
    # vetor de 5 caracteres
    vet: .word 0:4
    nline: .asciiz "\n"

.text
    # inicializa os valores do vetor
    li $s0, 4
    li $s1, 8
    li $s2, 12
    li $s3, 16
    li $s4, 20

# salva o endereco do vetor
add $t0, $t0, $zero

sw $s0, vet($t0)
    addi $t0, $t0, 4
sw $s1, vet($t0)
    addi $t0, $t0, 4
sw $s2, vet($t0)
    addi $t0, $t0, 4
sw $s3, vet($t0)
    addi $t0, $t0, 4
sw $s4, vet($t0)

la $a0, vet
addi $a1, $a0, 4  # indice 1
addi $a2, $a0, 8  # indice 2
jal troca

li $v0, 10
syscall

troca:
    # salva o endereco de retorno
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    add $t0, $zero, $a1   # t0 tem o indice da primeira posicao
    lw $t1, ($t0)         # t1 tem o valor da primeira posicao
    add $t0, $zero, $a2   # t0 tem o indice da segunda posicao
    lw $t2, ($t0)         # t2 tem o valor da segunda posicao
    beq $t1, $t2, end     # se os valores forem iguais, vai pro fim
    sw $t1, ($t0)         # salva o valor da primeira posicao na segunda
    add $t0, $zero, $a1   # t0 tem o indice da primeira posicao
    sw $t2, ($t0)         # salva o valor da segunda posicao na primeira
    j end

    end:
        # recupera o endereco de retorno
        lw $ra, 0($sp)
        addi $sp, $sp, 4
        jr $ra
