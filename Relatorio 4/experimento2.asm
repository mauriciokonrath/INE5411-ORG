.data
# Arranjo inicializado com elementos N n�o nulos. 
_array: .word 3:7	   # N elementos com o valor 3               [substitua N pelo valor definido no relat�rio]
_size: .word 7  	   # tamanho do arranjo                      [substitua N pelo valor definido no relat�rio]

.text
.globl main

main:
    la		$a0, _array		# carrega o endereco de array em $a0      [completar com 1 pseudo-instru��o]
    lw 		$a1, _size      	# carrega size em $a1                     [completar com 1 instru��o nativa]
    jal 	clear2
    li  	$v0,10
    syscall
    
clear2:     
   add	 	$t0, $a0, $zero         # $t0 <- $a0                              [completar com 1 instru��o nativa]
   sll 		$t1, $a1, 2             # $t1 <- size*4                           [completar com 1 instru��o nativa]
   add 		$t2,$a0,$t1     	# $t2 <- &array[size]                    
loop2:
   slt 		$t3, $t0, $t2           # $t3 = (p < &array[size])                [completar com 1 instru��o nativa]
   beq 		$t3, $zero, Exit        # se (p >= &array[size]) desvia para Exit [completar com 1 instru��o nativa]
   sw 		$zero,0($t0)     	# mem[p] = 0                              
   addi 	$t0,$t0,4    		# p = p + ?                               [completar operando faltante]
   j 		loop2
   
Exit:
   jr 		$ra