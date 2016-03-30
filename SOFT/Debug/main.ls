   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32.1 - 30 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     	bsct
  16  0000               _t0_cnt0:
  17  0000 00            	dc.b	0
  18  0001               _t0_cnt1:
  19  0001 00            	dc.b	0
  20  0002               _t0_cnt2:
  21  0002 00            	dc.b	0
  22  0003               _t0_cnt3:
  23  0003 00            	dc.b	0
  24  0004               _t0_cnt4:
  25  0004 00            	dc.b	0
  26                     	switch	.data
  27  0000               _tx_buffer1:
  28  0000 00            	dc.b	0
  29  0001 000000000000  	ds.b	49
  30  0032               _rx_buffer:
  31  0032 00            	dc.b	0
  32  0033 000000000000  	ds.b	299
  33                     	bsct
  34  0005               _tx_stat:
  35  0005 00            	dc.b	0
  36  0006               _tx_wd_cnt:
  37  0006 64            	dc.b	100
  38  0007               _bTX_FREE:
  39  0007 01            	dc.b	1
  40  0008               _bCAN_RX:
  41  0008 00            	dc.b	0
  42  0009               _led_ind:
  43  0009 05            	dc.b	5
  44  000a               _adr_drv_stat:
  45  000a 00            	dc.b	0
  46  000b               _rs485_cnt:
  47  000b 00            	dc.b	0
 106                     ; 117 void gran_char(signed char *adr, signed char min, signed char max)
 106                     ; 118 {
 108                     	switch	.text
 109  0000               _gran_char:
 111  0000 89            	pushw	x
 112       00000000      OFST:	set	0
 115                     ; 119 if (*adr<min) *adr=min;
 117  0001 9c            	rvf
 118  0002 f6            	ld	a,(x)
 119  0003 1105          	cp	a,(OFST+5,sp)
 120  0005 2e05          	jrsge	L73
 123  0007 7b05          	ld	a,(OFST+5,sp)
 124  0009 1e01          	ldw	x,(OFST+1,sp)
 125  000b f7            	ld	(x),a
 126  000c               L73:
 127                     ; 120 if (*adr>max)  *adr=max; 
 129  000c 9c            	rvf
 130  000d 1e01          	ldw	x,(OFST+1,sp)
 131  000f f6            	ld	a,(x)
 132  0010 1106          	cp	a,(OFST+6,sp)
 133  0012 2d05          	jrsle	L14
 136  0014 7b06          	ld	a,(OFST+6,sp)
 137  0016 1e01          	ldw	x,(OFST+1,sp)
 138  0018 f7            	ld	(x),a
 139  0019               L14:
 140                     ; 121 }
 143  0019 85            	popw	x
 144  001a 81            	ret
 197                     ; 124 void gran(signed short *adr, signed short min, signed short max)
 197                     ; 125 {
 198                     	switch	.text
 199  001b               _gran:
 201  001b 89            	pushw	x
 202       00000000      OFST:	set	0
 205                     ; 126 if (*adr<min) *adr=min;
 207  001c 9c            	rvf
 208  001d 9093          	ldw	y,x
 209  001f 51            	exgw	x,y
 210  0020 fe            	ldw	x,(x)
 211  0021 1305          	cpw	x,(OFST+5,sp)
 212  0023 51            	exgw	x,y
 213  0024 2e03          	jrsge	L17
 216  0026 1605          	ldw	y,(OFST+5,sp)
 217  0028 ff            	ldw	(x),y
 218  0029               L17:
 219                     ; 127 if (*adr>max)  *adr=max; 
 221  0029 9c            	rvf
 222  002a 1e01          	ldw	x,(OFST+1,sp)
 223  002c 9093          	ldw	y,x
 224  002e 51            	exgw	x,y
 225  002f fe            	ldw	x,(x)
 226  0030 1307          	cpw	x,(OFST+7,sp)
 227  0032 51            	exgw	x,y
 228  0033 2d05          	jrsle	L37
 231  0035 1e01          	ldw	x,(OFST+1,sp)
 232  0037 1607          	ldw	y,(OFST+7,sp)
 233  0039 ff            	ldw	(x),y
 234  003a               L37:
 235                     ; 128 }
 238  003a 85            	popw	x
 239  003b 81            	ret
 262                     ; 134 void uart1_init (void)
 262                     ; 135 {
 263                     	switch	.text
 264  003c               _uart1_init:
 268                     ; 137 GPIOA->DDR&=~(1<<4);
 270  003c 72195002      	bres	20482,#4
 271                     ; 138 GPIOA->CR1|=(1<<4);
 273  0040 72185003      	bset	20483,#4
 274                     ; 139 GPIOA->CR2&=~(1<<4);
 276  0044 72195004      	bres	20484,#4
 277                     ; 142 GPIOA->DDR|=(1<<5);
 279  0048 721a5002      	bset	20482,#5
 280                     ; 143 GPIOA->CR1|=(1<<5);
 282  004c 721a5003      	bset	20483,#5
 283                     ; 144 GPIOA->CR2&=~(1<<5);	
 285  0050 721b5004      	bres	20484,#5
 286                     ; 147 GPIOB->DDR|=(1<<6);
 288  0054 721c5007      	bset	20487,#6
 289                     ; 148 GPIOB->CR1|=(1<<6);
 291  0058 721c5008      	bset	20488,#6
 292                     ; 149 GPIOB->CR2&=~(1<<6);
 294  005c 721d5009      	bres	20489,#6
 295                     ; 150 GPIOB->ODR|=(1<<6);		//—разу в 1
 297  0060 721c5005      	bset	20485,#6
 298                     ; 153 GPIOB->DDR|=(1<<7);
 300  0064 721e5007      	bset	20487,#7
 301                     ; 154 GPIOB->CR1|=(1<<7);
 303  0068 721e5008      	bset	20488,#7
 304                     ; 155 GPIOB->CR2&=~(1<<7);
 306  006c 721f5009      	bres	20489,#7
 307                     ; 157 UART1->CR1&=~UART1_CR1_M;					
 309  0070 72195234      	bres	21044,#4
 310                     ; 158 UART1->CR3|= (0<<4) & UART1_CR3_STOP;  	
 312  0074 c65236        	ld	a,21046
 313                     ; 159 UART1->BRR2= 0x09;
 315  0077 35095233      	mov	21043,#9
 316                     ; 160 UART1->BRR1= 0x20;
 318  007b 35205232      	mov	21042,#32
 319                     ; 161 UART1->CR2|= UART1_CR2_TEN | UART1_CR2_REN | UART1_CR2_RIEN/*| UART2_CR2_TIEN*/ ;	
 321  007f c65235        	ld	a,21045
 322  0082 aa2c          	or	a,#44
 323  0084 c75235        	ld	21045,a
 324                     ; 162 }
 327  0087 81            	ret
 364                     ; 165 void putchar1(char c)
 364                     ; 166 {
 365                     	switch	.text
 366  0088               _putchar1:
 368  0088 88            	push	a
 369       00000000      OFST:	set	0
 372  0089               L521:
 373                     ; 167 while (tx_counter1 == TX_BUFFER_SIZE1);
 375  0089 b631          	ld	a,_tx_counter1
 376  008b a132          	cp	a,#50
 377  008d 27fa          	jreq	L521
 378                     ; 169 if (tx_counter1 || ((UART1->SR & UART1_SR_TXE)==0))
 380  008f 3d31          	tnz	_tx_counter1
 381  0091 2607          	jrne	L331
 383  0093 c65230        	ld	a,21040
 384  0096 a580          	bcp	a,#128
 385  0098 2622          	jrne	L131
 386  009a               L331:
 387                     ; 171    tx_buffer1[tx_wr_index1]=c;
 389  009a 5f            	clrw	x
 390  009b b630          	ld	a,_tx_wr_index1
 391  009d 2a01          	jrpl	L41
 392  009f 53            	cplw	x
 393  00a0               L41:
 394  00a0 97            	ld	xl,a
 395  00a1 7b01          	ld	a,(OFST+1,sp)
 396  00a3 d70000        	ld	(_tx_buffer1,x),a
 397                     ; 172    if (++tx_wr_index1 == TX_BUFFER_SIZE1) tx_wr_index1=0;
 399  00a6 3c30          	inc	_tx_wr_index1
 400  00a8 b630          	ld	a,_tx_wr_index1
 401  00aa a132          	cp	a,#50
 402  00ac 2602          	jrne	L531
 405  00ae 3f30          	clr	_tx_wr_index1
 406  00b0               L531:
 407                     ; 173    ++tx_counter1;
 409  00b0 3c31          	inc	_tx_counter1
 411  00b2               L731:
 412                     ; 177 UART1->CR2|= UART1_CR2_TIEN | UART1_CR2_TCIEN;
 414  00b2 c65235        	ld	a,21045
 415  00b5 aac0          	or	a,#192
 416  00b7 c75235        	ld	21045,a
 417                     ; 178 }
 420  00ba 84            	pop	a
 421  00bb 81            	ret
 422  00bc               L131:
 423                     ; 175 else UART1->DR=c;
 425  00bc 7b01          	ld	a,(OFST+1,sp)
 426  00be c75231        	ld	21041,a
 427  00c1 20ef          	jra	L731
 501                     ; 182 void uart1_out_adr(char *ptr, char len)
 501                     ; 183 {
 502                     	switch	.text
 503  00c3               _uart1_out_adr:
 505  00c3 89            	pushw	x
 506  00c4 5220          	subw	sp,#32
 507       00000020      OFST:	set	32
 510                     ; 185 @near char i,t=0;
 512  00c6 0f01          	clr	(OFST-31,sp)
 513                     ; 189 GPIOB->ODR|=(1<<7);
 515  00c8 721e5005      	bset	20485,#7
 516                     ; 192 for(i=0;i<len;i++)
 518  00cc 0f20          	clr	(OFST+0,sp)
 520  00ce 201d          	jra	L302
 521  00d0               L771:
 522                     ; 194 	UOB1[i]=ptr[i];
 524  00d0 96            	ldw	x,sp
 525  00d1 1c0002        	addw	x,#OFST-30
 526  00d4 9f            	ld	a,xl
 527  00d5 5e            	swapw	x
 528  00d6 1b20          	add	a,(OFST+0,sp)
 529  00d8 2401          	jrnc	L02
 530  00da 5c            	incw	x
 531  00db               L02:
 532  00db 02            	rlwa	x,a
 533  00dc 89            	pushw	x
 534  00dd 7b23          	ld	a,(OFST+3,sp)
 535  00df 97            	ld	xl,a
 536  00e0 7b24          	ld	a,(OFST+4,sp)
 537  00e2 1b22          	add	a,(OFST+2,sp)
 538  00e4 2401          	jrnc	L22
 539  00e6 5c            	incw	x
 540  00e7               L22:
 541  00e7 02            	rlwa	x,a
 542  00e8 f6            	ld	a,(x)
 543  00e9 85            	popw	x
 544  00ea f7            	ld	(x),a
 545                     ; 192 for(i=0;i<len;i++)
 547  00eb 0c20          	inc	(OFST+0,sp)
 548  00ed               L302:
 551  00ed 7b20          	ld	a,(OFST+0,sp)
 552  00ef 1125          	cp	a,(OFST+5,sp)
 553  00f1 25dd          	jrult	L771
 554                     ; 200 tx_stat=tsON;
 556  00f3 35010005      	mov	_tx_stat,#1
 557                     ; 202 for (i=0;i<len;i++)
 559  00f7 0f20          	clr	(OFST+0,sp)
 561  00f9 2012          	jra	L312
 562  00fb               L702:
 563                     ; 204 	putchar1(UOB1[i]);
 565  00fb 96            	ldw	x,sp
 566  00fc 1c0002        	addw	x,#OFST-30
 567  00ff 9f            	ld	a,xl
 568  0100 5e            	swapw	x
 569  0101 1b20          	add	a,(OFST+0,sp)
 570  0103 2401          	jrnc	L42
 571  0105 5c            	incw	x
 572  0106               L42:
 573  0106 02            	rlwa	x,a
 574  0107 f6            	ld	a,(x)
 575  0108 cd0088        	call	_putchar1
 577                     ; 202 for (i=0;i<len;i++)
 579  010b 0c20          	inc	(OFST+0,sp)
 580  010d               L312:
 583  010d 7b20          	ld	a,(OFST+0,sp)
 584  010f 1125          	cp	a,(OFST+5,sp)
 585  0111 25e8          	jrult	L702
 586                     ; 208 }
 589  0113 5b22          	addw	sp,#34
 590  0115 81            	ret
 625                     ; 215 char ascii2halFhex(char in)
 625                     ; 216 {
 626                     	switch	.text
 627  0116               _ascii2halFhex:
 629  0116 88            	push	a
 630       00000000      OFST:	set	0
 633                     ; 217 if(isalnum(in))
 635  0117 cd0000        	call	_isalnum
 637  011a 4d            	tnz	a
 638  011b 2739          	jreq	L532
 639                     ; 219 	if(isdigit(in))
 641  011d 7b01          	ld	a,(OFST+1,sp)
 642  011f a130          	cp	a,#48
 643  0121 250d          	jrult	L732
 645  0123 7b01          	ld	a,(OFST+1,sp)
 646  0125 a13a          	cp	a,#58
 647  0127 2407          	jruge	L732
 648                     ; 221 		return in-'0';
 650  0129 7b01          	ld	a,(OFST+1,sp)
 651  012b a030          	sub	a,#48
 654  012d 5b01          	addw	sp,#1
 655  012f 81            	ret
 656  0130               L732:
 657                     ; 223 	if(islower(in))
 659  0130 7b01          	ld	a,(OFST+1,sp)
 660  0132 a161          	cp	a,#97
 661  0134 250d          	jrult	L142
 663  0136 7b01          	ld	a,(OFST+1,sp)
 664  0138 a17b          	cp	a,#123
 665  013a 2407          	jruge	L142
 666                     ; 225 		return in-'a'+10;
 668  013c 7b01          	ld	a,(OFST+1,sp)
 669  013e a057          	sub	a,#87
 672  0140 5b01          	addw	sp,#1
 673  0142 81            	ret
 674  0143               L142:
 675                     ; 227 	if(isupper(in))
 677  0143 7b01          	ld	a,(OFST+1,sp)
 678  0145 a141          	cp	a,#65
 679  0147 250d          	jrult	L532
 681  0149 7b01          	ld	a,(OFST+1,sp)
 682  014b a15b          	cp	a,#91
 683  014d 2407          	jruge	L532
 684                     ; 229 		return in-'A'+10;
 686  014f 7b01          	ld	a,(OFST+1,sp)
 687  0151 a037          	sub	a,#55
 690  0153 5b01          	addw	sp,#1
 691  0155 81            	ret
 692  0156               L532:
 693                     ; 232 }
 696  0156 5b01          	addw	sp,#1
 697  0158 81            	ret
 761                     ; 236 void ascii2hex(char *ptr_dst, char *ptr_src, short len)
 761                     ; 237 {
 762                     	switch	.text
 763  0159               _ascii2hex:
 765  0159 89            	pushw	x
 766  015a 5203          	subw	sp,#3
 767       00000003      OFST:	set	3
 770                     ; 240 for(i=0;i<len/2;i++)
 772  015c 5f            	clrw	x
 773  015d 1f02          	ldw	(OFST-1,sp),x
 775  015f 2029          	jra	L303
 776  0161               L772:
 777                     ; 242 	ptr_dst[i]=((ascii2halFhex(ptr_src[i*2]))<<4)+((ascii2halFhex(ptr_src[(i*2)+1])));
 779  0161 1e02          	ldw	x,(OFST-1,sp)
 780  0163 58            	sllw	x
 781  0164 72fb08        	addw	x,(OFST+5,sp)
 782  0167 e601          	ld	a,(1,x)
 783  0169 adab          	call	_ascii2halFhex
 785  016b 6b01          	ld	(OFST-2,sp),a
 786  016d 1e02          	ldw	x,(OFST-1,sp)
 787  016f 58            	sllw	x
 788  0170 72fb08        	addw	x,(OFST+5,sp)
 789  0173 f6            	ld	a,(x)
 790  0174 ada0          	call	_ascii2halFhex
 792  0176 97            	ld	xl,a
 793  0177 a610          	ld	a,#16
 794  0179 42            	mul	x,a
 795  017a 9f            	ld	a,xl
 796  017b 1b01          	add	a,(OFST-2,sp)
 797  017d 1e02          	ldw	x,(OFST-1,sp)
 798  017f 72fb04        	addw	x,(OFST+1,sp)
 799  0182 f7            	ld	(x),a
 800                     ; 240 for(i=0;i<len/2;i++)
 802  0183 1e02          	ldw	x,(OFST-1,sp)
 803  0185 1c0001        	addw	x,#1
 804  0188 1f02          	ldw	(OFST-1,sp),x
 805  018a               L303:
 808  018a 9c            	rvf
 809  018b 1e0a          	ldw	x,(OFST+7,sp)
 810  018d a602          	ld	a,#2
 811  018f cd0000        	call	c_sdivx
 813  0192 1302          	cpw	x,(OFST-1,sp)
 814  0194 2ccb          	jrsgt	L772
 815                     ; 246 }
 818  0196 5b05          	addw	sp,#5
 819  0198 81            	ret
 822                     .const:	section	.text
 823  0000               L703_temp:
 824  0000 00            	dc.b	0
 825  0001 00            	dc.b	0
 826  0002 00            	dc.b	0
 827  0003 00            	dc.b	0
 828  0004 00            	dc.b	0
 829  0005 00            	dc.b	0
 830  0006 00            	dc.b	0
 831  0007 00            	dc.b	0
 832  0008 00            	dc.b	0
 833  0009 00            	ds.b	1
 914                     ; 250 int str2int(char *ptr, char len)
 914                     ; 251 {
 915                     	switch	.text
 916  0199               _str2int:
 918  0199 89            	pushw	x
 919  019a 5210          	subw	sp,#16
 920       00000010      OFST:	set	16
 923                     ; 255 @near char temp[10]={0,0,0,0,0,0,0,0,0};
 925  019c 96            	ldw	x,sp
 926  019d 1c0005        	addw	x,#OFST-11
 927  01a0 90ae0000      	ldw	y,#L703_temp
 928  01a4 a60a          	ld	a,#10
 929  01a6 cd0000        	call	c_xymvx
 931                     ; 256 @near int temp_out=0;
 933  01a9 5f            	clrw	x
 934  01aa 1f03          	ldw	(OFST-13,sp),x
 935                     ; 260 for (i=0;i<len;i++)
 937  01ac 0f10          	clr	(OFST+0,sp)
 939  01ae ac3f023f      	jpf	L753
 940  01b2               L353:
 941                     ; 262 	tt=*(ptr+i);
 943  01b2 7b11          	ld	a,(OFST+1,sp)
 944  01b4 97            	ld	xl,a
 945  01b5 7b12          	ld	a,(OFST+2,sp)
 946  01b7 1b10          	add	a,(OFST+0,sp)
 947  01b9 2401          	jrnc	L43
 948  01bb 5c            	incw	x
 949  01bc               L43:
 950  01bc 02            	rlwa	x,a
 951  01bd f6            	ld	a,(x)
 952  01be 6b0f          	ld	(OFST-1,sp),a
 953                     ; 264 	if(isalnum(tt/**(ptr+i)*/))
 955  01c0 7b0f          	ld	a,(OFST-1,sp)
 956  01c2 cd0000        	call	_isalnum
 958  01c5 4d            	tnz	a
 959  01c6 2775          	jreq	L363
 960                     ; 266 		if(isdigit(tt/**(ptr+i)*/))
 962  01c8 7b0f          	ld	a,(OFST-1,sp)
 963  01ca a130          	cp	a,#48
 964  01cc 2517          	jrult	L563
 966  01ce 7b0f          	ld	a,(OFST-1,sp)
 967  01d0 a13a          	cp	a,#58
 968  01d2 2411          	jruge	L563
 969                     ; 268 		temp[i]=tt/**(ptr+i)*/-'0';
 971  01d4 96            	ldw	x,sp
 972  01d5 1c0005        	addw	x,#OFST-11
 973  01d8 9f            	ld	a,xl
 974  01d9 5e            	swapw	x
 975  01da 1b10          	add	a,(OFST+0,sp)
 976  01dc 2401          	jrnc	L63
 977  01de 5c            	incw	x
 978  01df               L63:
 979  01df 02            	rlwa	x,a
 980  01e0 7b0f          	ld	a,(OFST-1,sp)
 981  01e2 a030          	sub	a,#48
 982  01e4 f7            	ld	(x),a
 983  01e5               L563:
 984                     ; 270 		if(islower(tt/**(ptr+i)*/))
 986  01e5 7b0f          	ld	a,(OFST-1,sp)
 987  01e7 a161          	cp	a,#97
 988  01e9 2517          	jrult	L763
 990  01eb 7b0f          	ld	a,(OFST-1,sp)
 991  01ed a17b          	cp	a,#123
 992  01ef 2411          	jruge	L763
 993                     ; 272 		temp[i]=tt/**(ptr+i)*/-'a'+10;
 995  01f1 96            	ldw	x,sp
 996  01f2 1c0005        	addw	x,#OFST-11
 997  01f5 9f            	ld	a,xl
 998  01f6 5e            	swapw	x
 999  01f7 1b10          	add	a,(OFST+0,sp)
1000  01f9 2401          	jrnc	L04
1001  01fb 5c            	incw	x
1002  01fc               L04:
1003  01fc 02            	rlwa	x,a
1004  01fd 7b0f          	ld	a,(OFST-1,sp)
1005  01ff a057          	sub	a,#87
1006  0201 f7            	ld	(x),a
1007  0202               L763:
1008                     ; 274 		if(isupper(tt/**(ptr+i)*/))
1010  0202 7b0f          	ld	a,(OFST-1,sp)
1011  0204 a141          	cp	a,#65
1012  0206 2535          	jrult	L363
1014  0208 7b0f          	ld	a,(OFST-1,sp)
1015  020a a15b          	cp	a,#91
1016  020c 242f          	jruge	L363
1017                     ; 276 		temp[i]=tt;
1019  020e 96            	ldw	x,sp
1020  020f 1c0005        	addw	x,#OFST-11
1021  0212 9f            	ld	a,xl
1022  0213 5e            	swapw	x
1023  0214 1b10          	add	a,(OFST+0,sp)
1024  0216 2401          	jrnc	L24
1025  0218 5c            	incw	x
1026  0219               L24:
1027  0219 02            	rlwa	x,a
1028  021a 7b0f          	ld	a,(OFST-1,sp)
1029  021c f7            	ld	(x),a
1030                     ; 277 		temp[i]-=/**(ptr+i)*/'A';
1032  021d 96            	ldw	x,sp
1033  021e 1c0005        	addw	x,#OFST-11
1034  0221 9f            	ld	a,xl
1035  0222 5e            	swapw	x
1036  0223 1b10          	add	a,(OFST+0,sp)
1037  0225 2401          	jrnc	L44
1038  0227 5c            	incw	x
1039  0228               L44:
1040  0228 02            	rlwa	x,a
1041  0229 f6            	ld	a,(x)
1042  022a a041          	sub	a,#65
1043  022c f7            	ld	(x),a
1044                     ; 278 		temp[i]+=10;
1046  022d 96            	ldw	x,sp
1047  022e 1c0005        	addw	x,#OFST-11
1048  0231 9f            	ld	a,xl
1049  0232 5e            	swapw	x
1050  0233 1b10          	add	a,(OFST+0,sp)
1051  0235 2401          	jrnc	L64
1052  0237 5c            	incw	x
1053  0238               L64:
1054  0238 02            	rlwa	x,a
1055  0239 f6            	ld	a,(x)
1056  023a ab0a          	add	a,#10
1057  023c f7            	ld	(x),a
1058  023d               L363:
1059                     ; 260 for (i=0;i<len;i++)
1061  023d 0c10          	inc	(OFST+0,sp)
1062  023f               L753:
1065  023f 7b10          	ld	a,(OFST+0,sp)
1066  0241 1115          	cp	a,(OFST+5,sp)
1067  0243 2403          	jruge	L25
1068  0245 cc01b2        	jp	L353
1069  0248               L25:
1070                     ; 284 for(i=len;i;i--)
1072  0248 7b15          	ld	a,(OFST+5,sp)
1073  024a 6b10          	ld	(OFST+0,sp),a
1075  024c 2045          	jra	L773
1076  024e               L373:
1077                     ; 286 	temp_out+= ((int)pow(16,len-i))*temp[i-1]; 
1079  024e 7b15          	ld	a,(OFST+5,sp)
1080  0250 5f            	clrw	x
1081  0251 1010          	sub	a,(OFST+0,sp)
1082  0253 2401          	jrnc	L05
1083  0255 5a            	decw	x
1084  0256               L05:
1085  0256 02            	rlwa	x,a
1086  0257 cd0000        	call	c_itof
1088  025a be02          	ldw	x,c_lreg+2
1089  025c 89            	pushw	x
1090  025d be00          	ldw	x,c_lreg
1091  025f 89            	pushw	x
1092  0260 ce000c        	ldw	x,L704+2
1093  0263 89            	pushw	x
1094  0264 ce000a        	ldw	x,L704
1095  0267 89            	pushw	x
1096  0268 cd0000        	call	_pow
1098  026b 5b08          	addw	sp,#8
1099  026d cd0000        	call	c_ftoi
1101  0270 9096          	ldw	y,sp
1102  0272 72a90005      	addw	y,#OFST-11
1103  0276 1701          	ldw	(OFST-15,sp),y
1104  0278 7b10          	ld	a,(OFST+0,sp)
1105  027a 905f          	clrw	y
1106  027c 9097          	ld	yl,a
1107  027e 905a          	decw	y
1108  0280 72f901        	addw	y,(OFST-15,sp)
1109  0283 90f6          	ld	a,(y)
1110  0285 905f          	clrw	y
1111  0287 9097          	ld	yl,a
1112  0289 cd0000        	call	c_imul
1114  028c 72fb03        	addw	x,(OFST-13,sp)
1115  028f 1f03          	ldw	(OFST-13,sp),x
1116                     ; 284 for(i=len;i;i--)
1118  0291 0a10          	dec	(OFST+0,sp)
1119  0293               L773:
1122  0293 0d10          	tnz	(OFST+0,sp)
1123  0295 26b7          	jrne	L373
1124                     ; 291 return temp_out;
1126  0297 1e03          	ldw	x,(OFST-13,sp)
1129  0299 5b12          	addw	sp,#18
1130  029b 81            	ret
1158                     ; 295 void rx485_in_an(void)
1158                     ; 296 {
1159                     	switch	.text
1160  029c               _rx485_in_an:
1164                     ; 297 if(bRX485==1)
1166  029c b601          	ld	a,_bRX485
1167  029e a101          	cp	a,#1
1168  02a0 2674          	jrne	L324
1169                     ; 299 	ascii2hex(&bat_mod_dump[0][0],&rx_buffer[13],40);
1171  02a2 ae0028        	ldw	x,#40
1172  02a5 89            	pushw	x
1173  02a6 ae003f        	ldw	x,#_rx_buffer+13
1174  02a9 89            	pushw	x
1175  02aa ae0000        	ldw	x,#_bat_mod_dump
1176  02ad cd0159        	call	_ascii2hex
1178  02b0 5b04          	addw	sp,#4
1179                     ; 300 	ascii2hex(&bat_mod_dump[1][0],&rx_buffer[13+40],40);
1181  02b2 ae0028        	ldw	x,#40
1182  02b5 89            	pushw	x
1183  02b6 ae0067        	ldw	x,#_rx_buffer+53
1184  02b9 89            	pushw	x
1185  02ba ae0028        	ldw	x,#_bat_mod_dump+40
1186  02bd cd0159        	call	_ascii2hex
1188  02c0 5b04          	addw	sp,#4
1189                     ; 301 	ascii2hex(&bat_mod_dump[2][0],&rx_buffer[13+80],40);
1191  02c2 ae0028        	ldw	x,#40
1192  02c5 89            	pushw	x
1193  02c6 ae008f        	ldw	x,#_rx_buffer+93
1194  02c9 89            	pushw	x
1195  02ca ae0050        	ldw	x,#_bat_mod_dump+80
1196  02cd cd0159        	call	_ascii2hex
1198  02d0 5b04          	addw	sp,#4
1199                     ; 302 	ascii2hex(&bat_mod_dump[3][0],&rx_buffer[13+120],40);
1201  02d2 ae0028        	ldw	x,#40
1202  02d5 89            	pushw	x
1203  02d6 ae00b7        	ldw	x,#_rx_buffer+133
1204  02d9 89            	pushw	x
1205  02da ae0078        	ldw	x,#_bat_mod_dump+120
1206  02dd cd0159        	call	_ascii2hex
1208  02e0 5b04          	addw	sp,#4
1209                     ; 303 	ascii2hex(&bat_mod_dump[4][0],&rx_buffer[13+160],40);
1211  02e2 ae0028        	ldw	x,#40
1212  02e5 89            	pushw	x
1213  02e6 ae00df        	ldw	x,#_rx_buffer+173
1214  02e9 89            	pushw	x
1215  02ea ae00a0        	ldw	x,#_bat_mod_dump+160
1216  02ed cd0159        	call	_ascii2hex
1218  02f0 5b04          	addw	sp,#4
1219                     ; 304 	ascii2hex(&bat_mod_dump[5][0],&rx_buffer[13+200],40);
1221  02f2 ae0028        	ldw	x,#40
1222  02f5 89            	pushw	x
1223  02f6 ae0107        	ldw	x,#_rx_buffer+213
1224  02f9 89            	pushw	x
1225  02fa ae00c8        	ldw	x,#_bat_mod_dump+200
1226  02fd cd0159        	call	_ascii2hex
1228  0300 5b04          	addw	sp,#4
1229                     ; 305 	ascii2hex(&bat_mod_dump[6][0],&rx_buffer[13+240],40);
1231  0302 ae0028        	ldw	x,#40
1232  0305 89            	pushw	x
1233  0306 ae012f        	ldw	x,#_rx_buffer+253
1234  0309 89            	pushw	x
1235  030a ae00f0        	ldw	x,#_bat_mod_dump+240
1236  030d cd0159        	call	_ascii2hex
1238  0310 5b04          	addw	sp,#4
1239                     ; 309 	rs485_cnt=0;
1241  0312 3f0b          	clr	_rs485_cnt
1243  0314 2078          	jra	L524
1244  0316               L324:
1245                     ; 313 else if(bRX485==2)
1247  0316 b601          	ld	a,_bRX485
1248  0318 a102          	cp	a,#2
1249  031a 2672          	jrne	L524
1250                     ; 315 	ascii2hex(&bat_mod_dump[0][20],&rx_buffer[21],34);
1252  031c ae0022        	ldw	x,#34
1253  031f 89            	pushw	x
1254  0320 ae0047        	ldw	x,#_rx_buffer+21
1255  0323 89            	pushw	x
1256  0324 ae0014        	ldw	x,#_bat_mod_dump+20
1257  0327 cd0159        	call	_ascii2hex
1259  032a 5b04          	addw	sp,#4
1260                     ; 316 	ascii2hex(&bat_mod_dump[1][20],&rx_buffer[21+34],34);
1262  032c ae0022        	ldw	x,#34
1263  032f 89            	pushw	x
1264  0330 ae0069        	ldw	x,#_rx_buffer+55
1265  0333 89            	pushw	x
1266  0334 ae003c        	ldw	x,#_bat_mod_dump+60
1267  0337 cd0159        	call	_ascii2hex
1269  033a 5b04          	addw	sp,#4
1270                     ; 317 	ascii2hex(&bat_mod_dump[2][20],&rx_buffer[21+68],34);
1272  033c ae0022        	ldw	x,#34
1273  033f 89            	pushw	x
1274  0340 ae008b        	ldw	x,#_rx_buffer+89
1275  0343 89            	pushw	x
1276  0344 ae0064        	ldw	x,#_bat_mod_dump+100
1277  0347 cd0159        	call	_ascii2hex
1279  034a 5b04          	addw	sp,#4
1280                     ; 318 	ascii2hex(&bat_mod_dump[3][20],&rx_buffer[21+102],34);
1282  034c ae0022        	ldw	x,#34
1283  034f 89            	pushw	x
1284  0350 ae00ad        	ldw	x,#_rx_buffer+123
1285  0353 89            	pushw	x
1286  0354 ae008c        	ldw	x,#_bat_mod_dump+140
1287  0357 cd0159        	call	_ascii2hex
1289  035a 5b04          	addw	sp,#4
1290                     ; 319 	ascii2hex(&bat_mod_dump[4][20],&rx_buffer[21+136],34);
1292  035c ae0022        	ldw	x,#34
1293  035f 89            	pushw	x
1294  0360 ae00cf        	ldw	x,#_rx_buffer+157
1295  0363 89            	pushw	x
1296  0364 ae00b4        	ldw	x,#_bat_mod_dump+180
1297  0367 cd0159        	call	_ascii2hex
1299  036a 5b04          	addw	sp,#4
1300                     ; 320 	ascii2hex(&bat_mod_dump[5][20],&rx_buffer[21+170],34);
1302  036c ae0022        	ldw	x,#34
1303  036f 89            	pushw	x
1304  0370 ae00f1        	ldw	x,#_rx_buffer+191
1305  0373 89            	pushw	x
1306  0374 ae00dc        	ldw	x,#_bat_mod_dump+220
1307  0377 cd0159        	call	_ascii2hex
1309  037a 5b04          	addw	sp,#4
1310                     ; 321 	ascii2hex(&bat_mod_dump[6][20],&rx_buffer[21+204],34);
1312  037c ae0022        	ldw	x,#34
1313  037f 89            	pushw	x
1314  0380 ae0113        	ldw	x,#_rx_buffer+225
1315  0383 89            	pushw	x
1316  0384 ae0104        	ldw	x,#_bat_mod_dump+260
1317  0387 cd0159        	call	_ascii2hex
1319  038a 5b04          	addw	sp,#4
1320                     ; 326 	rs485_cnt=0;	
1322  038c 3f0b          	clr	_rs485_cnt
1323  038e               L524:
1324                     ; 328 bRX485=0;	
1326  038e 3f01          	clr	_bRX485
1327                     ; 329 }
1330  0390 81            	ret
1353                     ; 332 void init_CAN(void) {
1354                     	switch	.text
1355  0391               _init_CAN:
1359                     ; 333 	CAN->MCR&=~CAN_MCR_SLEEP;					// CAN wake up request
1361  0391 72135420      	bres	21536,#1
1362                     ; 334 	CAN->MCR|= CAN_MCR_INRQ;					// CAN initialization request
1364  0395 72105420      	bset	21536,#0
1366  0399               L344:
1367                     ; 335 	while((CAN->MSR & CAN_MSR_INAK) == 0);	// waiting for CAN enter the init mode
1369  0399 c65421        	ld	a,21537
1370  039c a501          	bcp	a,#1
1371  039e 27f9          	jreq	L344
1372                     ; 337 	CAN->MCR|= CAN_MCR_NART;					// no automatic retransmition
1374  03a0 72185420      	bset	21536,#4
1375                     ; 339 	CAN->PSR= 2;							// *** FILTER 0 SETTINGS ***
1377  03a4 35025427      	mov	21543,#2
1378                     ; 348 	CAN->Page.Filter01.F0R1= MY_MESS_STID>>3;			// 16 bits mode
1380  03a8 35135428      	mov	21544,#19
1381                     ; 349 	CAN->Page.Filter01.F0R2= MY_MESS_STID<<5;
1383  03ac 35c05429      	mov	21545,#192
1384                     ; 350 	CAN->Page.Filter01.F0R5= MY_MESS_STID_MASK>>3;
1386  03b0 357f542c      	mov	21548,#127
1387                     ; 351 	CAN->Page.Filter01.F0R6= MY_MESS_STID_MASK<<5;
1389  03b4 35e0542d      	mov	21549,#224
1390                     ; 354 	CAN->PSR= 6;									// set page 6
1392  03b8 35065427      	mov	21543,#6
1393                     ; 359 	CAN->Page.Config.FMR1&=~3;								//mask mode
1395  03bc c65430        	ld	a,21552
1396  03bf a4fc          	and	a,#252
1397  03c1 c75430        	ld	21552,a
1398                     ; 365 	CAN->Page.Config.FCR1= ((3<<1) & (CAN_FCR1_FSC00 | CAN_FCR1_FSC01));		//16 bit scale
1400  03c4 35065432      	mov	21554,#6
1401                     ; 368 	CAN->Page.Config.FCR1|= CAN_FCR1_FACT0;	// filter 0 active
1403  03c8 72105432      	bset	21554,#0
1404                     ; 371 	CAN->PSR= 6;								// *** BIT TIMING SETTINGS ***
1406  03cc 35065427      	mov	21543,#6
1407                     ; 373 	CAN->Page.Config.BTR1= 9;					// CAN_BTR1_BRP=9, 	tq= fcpu/(9+1)
1409  03d0 3509542c      	mov	21548,#9
1410                     ; 374 	CAN->Page.Config.BTR2= (1<<7)|(6<<4) | 7; 		// BS2=8, BS1=7, 		
1412  03d4 35e7542d      	mov	21549,#231
1413                     ; 376 	CAN->IER|=(1<<1);
1415  03d8 72125425      	bset	21541,#1
1416                     ; 379 	CAN->MCR&=~CAN_MCR_INRQ;					// leave initialization request
1418  03dc 72115420      	bres	21536,#0
1420  03e0               L154:
1421                     ; 380 	while((CAN->MSR & CAN_MSR_INAK) != 0);	// waiting for CAN leave the init mode
1423  03e0 c65421        	ld	a,21537
1424  03e3 a501          	bcp	a,#1
1425  03e5 26f9          	jrne	L154
1426                     ; 381 }
1429  03e7 81            	ret
1537                     ; 384 void can_transmit(unsigned short id_st,char data0,char data1,char data2,char data3,char data4,char data5,char data6,char data7)
1537                     ; 385 {
1538                     	switch	.text
1539  03e8               _can_transmit:
1541  03e8 89            	pushw	x
1542       00000000      OFST:	set	0
1545                     ; 387 if((can_buff_wr_ptr<0)||(can_buff_wr_ptr>9))can_buff_wr_ptr=0;
1547  03e9 b627          	ld	a,_can_buff_wr_ptr
1548  03eb a10a          	cp	a,#10
1549  03ed 2502          	jrult	L335
1552  03ef 3f27          	clr	_can_buff_wr_ptr
1553  03f1               L335:
1554                     ; 389 can_out_buff[can_buff_wr_ptr][0]=(char)(id_st>>6);
1556  03f1 b627          	ld	a,_can_buff_wr_ptr
1557  03f3 97            	ld	xl,a
1558  03f4 a610          	ld	a,#16
1559  03f6 42            	mul	x,a
1560  03f7 1601          	ldw	y,(OFST+1,sp)
1561  03f9 a606          	ld	a,#6
1562  03fb               L26:
1563  03fb 9054          	srlw	y
1564  03fd 4a            	dec	a
1565  03fe 26fb          	jrne	L26
1566  0400 909f          	ld	a,yl
1567  0402 d70271        	ld	(_can_out_buff,x),a
1568                     ; 390 can_out_buff[can_buff_wr_ptr][1]=(char)(id_st<<2);
1570  0405 b627          	ld	a,_can_buff_wr_ptr
1571  0407 97            	ld	xl,a
1572  0408 a610          	ld	a,#16
1573  040a 42            	mul	x,a
1574  040b 7b02          	ld	a,(OFST+2,sp)
1575  040d 48            	sll	a
1576  040e 48            	sll	a
1577  040f d70272        	ld	(_can_out_buff+1,x),a
1578                     ; 392 can_out_buff[can_buff_wr_ptr][2]=data0;
1580  0412 b627          	ld	a,_can_buff_wr_ptr
1581  0414 97            	ld	xl,a
1582  0415 a610          	ld	a,#16
1583  0417 42            	mul	x,a
1584  0418 7b05          	ld	a,(OFST+5,sp)
1585  041a d70273        	ld	(_can_out_buff+2,x),a
1586                     ; 393 can_out_buff[can_buff_wr_ptr][3]=data1;
1588  041d b627          	ld	a,_can_buff_wr_ptr
1589  041f 97            	ld	xl,a
1590  0420 a610          	ld	a,#16
1591  0422 42            	mul	x,a
1592  0423 7b06          	ld	a,(OFST+6,sp)
1593  0425 d70274        	ld	(_can_out_buff+3,x),a
1594                     ; 394 can_out_buff[can_buff_wr_ptr][4]=data2;
1596  0428 b627          	ld	a,_can_buff_wr_ptr
1597  042a 97            	ld	xl,a
1598  042b a610          	ld	a,#16
1599  042d 42            	mul	x,a
1600  042e 7b07          	ld	a,(OFST+7,sp)
1601  0430 d70275        	ld	(_can_out_buff+4,x),a
1602                     ; 395 can_out_buff[can_buff_wr_ptr][5]=data3;
1604  0433 b627          	ld	a,_can_buff_wr_ptr
1605  0435 97            	ld	xl,a
1606  0436 a610          	ld	a,#16
1607  0438 42            	mul	x,a
1608  0439 7b08          	ld	a,(OFST+8,sp)
1609  043b d70276        	ld	(_can_out_buff+5,x),a
1610                     ; 396 can_out_buff[can_buff_wr_ptr][6]=data4;
1612  043e b627          	ld	a,_can_buff_wr_ptr
1613  0440 97            	ld	xl,a
1614  0441 a610          	ld	a,#16
1615  0443 42            	mul	x,a
1616  0444 7b09          	ld	a,(OFST+9,sp)
1617  0446 d70277        	ld	(_can_out_buff+6,x),a
1618                     ; 397 can_out_buff[can_buff_wr_ptr][7]=data5;
1620  0449 b627          	ld	a,_can_buff_wr_ptr
1621  044b 97            	ld	xl,a
1622  044c a610          	ld	a,#16
1623  044e 42            	mul	x,a
1624  044f 7b0a          	ld	a,(OFST+10,sp)
1625  0451 d70278        	ld	(_can_out_buff+7,x),a
1626                     ; 398 can_out_buff[can_buff_wr_ptr][8]=data6;
1628  0454 b627          	ld	a,_can_buff_wr_ptr
1629  0456 97            	ld	xl,a
1630  0457 a610          	ld	a,#16
1631  0459 42            	mul	x,a
1632  045a 7b0b          	ld	a,(OFST+11,sp)
1633  045c d70279        	ld	(_can_out_buff+8,x),a
1634                     ; 399 can_out_buff[can_buff_wr_ptr][9]=data7;
1636  045f b627          	ld	a,_can_buff_wr_ptr
1637  0461 97            	ld	xl,a
1638  0462 a610          	ld	a,#16
1639  0464 42            	mul	x,a
1640  0465 7b0c          	ld	a,(OFST+12,sp)
1641  0467 d7027a        	ld	(_can_out_buff+9,x),a
1642                     ; 401 can_buff_wr_ptr++;
1644  046a 3c27          	inc	_can_buff_wr_ptr
1645                     ; 402 if(can_buff_wr_ptr>9)can_buff_wr_ptr=0;
1647  046c b627          	ld	a,_can_buff_wr_ptr
1648  046e a10a          	cp	a,#10
1649  0470 2502          	jrult	L535
1652  0472 3f27          	clr	_can_buff_wr_ptr
1653  0474               L535:
1654                     ; 403 } 
1657  0474 85            	popw	x
1658  0475 81            	ret
1687                     ; 406 void can_tx_hndl(void)
1687                     ; 407 {
1688                     	switch	.text
1689  0476               _can_tx_hndl:
1693                     ; 408 if(bTX_FREE)
1695  0476 3d07          	tnz	_bTX_FREE
1696  0478 2754          	jreq	L745
1697                     ; 410 	if(can_buff_rd_ptr!=can_buff_wr_ptr)
1699  047a b626          	ld	a,_can_buff_rd_ptr
1700  047c b127          	cp	a,_can_buff_wr_ptr
1701  047e 275c          	jreq	L555
1702                     ; 412 		bTX_FREE=0;
1704  0480 3f07          	clr	_bTX_FREE
1705                     ; 414 		CAN->PSR= 0;
1707  0482 725f5427      	clr	21543
1708                     ; 415 		CAN->Page.TxMailbox.MDLCR=8;
1710  0486 35085429      	mov	21545,#8
1711                     ; 416 		CAN->Page.TxMailbox.MIDR1=can_out_buff[can_buff_rd_ptr][0];
1713  048a b626          	ld	a,_can_buff_rd_ptr
1714  048c 97            	ld	xl,a
1715  048d a610          	ld	a,#16
1716  048f 42            	mul	x,a
1717  0490 d60271        	ld	a,(_can_out_buff,x)
1718  0493 c7542a        	ld	21546,a
1719                     ; 417 		CAN->Page.TxMailbox.MIDR2=can_out_buff[can_buff_rd_ptr][1];
1721  0496 b626          	ld	a,_can_buff_rd_ptr
1722  0498 97            	ld	xl,a
1723  0499 a610          	ld	a,#16
1724  049b 42            	mul	x,a
1725  049c d60272        	ld	a,(_can_out_buff+1,x)
1726  049f c7542b        	ld	21547,a
1727                     ; 419 		memcpy(&CAN->Page.TxMailbox.MDAR1, &can_out_buff[can_buff_rd_ptr][2],8);
1729  04a2 b626          	ld	a,_can_buff_rd_ptr
1730  04a4 97            	ld	xl,a
1731  04a5 a610          	ld	a,#16
1732  04a7 42            	mul	x,a
1733  04a8 1c0273        	addw	x,#_can_out_buff+2
1734  04ab bf00          	ldw	c_x,x
1735  04ad ae0008        	ldw	x,#8
1736  04b0               L66:
1737  04b0 5a            	decw	x
1738  04b1 92d600        	ld	a,([c_x.w],x)
1739  04b4 d7542e        	ld	(21550,x),a
1740  04b7 5d            	tnzw	x
1741  04b8 26f6          	jrne	L66
1742                     ; 421 		can_buff_rd_ptr++;
1744  04ba 3c26          	inc	_can_buff_rd_ptr
1745                     ; 422 		if(can_buff_rd_ptr>9)can_buff_rd_ptr=0;
1747  04bc b626          	ld	a,_can_buff_rd_ptr
1748  04be a10a          	cp	a,#10
1749  04c0 2502          	jrult	L355
1752  04c2 3f26          	clr	_can_buff_rd_ptr
1753  04c4               L355:
1754                     ; 424 		CAN->Page.TxMailbox.MCSR|= CAN_MCSR_TXRQ;
1756  04c4 72105428      	bset	21544,#0
1757                     ; 425 		CAN->IER|=(1<<0);
1759  04c8 72105425      	bset	21541,#0
1760  04cc 200e          	jra	L555
1761  04ce               L745:
1762                     ; 430 	tx_busy_cnt++;
1764  04ce 3c25          	inc	_tx_busy_cnt
1765                     ; 431 	if(tx_busy_cnt>=100)
1767  04d0 b625          	ld	a,_tx_busy_cnt
1768  04d2 a164          	cp	a,#100
1769  04d4 2506          	jrult	L555
1770                     ; 433 		tx_busy_cnt=0;
1772  04d6 3f25          	clr	_tx_busy_cnt
1773                     ; 434 		bTX_FREE=1;
1775  04d8 35010007      	mov	_bTX_FREE,#1
1776  04dc               L555:
1777                     ; 437 }
1780  04dc 81            	ret
1816                     ; 441 void can_in_an(void)
1816                     ; 442 {
1817                     	switch	.text
1818  04dd               _can_in_an:
1820  04dd 88            	push	a
1821       00000001      OFST:	set	1
1824                     ; 456 if((mess[6]==19)&&(mess[7]==19)&&(mess[8]==GETTM))	
1826  04de b64c          	ld	a,_mess+6
1827  04e0 a113          	cp	a,#19
1828  04e2 2703          	jreq	L27
1829  04e4 cc0776        	jp	L165
1830  04e7               L27:
1832  04e7 b64d          	ld	a,_mess+7
1833  04e9 a113          	cp	a,#19
1834  04eb 2703          	jreq	L47
1835  04ed cc0776        	jp	L165
1836  04f0               L47:
1838  04f0 b64e          	ld	a,_mess+8
1839  04f2 a1ed          	cp	a,#237
1840  04f4 2703          	jreq	L67
1841  04f6 cc0776        	jp	L165
1842  04f9               L67:
1843                     ; 458 	GPIOD->DDR|=(1<<7);
1845  04f9 721e5011      	bset	20497,#7
1846                     ; 459 	GPIOD->CR1|=(1<<7);
1848  04fd 721e5012      	bset	20498,#7
1849                     ; 460 	GPIOD->CR2&=~(1<<7);	
1851  0501 721f5013      	bres	20499,#7
1852                     ; 461 	GPIOD->ODR^=(1<<7);
1854  0505 c6500f        	ld	a,20495
1855  0508 a880          	xor	a,	#128
1856  050a c7500f        	ld	20495,a
1857                     ; 462 	can_error_cnt=0;
1859  050d 3f24          	clr	_can_error_cnt
1860                     ; 470 	bat_mod_dump[0][37]=((ascii2halFhex(rx_buffer[13]))<<4)+((ascii2halFhex(rx_buffer[14])));
1862  050f c60040        	ld	a,_rx_buffer+14
1863  0512 cd0116        	call	_ascii2halFhex
1865  0515 6b01          	ld	(OFST+0,sp),a
1866  0517 c6003f        	ld	a,_rx_buffer+13
1867  051a cd0116        	call	_ascii2halFhex
1869  051d 97            	ld	xl,a
1870  051e a610          	ld	a,#16
1871  0520 42            	mul	x,a
1872  0521 9f            	ld	a,xl
1873  0522 1b01          	add	a,(OFST+0,sp)
1874  0524 c70025        	ld	_bat_mod_dump+37,a
1875                     ; 471 	bat_mod_dump[0][38]=((ascii2halFhex(rx_buffer[15]))<<4)+((ascii2halFhex(rx_buffer[16])));
1877  0527 c60042        	ld	a,_rx_buffer+16
1878  052a cd0116        	call	_ascii2halFhex
1880  052d 6b01          	ld	(OFST+0,sp),a
1881  052f c60041        	ld	a,_rx_buffer+15
1882  0532 cd0116        	call	_ascii2halFhex
1884  0535 97            	ld	xl,a
1885  0536 a610          	ld	a,#16
1886  0538 42            	mul	x,a
1887  0539 9f            	ld	a,xl
1888  053a 1b01          	add	a,(OFST+0,sp)
1889  053c c70026        	ld	_bat_mod_dump+38,a
1890                     ; 472 	bat_mod_dump[0][39]=((ascii2halFhex(rx_buffer[17]))<<4)+((ascii2halFhex(rx_buffer[18])));
1892  053f c60044        	ld	a,_rx_buffer+18
1893  0542 cd0116        	call	_ascii2halFhex
1895  0545 6b01          	ld	(OFST+0,sp),a
1896  0547 c60043        	ld	a,_rx_buffer+17
1897  054a cd0116        	call	_ascii2halFhex
1899  054d 97            	ld	xl,a
1900  054e a610          	ld	a,#16
1901  0550 42            	mul	x,a
1902  0551 9f            	ld	a,xl
1903  0552 1b01          	add	a,(OFST+0,sp)
1904  0554 c70027        	ld	_bat_mod_dump+39,a
1905                     ; 473 	bat_mod_dump[0][40]=((ascii2halFhex(rx_buffer[19]))<<4)+((ascii2halFhex(rx_buffer[20])));
1907  0557 c60046        	ld	a,_rx_buffer+20
1908  055a cd0116        	call	_ascii2halFhex
1910  055d 6b01          	ld	(OFST+0,sp),a
1911  055f c60045        	ld	a,_rx_buffer+19
1912  0562 cd0116        	call	_ascii2halFhex
1914  0565 97            	ld	xl,a
1915  0566 a610          	ld	a,#16
1916  0568 42            	mul	x,a
1917  0569 9f            	ld	a,xl
1918  056a 1b01          	add	a,(OFST+0,sp)
1919  056c c70028        	ld	_bat_mod_dump+40,a
1920                     ; 474 	bat_mod_dump[0][41]=rs485_cnt;
1922  056f 55000b0029    	mov	_bat_mod_dump+41,_rs485_cnt
1923                     ; 485 	can_transmit(0x18e,bat_mod_dump[transmit_cnt_number][0],PUT_LB_TM1+transmit_cnt_number,
1923                     ; 486 	bat_mod_dump[transmit_cnt_number][1],
1923                     ; 487 	bat_mod_dump[transmit_cnt_number][2],bat_mod_dump[transmit_cnt_number][3],
1923                     ; 488 	bat_mod_dump[transmit_cnt_number][4],bat_mod_dump[transmit_cnt_number][5],
1923                     ; 489 	bat_mod_dump[transmit_cnt_number][6]);
1925  0574 b600          	ld	a,_transmit_cnt_number
1926  0576 97            	ld	xl,a
1927  0577 a628          	ld	a,#40
1928  0579 42            	mul	x,a
1929  057a d60006        	ld	a,(_bat_mod_dump+6,x)
1930  057d 88            	push	a
1931  057e b600          	ld	a,_transmit_cnt_number
1932  0580 97            	ld	xl,a
1933  0581 a628          	ld	a,#40
1934  0583 42            	mul	x,a
1935  0584 d60005        	ld	a,(_bat_mod_dump+5,x)
1936  0587 88            	push	a
1937  0588 b600          	ld	a,_transmit_cnt_number
1938  058a 97            	ld	xl,a
1939  058b a628          	ld	a,#40
1940  058d 42            	mul	x,a
1941  058e d60004        	ld	a,(_bat_mod_dump+4,x)
1942  0591 88            	push	a
1943  0592 b600          	ld	a,_transmit_cnt_number
1944  0594 97            	ld	xl,a
1945  0595 a628          	ld	a,#40
1946  0597 42            	mul	x,a
1947  0598 d60003        	ld	a,(_bat_mod_dump+3,x)
1948  059b 88            	push	a
1949  059c b600          	ld	a,_transmit_cnt_number
1950  059e 97            	ld	xl,a
1951  059f a628          	ld	a,#40
1952  05a1 42            	mul	x,a
1953  05a2 d60002        	ld	a,(_bat_mod_dump+2,x)
1954  05a5 88            	push	a
1955  05a6 b600          	ld	a,_transmit_cnt_number
1956  05a8 97            	ld	xl,a
1957  05a9 a628          	ld	a,#40
1958  05ab 42            	mul	x,a
1959  05ac d60001        	ld	a,(_bat_mod_dump+1,x)
1960  05af 88            	push	a
1961  05b0 b600          	ld	a,_transmit_cnt_number
1962  05b2 ab18          	add	a,#24
1963  05b4 88            	push	a
1964  05b5 b600          	ld	a,_transmit_cnt_number
1965  05b7 97            	ld	xl,a
1966  05b8 a628          	ld	a,#40
1967  05ba 42            	mul	x,a
1968  05bb d60000        	ld	a,(_bat_mod_dump,x)
1969  05be 88            	push	a
1970  05bf ae018e        	ldw	x,#398
1971  05c2 cd03e8        	call	_can_transmit
1973  05c5 5b08          	addw	sp,#8
1974                     ; 490 	can_transmit(0x18e,bat_mod_dump[transmit_cnt_number][7],PUT_LB_TM2+transmit_cnt_number,
1974                     ; 491 	bat_mod_dump[transmit_cnt_number][8],
1974                     ; 492 	bat_mod_dump[transmit_cnt_number][9],bat_mod_dump[transmit_cnt_number][10],
1974                     ; 493 	bat_mod_dump[transmit_cnt_number][11],bat_mod_dump[transmit_cnt_number][12],
1974                     ; 494 	bat_mod_dump[transmit_cnt_number][13]);
1976  05c7 b600          	ld	a,_transmit_cnt_number
1977  05c9 97            	ld	xl,a
1978  05ca a628          	ld	a,#40
1979  05cc 42            	mul	x,a
1980  05cd d6000d        	ld	a,(_bat_mod_dump+13,x)
1981  05d0 88            	push	a
1982  05d1 b600          	ld	a,_transmit_cnt_number
1983  05d3 97            	ld	xl,a
1984  05d4 a628          	ld	a,#40
1985  05d6 42            	mul	x,a
1986  05d7 d6000c        	ld	a,(_bat_mod_dump+12,x)
1987  05da 88            	push	a
1988  05db b600          	ld	a,_transmit_cnt_number
1989  05dd 97            	ld	xl,a
1990  05de a628          	ld	a,#40
1991  05e0 42            	mul	x,a
1992  05e1 d6000b        	ld	a,(_bat_mod_dump+11,x)
1993  05e4 88            	push	a
1994  05e5 b600          	ld	a,_transmit_cnt_number
1995  05e7 97            	ld	xl,a
1996  05e8 a628          	ld	a,#40
1997  05ea 42            	mul	x,a
1998  05eb d6000a        	ld	a,(_bat_mod_dump+10,x)
1999  05ee 88            	push	a
2000  05ef b600          	ld	a,_transmit_cnt_number
2001  05f1 97            	ld	xl,a
2002  05f2 a628          	ld	a,#40
2003  05f4 42            	mul	x,a
2004  05f5 d60009        	ld	a,(_bat_mod_dump+9,x)
2005  05f8 88            	push	a
2006  05f9 b600          	ld	a,_transmit_cnt_number
2007  05fb 97            	ld	xl,a
2008  05fc a628          	ld	a,#40
2009  05fe 42            	mul	x,a
2010  05ff d60008        	ld	a,(_bat_mod_dump+8,x)
2011  0602 88            	push	a
2012  0603 b600          	ld	a,_transmit_cnt_number
2013  0605 ab78          	add	a,#120
2014  0607 88            	push	a
2015  0608 b600          	ld	a,_transmit_cnt_number
2016  060a 97            	ld	xl,a
2017  060b a628          	ld	a,#40
2018  060d 42            	mul	x,a
2019  060e d60007        	ld	a,(_bat_mod_dump+7,x)
2020  0611 88            	push	a
2021  0612 ae018e        	ldw	x,#398
2022  0615 cd03e8        	call	_can_transmit
2024  0618 5b08          	addw	sp,#8
2025                     ; 495 	can_transmit(0x18e,bat_mod_dump[transmit_cnt_number][14],PUT_LB_TM3+transmit_cnt_number,
2025                     ; 496 	bat_mod_dump[transmit_cnt_number][15],
2025                     ; 497 	bat_mod_dump[transmit_cnt_number][16],bat_mod_dump[transmit_cnt_number][17],
2025                     ; 498 	bat_mod_dump[transmit_cnt_number][18],bat_mod_dump[transmit_cnt_number][19],
2025                     ; 499 	bat_mod_dump[transmit_cnt_number][20]);
2027  061a b600          	ld	a,_transmit_cnt_number
2028  061c 97            	ld	xl,a
2029  061d a628          	ld	a,#40
2030  061f 42            	mul	x,a
2031  0620 d60014        	ld	a,(_bat_mod_dump+20,x)
2032  0623 88            	push	a
2033  0624 b600          	ld	a,_transmit_cnt_number
2034  0626 97            	ld	xl,a
2035  0627 a628          	ld	a,#40
2036  0629 42            	mul	x,a
2037  062a d60013        	ld	a,(_bat_mod_dump+19,x)
2038  062d 88            	push	a
2039  062e b600          	ld	a,_transmit_cnt_number
2040  0630 97            	ld	xl,a
2041  0631 a628          	ld	a,#40
2042  0633 42            	mul	x,a
2043  0634 d60012        	ld	a,(_bat_mod_dump+18,x)
2044  0637 88            	push	a
2045  0638 b600          	ld	a,_transmit_cnt_number
2046  063a 97            	ld	xl,a
2047  063b a628          	ld	a,#40
2048  063d 42            	mul	x,a
2049  063e d60011        	ld	a,(_bat_mod_dump+17,x)
2050  0641 88            	push	a
2051  0642 b600          	ld	a,_transmit_cnt_number
2052  0644 97            	ld	xl,a
2053  0645 a628          	ld	a,#40
2054  0647 42            	mul	x,a
2055  0648 d60010        	ld	a,(_bat_mod_dump+16,x)
2056  064b 88            	push	a
2057  064c b600          	ld	a,_transmit_cnt_number
2058  064e 97            	ld	xl,a
2059  064f a628          	ld	a,#40
2060  0651 42            	mul	x,a
2061  0652 d6000f        	ld	a,(_bat_mod_dump+15,x)
2062  0655 88            	push	a
2063  0656 b600          	ld	a,_transmit_cnt_number
2064  0658 ab38          	add	a,#56
2065  065a 88            	push	a
2066  065b b600          	ld	a,_transmit_cnt_number
2067  065d 97            	ld	xl,a
2068  065e a628          	ld	a,#40
2069  0660 42            	mul	x,a
2070  0661 d6000e        	ld	a,(_bat_mod_dump+14,x)
2071  0664 88            	push	a
2072  0665 ae018e        	ldw	x,#398
2073  0668 cd03e8        	call	_can_transmit
2075  066b 5b08          	addw	sp,#8
2076                     ; 500 	can_transmit(0x18e,bat_mod_dump[transmit_cnt_number][21],PUT_LB_TM4+transmit_cnt_number,
2076                     ; 501 	bat_mod_dump[transmit_cnt_number][22],
2076                     ; 502 	bat_mod_dump[transmit_cnt_number][23],bat_mod_dump[transmit_cnt_number][24],
2076                     ; 503 	bat_mod_dump[transmit_cnt_number][25],bat_mod_dump[transmit_cnt_number][26],
2076                     ; 504 	bat_mod_dump[transmit_cnt_number][27]);
2078  066d b600          	ld	a,_transmit_cnt_number
2079  066f 97            	ld	xl,a
2080  0670 a628          	ld	a,#40
2081  0672 42            	mul	x,a
2082  0673 d6001b        	ld	a,(_bat_mod_dump+27,x)
2083  0676 88            	push	a
2084  0677 b600          	ld	a,_transmit_cnt_number
2085  0679 97            	ld	xl,a
2086  067a a628          	ld	a,#40
2087  067c 42            	mul	x,a
2088  067d d6001a        	ld	a,(_bat_mod_dump+26,x)
2089  0680 88            	push	a
2090  0681 b600          	ld	a,_transmit_cnt_number
2091  0683 97            	ld	xl,a
2092  0684 a628          	ld	a,#40
2093  0686 42            	mul	x,a
2094  0687 d60019        	ld	a,(_bat_mod_dump+25,x)
2095  068a 88            	push	a
2096  068b b600          	ld	a,_transmit_cnt_number
2097  068d 97            	ld	xl,a
2098  068e a628          	ld	a,#40
2099  0690 42            	mul	x,a
2100  0691 d60018        	ld	a,(_bat_mod_dump+24,x)
2101  0694 88            	push	a
2102  0695 b600          	ld	a,_transmit_cnt_number
2103  0697 97            	ld	xl,a
2104  0698 a628          	ld	a,#40
2105  069a 42            	mul	x,a
2106  069b d60017        	ld	a,(_bat_mod_dump+23,x)
2107  069e 88            	push	a
2108  069f b600          	ld	a,_transmit_cnt_number
2109  06a1 97            	ld	xl,a
2110  06a2 a628          	ld	a,#40
2111  06a4 42            	mul	x,a
2112  06a5 d60016        	ld	a,(_bat_mod_dump+22,x)
2113  06a8 88            	push	a
2114  06a9 b600          	ld	a,_transmit_cnt_number
2115  06ab ab48          	add	a,#72
2116  06ad 88            	push	a
2117  06ae b600          	ld	a,_transmit_cnt_number
2118  06b0 97            	ld	xl,a
2119  06b1 a628          	ld	a,#40
2120  06b3 42            	mul	x,a
2121  06b4 d60015        	ld	a,(_bat_mod_dump+21,x)
2122  06b7 88            	push	a
2123  06b8 ae018e        	ldw	x,#398
2124  06bb cd03e8        	call	_can_transmit
2126  06be 5b08          	addw	sp,#8
2127                     ; 505 	can_transmit(0x18e,bat_mod_dump[transmit_cnt_number][28],PUT_LB_TM5+transmit_cnt_number,
2127                     ; 506 	bat_mod_dump[transmit_cnt_number][29],
2127                     ; 507 	bat_mod_dump[transmit_cnt_number][30],bat_mod_dump[transmit_cnt_number][31],
2127                     ; 508 	bat_mod_dump[transmit_cnt_number][32],bat_mod_dump[transmit_cnt_number][33],
2127                     ; 509 	bat_mod_dump[transmit_cnt_number][34]);
2129  06c0 b600          	ld	a,_transmit_cnt_number
2130  06c2 97            	ld	xl,a
2131  06c3 a628          	ld	a,#40
2132  06c5 42            	mul	x,a
2133  06c6 d60022        	ld	a,(_bat_mod_dump+34,x)
2134  06c9 88            	push	a
2135  06ca b600          	ld	a,_transmit_cnt_number
2136  06cc 97            	ld	xl,a
2137  06cd a628          	ld	a,#40
2138  06cf 42            	mul	x,a
2139  06d0 d60021        	ld	a,(_bat_mod_dump+33,x)
2140  06d3 88            	push	a
2141  06d4 b600          	ld	a,_transmit_cnt_number
2142  06d6 97            	ld	xl,a
2143  06d7 a628          	ld	a,#40
2144  06d9 42            	mul	x,a
2145  06da d60020        	ld	a,(_bat_mod_dump+32,x)
2146  06dd 88            	push	a
2147  06de b600          	ld	a,_transmit_cnt_number
2148  06e0 97            	ld	xl,a
2149  06e1 a628          	ld	a,#40
2150  06e3 42            	mul	x,a
2151  06e4 d6001f        	ld	a,(_bat_mod_dump+31,x)
2152  06e7 88            	push	a
2153  06e8 b600          	ld	a,_transmit_cnt_number
2154  06ea 97            	ld	xl,a
2155  06eb a628          	ld	a,#40
2156  06ed 42            	mul	x,a
2157  06ee d6001e        	ld	a,(_bat_mod_dump+30,x)
2158  06f1 88            	push	a
2159  06f2 b600          	ld	a,_transmit_cnt_number
2160  06f4 97            	ld	xl,a
2161  06f5 a628          	ld	a,#40
2162  06f7 42            	mul	x,a
2163  06f8 d6001d        	ld	a,(_bat_mod_dump+29,x)
2164  06fb 88            	push	a
2165  06fc b600          	ld	a,_transmit_cnt_number
2166  06fe ab58          	add	a,#88
2167  0700 88            	push	a
2168  0701 b600          	ld	a,_transmit_cnt_number
2169  0703 97            	ld	xl,a
2170  0704 a628          	ld	a,#40
2171  0706 42            	mul	x,a
2172  0707 d6001c        	ld	a,(_bat_mod_dump+28,x)
2173  070a 88            	push	a
2174  070b ae018e        	ldw	x,#398
2175  070e cd03e8        	call	_can_transmit
2177  0711 5b08          	addw	sp,#8
2178                     ; 510 	can_transmit(0x18e,bat_mod_dump[transmit_cnt_number][35],PUT_LB_TM6+transmit_cnt_number,
2178                     ; 511 	bat_mod_dump[transmit_cnt_number][36],
2178                     ; 512 	bat_mod_dump[transmit_cnt_number][37],bat_mod_dump[transmit_cnt_number][38],
2178                     ; 513 	bat_mod_dump[transmit_cnt_number][39],bat_mod_dump[transmit_cnt_number][40],
2178                     ; 514 	bat_mod_dump[transmit_cnt_number][41]);
2180  0713 b600          	ld	a,_transmit_cnt_number
2181  0715 97            	ld	xl,a
2182  0716 a628          	ld	a,#40
2183  0718 42            	mul	x,a
2184  0719 d60029        	ld	a,(_bat_mod_dump+41,x)
2185  071c 88            	push	a
2186  071d b600          	ld	a,_transmit_cnt_number
2187  071f 97            	ld	xl,a
2188  0720 a628          	ld	a,#40
2189  0722 42            	mul	x,a
2190  0723 d60028        	ld	a,(_bat_mod_dump+40,x)
2191  0726 88            	push	a
2192  0727 b600          	ld	a,_transmit_cnt_number
2193  0729 97            	ld	xl,a
2194  072a a628          	ld	a,#40
2195  072c 42            	mul	x,a
2196  072d d60027        	ld	a,(_bat_mod_dump+39,x)
2197  0730 88            	push	a
2198  0731 b600          	ld	a,_transmit_cnt_number
2199  0733 97            	ld	xl,a
2200  0734 a628          	ld	a,#40
2201  0736 42            	mul	x,a
2202  0737 d60026        	ld	a,(_bat_mod_dump+38,x)
2203  073a 88            	push	a
2204  073b b600          	ld	a,_transmit_cnt_number
2205  073d 97            	ld	xl,a
2206  073e a628          	ld	a,#40
2207  0740 42            	mul	x,a
2208  0741 d60025        	ld	a,(_bat_mod_dump+37,x)
2209  0744 88            	push	a
2210  0745 b600          	ld	a,_transmit_cnt_number
2211  0747 97            	ld	xl,a
2212  0748 a628          	ld	a,#40
2213  074a 42            	mul	x,a
2214  074b d60024        	ld	a,(_bat_mod_dump+36,x)
2215  074e 88            	push	a
2216  074f b600          	ld	a,_transmit_cnt_number
2217  0751 ab68          	add	a,#104
2218  0753 88            	push	a
2219  0754 b600          	ld	a,_transmit_cnt_number
2220  0756 97            	ld	xl,a
2221  0757 a628          	ld	a,#40
2222  0759 42            	mul	x,a
2223  075a d60023        	ld	a,(_bat_mod_dump+35,x)
2224  075d 88            	push	a
2225  075e ae018e        	ldw	x,#398
2226  0761 cd03e8        	call	_can_transmit
2228  0764 5b08          	addw	sp,#8
2229                     ; 517      link_cnt=0;
2231  0766 3f0a          	clr	_link_cnt
2232                     ; 518      link=ON;
2234  0768 3555000b      	mov	_link,#85
2235                     ; 520 	transmit_cnt_number++;
2237  076c 3c00          	inc	_transmit_cnt_number
2238                     ; 521 	if(transmit_cnt_number>=7)transmit_cnt_number=0;
2240  076e b600          	ld	a,_transmit_cnt_number
2241  0770 a107          	cp	a,#7
2242  0772 2502          	jrult	L165
2245  0774 3f00          	clr	_transmit_cnt_number
2246  0776               L165:
2247                     ; 531 can_in_an_end:
2247                     ; 532 bCAN_RX=0;
2249  0776 3f08          	clr	_bCAN_RX
2250                     ; 533 }   
2253  0778 84            	pop	a
2254  0779 81            	ret
2277                     ; 537 void t4_init(void){
2278                     	switch	.text
2279  077a               _t4_init:
2283                     ; 538 	TIM4->PSCR = 7;
2285  077a 35075345      	mov	21317,#7
2286                     ; 539 	TIM4->ARR= 77;
2288  077e 354d5346      	mov	21318,#77
2289                     ; 540 	TIM4->IER|= TIM4_IER_UIE;					// enable break interrupt
2291  0782 72105341      	bset	21313,#0
2292                     ; 542 	TIM4->CR1=(TIM4_CR1_URS | TIM4_CR1_CEN | TIM4_CR1_ARPE);	
2294  0786 35855340      	mov	21312,#133
2295                     ; 544 }
2298  078a 81            	ret
2333                     ; 550 @far @interrupt void TIM4_UPD_Interrupt (void) 
2333                     ; 551 {
2335                     	switch	.text
2336  078b               f_TIM4_UPD_Interrupt:
2340                     ; 552 TIM4->SR1&=~TIM4_SR1_UIF;
2342  078b 72115342      	bres	21314,#0
2343                     ; 555 if(++t0_cnt0>=10)
2345  078f 3c00          	inc	_t0_cnt0
2346  0791 b600          	ld	a,_t0_cnt0
2347  0793 a10a          	cp	a,#10
2348  0795 253e          	jrult	L126
2349                     ; 557 	t0_cnt0=0;
2351  0797 3f00          	clr	_t0_cnt0
2352                     ; 558 	b100Hz=1;
2354  0799 72100006      	bset	_b100Hz
2355                     ; 560 	if(++t0_cnt1>=10)
2357  079d 3c01          	inc	_t0_cnt1
2358  079f b601          	ld	a,_t0_cnt1
2359  07a1 a10a          	cp	a,#10
2360  07a3 2506          	jrult	L326
2361                     ; 562 		t0_cnt1=0;
2363  07a5 3f01          	clr	_t0_cnt1
2364                     ; 563 		b10Hz=1;
2366  07a7 72100005      	bset	_b10Hz
2367  07ab               L326:
2368                     ; 566 	if(++t0_cnt2>=20)
2370  07ab 3c02          	inc	_t0_cnt2
2371  07ad b602          	ld	a,_t0_cnt2
2372  07af a114          	cp	a,#20
2373  07b1 2506          	jrult	L526
2374                     ; 568 		t0_cnt2=0;
2376  07b3 3f02          	clr	_t0_cnt2
2377                     ; 569 		b5Hz=1;
2379  07b5 72100004      	bset	_b5Hz
2380  07b9               L526:
2381                     ; 573 	if(++t0_cnt4>=50)
2383  07b9 3c04          	inc	_t0_cnt4
2384  07bb b604          	ld	a,_t0_cnt4
2385  07bd a132          	cp	a,#50
2386  07bf 2506          	jrult	L726
2387                     ; 575 		t0_cnt4=0;
2389  07c1 3f04          	clr	_t0_cnt4
2390                     ; 576 		b2Hz=1;
2392  07c3 72100003      	bset	_b2Hz
2393  07c7               L726:
2394                     ; 579 	if(++t0_cnt3>=100)
2396  07c7 3c03          	inc	_t0_cnt3
2397  07c9 b603          	ld	a,_t0_cnt3
2398  07cb a164          	cp	a,#100
2399  07cd 2506          	jrult	L126
2400                     ; 581 		t0_cnt3=0;
2402  07cf 3f03          	clr	_t0_cnt3
2403                     ; 582 		b1Hz=1;
2405  07d1 72100002      	bset	_b1Hz
2406  07d5               L126:
2407                     ; 589 if(tx_stat_cnt)
2409  07d5 725d0331      	tnz	_tx_stat_cnt
2410  07d9 270c          	jreq	L336
2411                     ; 591 	tx_stat_cnt--;
2413  07db 725a0331      	dec	_tx_stat_cnt
2414                     ; 592 	if(tx_stat_cnt==0)tx_stat=tsOFF;
2416  07df 725d0331      	tnz	_tx_stat_cnt
2417  07e3 2602          	jrne	L336
2420  07e5 3f05          	clr	_tx_stat
2421  07e7               L336:
2422                     ; 607 }
2425  07e7 80            	iret
2450                     ; 610 @far @interrupt void CAN_RX_Interrupt (void) 
2450                     ; 611 {
2451                     	switch	.text
2452  07e8               f_CAN_RX_Interrupt:
2456                     ; 621 CAN->PSR= 7;
2458  07e8 35075427      	mov	21543,#7
2459                     ; 630 memcpy(&mess[0], &CAN->Page.RxFIFO.MFMI, 14); // compare the message content
2461  07ec ae000e        	ldw	x,#14
2462  07ef               L601:
2463  07ef d65427        	ld	a,(21543,x)
2464  07f2 e745          	ld	(_mess-1,x),a
2465  07f4 5a            	decw	x
2466  07f5 26f8          	jrne	L601
2467                     ; 641 bCAN_RX=1;
2469  07f7 35010008      	mov	_bCAN_RX,#1
2470                     ; 642 CAN->RFR|=(1<<5);
2472  07fb 721a5424      	bset	21540,#5
2473                     ; 644 }
2476  07ff 80            	iret
2499                     ; 647 @far @interrupt void CAN_TX_Interrupt (void) 
2499                     ; 648 {
2500                     	switch	.text
2501  0800               f_CAN_TX_Interrupt:
2505                     ; 649 	if((CAN->TSR)&(1<<0))
2507  0800 c65422        	ld	a,21538
2508  0803 a501          	bcp	a,#1
2509  0805 2708          	jreq	L756
2510                     ; 651 	bTX_FREE=1;	
2512  0807 35010007      	mov	_bTX_FREE,#1
2513                     ; 653 	CAN->TSR|=(1<<0);
2515  080b 72105422      	bset	21538,#0
2516  080f               L756:
2517                     ; 655 }
2520  080f 80            	iret
2558                     ; 659 @far @interrupt void UART1TxInterrupt (void) 
2558                     ; 660 {
2559                     	switch	.text
2560  0810               f_UART1TxInterrupt:
2562       00000001      OFST:	set	1
2563  0810 88            	push	a
2566                     ; 663 tx_status=UART1->SR;
2568  0811 c65230        	ld	a,21040
2569  0814 6b01          	ld	(OFST+0,sp),a
2570                     ; 665 if (tx_status & (UART1_SR_TXE))
2572  0816 7b01          	ld	a,(OFST+0,sp)
2573  0818 a580          	bcp	a,#128
2574  081a 272b          	jreq	L776
2575                     ; 667 	if (tx_counter1)
2577  081c 3d31          	tnz	_tx_counter1
2578  081e 271b          	jreq	L107
2579                     ; 669 		--tx_counter1;
2581  0820 3a31          	dec	_tx_counter1
2582                     ; 670 		UART1->DR=tx_buffer1[tx_rd_index1];
2584  0822 5f            	clrw	x
2585  0823 b62f          	ld	a,_tx_rd_index1
2586  0825 2a01          	jrpl	L411
2587  0827 53            	cplw	x
2588  0828               L411:
2589  0828 97            	ld	xl,a
2590  0829 d60000        	ld	a,(_tx_buffer1,x)
2591  082c c75231        	ld	21041,a
2592                     ; 671 		if (++tx_rd_index1 == TX_BUFFER_SIZE1) tx_rd_index1=0;
2594  082f 3c2f          	inc	_tx_rd_index1
2595  0831 b62f          	ld	a,_tx_rd_index1
2596  0833 a132          	cp	a,#50
2597  0835 2610          	jrne	L776
2600  0837 3f2f          	clr	_tx_rd_index1
2601  0839 200c          	jra	L776
2602  083b               L107:
2603                     ; 675 		tx_stat_cnt=3;
2605  083b 35030331      	mov	_tx_stat_cnt,#3
2606                     ; 676 			bOUT_FREE=1;
2608  083f 35010028      	mov	_bOUT_FREE,#1
2609                     ; 677 			UART1->CR2&= ~UART1_CR2_TIEN;
2611  0843 721f5235      	bres	21045,#7
2612  0847               L776:
2613                     ; 681 if (tx_status & (UART1_SR_TC))
2615  0847 7b01          	ld	a,(OFST+0,sp)
2616  0849 a540          	bcp	a,#64
2617  084b 2708          	jreq	L707
2618                     ; 683 	GPIOB->ODR&=~(1<<7);
2620  084d 721f5005      	bres	20485,#7
2621                     ; 684 	UART1->SR&=~UART1_SR_TC;
2623  0851 721d5230      	bres	21040,#6
2624  0855               L707:
2625                     ; 686 }
2628  0855 84            	pop	a
2629  0856 80            	iret
2683                     ; 689 @far @interrupt void UART1RxInterrupt (void) 
2683                     ; 690 {
2684                     	switch	.text
2685  0857               f_UART1RxInterrupt:
2687       00000003      OFST:	set	3
2688  0857 5203          	subw	sp,#3
2691                     ; 693 rx_status=UART1->SR;
2693  0859 c65230        	ld	a,21040
2694  085c 6b02          	ld	(OFST-1,sp),a
2695                     ; 694 rx_data=UART1->DR;
2697  085e c65231        	ld	a,21041
2698  0861 6b03          	ld	(OFST+0,sp),a
2699                     ; 696 if (rx_status & (UART1_SR_RXNE))
2701  0863 7b02          	ld	a,(OFST-1,sp)
2702  0865 a520          	bcp	a,#32
2703  0867 2739          	jreq	L737
2704                     ; 699 temp=rx_data;
2706                     ; 700 rx_buffer[rs485_rx_cnt]=rx_data;
2708  0869 7b03          	ld	a,(OFST+0,sp)
2709  086b be02          	ldw	x,_rs485_rx_cnt
2710  086d d70032        	ld	(_rx_buffer,x),a
2711                     ; 701 rs485_rx_cnt++;
2713  0870 be02          	ldw	x,_rs485_rx_cnt
2714  0872 1c0001        	addw	x,#1
2715  0875 bf02          	ldw	_rs485_rx_cnt,x
2716                     ; 717 	if((rx_data==0x0d)&&(rs485_rx_cnt==298))bRX485=1;
2718  0877 7b03          	ld	a,(OFST+0,sp)
2719  0879 a10d          	cp	a,#13
2720  087b 260b          	jrne	L147
2722  087d be02          	ldw	x,_rs485_rx_cnt
2723  087f a3012a        	cpw	x,#298
2724  0882 2604          	jrne	L147
2727  0884 35010001      	mov	_bRX485,#1
2728  0888               L147:
2729                     ; 718 	if((rx_data==0x0d)&&(rs485_rx_cnt==264))bRX485=2;
2731  0888 7b03          	ld	a,(OFST+0,sp)
2732  088a a10d          	cp	a,#13
2733  088c 260b          	jrne	L347
2735  088e be02          	ldw	x,_rs485_rx_cnt
2736  0890 a30108        	cpw	x,#264
2737  0893 2604          	jrne	L347
2740  0895 35020001      	mov	_bRX485,#2
2741  0899               L347:
2742                     ; 720 	if(rx_data==0x0d)rs485_rx_cnt=0;	
2744  0899 7b03          	ld	a,(OFST+0,sp)
2745  089b a10d          	cp	a,#13
2746  089d 2603          	jrne	L737
2749  089f 5f            	clrw	x
2750  08a0 bf02          	ldw	_rs485_rx_cnt,x
2751  08a2               L737:
2752                     ; 725 }
2755  08a2 5b03          	addw	sp,#3
2756  08a4 80            	iret
2798                     ; 734 main()
2798                     ; 735 {
2800                     	switch	.text
2801  08a5               _main:
2805                     ; 736 CLK->ECKR|=1;
2807  08a5 721050c1      	bset	20673,#0
2809  08a9               L167:
2810                     ; 737 while((CLK->ECKR & 2) == 0);
2812  08a9 c650c1        	ld	a,20673
2813  08ac a502          	bcp	a,#2
2814  08ae 27f9          	jreq	L167
2815                     ; 738 CLK->SWCR|=2;
2817  08b0 721250c5      	bset	20677,#1
2818                     ; 739 CLK->SWR=0xB4;
2820  08b4 35b450c4      	mov	20676,#180
2821                     ; 742 t4_init();
2823  08b8 cd077a        	call	_t4_init
2825                     ; 744 		GPIOG->DDR|=(1<<0);
2827  08bb 72105020      	bset	20512,#0
2828                     ; 745 		GPIOG->CR1|=(1<<0);
2830  08bf 72105021      	bset	20513,#0
2831                     ; 746 		GPIOG->CR2&=~(1<<0);	
2833  08c3 72115022      	bres	20514,#0
2834                     ; 749 		GPIOG->DDR&=~(1<<1);
2836  08c7 72135020      	bres	20512,#1
2837                     ; 750 		GPIOG->CR1|=(1<<1);
2839  08cb 72125021      	bset	20513,#1
2840                     ; 751 		GPIOG->CR2&=~(1<<1);
2842  08cf 72135022      	bres	20514,#1
2843                     ; 753 init_CAN();
2845  08d3 cd0391        	call	_init_CAN
2847                     ; 761 uart1_init();
2849  08d6 cd003c        	call	_uart1_init
2851                     ; 763 adress=19;
2853  08d9 35130119      	mov	_adress,#19
2854                     ; 765 bat_mod_dump[0][5]=1;
2856  08dd 35010005      	mov	_bat_mod_dump+5,#1
2857                     ; 766 bat_mod_dump[1][5]=2;
2859  08e1 3502002d      	mov	_bat_mod_dump+45,#2
2860                     ; 767 bat_mod_dump[2][5]=3;
2862  08e5 35030055      	mov	_bat_mod_dump+85,#3
2863                     ; 768 bat_mod_dump[3][5]=4;
2865  08e9 3504007d      	mov	_bat_mod_dump+125,#4
2866                     ; 769 bat_mod_dump[4][5]=5;
2868  08ed 350500a5      	mov	_bat_mod_dump+165,#5
2869                     ; 770 bat_mod_dump[5][5]=6;
2871  08f1 350600cd      	mov	_bat_mod_dump+205,#6
2872                     ; 771 bat_mod_dump[6][5]=7;
2874  08f5 350700f5      	mov	_bat_mod_dump+245,#7
2875                     ; 773 enableInterrupts();
2878  08f9 9a            rim
2880  08fa               L567:
2881                     ; 777 	if(bRX485)
2883  08fa 3d01          	tnz	_bRX485
2884  08fc 2703          	jreq	L177
2885                     ; 779 		rx485_in_an();
2887  08fe cd029c        	call	_rx485_in_an
2889  0901               L177:
2890                     ; 782 	if(bCAN_RX)
2892  0901 3d08          	tnz	_bCAN_RX
2893  0903 2705          	jreq	L377
2894                     ; 784 		bCAN_RX=0;
2896  0905 3f08          	clr	_bCAN_RX
2897                     ; 785 		can_in_an();
2899  0907 cd04dd        	call	_can_in_an
2901  090a               L377:
2902                     ; 794 	if(b100Hz)
2904                     	btst	_b100Hz
2905  090f 2404          	jruge	L577
2906                     ; 796 		b100Hz=0;
2908  0911 72110006      	bres	_b100Hz
2909  0915               L577:
2910                     ; 799 	if(b10Hz)
2912                     	btst	_b10Hz
2913  091a 2407          	jruge	L777
2914                     ; 801 		b10Hz=0;
2916  091c 72110005      	bres	_b10Hz
2917                     ; 803 			can_tx_hndl();
2919  0920 cd0476        	call	_can_tx_hndl
2921  0923               L777:
2922                     ; 809 	if(b2Hz)
2924                     	btst	_b2Hz
2925  0928 2503          	jrult	L221
2926  092a cc09f4        	jp	L1001
2927  092d               L221:
2928                     ; 811 		b2Hz=0;
2930  092d 72110003      	bres	_b2Hz
2931                     ; 813 		if(bBAT_REQ)
2933                     	btst	_bBAT_REQ
2934  0936 245f          	jruge	L3001
2935                     ; 815 			bBAT_REQ=0;
2937  0938 72110001      	bres	_bBAT_REQ
2938                     ; 817 			rs485_out_buff[0]=0x7e;
2940  093c 357e0032      	mov	_rs485_out_buff,#126
2941                     ; 818 			rs485_out_buff[1]=0x31;
2943  0940 35310033      	mov	_rs485_out_buff+1,#49
2944                     ; 819 			rs485_out_buff[2]=0x31;
2946  0944 35310034      	mov	_rs485_out_buff+2,#49
2947                     ; 820 			rs485_out_buff[3]=0x30;
2949  0948 35300035      	mov	_rs485_out_buff+3,#48
2950                     ; 821 			rs485_out_buff[4]=0x31;
2952  094c 35310036      	mov	_rs485_out_buff+4,#49
2953                     ; 822 			rs485_out_buff[5]=0x44;
2955  0950 35440037      	mov	_rs485_out_buff+5,#68
2956                     ; 823 			rs485_out_buff[6]=0x30;
2958  0954 35300038      	mov	_rs485_out_buff+6,#48
2959                     ; 824 			rs485_out_buff[7]=0x38;
2961  0958 35380039      	mov	_rs485_out_buff+7,#56
2962                     ; 825 			rs485_out_buff[8]=0x32;
2964  095c 3532003a      	mov	_rs485_out_buff+8,#50
2965                     ; 826 			rs485_out_buff[9]=0x45;
2967  0960 3545003b      	mov	_rs485_out_buff+9,#69
2968                     ; 827 			rs485_out_buff[10]=0x30;
2970  0964 3530003c      	mov	_rs485_out_buff+10,#48
2971                     ; 828 			rs485_out_buff[11]=0x30;
2973  0968 3530003d      	mov	_rs485_out_buff+11,#48
2974                     ; 829 			rs485_out_buff[12]=0x32;
2976  096c 3532003e      	mov	_rs485_out_buff+12,#50
2977                     ; 830 			rs485_out_buff[13]=0x30;
2979  0970 3530003f      	mov	_rs485_out_buff+13,#48
2980                     ; 831 			rs485_out_buff[14]=0x31;
2982  0974 35310040      	mov	_rs485_out_buff+14,#49
2983                     ; 832 			rs485_out_buff[15]=0x46;
2985  0978 35460041      	mov	_rs485_out_buff+15,#70
2986                     ; 833 			rs485_out_buff[16]=0x44;
2988  097c 35440042      	mov	_rs485_out_buff+16,#68
2989                     ; 834 			rs485_out_buff[17]=0x32;
2991  0980 35320043      	mov	_rs485_out_buff+17,#50
2992                     ; 835 			rs485_out_buff[18]=0x37;
2994  0984 35370044      	mov	_rs485_out_buff+18,#55
2995                     ; 836 			rs485_out_buff[19]=0x0d;
2997  0988 350d0045      	mov	_rs485_out_buff+19,#13
2998                     ; 838 			uart1_out_adr(rs485_out_buff,20);
3000  098c 4b14          	push	#20
3001  098e ae0032        	ldw	x,#_rs485_out_buff
3002  0991 cd00c3        	call	_uart1_out_adr
3004  0994 84            	pop	a
3006  0995 205d          	jra	L1001
3007  0997               L3001:
3008                     ; 842 			bBAT_REQ=1;
3010  0997 72100001      	bset	_bBAT_REQ
3011                     ; 844 			rs485_out_buff[0]=0x7e;
3013  099b 357e0032      	mov	_rs485_out_buff,#126
3014                     ; 845 			rs485_out_buff[1]=0x31;
3016  099f 35310033      	mov	_rs485_out_buff+1,#49
3017                     ; 846 			rs485_out_buff[2]=0x31;
3019  09a3 35310034      	mov	_rs485_out_buff+2,#49
3020                     ; 847 			rs485_out_buff[3]=0x30;
3022  09a7 35300035      	mov	_rs485_out_buff+3,#48
3023                     ; 848 			rs485_out_buff[4]=0x31;
3025  09ab 35310036      	mov	_rs485_out_buff+4,#49
3026                     ; 849 			rs485_out_buff[5]=0x44;
3028  09af 35440037      	mov	_rs485_out_buff+5,#68
3029                     ; 850 			rs485_out_buff[6]=0x30;
3031  09b3 35300038      	mov	_rs485_out_buff+6,#48
3032                     ; 851 			rs485_out_buff[7]=0x38;
3034  09b7 35380039      	mov	_rs485_out_buff+7,#56
3035                     ; 852 			rs485_out_buff[8]=0x33;
3037  09bb 3533003a      	mov	_rs485_out_buff+8,#51
3038                     ; 853 			rs485_out_buff[9]=0x45;
3040  09bf 3545003b      	mov	_rs485_out_buff+9,#69
3041                     ; 854 			rs485_out_buff[10]=0x30;
3043  09c3 3530003c      	mov	_rs485_out_buff+10,#48
3044                     ; 855 			rs485_out_buff[11]=0x30;
3046  09c7 3530003d      	mov	_rs485_out_buff+11,#48
3047                     ; 856 			rs485_out_buff[12]=0x32;
3049  09cb 3532003e      	mov	_rs485_out_buff+12,#50
3050                     ; 857 			rs485_out_buff[13]=0x30;
3052  09cf 3530003f      	mov	_rs485_out_buff+13,#48
3053                     ; 858 			rs485_out_buff[14]=0x31;
3055  09d3 35310040      	mov	_rs485_out_buff+14,#49
3056                     ; 859 			rs485_out_buff[15]=0x46;
3058  09d7 35460041      	mov	_rs485_out_buff+15,#70
3059                     ; 860 			rs485_out_buff[16]=0x44;
3061  09db 35440042      	mov	_rs485_out_buff+16,#68
3062                     ; 861 			rs485_out_buff[17]=0x32;
3064  09df 35320043      	mov	_rs485_out_buff+17,#50
3065                     ; 862 			rs485_out_buff[18]=0x36;
3067  09e3 35360044      	mov	_rs485_out_buff+18,#54
3068                     ; 863 			rs485_out_buff[19]=0x0d;
3070  09e7 350d0045      	mov	_rs485_out_buff+19,#13
3071                     ; 865 			uart1_out_adr(rs485_out_buff,20);
3073  09eb 4b14          	push	#20
3074  09ed ae0032        	ldw	x,#_rs485_out_buff
3075  09f0 cd00c3        	call	_uart1_out_adr
3077  09f3 84            	pop	a
3078  09f4               L1001:
3079                     ; 869 	if(b1Hz)
3081                     	btst	_b1Hz
3082  09f9 2503          	jrult	L421
3083  09fb cc08fa        	jp	L567
3084  09fe               L421:
3085                     ; 871 		b1Hz=0;
3087  09fe 72110002      	bres	_b1Hz
3088                     ; 880 		if(++rs485_cnt>=100)
3090  0a02 3c0b          	inc	_rs485_cnt
3091  0a04 b60b          	ld	a,_rs485_cnt
3092  0a06 a164          	cp	a,#100
3093  0a08 2403          	jruge	L621
3094  0a0a cc08fa        	jp	L567
3095  0a0d               L621:
3096                     ; 882 			rs485_cnt=100;
3098  0a0d 3564000b      	mov	_rs485_cnt,#100
3099                     ; 883 			bRS485ERR=1;
3101  0a11 72100000      	bset	_bRS485ERR
3102  0a15 acfa08fa      	jpf	L567
3682                     	xdef	_main
3683                     	xdef	f_UART1RxInterrupt
3684                     	xdef	f_UART1TxInterrupt
3685                     	xdef	f_CAN_TX_Interrupt
3686                     	xdef	f_CAN_RX_Interrupt
3687                     	xdef	f_TIM4_UPD_Interrupt
3688                     	xdef	_t4_init
3689                     	xdef	_can_in_an
3690                     	xdef	_can_tx_hndl
3691                     	xdef	_can_transmit
3692                     	xdef	_init_CAN
3693                     	xdef	_rx485_in_an
3694                     	xdef	_str2int
3695                     	xdef	_ascii2hex
3696                     	xdef	_ascii2halFhex
3697                     	xdef	_uart1_out_adr
3698                     	xdef	_putchar1
3699                     	xdef	_uart1_init
3700                     	xdef	_gran
3701                     	xdef	_gran_char
3702                     	switch	.bss
3703  0000               _bat_mod_dump:
3704  0000 000000000000  	ds.b	280
3705                     	xdef	_bat_mod_dump
3706                     	switch	.ubsct
3707  0000               _transmit_cnt_number:
3708  0000 00            	ds.b	1
3709                     	xdef	_transmit_cnt_number
3710                     .bit:	section	.data,bit
3711  0000               _bRS485ERR:
3712  0000 00            	ds.b	1
3713                     	xdef	_bRS485ERR
3714                     	xdef	_rs485_cnt
3715                     	switch	.ubsct
3716  0001               _bRX485:
3717  0001 00            	ds.b	1
3718                     	xdef	_bRX485
3719  0002               _rs485_rx_cnt:
3720  0002 0000          	ds.b	2
3721                     	xdef	_rs485_rx_cnt
3722  0004               _plazma_int:
3723  0004 000000000000  	ds.b	6
3724                     	xdef	_plazma_int
3725  000a               _link_cnt:
3726  000a 00            	ds.b	1
3727                     	xdef	_link_cnt
3728  000b               _link:
3729  000b 00            	ds.b	1
3730                     	xdef	_link
3731                     	switch	.bss
3732  0118               _adress_error:
3733  0118 00            	ds.b	1
3734                     	xdef	_adress_error
3735  0119               _adress:
3736  0119 00            	ds.b	1
3737                     	xdef	_adress
3738  011a               _adr:
3739  011a 000000        	ds.b	3
3740                     	xdef	_adr
3741                     	xdef	_adr_drv_stat
3742                     	xdef	_led_ind
3743                     	switch	.ubsct
3744  000c               _led_ind_cnt:
3745  000c 00            	ds.b	1
3746                     	xdef	_led_ind_cnt
3747  000d               _adc_plazma:
3748  000d 000000000000  	ds.b	10
3749                     	xdef	_adc_plazma
3750  0017               _adc_plazma_short:
3751  0017 0000          	ds.b	2
3752                     	xdef	_adc_plazma_short
3753  0019               _adc_cnt:
3754  0019 00            	ds.b	1
3755                     	xdef	_adc_cnt
3756  001a               _adc_ch:
3757  001a 00            	ds.b	1
3758                     	xdef	_adc_ch
3759                     	switch	.bss
3760  011d               _adc_buff_:
3761  011d 000000000000  	ds.b	20
3762                     	xdef	_adc_buff_
3763  0131               _adc_buff:
3764  0131 000000000000  	ds.b	320
3765                     	xdef	_adc_buff
3766                     	switch	.ubsct
3767  001b               _T:
3768  001b 00            	ds.b	1
3769                     	xdef	_T
3770  001c               _Udb:
3771  001c 0000          	ds.b	2
3772                     	xdef	_Udb
3773  001e               _Ui:
3774  001e 0000          	ds.b	2
3775                     	xdef	_Ui
3776  0020               _Un:
3777  0020 0000          	ds.b	2
3778                     	xdef	_Un
3779  0022               _I:
3780  0022 0000          	ds.b	2
3781                     	xdef	_I
3782  0024               _can_error_cnt:
3783  0024 00            	ds.b	1
3784                     	xdef	_can_error_cnt
3785                     	xdef	_bCAN_RX
3786  0025               _tx_busy_cnt:
3787  0025 00            	ds.b	1
3788                     	xdef	_tx_busy_cnt
3789                     	xdef	_bTX_FREE
3790  0026               _can_buff_rd_ptr:
3791  0026 00            	ds.b	1
3792                     	xdef	_can_buff_rd_ptr
3793  0027               _can_buff_wr_ptr:
3794  0027 00            	ds.b	1
3795                     	xdef	_can_buff_wr_ptr
3796                     	switch	.bss
3797  0271               _can_out_buff:
3798  0271 000000000000  	ds.b	192
3799                     	xdef	_can_out_buff
3800                     	switch	.ubsct
3801  0028               _bOUT_FREE:
3802  0028 00            	ds.b	1
3803                     	xdef	_bOUT_FREE
3804                     	xdef	_tx_wd_cnt
3805                     	switch	.bss
3806  0331               _tx_stat_cnt:
3807  0331 00            	ds.b	1
3808                     	xdef	_tx_stat_cnt
3809                     	switch	.ubsct
3810  0029               _rx_rd_index1:
3811  0029 0000          	ds.b	2
3812                     	xdef	_rx_rd_index1
3813  002b               _rx_wr_index1:
3814  002b 0000          	ds.b	2
3815                     	xdef	_rx_wr_index1
3816  002d               _rx_counter1:
3817  002d 0000          	ds.b	2
3818                     	xdef	_rx_counter1
3819                     	xdef	_rx_buffer
3820  002f               _tx_rd_index1:
3821  002f 00            	ds.b	1
3822                     	xdef	_tx_rd_index1
3823  0030               _tx_wr_index1:
3824  0030 00            	ds.b	1
3825                     	xdef	_tx_wr_index1
3826  0031               _tx_counter1:
3827  0031 00            	ds.b	1
3828                     	xdef	_tx_counter1
3829                     	xdef	_tx_buffer1
3830  0032               _rs485_out_buff:
3831  0032 000000000000  	ds.b	20
3832                     	xdef	_rs485_out_buff
3833  0046               _mess:
3834  0046 000000000000  	ds.b	14
3835                     	xdef	_mess
3836                     	switch	.bit
3837  0001               _bBAT_REQ:
3838  0001 00            	ds.b	1
3839                     	xdef	_bBAT_REQ
3840  0002               _b1Hz:
3841  0002 00            	ds.b	1
3842                     	xdef	_b1Hz
3843  0003               _b2Hz:
3844  0003 00            	ds.b	1
3845                     	xdef	_b2Hz
3846  0004               _b5Hz:
3847  0004 00            	ds.b	1
3848                     	xdef	_b5Hz
3849  0005               _b10Hz:
3850  0005 00            	ds.b	1
3851                     	xdef	_b10Hz
3852  0006               _b100Hz:
3853  0006 00            	ds.b	1
3854                     	xdef	_b100Hz
3855                     	xdef	_t0_cnt4
3856                     	xdef	_t0_cnt3
3857                     	xdef	_t0_cnt2
3858                     	xdef	_t0_cnt1
3859                     	xdef	_t0_cnt0
3860                     	xref	_pow
3861                     	xref	_isalnum
3862                     	xdef	_tx_stat
3863                     	switch	.const
3864  000a               L704:
3865  000a 41800000      	dc.w	16768,0
3866                     	xref.b	c_lreg
3867                     	xref.b	c_x
3887                     	xref	c_imul
3888                     	xref	c_ftoi
3889                     	xref	c_itof
3890                     	xref	c_xymvx
3891                     	xref	c_sdivx
3892                     	end
