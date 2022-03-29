.data
# Seção 1: variáveis f, g, h, i, j  armazenadas em memória (inicialização)
_f: .word 1
_g: .word 2
_h: .word 4
_i: .word 8
_j: .word 16

# Seção 2: jump address table
jat: 
.word L0 
.word L1 
.word L2 
.word L3
.word L4
.word default

.text
.globl main
main:
# Seção 3: registradores recebem valores inicializados 
lw $s0, _f
lw $s1, _g
lw $s2, _h
lw $s3, _i
lw $s4, _j

la $t4, jat # carrega em $t4 o endereco-base de jat

# Seção 4: testa se k no intervalo [0,4]
sltiu $t0, $s5, 5
beq $t0, $zero, default 
                                                                                
# Seção 5: calcula o endereço de jat[k]
sll $t1, $s5, 2
add $t1, $t1, $t4
                               
# Seção 6: desvia para o endereço em jat[k]
lw $t1, 0($t1)
jr $t1

# Seção 7: codifica as alternativas de execução
L0:    #expressão vai aqui  f=(h+i)<<1
add $s0, $s3, $s4
j Exit
 
L1:    
sub $s0, $s1, $s2 # f = g - h
j Exit

L2:    
add $t0, $s1, $s2 #f = g + h 
add $s0, $t0, $s4 #f = f + j
j Exit

L3:  
or $t0, $s3, $s2
or $s0, $t0, $s4
j Exit

L4: 
and $s0, $s2, $s5
j Exit

default:
sub $t0, $s3, $s5 #f = i - k + 5
addi $s0, $t0, 5
Exit:   nop