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
1824                     ; 447 	GPIOD->DDR|=(1<<7);
1826  04de 721e5011      	bset	20497,#7
1827                     ; 448 	GPIOD->CR1|=(1<<7);
1829  04e2 721e5012      	bset	20498,#7
1830                     ; 449 	GPIOD->CR2&=~(1<<7);	
1832  04e6 721f5013      	bres	20499,#7
1833                     ; 450 	GPIOD->ODR^=(1<<7);
1835  04ea c6500f        	ld	a,20495
1836  04ed a880          	xor	a,	#128
1837  04ef c7500f        	ld	20495,a
1838                     ; 456 if((mess[6]==19)&&(mess[7]==19)&&(mess[8]==GETTM))	
1840  04f2 b64c          	ld	a,_mess+6
1841  04f4 a113          	cp	a,#19
1842  04f6 2703          	jreq	L27
1843  04f8 cc078a        	jp	L165
1844  04fb               L27:
1846  04fb b64d          	ld	a,_mess+7
1847  04fd a113          	cp	a,#19
1848  04ff 2703          	jreq	L47
1849  0501 cc078a        	jp	L165
1850  0504               L47:
1852  0504 b64e          	ld	a,_mess+8
1853  0506 a1ed          	cp	a,#237
1854  0508 2703          	jreq	L67
1855  050a cc078a        	jp	L165
1856  050d               L67:
1857                     ; 458 	GPIOD->DDR|=(1<<7);
1859  050d 721e5011      	bset	20497,#7
1860                     ; 459 	GPIOD->CR1|=(1<<7);
1862  0511 721e5012      	bset	20498,#7
1863                     ; 460 	GPIOD->CR2&=~(1<<7);	
1865  0515 721f5013      	bres	20499,#7
1866                     ; 461 	GPIOD->ODR^=(1<<7);
1868  0519 c6500f        	ld	a,20495
1869  051c a880          	xor	a,	#128
1870  051e c7500f        	ld	20495,a
1871                     ; 462 	can_error_cnt=0;
1873  0521 3f24          	clr	_can_error_cnt
1874                     ; 470 	bat_mod_dump[0][37]=((ascii2halFhex(rx_buffer[13]))<<4)+((ascii2halFhex(rx_buffer[14])));
1876  0523 c60040        	ld	a,_rx_buffer+14
1877  0526 cd0116        	call	_ascii2halFhex
1879  0529 6b01          	ld	(OFST+0,sp),a
1880  052b c6003f        	ld	a,_rx_buffer+13
1881  052e cd0116        	call	_ascii2halFhex
1883  0531 97            	ld	xl,a
1884  0532 a610          	ld	a,#16
1885  0534 42            	mul	x,a
1886  0535 9f            	ld	a,xl
1887  0536 1b01          	add	a,(OFST+0,sp)
1888  0538 c70025        	ld	_bat_mod_dump+37,a
1889                     ; 471 	bat_mod_dump[0][38]=((ascii2halFhex(rx_buffer[15]))<<4)+((ascii2halFhex(rx_buffer[16])));
1891  053b c60042        	ld	a,_rx_buffer+16
1892  053e cd0116        	call	_ascii2halFhex
1894  0541 6b01          	ld	(OFST+0,sp),a
1895  0543 c60041        	ld	a,_rx_buffer+15
1896  0546 cd0116        	call	_ascii2halFhex
1898  0549 97            	ld	xl,a
1899  054a a610          	ld	a,#16
1900  054c 42            	mul	x,a
1901  054d 9f            	ld	a,xl
1902  054e 1b01          	add	a,(OFST+0,sp)
1903  0550 c70026        	ld	_bat_mod_dump+38,a
1904                     ; 472 	bat_mod_dump[0][39]=((ascii2halFhex(rx_buffer[17]))<<4)+((ascii2halFhex(rx_buffer[18])));
1906  0553 c60044        	ld	a,_rx_buffer+18
1907  0556 cd0116        	call	_ascii2halFhex
1909  0559 6b01          	ld	(OFST+0,sp),a
1910  055b c60043        	ld	a,_rx_buffer+17
1911  055e cd0116        	call	_ascii2halFhex
1913  0561 97            	ld	xl,a
1914  0562 a610          	ld	a,#16
1915  0564 42            	mul	x,a
1916  0565 9f            	ld	a,xl
1917  0566 1b01          	add	a,(OFST+0,sp)
1918  0568 c70027        	ld	_bat_mod_dump+39,a
1919                     ; 473 	bat_mod_dump[0][40]=((ascii2halFhex(rx_buffer[19]))<<4)+((ascii2halFhex(rx_buffer[20])));
1921  056b c60046        	ld	a,_rx_buffer+20
1922  056e cd0116        	call	_ascii2halFhex
1924  0571 6b01          	ld	(OFST+0,sp),a
1925  0573 c60045        	ld	a,_rx_buffer+19
1926  0576 cd0116        	call	_ascii2halFhex
1928  0579 97            	ld	xl,a
1929  057a a610          	ld	a,#16
1930  057c 42            	mul	x,a
1931  057d 9f            	ld	a,xl
1932  057e 1b01          	add	a,(OFST+0,sp)
1933  0580 c70028        	ld	_bat_mod_dump+40,a
1934                     ; 474 	bat_mod_dump[0][41]=rs485_cnt;
1936  0583 55000b0029    	mov	_bat_mod_dump+41,_rs485_cnt
1937                     ; 485 	can_transmit(0x18e,bat_mod_dump[transmit_cnt_number][0],PUT_LB_TM1+transmit_cnt_number,
1937                     ; 486 	bat_mod_dump[transmit_cnt_number][1],
1937                     ; 487 	bat_mod_dump[transmit_cnt_number][2],bat_mod_dump[transmit_cnt_number][3],
1937                     ; 488 	bat_mod_dump[transmit_cnt_number][4],bat_mod_dump[transmit_cnt_number][5],
1937                     ; 489 	bat_mod_dump[transmit_cnt_number][6]);
1939  0588 b600          	ld	a,_transmit_cnt_number
1940  058a 97            	ld	xl,a
1941  058b a628          	ld	a,#40
1942  058d 42            	mul	x,a
1943  058e d60006        	ld	a,(_bat_mod_dump+6,x)
1944  0591 88            	push	a
1945  0592 b600          	ld	a,_transmit_cnt_number
1946  0594 97            	ld	xl,a
1947  0595 a628          	ld	a,#40
1948  0597 42            	mul	x,a
1949  0598 d60005        	ld	a,(_bat_mod_dump+5,x)
1950  059b 88            	push	a
1951  059c b600          	ld	a,_transmit_cnt_number
1952  059e 97            	ld	xl,a
1953  059f a628          	ld	a,#40
1954  05a1 42            	mul	x,a
1955  05a2 d60004        	ld	a,(_bat_mod_dump+4,x)
1956  05a5 88            	push	a
1957  05a6 b600          	ld	a,_transmit_cnt_number
1958  05a8 97            	ld	xl,a
1959  05a9 a628          	ld	a,#40
1960  05ab 42            	mul	x,a
1961  05ac d60003        	ld	a,(_bat_mod_dump+3,x)
1962  05af 88            	push	a
1963  05b0 b600          	ld	a,_transmit_cnt_number
1964  05b2 97            	ld	xl,a
1965  05b3 a628          	ld	a,#40
1966  05b5 42            	mul	x,a
1967  05b6 d60002        	ld	a,(_bat_mod_dump+2,x)
1968  05b9 88            	push	a
1969  05ba b600          	ld	a,_transmit_cnt_number
1970  05bc 97            	ld	xl,a
1971  05bd a628          	ld	a,#40
1972  05bf 42            	mul	x,a
1973  05c0 d60001        	ld	a,(_bat_mod_dump+1,x)
1974  05c3 88            	push	a
1975  05c4 b600          	ld	a,_transmit_cnt_number
1976  05c6 ab18          	add	a,#24
1977  05c8 88            	push	a
1978  05c9 b600          	ld	a,_transmit_cnt_number
1979  05cb 97            	ld	xl,a
1980  05cc a628          	ld	a,#40
1981  05ce 42            	mul	x,a
1982  05cf d60000        	ld	a,(_bat_mod_dump,x)
1983  05d2 88            	push	a
1984  05d3 ae018e        	ldw	x,#398
1985  05d6 cd03e8        	call	_can_transmit
1987  05d9 5b08          	addw	sp,#8
1988                     ; 490 	can_transmit(0x18e,bat_mod_dump[transmit_cnt_number][7],PUT_LB_TM2+transmit_cnt_number,
1988                     ; 491 	bat_mod_dump[transmit_cnt_number][8],
1988                     ; 492 	bat_mod_dump[transmit_cnt_number][9],bat_mod_dump[transmit_cnt_number][10],
1988                     ; 493 	bat_mod_dump[transmit_cnt_number][11],bat_mod_dump[transmit_cnt_number][12],
1988                     ; 494 	bat_mod_dump[transmit_cnt_number][13]);
1990  05db b600          	ld	a,_transmit_cnt_number
1991  05dd 97            	ld	xl,a
1992  05de a628          	ld	a,#40
1993  05e0 42            	mul	x,a
1994  05e1 d6000d        	ld	a,(_bat_mod_dump+13,x)
1995  05e4 88            	push	a
1996  05e5 b600          	ld	a,_transmit_cnt_number
1997  05e7 97            	ld	xl,a
1998  05e8 a628          	ld	a,#40
1999  05ea 42            	mul	x,a
2000  05eb d6000c        	ld	a,(_bat_mod_dump+12,x)
2001  05ee 88            	push	a
2002  05ef b600          	ld	a,_transmit_cnt_number
2003  05f1 97            	ld	xl,a
2004  05f2 a628          	ld	a,#40
2005  05f4 42            	mul	x,a
2006  05f5 d6000b        	ld	a,(_bat_mod_dump+11,x)
2007  05f8 88            	push	a
2008  05f9 b600          	ld	a,_transmit_cnt_number
2009  05fb 97            	ld	xl,a
2010  05fc a628          	ld	a,#40
2011  05fe 42            	mul	x,a
2012  05ff d6000a        	ld	a,(_bat_mod_dump+10,x)
2013  0602 88            	push	a
2014  0603 b600          	ld	a,_transmit_cnt_number
2015  0605 97            	ld	xl,a
2016  0606 a628          	ld	a,#40
2017  0608 42            	mul	x,a
2018  0609 d60009        	ld	a,(_bat_mod_dump+9,x)
2019  060c 88            	push	a
2020  060d b600          	ld	a,_transmit_cnt_number
2021  060f 97            	ld	xl,a
2022  0610 a628          	ld	a,#40
2023  0612 42            	mul	x,a
2024  0613 d60008        	ld	a,(_bat_mod_dump+8,x)
2025  0616 88            	push	a
2026  0617 b600          	ld	a,_transmit_cnt_number
2027  0619 ab78          	add	a,#120
2028  061b 88            	push	a
2029  061c b600          	ld	a,_transmit_cnt_number
2030  061e 97            	ld	xl,a
2031  061f a628          	ld	a,#40
2032  0621 42            	mul	x,a
2033  0622 d60007        	ld	a,(_bat_mod_dump+7,x)
2034  0625 88            	push	a
2035  0626 ae018e        	ldw	x,#398
2036  0629 cd03e8        	call	_can_transmit
2038  062c 5b08          	addw	sp,#8
2039                     ; 495 	can_transmit(0x18e,bat_mod_dump[transmit_cnt_number][14],PUT_LB_TM3+transmit_cnt_number,
2039                     ; 496 	bat_mod_dump[transmit_cnt_number][15],
2039                     ; 497 	bat_mod_dump[transmit_cnt_number][16],bat_mod_dump[transmit_cnt_number][17],
2039                     ; 498 	bat_mod_dump[transmit_cnt_number][18],bat_mod_dump[transmit_cnt_number][19],
2039                     ; 499 	bat_mod_dump[transmit_cnt_number][20]);
2041  062e b600          	ld	a,_transmit_cnt_number
2042  0630 97            	ld	xl,a
2043  0631 a628          	ld	a,#40
2044  0633 42            	mul	x,a
2045  0634 d60014        	ld	a,(_bat_mod_dump+20,x)
2046  0637 88            	push	a
2047  0638 b600          	ld	a,_transmit_cnt_number
2048  063a 97            	ld	xl,a
2049  063b a628          	ld	a,#40
2050  063d 42            	mul	x,a
2051  063e d60013        	ld	a,(_bat_mod_dump+19,x)
2052  0641 88            	push	a
2053  0642 b600          	ld	a,_transmit_cnt_number
2054  0644 97            	ld	xl,a
2055  0645 a628          	ld	a,#40
2056  0647 42            	mul	x,a
2057  0648 d60012        	ld	a,(_bat_mod_dump+18,x)
2058  064b 88            	push	a
2059  064c b600          	ld	a,_transmit_cnt_number
2060  064e 97            	ld	xl,a
2061  064f a628          	ld	a,#40
2062  0651 42            	mul	x,a
2063  0652 d60011        	ld	a,(_bat_mod_dump+17,x)
2064  0655 88            	push	a
2065  0656 b600          	ld	a,_transmit_cnt_number
2066  0658 97            	ld	xl,a
2067  0659 a628          	ld	a,#40
2068  065b 42            	mul	x,a
2069  065c d60010        	ld	a,(_bat_mod_dump+16,x)
2070  065f 88            	push	a
2071  0660 b600          	ld	a,_transmit_cnt_number
2072  0662 97            	ld	xl,a
2073  0663 a628          	ld	a,#40
2074  0665 42            	mul	x,a
2075  0666 d6000f        	ld	a,(_bat_mod_dump+15,x)
2076  0669 88            	push	a
2077  066a b600          	ld	a,_transmit_cnt_number
2078  066c ab38          	add	a,#56
2079  066e 88            	push	a
2080  066f b600          	ld	a,_transmit_cnt_number
2081  0671 97            	ld	xl,a
2082  0672 a628          	ld	a,#40
2083  0674 42            	mul	x,a
2084  0675 d6000e        	ld	a,(_bat_mod_dump+14,x)
2085  0678 88            	push	a
2086  0679 ae018e        	ldw	x,#398
2087  067c cd03e8        	call	_can_transmit
2089  067f 5b08          	addw	sp,#8
2090                     ; 500 	can_transmit(0x18e,bat_mod_dump[transmit_cnt_number][21],PUT_LB_TM4+transmit_cnt_number,
2090                     ; 501 	bat_mod_dump[transmit_cnt_number][22],
2090                     ; 502 	bat_mod_dump[transmit_cnt_number][23],bat_mod_dump[transmit_cnt_number][24],
2090                     ; 503 	bat_mod_dump[transmit_cnt_number][25],bat_mod_dump[transmit_cnt_number][26],
2090                     ; 504 	bat_mod_dump[transmit_cnt_number][27]);
2092  0681 b600          	ld	a,_transmit_cnt_number
2093  0683 97            	ld	xl,a
2094  0684 a628          	ld	a,#40
2095  0686 42            	mul	x,a
2096  0687 d6001b        	ld	a,(_bat_mod_dump+27,x)
2097  068a 88            	push	a
2098  068b b600          	ld	a,_transmit_cnt_number
2099  068d 97            	ld	xl,a
2100  068e a628          	ld	a,#40
2101  0690 42            	mul	x,a
2102  0691 d6001a        	ld	a,(_bat_mod_dump+26,x)
2103  0694 88            	push	a
2104  0695 b600          	ld	a,_transmit_cnt_number
2105  0697 97            	ld	xl,a
2106  0698 a628          	ld	a,#40
2107  069a 42            	mul	x,a
2108  069b d60019        	ld	a,(_bat_mod_dump+25,x)
2109  069e 88            	push	a
2110  069f b600          	ld	a,_transmit_cnt_number
2111  06a1 97            	ld	xl,a
2112  06a2 a628          	ld	a,#40
2113  06a4 42            	mul	x,a
2114  06a5 d60018        	ld	a,(_bat_mod_dump+24,x)
2115  06a8 88            	push	a
2116  06a9 b600          	ld	a,_transmit_cnt_number
2117  06ab 97            	ld	xl,a
2118  06ac a628          	ld	a,#40
2119  06ae 42            	mul	x,a
2120  06af d60017        	ld	a,(_bat_mod_dump+23,x)
2121  06b2 88            	push	a
2122  06b3 b600          	ld	a,_transmit_cnt_number
2123  06b5 97            	ld	xl,a
2124  06b6 a628          	ld	a,#40
2125  06b8 42            	mul	x,a
2126  06b9 d60016        	ld	a,(_bat_mod_dump+22,x)
2127  06bc 88            	push	a
2128  06bd b600          	ld	a,_transmit_cnt_number
2129  06bf ab48          	add	a,#72
2130  06c1 88            	push	a
2131  06c2 b600          	ld	a,_transmit_cnt_number
2132  06c4 97            	ld	xl,a
2133  06c5 a628          	ld	a,#40
2134  06c7 42            	mul	x,a
2135  06c8 d60015        	ld	a,(_bat_mod_dump+21,x)
2136  06cb 88            	push	a
2137  06cc ae018e        	ldw	x,#398
2138  06cf cd03e8        	call	_can_transmit
2140  06d2 5b08          	addw	sp,#8
2141                     ; 505 	can_transmit(0x18e,bat_mod_dump[transmit_cnt_number][28],PUT_LB_TM5+transmit_cnt_number,
2141                     ; 506 	bat_mod_dump[transmit_cnt_number][29],
2141                     ; 507 	bat_mod_dump[transmit_cnt_number][30],bat_mod_dump[transmit_cnt_number][31],
2141                     ; 508 	bat_mod_dump[transmit_cnt_number][32],bat_mod_dump[transmit_cnt_number][33],
2141                     ; 509 	bat_mod_dump[transmit_cnt_number][34]);
2143  06d4 b600          	ld	a,_transmit_cnt_number
2144  06d6 97            	ld	xl,a
2145  06d7 a628          	ld	a,#40
2146  06d9 42            	mul	x,a
2147  06da d60022        	ld	a,(_bat_mod_dump+34,x)
2148  06dd 88            	push	a
2149  06de b600          	ld	a,_transmit_cnt_number
2150  06e0 97            	ld	xl,a
2151  06e1 a628          	ld	a,#40
2152  06e3 42            	mul	x,a
2153  06e4 d60021        	ld	a,(_bat_mod_dump+33,x)
2154  06e7 88            	push	a
2155  06e8 b600          	ld	a,_transmit_cnt_number
2156  06ea 97            	ld	xl,a
2157  06eb a628          	ld	a,#40
2158  06ed 42            	mul	x,a
2159  06ee d60020        	ld	a,(_bat_mod_dump+32,x)
2160  06f1 88            	push	a
2161  06f2 b600          	ld	a,_transmit_cnt_number
2162  06f4 97            	ld	xl,a
2163  06f5 a628          	ld	a,#40
2164  06f7 42            	mul	x,a
2165  06f8 d6001f        	ld	a,(_bat_mod_dump+31,x)
2166  06fb 88            	push	a
2167  06fc b600          	ld	a,_transmit_cnt_number
2168  06fe 97            	ld	xl,a
2169  06ff a628          	ld	a,#40
2170  0701 42            	mul	x,a
2171  0702 d6001e        	ld	a,(_bat_mod_dump+30,x)
2172  0705 88            	push	a
2173  0706 b600          	ld	a,_transmit_cnt_number
2174  0708 97            	ld	xl,a
2175  0709 a628          	ld	a,#40
2176  070b 42            	mul	x,a
2177  070c d6001d        	ld	a,(_bat_mod_dump+29,x)
2178  070f 88            	push	a
2179  0710 b600          	ld	a,_transmit_cnt_number
2180  0712 ab58          	add	a,#88
2181  0714 88            	push	a
2182  0715 b600          	ld	a,_transmit_cnt_number
2183  0717 97            	ld	xl,a
2184  0718 a628          	ld	a,#40
2185  071a 42            	mul	x,a
2186  071b d6001c        	ld	a,(_bat_mod_dump+28,x)
2187  071e 88            	push	a
2188  071f ae018e        	ldw	x,#398
2189  0722 cd03e8        	call	_can_transmit
2191  0725 5b08          	addw	sp,#8
2192                     ; 510 	can_transmit(0x18e,bat_mod_dump[transmit_cnt_number][35],PUT_LB_TM6+transmit_cnt_number,
2192                     ; 511 	bat_mod_dump[transmit_cnt_number][36],
2192                     ; 512 	bat_mod_dump[transmit_cnt_number][37],bat_mod_dump[transmit_cnt_number][38],
2192                     ; 513 	bat_mod_dump[transmit_cnt_number][39],bat_mod_dump[transmit_cnt_number][40],
2192                     ; 514 	bat_mod_dump[transmit_cnt_number][41]);
2194  0727 b600          	ld	a,_transmit_cnt_number
2195  0729 97            	ld	xl,a
2196  072a a628          	ld	a,#40
2197  072c 42            	mul	x,a
2198  072d d60029        	ld	a,(_bat_mod_dump+41,x)
2199  0730 88            	push	a
2200  0731 b600          	ld	a,_transmit_cnt_number
2201  0733 97            	ld	xl,a
2202  0734 a628          	ld	a,#40
2203  0736 42            	mul	x,a
2204  0737 d60028        	ld	a,(_bat_mod_dump+40,x)
2205  073a 88            	push	a
2206  073b b600          	ld	a,_transmit_cnt_number
2207  073d 97            	ld	xl,a
2208  073e a628          	ld	a,#40
2209  0740 42            	mul	x,a
2210  0741 d60027        	ld	a,(_bat_mod_dump+39,x)
2211  0744 88            	push	a
2212  0745 b600          	ld	a,_transmit_cnt_number
2213  0747 97            	ld	xl,a
2214  0748 a628          	ld	a,#40
2215  074a 42            	mul	x,a
2216  074b d60026        	ld	a,(_bat_mod_dump+38,x)
2217  074e 88            	push	a
2218  074f b600          	ld	a,_transmit_cnt_number
2219  0751 97            	ld	xl,a
2220  0752 a628          	ld	a,#40
2221  0754 42            	mul	x,a
2222  0755 d60025        	ld	a,(_bat_mod_dump+37,x)
2223  0758 88            	push	a
2224  0759 b600          	ld	a,_transmit_cnt_number
2225  075b 97            	ld	xl,a
2226  075c a628          	ld	a,#40
2227  075e 42            	mul	x,a
2228  075f d60024        	ld	a,(_bat_mod_dump+36,x)
2229  0762 88            	push	a
2230  0763 b600          	ld	a,_transmit_cnt_number
2231  0765 ab68          	add	a,#104
2232  0767 88            	push	a
2233  0768 b600          	ld	a,_transmit_cnt_number
2234  076a 97            	ld	xl,a
2235  076b a628          	ld	a,#40
2236  076d 42            	mul	x,a
2237  076e d60023        	ld	a,(_bat_mod_dump+35,x)
2238  0771 88            	push	a
2239  0772 ae018e        	ldw	x,#398
2240  0775 cd03e8        	call	_can_transmit
2242  0778 5b08          	addw	sp,#8
2243                     ; 517      link_cnt=0;
2245  077a 3f0a          	clr	_link_cnt
2246                     ; 518      link=ON;
2248  077c 3555000b      	mov	_link,#85
2249                     ; 520 	transmit_cnt_number++;
2251  0780 3c00          	inc	_transmit_cnt_number
2252                     ; 521 	if(transmit_cnt_number>=7)transmit_cnt_number=0;
2254  0782 b600          	ld	a,_transmit_cnt_number
2255  0784 a107          	cp	a,#7
2256  0786 2502          	jrult	L165
2259  0788 3f00          	clr	_transmit_cnt_number
2260  078a               L165:
2261                     ; 531 can_in_an_end:
2261                     ; 532 bCAN_RX=0;
2263  078a 3f08          	clr	_bCAN_RX
2264                     ; 533 }   
2267  078c 84            	pop	a
2268  078d 81            	ret
2291                     ; 537 void t4_init(void){
2292                     	switch	.text
2293  078e               _t4_init:
2297                     ; 538 	TIM4->PSCR = 7;
2299  078e 35075345      	mov	21317,#7
2300                     ; 539 	TIM4->ARR= 77;
2302  0792 354d5346      	mov	21318,#77
2303                     ; 540 	TIM4->IER|= TIM4_IER_UIE;					// enable break interrupt
2305  0796 72105341      	bset	21313,#0
2306                     ; 542 	TIM4->CR1=(TIM4_CR1_URS | TIM4_CR1_CEN | TIM4_CR1_ARPE);	
2308  079a 35855340      	mov	21312,#133
2309                     ; 544 }
2312  079e 81            	ret
2347                     ; 550 @far @interrupt void TIM4_UPD_Interrupt (void) 
2347                     ; 551 {
2349                     	switch	.text
2350  079f               f_TIM4_UPD_Interrupt:
2354                     ; 552 TIM4->SR1&=~TIM4_SR1_UIF;
2356  079f 72115342      	bres	21314,#0
2357                     ; 555 if(++t0_cnt0>=10)
2359  07a3 3c00          	inc	_t0_cnt0
2360  07a5 b600          	ld	a,_t0_cnt0
2361  07a7 a10a          	cp	a,#10
2362  07a9 253e          	jrult	L126
2363                     ; 557 	t0_cnt0=0;
2365  07ab 3f00          	clr	_t0_cnt0
2366                     ; 558 	b100Hz=1;
2368  07ad 72100006      	bset	_b100Hz
2369                     ; 560 	if(++t0_cnt1>=10)
2371  07b1 3c01          	inc	_t0_cnt1
2372  07b3 b601          	ld	a,_t0_cnt1
2373  07b5 a10a          	cp	a,#10
2374  07b7 2506          	jrult	L326
2375                     ; 562 		t0_cnt1=0;
2377  07b9 3f01          	clr	_t0_cnt1
2378                     ; 563 		b10Hz=1;
2380  07bb 72100005      	bset	_b10Hz
2381  07bf               L326:
2382                     ; 566 	if(++t0_cnt2>=20)
2384  07bf 3c02          	inc	_t0_cnt2
2385  07c1 b602          	ld	a,_t0_cnt2
2386  07c3 a114          	cp	a,#20
2387  07c5 2506          	jrult	L526
2388                     ; 568 		t0_cnt2=0;
2390  07c7 3f02          	clr	_t0_cnt2
2391                     ; 569 		b5Hz=1;
2393  07c9 72100004      	bset	_b5Hz
2394  07cd               L526:
2395                     ; 573 	if(++t0_cnt4>=50)
2397  07cd 3c04          	inc	_t0_cnt4
2398  07cf b604          	ld	a,_t0_cnt4
2399  07d1 a132          	cp	a,#50
2400  07d3 2506          	jrult	L726
2401                     ; 575 		t0_cnt4=0;
2403  07d5 3f04          	clr	_t0_cnt4
2404                     ; 576 		b2Hz=1;
2406  07d7 72100003      	bset	_b2Hz
2407  07db               L726:
2408                     ; 579 	if(++t0_cnt3>=100)
2410  07db 3c03          	inc	_t0_cnt3
2411  07dd b603          	ld	a,_t0_cnt3
2412  07df a164          	cp	a,#100
2413  07e1 2506          	jrult	L126
2414                     ; 581 		t0_cnt3=0;
2416  07e3 3f03          	clr	_t0_cnt3
2417                     ; 582 		b1Hz=1;
2419  07e5 72100002      	bset	_b1Hz
2420  07e9               L126:
2421                     ; 589 if(tx_stat_cnt)
2423  07e9 725d0331      	tnz	_tx_stat_cnt
2424  07ed 270c          	jreq	L336
2425                     ; 591 	tx_stat_cnt--;
2427  07ef 725a0331      	dec	_tx_stat_cnt
2428                     ; 592 	if(tx_stat_cnt==0)tx_stat=tsOFF;
2430  07f3 725d0331      	tnz	_tx_stat_cnt
2431  07f7 2602          	jrne	L336
2434  07f9 3f05          	clr	_tx_stat
2435  07fb               L336:
2436                     ; 607 }
2439  07fb 80            	iret
2464                     ; 610 @far @interrupt void CAN_RX_Interrupt (void) 
2464                     ; 611 {
2465                     	switch	.text
2466  07fc               f_CAN_RX_Interrupt:
2470                     ; 621 CAN->PSR= 7;
2472  07fc 35075427      	mov	21543,#7
2473                     ; 630 memcpy(&mess[0], &CAN->Page.RxFIFO.MFMI, 14); // compare the message content
2475  0800 ae000e        	ldw	x,#14
2476  0803               L601:
2477  0803 d65427        	ld	a,(21543,x)
2478  0806 e745          	ld	(_mess-1,x),a
2479  0808 5a            	decw	x
2480  0809 26f8          	jrne	L601
2481                     ; 641 bCAN_RX=1;
2483  080b 35010008      	mov	_bCAN_RX,#1
2484                     ; 642 CAN->RFR|=(1<<5);
2486  080f 721a5424      	bset	21540,#5
2487                     ; 644 }
2490  0813 80            	iret
2513                     ; 647 @far @interrupt void CAN_TX_Interrupt (void) 
2513                     ; 648 {
2514                     	switch	.text
2515  0814               f_CAN_TX_Interrupt:
2519                     ; 649 	if((CAN->TSR)&(1<<0))
2521  0814 c65422        	ld	a,21538
2522  0817 a501          	bcp	a,#1
2523  0819 2708          	jreq	L756
2524                     ; 651 	bTX_FREE=1;	
2526  081b 35010007      	mov	_bTX_FREE,#1
2527                     ; 653 	CAN->TSR|=(1<<0);
2529  081f 72105422      	bset	21538,#0
2530  0823               L756:
2531                     ; 655 }
2534  0823 80            	iret
2572                     ; 659 @far @interrupt void UART1TxInterrupt (void) 
2572                     ; 660 {
2573                     	switch	.text
2574  0824               f_UART1TxInterrupt:
2576       00000001      OFST:	set	1
2577  0824 88            	push	a
2580                     ; 663 tx_status=UART1->SR;
2582  0825 c65230        	ld	a,21040
2583  0828 6b01          	ld	(OFST+0,sp),a
2584                     ; 665 if (tx_status & (UART1_SR_TXE))
2586  082a 7b01          	ld	a,(OFST+0,sp)
2587  082c a580          	bcp	a,#128
2588  082e 272b          	jreq	L776
2589                     ; 667 	if (tx_counter1)
2591  0830 3d31          	tnz	_tx_counter1
2592  0832 271b          	jreq	L107
2593                     ; 669 		--tx_counter1;
2595  0834 3a31          	dec	_tx_counter1
2596                     ; 670 		UART1->DR=tx_buffer1[tx_rd_index1];
2598  0836 5f            	clrw	x
2599  0837 b62f          	ld	a,_tx_rd_index1
2600  0839 2a01          	jrpl	L411
2601  083b 53            	cplw	x
2602  083c               L411:
2603  083c 97            	ld	xl,a
2604  083d d60000        	ld	a,(_tx_buffer1,x)
2605  0840 c75231        	ld	21041,a
2606                     ; 671 		if (++tx_rd_index1 == TX_BUFFER_SIZE1) tx_rd_index1=0;
2608  0843 3c2f          	inc	_tx_rd_index1
2609  0845 b62f          	ld	a,_tx_rd_index1
2610  0847 a132          	cp	a,#50
2611  0849 2610          	jrne	L776
2614  084b 3f2f          	clr	_tx_rd_index1
2615  084d 200c          	jra	L776
2616  084f               L107:
2617                     ; 675 		tx_stat_cnt=3;
2619  084f 35030331      	mov	_tx_stat_cnt,#3
2620                     ; 676 			bOUT_FREE=1;
2622  0853 35010028      	mov	_bOUT_FREE,#1
2623                     ; 677 			UART1->CR2&= ~UART1_CR2_TIEN;
2625  0857 721f5235      	bres	21045,#7
2626  085b               L776:
2627                     ; 681 if (tx_status & (UART1_SR_TC))
2629  085b 7b01          	ld	a,(OFST+0,sp)
2630  085d a540          	bcp	a,#64
2631  085f 2708          	jreq	L707
2632                     ; 683 	GPIOB->ODR&=~(1<<7);
2634  0861 721f5005      	bres	20485,#7
2635                     ; 684 	UART1->SR&=~UART1_SR_TC;
2637  0865 721d5230      	bres	21040,#6
2638  0869               L707:
2639                     ; 686 }
2642  0869 84            	pop	a
2643  086a 80            	iret
2697                     ; 689 @far @interrupt void UART1RxInterrupt (void) 
2697                     ; 690 {
2698                     	switch	.text
2699  086b               f_UART1RxInterrupt:
2701       00000003      OFST:	set	3
2702  086b 5203          	subw	sp,#3
2705                     ; 693 rx_status=UART1->SR;
2707  086d c65230        	ld	a,21040
2708  0870 6b02          	ld	(OFST-1,sp),a
2709                     ; 694 rx_data=UART1->DR;
2711  0872 c65231        	ld	a,21041
2712  0875 6b03          	ld	(OFST+0,sp),a
2713                     ; 696 if (rx_status & (UART1_SR_RXNE))
2715  0877 7b02          	ld	a,(OFST-1,sp)
2716  0879 a520          	bcp	a,#32
2717  087b 2739          	jreq	L737
2718                     ; 699 temp=rx_data;
2720                     ; 700 rx_buffer[rs485_rx_cnt]=rx_data;
2722  087d 7b03          	ld	a,(OFST+0,sp)
2723  087f be02          	ldw	x,_rs485_rx_cnt
2724  0881 d70032        	ld	(_rx_buffer,x),a
2725                     ; 701 rs485_rx_cnt++;
2727  0884 be02          	ldw	x,_rs485_rx_cnt
2728  0886 1c0001        	addw	x,#1
2729  0889 bf02          	ldw	_rs485_rx_cnt,x
2730                     ; 717 	if((rx_data==0x0d)&&(rs485_rx_cnt==298))bRX485=1;
2732  088b 7b03          	ld	a,(OFST+0,sp)
2733  088d a10d          	cp	a,#13
2734  088f 260b          	jrne	L147
2736  0891 be02          	ldw	x,_rs485_rx_cnt
2737  0893 a3012a        	cpw	x,#298
2738  0896 2604          	jrne	L147
2741  0898 35010001      	mov	_bRX485,#1
2742  089c               L147:
2743                     ; 718 	if((rx_data==0x0d)&&(rs485_rx_cnt==264))bRX485=2;
2745  089c 7b03          	ld	a,(OFST+0,sp)
2746  089e a10d          	cp	a,#13
2747  08a0 260b          	jrne	L347
2749  08a2 be02          	ldw	x,_rs485_rx_cnt
2750  08a4 a30108        	cpw	x,#264
2751  08a7 2604          	jrne	L347
2754  08a9 35020001      	mov	_bRX485,#2
2755  08ad               L347:
2756                     ; 720 	if(rx_data==0x0d)rs485_rx_cnt=0;	
2758  08ad 7b03          	ld	a,(OFST+0,sp)
2759  08af a10d          	cp	a,#13
2760  08b1 2603          	jrne	L737
2763  08b3 5f            	clrw	x
2764  08b4 bf02          	ldw	_rs485_rx_cnt,x
2765  08b6               L737:
2766                     ; 725 }
2769  08b6 5b03          	addw	sp,#3
2770  08b8 80            	iret
2812                     ; 734 main()
2812                     ; 735 {
2814                     	switch	.text
2815  08b9               _main:
2819                     ; 736 CLK->ECKR|=1;
2821  08b9 721050c1      	bset	20673,#0
2823  08bd               L167:
2824                     ; 737 while((CLK->ECKR & 2) == 0);
2826  08bd c650c1        	ld	a,20673
2827  08c0 a502          	bcp	a,#2
2828  08c2 27f9          	jreq	L167
2829                     ; 738 CLK->SWCR|=2;
2831  08c4 721250c5      	bset	20677,#1
2832                     ; 739 CLK->SWR=0xB4;
2834  08c8 35b450c4      	mov	20676,#180
2835                     ; 742 t4_init();
2837  08cc cd078e        	call	_t4_init
2839                     ; 744 		GPIOG->DDR|=(1<<0);
2841  08cf 72105020      	bset	20512,#0
2842                     ; 745 		GPIOG->CR1|=(1<<0);
2844  08d3 72105021      	bset	20513,#0
2845                     ; 746 		GPIOG->CR2&=~(1<<0);	
2847  08d7 72115022      	bres	20514,#0
2848                     ; 749 		GPIOG->DDR&=~(1<<1);
2850  08db 72135020      	bres	20512,#1
2851                     ; 750 		GPIOG->CR1|=(1<<1);
2853  08df 72125021      	bset	20513,#1
2854                     ; 751 		GPIOG->CR2&=~(1<<1);
2856  08e3 72135022      	bres	20514,#1
2857                     ; 753 init_CAN();
2859  08e7 cd0391        	call	_init_CAN
2861                     ; 761 uart1_init();
2863  08ea cd003c        	call	_uart1_init
2865                     ; 763 adress=19;
2867  08ed 35130119      	mov	_adress,#19
2868                     ; 765 bat_mod_dump[0][5]=1;
2870  08f1 35010005      	mov	_bat_mod_dump+5,#1
2871                     ; 766 bat_mod_dump[1][5]=2;
2873  08f5 3502002d      	mov	_bat_mod_dump+45,#2
2874                     ; 767 bat_mod_dump[2][5]=3;
2876  08f9 35030055      	mov	_bat_mod_dump+85,#3
2877                     ; 768 bat_mod_dump[3][5]=4;
2879  08fd 3504007d      	mov	_bat_mod_dump+125,#4
2880                     ; 769 bat_mod_dump[4][5]=5;
2882  0901 350500a5      	mov	_bat_mod_dump+165,#5
2883                     ; 770 bat_mod_dump[5][5]=6;
2885  0905 350600cd      	mov	_bat_mod_dump+205,#6
2886                     ; 771 bat_mod_dump[6][5]=7;
2888  0909 350700f5      	mov	_bat_mod_dump+245,#7
2889                     ; 773 enableInterrupts();
2892  090d 9a            rim
2894  090e               L567:
2895                     ; 777 	if(bRX485)
2897  090e 3d01          	tnz	_bRX485
2898  0910 2703          	jreq	L177
2899                     ; 779 		rx485_in_an();
2901  0912 cd029c        	call	_rx485_in_an
2903  0915               L177:
2904                     ; 782 	if(bCAN_RX)
2906  0915 3d08          	tnz	_bCAN_RX
2907  0917 2719          	jreq	L377
2908                     ; 784 		bCAN_RX=0;
2910  0919 3f08          	clr	_bCAN_RX
2911                     ; 785 		can_in_an();
2913  091b cd04dd        	call	_can_in_an
2915                     ; 787 GPIOD->DDR|=(1<<7);
2917  091e 721e5011      	bset	20497,#7
2918                     ; 788 		GPIOD->CR1|=(1<<7);
2920  0922 721e5012      	bset	20498,#7
2921                     ; 789 		GPIOD->CR2&=~(1<<7);	
2923  0926 721f5013      	bres	20499,#7
2924                     ; 790 		GPIOD->ODR^=(1<<7);
2926  092a c6500f        	ld	a,20495
2927  092d a880          	xor	a,	#128
2928  092f c7500f        	ld	20495,a
2929  0932               L377:
2930                     ; 794 	if(b100Hz)
2932                     	btst	_b100Hz
2933  0937 2404          	jruge	L577
2934                     ; 796 		b100Hz=0;
2936  0939 72110006      	bres	_b100Hz
2937  093d               L577:
2938                     ; 799 	if(b10Hz)
2940                     	btst	_b10Hz
2941  0942 2407          	jruge	L777
2942                     ; 801 		b10Hz=0;
2944  0944 72110005      	bres	_b10Hz
2945                     ; 803 			can_tx_hndl();
2947  0948 cd0476        	call	_can_tx_hndl
2949  094b               L777:
2950                     ; 809 	if(b2Hz)
2952                     	btst	_b2Hz
2953  0950 2503          	jrult	L221
2954  0952 cc0a1c        	jp	L1001
2955  0955               L221:
2956                     ; 811 		b2Hz=0;
2958  0955 72110003      	bres	_b2Hz
2959                     ; 813 		if(bBAT_REQ)
2961                     	btst	_bBAT_REQ
2962  095e 245f          	jruge	L3001
2963                     ; 815 			bBAT_REQ=0;
2965  0960 72110001      	bres	_bBAT_REQ
2966                     ; 817 			rs485_out_buff[0]=0x7e;
2968  0964 357e0032      	mov	_rs485_out_buff,#126
2969                     ; 818 			rs485_out_buff[1]=0x31;
2971  0968 35310033      	mov	_rs485_out_buff+1,#49
2972                     ; 819 			rs485_out_buff[2]=0x31;
2974  096c 35310034      	mov	_rs485_out_buff+2,#49
2975                     ; 820 			rs485_out_buff[3]=0x30;
2977  0970 35300035      	mov	_rs485_out_buff+3,#48
2978                     ; 821 			rs485_out_buff[4]=0x31;
2980  0974 35310036      	mov	_rs485_out_buff+4,#49
2981                     ; 822 			rs485_out_buff[5]=0x44;
2983  0978 35440037      	mov	_rs485_out_buff+5,#68
2984                     ; 823 			rs485_out_buff[6]=0x30;
2986  097c 35300038      	mov	_rs485_out_buff+6,#48
2987                     ; 824 			rs485_out_buff[7]=0x38;
2989  0980 35380039      	mov	_rs485_out_buff+7,#56
2990                     ; 825 			rs485_out_buff[8]=0x32;
2992  0984 3532003a      	mov	_rs485_out_buff+8,#50
2993                     ; 826 			rs485_out_buff[9]=0x45;
2995  0988 3545003b      	mov	_rs485_out_buff+9,#69
2996                     ; 827 			rs485_out_buff[10]=0x30;
2998  098c 3530003c      	mov	_rs485_out_buff+10,#48
2999                     ; 828 			rs485_out_buff[11]=0x30;
3001  0990 3530003d      	mov	_rs485_out_buff+11,#48
3002                     ; 829 			rs485_out_buff[12]=0x32;
3004  0994 3532003e      	mov	_rs485_out_buff+12,#50
3005                     ; 830 			rs485_out_buff[13]=0x30;
3007  0998 3530003f      	mov	_rs485_out_buff+13,#48
3008                     ; 831 			rs485_out_buff[14]=0x31;
3010  099c 35310040      	mov	_rs485_out_buff+14,#49
3011                     ; 832 			rs485_out_buff[15]=0x46;
3013  09a0 35460041      	mov	_rs485_out_buff+15,#70
3014                     ; 833 			rs485_out_buff[16]=0x44;
3016  09a4 35440042      	mov	_rs485_out_buff+16,#68
3017                     ; 834 			rs485_out_buff[17]=0x32;
3019  09a8 35320043      	mov	_rs485_out_buff+17,#50
3020                     ; 835 			rs485_out_buff[18]=0x37;
3022  09ac 35370044      	mov	_rs485_out_buff+18,#55
3023                     ; 836 			rs485_out_buff[19]=0x0d;
3025  09b0 350d0045      	mov	_rs485_out_buff+19,#13
3026                     ; 838 			uart1_out_adr(rs485_out_buff,20);
3028  09b4 4b14          	push	#20
3029  09b6 ae0032        	ldw	x,#_rs485_out_buff
3030  09b9 cd00c3        	call	_uart1_out_adr
3032  09bc 84            	pop	a
3034  09bd 205d          	jra	L1001
3035  09bf               L3001:
3036                     ; 842 			bBAT_REQ=1;
3038  09bf 72100001      	bset	_bBAT_REQ
3039                     ; 844 			rs485_out_buff[0]=0x7e;
3041  09c3 357e0032      	mov	_rs485_out_buff,#126
3042                     ; 845 			rs485_out_buff[1]=0x31;
3044  09c7 35310033      	mov	_rs485_out_buff+1,#49
3045                     ; 846 			rs485_out_buff[2]=0x31;
3047  09cb 35310034      	mov	_rs485_out_buff+2,#49
3048                     ; 847 			rs485_out_buff[3]=0x30;
3050  09cf 35300035      	mov	_rs485_out_buff+3,#48
3051                     ; 848 			rs485_out_buff[4]=0x31;
3053  09d3 35310036      	mov	_rs485_out_buff+4,#49
3054                     ; 849 			rs485_out_buff[5]=0x44;
3056  09d7 35440037      	mov	_rs485_out_buff+5,#68
3057                     ; 850 			rs485_out_buff[6]=0x30;
3059  09db 35300038      	mov	_rs485_out_buff+6,#48
3060                     ; 851 			rs485_out_buff[7]=0x38;
3062  09df 35380039      	mov	_rs485_out_buff+7,#56
3063                     ; 852 			rs485_out_buff[8]=0x33;
3065  09e3 3533003a      	mov	_rs485_out_buff+8,#51
3066                     ; 853 			rs485_out_buff[9]=0x45;
3068  09e7 3545003b      	mov	_rs485_out_buff+9,#69
3069                     ; 854 			rs485_out_buff[10]=0x30;
3071  09eb 3530003c      	mov	_rs485_out_buff+10,#48
3072                     ; 855 			rs485_out_buff[11]=0x30;
3074  09ef 3530003d      	mov	_rs485_out_buff+11,#48
3075                     ; 856 			rs485_out_buff[12]=0x32;
3077  09f3 3532003e      	mov	_rs485_out_buff+12,#50
3078                     ; 857 			rs485_out_buff[13]=0x30;
3080  09f7 3530003f      	mov	_rs485_out_buff+13,#48
3081                     ; 858 			rs485_out_buff[14]=0x31;
3083  09fb 35310040      	mov	_rs485_out_buff+14,#49
3084                     ; 859 			rs485_out_buff[15]=0x46;
3086  09ff 35460041      	mov	_rs485_out_buff+15,#70
3087                     ; 860 			rs485_out_buff[16]=0x44;
3089  0a03 35440042      	mov	_rs485_out_buff+16,#68
3090                     ; 861 			rs485_out_buff[17]=0x32;
3092  0a07 35320043      	mov	_rs485_out_buff+17,#50
3093                     ; 862 			rs485_out_buff[18]=0x36;
3095  0a0b 35360044      	mov	_rs485_out_buff+18,#54
3096                     ; 863 			rs485_out_buff[19]=0x0d;
3098  0a0f 350d0045      	mov	_rs485_out_buff+19,#13
3099                     ; 865 			uart1_out_adr(rs485_out_buff,20);
3101  0a13 4b14          	push	#20
3102  0a15 ae0032        	ldw	x,#_rs485_out_buff
3103  0a18 cd00c3        	call	_uart1_out_adr
3105  0a1b 84            	pop	a
3106  0a1c               L1001:
3107                     ; 869 	if(b1Hz)
3109                     	btst	_b1Hz
3110  0a21 2503          	jrult	L421
3111  0a23 cc090e        	jp	L567
3112  0a26               L421:
3113                     ; 871 		b1Hz=0;
3115  0a26 72110002      	bres	_b1Hz
3116                     ; 880 		if(++rs485_cnt>=100)
3118  0a2a 3c0b          	inc	_rs485_cnt
3119  0a2c b60b          	ld	a,_rs485_cnt
3120  0a2e a164          	cp	a,#100
3121  0a30 2403          	jruge	L621
3122  0a32 cc090e        	jp	L567
3123  0a35               L621:
3124                     ; 882 			rs485_cnt=100;
3126  0a35 3564000b      	mov	_rs485_cnt,#100
3127                     ; 883 			bRS485ERR=1;
3129  0a39 72100000      	bset	_bRS485ERR
3130  0a3d ac0e090e      	jpf	L567
3710                     	xdef	_main
3711                     	xdef	f_UART1RxInterrupt
3712                     	xdef	f_UART1TxInterrupt
3713                     	xdef	f_CAN_TX_Interrupt
3714                     	xdef	f_CAN_RX_Interrupt
3715                     	xdef	f_TIM4_UPD_Interrupt
3716                     	xdef	_t4_init
3717                     	xdef	_can_in_an
3718                     	xdef	_can_tx_hndl
3719                     	xdef	_can_transmit
3720                     	xdef	_init_CAN
3721                     	xdef	_rx485_in_an
3722                     	xdef	_str2int
3723                     	xdef	_ascii2hex
3724                     	xdef	_ascii2halFhex
3725                     	xdef	_uart1_out_adr
3726                     	xdef	_putchar1
3727                     	xdef	_uart1_init
3728                     	xdef	_gran
3729                     	xdef	_gran_char
3730                     	switch	.bss
3731  0000               _bat_mod_dump:
3732  0000 000000000000  	ds.b	280
3733                     	xdef	_bat_mod_dump
3734                     	switch	.ubsct
3735  0000               _transmit_cnt_number:
3736  0000 00            	ds.b	1
3737                     	xdef	_transmit_cnt_number
3738                     .bit:	section	.data,bit
3739  0000               _bRS485ERR:
3740  0000 00            	ds.b	1
3741                     	xdef	_bRS485ERR
3742                     	xdef	_rs485_cnt
3743                     	switch	.ubsct
3744  0001               _bRX485:
3745  0001 00            	ds.b	1
3746                     	xdef	_bRX485
3747  0002               _rs485_rx_cnt:
3748  0002 0000          	ds.b	2
3749                     	xdef	_rs485_rx_cnt
3750  0004               _plazma_int:
3751  0004 000000000000  	ds.b	6
3752                     	xdef	_plazma_int
3753  000a               _link_cnt:
3754  000a 00            	ds.b	1
3755                     	xdef	_link_cnt
3756  000b               _link:
3757  000b 00            	ds.b	1
3758                     	xdef	_link
3759                     	switch	.bss
3760  0118               _adress_error:
3761  0118 00            	ds.b	1
3762                     	xdef	_adress_error
3763  0119               _adress:
3764  0119 00            	ds.b	1
3765                     	xdef	_adress
3766  011a               _adr:
3767  011a 000000        	ds.b	3
3768                     	xdef	_adr
3769                     	xdef	_adr_drv_stat
3770                     	xdef	_led_ind
3771                     	switch	.ubsct
3772  000c               _led_ind_cnt:
3773  000c 00            	ds.b	1
3774                     	xdef	_led_ind_cnt
3775  000d               _adc_plazma:
3776  000d 000000000000  	ds.b	10
3777                     	xdef	_adc_plazma
3778  0017               _adc_plazma_short:
3779  0017 0000          	ds.b	2
3780                     	xdef	_adc_plazma_short
3781  0019               _adc_cnt:
3782  0019 00            	ds.b	1
3783                     	xdef	_adc_cnt
3784  001a               _adc_ch:
3785  001a 00            	ds.b	1
3786                     	xdef	_adc_ch
3787                     	switch	.bss
3788  011d               _adc_buff_:
3789  011d 000000000000  	ds.b	20
3790                     	xdef	_adc_buff_
3791  0131               _adc_buff:
3792  0131 000000000000  	ds.b	320
3793                     	xdef	_adc_buff
3794                     	switch	.ubsct
3795  001b               _T:
3796  001b 00            	ds.b	1
3797                     	xdef	_T
3798  001c               _Udb:
3799  001c 0000          	ds.b	2
3800                     	xdef	_Udb
3801  001e               _Ui:
3802  001e 0000          	ds.b	2
3803                     	xdef	_Ui
3804  0020               _Un:
3805  0020 0000          	ds.b	2
3806                     	xdef	_Un
3807  0022               _I:
3808  0022 0000          	ds.b	2
3809                     	xdef	_I
3810  0024               _can_error_cnt:
3811  0024 00            	ds.b	1
3812                     	xdef	_can_error_cnt
3813                     	xdef	_bCAN_RX
3814  0025               _tx_busy_cnt:
3815  0025 00            	ds.b	1
3816                     	xdef	_tx_busy_cnt
3817                     	xdef	_bTX_FREE
3818  0026               _can_buff_rd_ptr:
3819  0026 00            	ds.b	1
3820                     	xdef	_can_buff_rd_ptr
3821  0027               _can_buff_wr_ptr:
3822  0027 00            	ds.b	1
3823                     	xdef	_can_buff_wr_ptr
3824                     	switch	.bss
3825  0271               _can_out_buff:
3826  0271 000000000000  	ds.b	192
3827                     	xdef	_can_out_buff
3828                     	switch	.ubsct
3829  0028               _bOUT_FREE:
3830  0028 00            	ds.b	1
3831                     	xdef	_bOUT_FREE
3832                     	xdef	_tx_wd_cnt
3833                     	switch	.bss
3834  0331               _tx_stat_cnt:
3835  0331 00            	ds.b	1
3836                     	xdef	_tx_stat_cnt
3837                     	switch	.ubsct
3838  0029               _rx_rd_index1:
3839  0029 0000          	ds.b	2
3840                     	xdef	_rx_rd_index1
3841  002b               _rx_wr_index1:
3842  002b 0000          	ds.b	2
3843                     	xdef	_rx_wr_index1
3844  002d               _rx_counter1:
3845  002d 0000          	ds.b	2
3846                     	xdef	_rx_counter1
3847                     	xdef	_rx_buffer
3848  002f               _tx_rd_index1:
3849  002f 00            	ds.b	1
3850                     	xdef	_tx_rd_index1
3851  0030               _tx_wr_index1:
3852  0030 00            	ds.b	1
3853                     	xdef	_tx_wr_index1
3854  0031               _tx_counter1:
3855  0031 00            	ds.b	1
3856                     	xdef	_tx_counter1
3857                     	xdef	_tx_buffer1
3858  0032               _rs485_out_buff:
3859  0032 000000000000  	ds.b	20
3860                     	xdef	_rs485_out_buff
3861  0046               _mess:
3862  0046 000000000000  	ds.b	14
3863                     	xdef	_mess
3864                     	switch	.bit
3865  0001               _bBAT_REQ:
3866  0001 00            	ds.b	1
3867                     	xdef	_bBAT_REQ
3868  0002               _b1Hz:
3869  0002 00            	ds.b	1
3870                     	xdef	_b1Hz
3871  0003               _b2Hz:
3872  0003 00            	ds.b	1
3873                     	xdef	_b2Hz
3874  0004               _b5Hz:
3875  0004 00            	ds.b	1
3876                     	xdef	_b5Hz
3877  0005               _b10Hz:
3878  0005 00            	ds.b	1
3879                     	xdef	_b10Hz
3880  0006               _b100Hz:
3881  0006 00            	ds.b	1
3882                     	xdef	_b100Hz
3883                     	xdef	_t0_cnt4
3884                     	xdef	_t0_cnt3
3885                     	xdef	_t0_cnt2
3886                     	xdef	_t0_cnt1
3887                     	xdef	_t0_cnt0
3888                     	xref	_pow
3889                     	xref	_isalnum
3890                     	xdef	_tx_stat
3891                     	switch	.const
3892  000a               L704:
3893  000a 41800000      	dc.w	16768,0
3894                     	xref.b	c_lreg
3895                     	xref.b	c_x
3915                     	xref	c_imul
3916                     	xref	c_ftoi
3917                     	xref	c_itof
3918                     	xref	c_xymvx
3919                     	xref	c_sdivx
3920                     	end
