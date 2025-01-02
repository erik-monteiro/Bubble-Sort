 .text           
.globl  main         
main: 
	xor $t0, $t0, $t0 # zera o 'i'
	la $t2, n # numero de elementos da série
	lw $t2, 0($t2)   
    	addi $t3, $t2, -1 # n - 1 
	la $t4, v # endereço pra guardar a série
ni:
	xor $t1, $t1, $t1 # zera o 'j'
nj:
	sll $t5, $t1, 2
	add $t5, $t4, $t5 # end. de v[j]
	lw $t6, 0($t5) # le v[j]
	lw $t7, 4($t5) # le v[j+1]
	blt $t6, $t7, l1 # se v[j] < v[j + 1] go to l1
	sw $t7, 0($t5) # swap   
	sw $t6, 4($t5)         
l1:
	addi $t1, $t1, 1 # inxrementa o 'j'
	sub $s0, $t3, -1 # n - 1 - i e guarda em $s0
	blt $t1, $s0, nj # se j < n - 1 - i go to nj
	addi $t0, $t0, 1 # incrementa o 'i'
	blt $t0, $t3, ni # se i < n - 1 go to ni
end:    j   end
.data
	n: .word 10
	v: .word 0x323 0x223 0x123 0x90 0x90 0x45 0x43 0x34 0xAAA -1