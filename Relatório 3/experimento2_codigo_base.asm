.data
# completar com Est�mulo 2.1 ou Est�mulo 2.2
#_save: 9999,8,6,6,6,6,5,6,3,0
#save: 9999,8,6,6,6,6,6,6,6,6  

#_save: 9999,7,6,1,6,4,5,6,0
_save: 9999,7,6,6,6,6,6,6,6               
_k: .word 6 
_error: .asciiz "Index Out of Bounds Exception"	    
.text
.globl main
main: # inicializa��o
	la $s6, _save                                # completar com 1 pseudoinstru��o
	lw $s5, _k                               # completar com 1 pseudoinstru��o
	addi $s3, $zero, 0                                # completar com 1 instru��o nativa
	lw $t2, 4($s6)
                                 # completar com 1 instru��o nativa
Loop: 
# verifica��o de limite do arranjo
 sltu $t0, $s3, $t2 # i < size     # teste de �ndice: completar com 1 instru��o nativa
 beq $t0, $zero, IndexOutOfBounds  # desvio para mensagem de erro: completar com 1 instru��o nativa
# corpo do la�o
sll $t1, $s3, 2    
add $t1, $t1, $s6 
lw $t0, 8($t1)                       # voc� ter� que modificar esta instru��o!
bne $t0, $s5, Exit    
addi $s3, $s3, 1      
j Loop

Exit: # rotina para imprimir inteiro no console
addi $v0, $zero, 1
add $a0, $zero, $s3
syscall
j End

IndexOutOfBounds: # rotina para imprimir mensagem de erro no console
addi $v0, $zero, 4
la $a0, _error
syscall
End:   
