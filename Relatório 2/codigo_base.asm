.data
# Se��o 1: vari�veis f, g, h, i, j
# armazenadas em mem�ria (inicializa��o)
_f: .word 1    #vari�vel f e valor inicial
_g: .word 2
_h: .word 4
_i: .word 8
_j: .word 16
# Se��o 2: jump address table
jat:
.word L0       #endere�o do label L0
.word L1
.word L2
.word L3
.word L4
.word default   #endere�o do label default

.text
.globl main
main:
# Se��o 3: registradores recebem valores
# inicializados (exceto vari�vel k)
lw $s0, _f
lw $s1, _g
lw $s2, _h
lw $s3, _i
lw $s4, _j
# lw $s5, _k
# carrega em $t4 o endere�o-base de jat
la $t4, jat

# Se��o 4: testa se k est� no intervalo
# [0,4], caso contr�rio desvia p/ default
sltiu $t0,$s5,5
beq $t0,$zero,default

# Se��o 5: calcula o endere�o de jat[k]
sll $t1,$s5,2
add $t1,$t1,$t4
lw $t1,0($t1)

# Se��o 6: desvia para o endere�o que se
# encontra armazenado em jat[k]
jr $t1

# Se��o 7: codifica as alternativas de
# execu��o
# f = $s0
# g = $s1
# h = $s2
# i = $s3
# j = $s4
# j = $s5

L0:
# definida no relatorio
add $t0,$s2,$s3
sll $s0,$t0,1
j Exit
# express�o definida no relatorio;

L1:
sub $s0,$s1,$s2 # f = g - h
j Exit

L2:
add $t0,$s1,$s2 # t0 = g + h
add $s0,$t0,$s4 # f = (g + h) + j
j Exit

L3:
or  $t0,$s3,$s2 # t0 = i | h
or  $s0,$t0,$s4 # f = t0 | j
j Exit

L4:
and $s0,$s2,$s5 # f = h & k
j Exit

default:
sub  $t0,$s3,$s5 # t0 = i - k
addi $s0,$t0, 5  # f = t0 + 5

Exit: nop