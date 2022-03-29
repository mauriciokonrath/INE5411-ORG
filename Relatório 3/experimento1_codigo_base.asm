.data
# completar com Est�mulo 2.1 ou Est�mulo 2.2
#_save: .word 6,6,6,2,7,6,5	# Est�mulo 1.1
#_save: .word 6,6,6,6,6,6,6	# Est�mulo 1.2

#_save: .word 6,6,1,6,6,2,7,6	# Est�mulo 1.1
_save: .word 6,6,6,6,6,6,6,6	# Est�mulo 1.2

_k: .word 6             
.text
.globl main
main: # inicializa��o
la $s6, _save # puxar o valor de _save pro registrador $t6
lw $s5, _k # puxa o valor de k pro registrador $t5
addi $s3, $zero, 0 # adiciona o valor 0 ao registrador $s3
      
Loop: # corpo do la�o
sll $t1, $s3, 2 # multiplica por 4 o valor de $s3 e guarda em $t1   
add $t1, $t1, $s6 # adiciona $s6 (a base de save) ao valor atual de $t1
lw $t0, 0($t1) # carrega no registrador $t0 o valor de mem�ria de $t1, ou save[i]
bne $t0, $s5, Exit # verifica se k = save[i]. caso seja diferen�a envia ao Exit   
addi $s3, $s3, 1 # adiciona 1 ao contador $s3      
j Loop
                
Exit: # rotina para imprimir inteiro no console
addi $v0, $zero, 1
add $a0, $zero, $s3
syscall
