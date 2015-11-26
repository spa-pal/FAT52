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
  46  000b               _power_net_cnt:
  47  000b 03            	dc.b	3
  48  000c               _rs485_cnt:
  49  000c 00            	dc.b	0
 108                     ; 120 void gran_char(signed char *adr, signed char min, signed char max)
 108                     ; 121 {
 110                     	switch	.text
 111  0000               _gran_char:
 113  0000 89            	pushw	x
 114       00000000      OFST:	set	0
 117                     ; 122 if (*adr<min) *adr=min;
 119  0001 9c            	rvf
 120  0002 f6            	ld	a,(x)
 121  0003 1105          	cp	a,(OFST+5,sp)
 122  0005 2e05          	jrsge	L73
 125  0007 7b05          	ld	a,(OFST+5,sp)
 126  0009 1e01          	ldw	x,(OFST+1,sp)
 127  000b f7            	ld	(x),a
 128  000c               L73:
 129                     ; 123 if (*adr>max)  *adr=max; 
 131  000c 9c            	rvf
 132  000d 1e01          	ldw	x,(OFST+1,sp)
 133  000f f6            	ld	a,(x)
 134  0010 1106          	cp	a,(OFST+6,sp)
 135  0012 2d05          	jrsle	L14
 138  0014 7b06          	ld	a,(OFST+6,sp)
 139  0016 1e01          	ldw	x,(OFST+1,sp)
 140  0018 f7            	ld	(x),a
 141  0019               L14:
 142                     ; 124 }
 145  0019 85            	popw	x
 146  001a 81            	ret
 199                     ; 127 void gran(signed short *adr, signed short min, signed short max)
 199                     ; 128 {
 200                     	switch	.text
 201  001b               _gran:
 203  001b 89            	pushw	x
 204       00000000      OFST:	set	0
 207                     ; 129 if (*adr<min) *adr=min;
 209  001c 9c            	rvf
 210  001d 9093          	ldw	y,x
 211  001f 51            	exgw	x,y
 212  0020 fe            	ldw	x,(x)
 213  0021 1305          	cpw	x,(OFST+5,sp)
 214  0023 51            	exgw	x,y
 215  0024 2e03          	jrsge	L17
 218  0026 1605          	ldw	y,(OFST+5,sp)
 219  0028 ff            	ldw	(x),y
 220  0029               L17:
 221                     ; 130 if (*adr>max)  *adr=max; 
 223  0029 9c            	rvf
 224  002a 1e01          	ldw	x,(OFST+1,sp)
 225  002c 9093          	ldw	y,x
 226  002e 51            	exgw	x,y
 227  002f fe            	ldw	x,(x)
 228  0030 1307          	cpw	x,(OFST+7,sp)
 229  0032 51            	exgw	x,y
 230  0033 2d05          	jrsle	L37
 233  0035 1e01          	ldw	x,(OFST+1,sp)
 234  0037 1607          	ldw	y,(OFST+7,sp)
 235  0039 ff            	ldw	(x),y
 236  003a               L37:
 237                     ; 131 }
 240  003a 85            	popw	x
 241  003b 81            	ret
 310                     .const:	section	.text
 311  0000               L21:
 312  0000 000186a0      	dc.l	100000
 313  0004               L41:
 314  0004 000f4240      	dc.l	1000000
 315  0008               L61:
 316  0008 00989680      	dc.l	10000000
 317                     ; 136 void matemath(void)
 317                     ; 137 {
 318                     	switch	.text
 319  003c               _matemath:
 321  003c 5205          	subw	sp,#5
 322       00000005      OFST:	set	5
 325                     ; 141 if(tot_pow_buff_ready)
 327  003e 725d0000      	tnz	_tot_pow_buff_ready
 328  0042 2603          	jrne	L02
 329  0044 cc0160        	jp	L721
 330  0047               L02:
 331                     ; 146 	temp_SL_=0;
 333  0047 ae0000        	ldw	x,#0
 334  004a 1f03          	ldw	(OFST-2,sp),x
 335  004c ae0000        	ldw	x,#0
 336  004f 1f01          	ldw	(OFST-4,sp),x
 337                     ; 147 	i=tot_pow_buff_cnt/*-1*/;
 339  0051 c60000        	ld	a,_tot_pow_buff_cnt
 340  0054 6b05          	ld	(OFST+0,sp),a
 341                     ; 149 	i--;
 343  0056 0a05          	dec	(OFST+0,sp)
 344                     ; 150 	temp_SL_+=(1L*(signed long)(tot_pow_buff[i]-0x30));
 346  0058 7b05          	ld	a,(OFST+0,sp)
 347  005a 5f            	clrw	x
 348  005b 97            	ld	xl,a
 349  005c d60000        	ld	a,(_tot_pow_buff,x)
 350  005f 5f            	clrw	x
 351  0060 97            	ld	xl,a
 352  0061 1d0030        	subw	x,#48
 353  0064 cd0000        	call	c_itolx
 355  0067 96            	ldw	x,sp
 356  0068 1c0001        	addw	x,#OFST-4
 357  006b cd0000        	call	c_lgadd
 359                     ; 152 	i--;
 361  006e 0a05          	dec	(OFST+0,sp)
 362                     ; 153 	temp_SL_+=(10L*(signed long)(tot_pow_buff[i]-0x30));
 364  0070 7b05          	ld	a,(OFST+0,sp)
 365  0072 5f            	clrw	x
 366  0073 97            	ld	xl,a
 367  0074 d60000        	ld	a,(_tot_pow_buff,x)
 368  0077 5f            	clrw	x
 369  0078 97            	ld	xl,a
 370  0079 1d0030        	subw	x,#48
 371  007c 90ae000a      	ldw	y,#10
 372  0080 cd0000        	call	c_vmul
 374  0083 96            	ldw	x,sp
 375  0084 1c0001        	addw	x,#OFST-4
 376  0087 cd0000        	call	c_lgadd
 378                     ; 155 	i--;
 380  008a 0a05          	dec	(OFST+0,sp)
 381                     ; 157 	i--;
 383  008c 0a05          	dec	(OFST+0,sp)
 384                     ; 158 	temp_SL_+=(100L*(signed long)(tot_pow_buff[i]-0x30));
 386  008e 7b05          	ld	a,(OFST+0,sp)
 387  0090 5f            	clrw	x
 388  0091 97            	ld	xl,a
 389  0092 d60000        	ld	a,(_tot_pow_buff,x)
 390  0095 5f            	clrw	x
 391  0096 97            	ld	xl,a
 392  0097 1d0030        	subw	x,#48
 393  009a 90ae0064      	ldw	y,#100
 394  009e cd0000        	call	c_vmul
 396  00a1 96            	ldw	x,sp
 397  00a2 1c0001        	addw	x,#OFST-4
 398  00a5 cd0000        	call	c_lgadd
 400                     ; 160 	if(i)
 402  00a8 0d05          	tnz	(OFST+0,sp)
 403  00aa 2603          	jrne	L22
 404  00ac cc0154        	jp	L131
 405  00af               L22:
 406                     ; 162 		i--;
 408  00af 0a05          	dec	(OFST+0,sp)
 409                     ; 163 		temp_SL_+=(1000L*(signed long)(tot_pow_buff[i]-0x30));
 411  00b1 7b05          	ld	a,(OFST+0,sp)
 412  00b3 5f            	clrw	x
 413  00b4 97            	ld	xl,a
 414  00b5 d60000        	ld	a,(_tot_pow_buff,x)
 415  00b8 5f            	clrw	x
 416  00b9 97            	ld	xl,a
 417  00ba 1d0030        	subw	x,#48
 418  00bd 90ae03e8      	ldw	y,#1000
 419  00c1 cd0000        	call	c_vmul
 421  00c4 96            	ldw	x,sp
 422  00c5 1c0001        	addw	x,#OFST-4
 423  00c8 cd0000        	call	c_lgadd
 425                     ; 164 		if(i)
 427  00cb 0d05          	tnz	(OFST+0,sp)
 428  00cd 2603          	jrne	L42
 429  00cf cc0154        	jp	L131
 430  00d2               L42:
 431                     ; 166 			i--;
 433  00d2 0a05          	dec	(OFST+0,sp)
 434                     ; 167 			temp_SL_+=(10000L*(signed long)(tot_pow_buff[i]-0x30));
 436  00d4 7b05          	ld	a,(OFST+0,sp)
 437  00d6 5f            	clrw	x
 438  00d7 97            	ld	xl,a
 439  00d8 d60000        	ld	a,(_tot_pow_buff,x)
 440  00db 5f            	clrw	x
 441  00dc 97            	ld	xl,a
 442  00dd 1d0030        	subw	x,#48
 443  00e0 90ae2710      	ldw	y,#10000
 444  00e4 cd0000        	call	c_vmul
 446  00e7 96            	ldw	x,sp
 447  00e8 1c0001        	addw	x,#OFST-4
 448  00eb cd0000        	call	c_lgadd
 450                     ; 168 			if(i)
 452  00ee 0d05          	tnz	(OFST+0,sp)
 453  00f0 2762          	jreq	L131
 454                     ; 170 				i--;
 456  00f2 0a05          	dec	(OFST+0,sp)
 457                     ; 171 				temp_SL_+=(100000L*(signed long)(tot_pow_buff[i]-0x30));
 459  00f4 7b05          	ld	a,(OFST+0,sp)
 460  00f6 5f            	clrw	x
 461  00f7 97            	ld	xl,a
 462  00f8 d60000        	ld	a,(_tot_pow_buff,x)
 463  00fb 5f            	clrw	x
 464  00fc 97            	ld	xl,a
 465  00fd 1d0030        	subw	x,#48
 466  0100 cd0000        	call	c_itolx
 468  0103 ae0000        	ldw	x,#L21
 469  0106 cd0000        	call	c_lmul
 471  0109 96            	ldw	x,sp
 472  010a 1c0001        	addw	x,#OFST-4
 473  010d cd0000        	call	c_lgadd
 475                     ; 172 				if(i)
 477  0110 0d05          	tnz	(OFST+0,sp)
 478  0112 2740          	jreq	L131
 479                     ; 174 					i--;
 481  0114 0a05          	dec	(OFST+0,sp)
 482                     ; 175 					temp_SL_+=(1000000L*(signed long)(tot_pow_buff[i]-0x30));
 484  0116 7b05          	ld	a,(OFST+0,sp)
 485  0118 5f            	clrw	x
 486  0119 97            	ld	xl,a
 487  011a d60000        	ld	a,(_tot_pow_buff,x)
 488  011d 5f            	clrw	x
 489  011e 97            	ld	xl,a
 490  011f 1d0030        	subw	x,#48
 491  0122 cd0000        	call	c_itolx
 493  0125 ae0004        	ldw	x,#L41
 494  0128 cd0000        	call	c_lmul
 496  012b 96            	ldw	x,sp
 497  012c 1c0001        	addw	x,#OFST-4
 498  012f cd0000        	call	c_lgadd
 500                     ; 176 					if(i)
 502  0132 0d05          	tnz	(OFST+0,sp)
 503  0134 271e          	jreq	L131
 504                     ; 178 						i--;
 506  0136 0a05          	dec	(OFST+0,sp)
 507                     ; 179 						temp_SL_+=(10000000L*(signed long)(tot_pow_buff[i]-0x30));
 509  0138 7b05          	ld	a,(OFST+0,sp)
 510  013a 5f            	clrw	x
 511  013b 97            	ld	xl,a
 512  013c d60000        	ld	a,(_tot_pow_buff,x)
 513  013f 5f            	clrw	x
 514  0140 97            	ld	xl,a
 515  0141 1d0030        	subw	x,#48
 516  0144 cd0000        	call	c_itolx
 518  0147 ae0008        	ldw	x,#L61
 519  014a cd0000        	call	c_lmul
 521  014d 96            	ldw	x,sp
 522  014e 1c0001        	addw	x,#OFST-4
 523  0151 cd0000        	call	c_lgadd
 525  0154               L131:
 526                     ; 186 	power_summary=temp_SL_;
 528  0154 1e03          	ldw	x,(OFST-2,sp)
 529  0156 bf02          	ldw	_power_summary+2,x
 530  0158 1e01          	ldw	x,(OFST-4,sp)
 531  015a bf00          	ldw	_power_summary,x
 532                     ; 187 	tot_pow_buff_ready=0;
 534  015c 725f0000      	clr	_tot_pow_buff_ready
 535  0160               L721:
 536                     ; 190 if(curr_pow_buff_ready)
 538  0160 725d0000      	tnz	_curr_pow_buff_ready
 539  0164 2603          	jrne	L62
 540  0166 cc0210        	jp	L341
 541  0169               L62:
 542                     ; 195 	temp_SL_=0;
 544  0169 ae0000        	ldw	x,#0
 545  016c 1f03          	ldw	(OFST-2,sp),x
 546  016e ae0000        	ldw	x,#0
 547  0171 1f01          	ldw	(OFST-4,sp),x
 548                     ; 196 	i=curr_pow_buff_cnt-3;
 550  0173 c60000        	ld	a,_curr_pow_buff_cnt
 551  0176 a003          	sub	a,#3
 552  0178 6b05          	ld	(OFST+0,sp),a
 553                     ; 198 	i--;
 555  017a 0a05          	dec	(OFST+0,sp)
 556                     ; 199 	temp_SL_+=(1L*(signed long)(curr_pow_buff[i]-0x30));
 558  017c 7b05          	ld	a,(OFST+0,sp)
 559  017e 5f            	clrw	x
 560  017f 97            	ld	xl,a
 561  0180 d60000        	ld	a,(_curr_pow_buff,x)
 562  0183 5f            	clrw	x
 563  0184 97            	ld	xl,a
 564  0185 1d0030        	subw	x,#48
 565  0188 cd0000        	call	c_itolx
 567  018b 96            	ldw	x,sp
 568  018c 1c0001        	addw	x,#OFST-4
 569  018f cd0000        	call	c_lgadd
 571                     ; 201 	i--;
 573  0192 0a05          	dec	(OFST+0,sp)
 574                     ; 202 	temp_SL_+=(10L*(signed long)(curr_pow_buff[i]-0x30));
 576  0194 7b05          	ld	a,(OFST+0,sp)
 577  0196 5f            	clrw	x
 578  0197 97            	ld	xl,a
 579  0198 d60000        	ld	a,(_curr_pow_buff,x)
 580  019b 5f            	clrw	x
 581  019c 97            	ld	xl,a
 582  019d 1d0030        	subw	x,#48
 583  01a0 90ae000a      	ldw	y,#10
 584  01a4 cd0000        	call	c_vmul
 586  01a7 96            	ldw	x,sp
 587  01a8 1c0001        	addw	x,#OFST-4
 588  01ab cd0000        	call	c_lgadd
 590                     ; 204 	i--;
 592  01ae 0a05          	dec	(OFST+0,sp)
 593                     ; 205 	temp_SL_+=(100L*(signed long)(curr_pow_buff[i]-0x30));
 595  01b0 7b05          	ld	a,(OFST+0,sp)
 596  01b2 5f            	clrw	x
 597  01b3 97            	ld	xl,a
 598  01b4 d60000        	ld	a,(_curr_pow_buff,x)
 599  01b7 5f            	clrw	x
 600  01b8 97            	ld	xl,a
 601  01b9 1d0030        	subw	x,#48
 602  01bc 90ae0064      	ldw	y,#100
 603  01c0 cd0000        	call	c_vmul
 605  01c3 96            	ldw	x,sp
 606  01c4 1c0001        	addw	x,#OFST-4
 607  01c7 cd0000        	call	c_lgadd
 609                     ; 207 	i--;
 611  01ca 0a05          	dec	(OFST+0,sp)
 612                     ; 209 	i--;	 
 614  01cc 0a05          	dec	(OFST+0,sp)
 615                     ; 210 	temp_SL_+=(1000L*(signed long)(curr_pow_buff[i]-0x30));
 617  01ce 7b05          	ld	a,(OFST+0,sp)
 618  01d0 5f            	clrw	x
 619  01d1 97            	ld	xl,a
 620  01d2 d60000        	ld	a,(_curr_pow_buff,x)
 621  01d5 5f            	clrw	x
 622  01d6 97            	ld	xl,a
 623  01d7 1d0030        	subw	x,#48
 624  01da 90ae03e8      	ldw	y,#1000
 625  01de cd0000        	call	c_vmul
 627  01e1 96            	ldw	x,sp
 628  01e2 1c0001        	addw	x,#OFST-4
 629  01e5 cd0000        	call	c_lgadd
 631                     ; 212 	if(i)
 633  01e8 0d05          	tnz	(OFST+0,sp)
 634  01ea 271c          	jreq	L541
 635                     ; 214 		i--;
 637  01ec 0a05          	dec	(OFST+0,sp)
 638                     ; 215 		temp_SL_+=(1000L*(signed long)(curr_pow_buff[i]-0x30));
 640  01ee 7b05          	ld	a,(OFST+0,sp)
 641  01f0 5f            	clrw	x
 642  01f1 97            	ld	xl,a
 643  01f2 d60000        	ld	a,(_curr_pow_buff,x)
 644  01f5 5f            	clrw	x
 645  01f6 97            	ld	xl,a
 646  01f7 1d0030        	subw	x,#48
 647  01fa 90ae03e8      	ldw	y,#1000
 648  01fe cd0000        	call	c_vmul
 650  0201 96            	ldw	x,sp
 651  0202 1c0001        	addw	x,#OFST-4
 652  0205 cd0000        	call	c_lgadd
 654  0208               L541:
 655                     ; 217 	power_current=(signed short)temp_SL_;
 657  0208 1e03          	ldw	x,(OFST-2,sp)
 658  020a bf00          	ldw	_power_current,x
 659                     ; 218 	curr_pow_buff_ready=0; 
 661  020c 725f0000      	clr	_curr_pow_buff_ready
 662  0210               L341:
 663                     ; 220 }
 666  0210 5b05          	addw	sp,#5
 667  0212 81            	ret
 690                     ; 225 void uart1_init (void)
 690                     ; 226 {
 691                     	switch	.text
 692  0213               _uart1_init:
 696                     ; 228 GPIOA->DDR&=~(1<<4);
 698  0213 72195002      	bres	20482,#4
 699                     ; 229 GPIOA->CR1|=(1<<4);
 701  0217 72185003      	bset	20483,#4
 702                     ; 230 GPIOA->CR2&=~(1<<4);
 704  021b 72195004      	bres	20484,#4
 705                     ; 233 GPIOA->DDR|=(1<<5);
 707  021f 721a5002      	bset	20482,#5
 708                     ; 234 GPIOA->CR1|=(1<<5);
 710  0223 721a5003      	bset	20483,#5
 711                     ; 235 GPIOA->CR2&=~(1<<5);	
 713  0227 721b5004      	bres	20484,#5
 714                     ; 238 GPIOB->DDR|=(1<<6);
 716  022b 721c5007      	bset	20487,#6
 717                     ; 239 GPIOB->CR1|=(1<<6);
 719  022f 721c5008      	bset	20488,#6
 720                     ; 240 GPIOB->CR2&=~(1<<6);
 722  0233 721d5009      	bres	20489,#6
 723                     ; 241 GPIOB->ODR|=(1<<6);		//—разу в 1
 725  0237 721c5005      	bset	20485,#6
 726                     ; 244 GPIOB->DDR|=(1<<7);
 728  023b 721e5007      	bset	20487,#7
 729                     ; 245 GPIOB->CR1|=(1<<7);
 731  023f 721e5008      	bset	20488,#7
 732                     ; 246 GPIOB->CR2&=~(1<<7);
 734  0243 721f5009      	bres	20489,#7
 735                     ; 248 UART1->CR1&=~UART1_CR1_M;					
 737  0247 72195234      	bres	21044,#4
 738                     ; 249 UART1->CR3|= (0<<4) & UART1_CR3_STOP;  	
 740  024b c65236        	ld	a,21046
 741                     ; 250 UART1->BRR2= 0x02;
 743  024e 35025233      	mov	21043,#2
 744                     ; 251 UART1->BRR1= 0x41;
 746  0252 35415232      	mov	21042,#65
 747                     ; 252 UART1->CR2|= UART1_CR2_TEN | UART1_CR2_REN | UART1_CR2_RIEN/*| UART2_CR2_TIEN*/ ;	
 749  0256 c65235        	ld	a,21045
 750  0259 aa2c          	or	a,#44
 751  025b c75235        	ld	21045,a
 752                     ; 253 }
 755  025e 81            	ret
 792                     ; 256 void putchar1(char c)
 792                     ; 257 {
 793                     	switch	.text
 794  025f               _putchar1:
 796  025f 88            	push	a
 797       00000000      OFST:	set	0
 800  0260               L771:
 801                     ; 258 while (tx_counter1 == TX_BUFFER_SIZE1);
 803  0260 b633          	ld	a,_tx_counter1
 804  0262 a132          	cp	a,#50
 805  0264 27fa          	jreq	L771
 806                     ; 260 if (tx_counter1 || ((UART1->SR & UART1_SR_TXE)==0))
 808  0266 3d33          	tnz	_tx_counter1
 809  0268 2607          	jrne	L502
 811  026a c65230        	ld	a,21040
 812  026d a580          	bcp	a,#128
 813  026f 2622          	jrne	L302
 814  0271               L502:
 815                     ; 262    tx_buffer1[tx_wr_index1]=c;
 817  0271 5f            	clrw	x
 818  0272 b632          	ld	a,_tx_wr_index1
 819  0274 2a01          	jrpl	L43
 820  0276 53            	cplw	x
 821  0277               L43:
 822  0277 97            	ld	xl,a
 823  0278 7b01          	ld	a,(OFST+1,sp)
 824  027a d70000        	ld	(_tx_buffer1,x),a
 825                     ; 263    if (++tx_wr_index1 == TX_BUFFER_SIZE1) tx_wr_index1=0;
 827  027d 3c32          	inc	_tx_wr_index1
 828  027f b632          	ld	a,_tx_wr_index1
 829  0281 a132          	cp	a,#50
 830  0283 2602          	jrne	L702
 833  0285 3f32          	clr	_tx_wr_index1
 834  0287               L702:
 835                     ; 264    ++tx_counter1;
 837  0287 3c33          	inc	_tx_counter1
 839  0289               L112:
 840                     ; 268 UART1->CR2|= UART1_CR2_TIEN | UART1_CR2_TCIEN;
 842  0289 c65235        	ld	a,21045
 843  028c aac0          	or	a,#192
 844  028e c75235        	ld	21045,a
 845                     ; 269 }
 848  0291 84            	pop	a
 849  0292 81            	ret
 850  0293               L302:
 851                     ; 266 else UART1->DR=c;
 853  0293 7b01          	ld	a,(OFST+1,sp)
 854  0295 c75231        	ld	21041,a
 855  0298 20ef          	jra	L112
 929                     ; 273 void uart1_out_adr(char *ptr, char len)
 929                     ; 274 {
 930                     	switch	.text
 931  029a               _uart1_out_adr:
 933  029a 89            	pushw	x
 934  029b 5220          	subw	sp,#32
 935       00000020      OFST:	set	32
 938                     ; 276 @near char i,t=0;
 940  029d 0f01          	clr	(OFST-31,sp)
 941                     ; 280 GPIOB->ODR|=(1<<7);
 943  029f 721e5005      	bset	20485,#7
 944                     ; 283 for(i=0;i<len;i++)
 946  02a3 0f20          	clr	(OFST+0,sp)
 948  02a5 201d          	jra	L552
 949  02a7               L152:
 950                     ; 285 	UOB1[i]=ptr[i];
 952  02a7 96            	ldw	x,sp
 953  02a8 1c0002        	addw	x,#OFST-30
 954  02ab 9f            	ld	a,xl
 955  02ac 5e            	swapw	x
 956  02ad 1b20          	add	a,(OFST+0,sp)
 957  02af 2401          	jrnc	L04
 958  02b1 5c            	incw	x
 959  02b2               L04:
 960  02b2 02            	rlwa	x,a
 961  02b3 89            	pushw	x
 962  02b4 7b23          	ld	a,(OFST+3,sp)
 963  02b6 97            	ld	xl,a
 964  02b7 7b24          	ld	a,(OFST+4,sp)
 965  02b9 1b22          	add	a,(OFST+2,sp)
 966  02bb 2401          	jrnc	L24
 967  02bd 5c            	incw	x
 968  02be               L24:
 969  02be 02            	rlwa	x,a
 970  02bf f6            	ld	a,(x)
 971  02c0 85            	popw	x
 972  02c1 f7            	ld	(x),a
 973                     ; 283 for(i=0;i<len;i++)
 975  02c2 0c20          	inc	(OFST+0,sp)
 976  02c4               L552:
 979  02c4 7b20          	ld	a,(OFST+0,sp)
 980  02c6 1125          	cp	a,(OFST+5,sp)
 981  02c8 25dd          	jrult	L152
 982                     ; 291 tx_stat=tsON;
 984  02ca 35010005      	mov	_tx_stat,#1
 985                     ; 293 for (i=0;i<len;i++)
 987  02ce 0f20          	clr	(OFST+0,sp)
 989  02d0 2012          	jra	L562
 990  02d2               L162:
 991                     ; 295 	putchar1(UOB1[i]);
 993  02d2 96            	ldw	x,sp
 994  02d3 1c0002        	addw	x,#OFST-30
 995  02d6 9f            	ld	a,xl
 996  02d7 5e            	swapw	x
 997  02d8 1b20          	add	a,(OFST+0,sp)
 998  02da 2401          	jrnc	L44
 999  02dc 5c            	incw	x
1000  02dd               L44:
1001  02dd 02            	rlwa	x,a
1002  02de f6            	ld	a,(x)
1003  02df cd025f        	call	_putchar1
1005                     ; 293 for (i=0;i<len;i++)
1007  02e2 0c20          	inc	(OFST+0,sp)
1008  02e4               L562:
1011  02e4 7b20          	ld	a,(OFST+0,sp)
1012  02e6 1125          	cp	a,(OFST+5,sp)
1013  02e8 25e8          	jrult	L162
1014                     ; 299 }
1017  02ea 5b22          	addw	sp,#34
1018  02ec 81            	ret
1053                     ; 306 char ascii2halFhex(char in)
1053                     ; 307 {
1054                     	switch	.text
1055  02ed               _ascii2halFhex:
1057  02ed 88            	push	a
1058       00000000      OFST:	set	0
1061                     ; 308 if(isalnum(in))
1063  02ee cd0000        	call	_isalnum
1065  02f1 4d            	tnz	a
1066  02f2 2739          	jreq	L703
1067                     ; 310 	if(isdigit(in))
1069  02f4 7b01          	ld	a,(OFST+1,sp)
1070  02f6 a130          	cp	a,#48
1071  02f8 250d          	jrult	L113
1073  02fa 7b01          	ld	a,(OFST+1,sp)
1074  02fc a13a          	cp	a,#58
1075  02fe 2407          	jruge	L113
1076                     ; 312 		return in-'0';
1078  0300 7b01          	ld	a,(OFST+1,sp)
1079  0302 a030          	sub	a,#48
1082  0304 5b01          	addw	sp,#1
1083  0306 81            	ret
1084  0307               L113:
1085                     ; 314 	if(islower(in))
1087  0307 7b01          	ld	a,(OFST+1,sp)
1088  0309 a161          	cp	a,#97
1089  030b 250d          	jrult	L313
1091  030d 7b01          	ld	a,(OFST+1,sp)
1092  030f a17b          	cp	a,#123
1093  0311 2407          	jruge	L313
1094                     ; 316 		return in-'a'+10;
1096  0313 7b01          	ld	a,(OFST+1,sp)
1097  0315 a057          	sub	a,#87
1100  0317 5b01          	addw	sp,#1
1101  0319 81            	ret
1102  031a               L313:
1103                     ; 318 	if(isupper(in))
1105  031a 7b01          	ld	a,(OFST+1,sp)
1106  031c a141          	cp	a,#65
1107  031e 250d          	jrult	L703
1109  0320 7b01          	ld	a,(OFST+1,sp)
1110  0322 a15b          	cp	a,#91
1111  0324 2407          	jruge	L703
1112                     ; 320 		return in-'A'+10;
1114  0326 7b01          	ld	a,(OFST+1,sp)
1115  0328 a037          	sub	a,#55
1118  032a 5b01          	addw	sp,#1
1119  032c 81            	ret
1120  032d               L703:
1121                     ; 323 }
1124  032d 5b01          	addw	sp,#1
1125  032f 81            	ret
1189                     ; 327 void ascii2hex(char *ptr_dst, char *ptr_src, short len)
1189                     ; 328 {
1190                     	switch	.text
1191  0330               _ascii2hex:
1193  0330 89            	pushw	x
1194  0331 5203          	subw	sp,#3
1195       00000003      OFST:	set	3
1198                     ; 331 for(i=0;i<len/2;i++)
1200  0333 5f            	clrw	x
1201  0334 1f02          	ldw	(OFST-1,sp),x
1203  0336 2029          	jra	L553
1204  0338               L153:
1205                     ; 333 	ptr_dst[i]=((ascii2halFhex(ptr_src[i*2]))<<4)+((ascii2halFhex(ptr_src[(i*2)+1])));
1207  0338 1e02          	ldw	x,(OFST-1,sp)
1208  033a 58            	sllw	x
1209  033b 72fb08        	addw	x,(OFST+5,sp)
1210  033e e601          	ld	a,(1,x)
1211  0340 adab          	call	_ascii2halFhex
1213  0342 6b01          	ld	(OFST-2,sp),a
1214  0344 1e02          	ldw	x,(OFST-1,sp)
1215  0346 58            	sllw	x
1216  0347 72fb08        	addw	x,(OFST+5,sp)
1217  034a f6            	ld	a,(x)
1218  034b ada0          	call	_ascii2halFhex
1220  034d 97            	ld	xl,a
1221  034e a610          	ld	a,#16
1222  0350 42            	mul	x,a
1223  0351 9f            	ld	a,xl
1224  0352 1b01          	add	a,(OFST-2,sp)
1225  0354 1e02          	ldw	x,(OFST-1,sp)
1226  0356 72fb04        	addw	x,(OFST+1,sp)
1227  0359 f7            	ld	(x),a
1228                     ; 331 for(i=0;i<len/2;i++)
1230  035a 1e02          	ldw	x,(OFST-1,sp)
1231  035c 1c0001        	addw	x,#1
1232  035f 1f02          	ldw	(OFST-1,sp),x
1233  0361               L553:
1236  0361 9c            	rvf
1237  0362 1e0a          	ldw	x,(OFST+7,sp)
1238  0364 a602          	ld	a,#2
1239  0366 cd0000        	call	c_sdivx
1241  0369 1302          	cpw	x,(OFST-1,sp)
1242  036b 2ccb          	jrsgt	L153
1243                     ; 337 }
1246  036d 5b05          	addw	sp,#5
1247  036f 81            	ret
1250                     	switch	.const
1251  000c               L163_temp:
1252  000c 00            	dc.b	0
1253  000d 00            	dc.b	0
1254  000e 00            	dc.b	0
1255  000f 00            	dc.b	0
1256  0010 00            	dc.b	0
1257  0011 00            	dc.b	0
1258  0012 00            	dc.b	0
1259  0013 00            	dc.b	0
1260  0014 00            	dc.b	0
1261  0015 00            	ds.b	1
1342                     ; 341 int str2int(char *ptr, char len)
1342                     ; 342 {
1343                     	switch	.text
1344  0370               _str2int:
1346  0370 89            	pushw	x
1347  0371 5210          	subw	sp,#16
1348       00000010      OFST:	set	16
1351                     ; 346 @near char temp[10]={0,0,0,0,0,0,0,0,0};
1353  0373 96            	ldw	x,sp
1354  0374 1c0005        	addw	x,#OFST-11
1355  0377 90ae000c      	ldw	y,#L163_temp
1356  037b a60a          	ld	a,#10
1357  037d cd0000        	call	c_xymvx
1359                     ; 347 @near int temp_out=0;
1361  0380 5f            	clrw	x
1362  0381 1f03          	ldw	(OFST-13,sp),x
1363                     ; 351 for (i=0;i<len;i++)
1365  0383 0f10          	clr	(OFST+0,sp)
1367  0385 ac160416      	jpf	L134
1368  0389               L524:
1369                     ; 353 	tt=*(ptr+i);
1371  0389 7b11          	ld	a,(OFST+1,sp)
1372  038b 97            	ld	xl,a
1373  038c 7b12          	ld	a,(OFST+2,sp)
1374  038e 1b10          	add	a,(OFST+0,sp)
1375  0390 2401          	jrnc	L45
1376  0392 5c            	incw	x
1377  0393               L45:
1378  0393 02            	rlwa	x,a
1379  0394 f6            	ld	a,(x)
1380  0395 6b0f          	ld	(OFST-1,sp),a
1381                     ; 355 	if(isalnum(tt/**(ptr+i)*/))
1383  0397 7b0f          	ld	a,(OFST-1,sp)
1384  0399 cd0000        	call	_isalnum
1386  039c 4d            	tnz	a
1387  039d 2775          	jreq	L534
1388                     ; 357 		if(isdigit(tt/**(ptr+i)*/))
1390  039f 7b0f          	ld	a,(OFST-1,sp)
1391  03a1 a130          	cp	a,#48
1392  03a3 2517          	jrult	L734
1394  03a5 7b0f          	ld	a,(OFST-1,sp)
1395  03a7 a13a          	cp	a,#58
1396  03a9 2411          	jruge	L734
1397                     ; 359 		temp[i]=tt/**(ptr+i)*/-'0';
1399  03ab 96            	ldw	x,sp
1400  03ac 1c0005        	addw	x,#OFST-11
1401  03af 9f            	ld	a,xl
1402  03b0 5e            	swapw	x
1403  03b1 1b10          	add	a,(OFST+0,sp)
1404  03b3 2401          	jrnc	L65
1405  03b5 5c            	incw	x
1406  03b6               L65:
1407  03b6 02            	rlwa	x,a
1408  03b7 7b0f          	ld	a,(OFST-1,sp)
1409  03b9 a030          	sub	a,#48
1410  03bb f7            	ld	(x),a
1411  03bc               L734:
1412                     ; 361 		if(islower(tt/**(ptr+i)*/))
1414  03bc 7b0f          	ld	a,(OFST-1,sp)
1415  03be a161          	cp	a,#97
1416  03c0 2517          	jrult	L144
1418  03c2 7b0f          	ld	a,(OFST-1,sp)
1419  03c4 a17b          	cp	a,#123
1420  03c6 2411          	jruge	L144
1421                     ; 363 		temp[i]=tt/**(ptr+i)*/-'a'+10;
1423  03c8 96            	ldw	x,sp
1424  03c9 1c0005        	addw	x,#OFST-11
1425  03cc 9f            	ld	a,xl
1426  03cd 5e            	swapw	x
1427  03ce 1b10          	add	a,(OFST+0,sp)
1428  03d0 2401          	jrnc	L06
1429  03d2 5c            	incw	x
1430  03d3               L06:
1431  03d3 02            	rlwa	x,a
1432  03d4 7b0f          	ld	a,(OFST-1,sp)
1433  03d6 a057          	sub	a,#87
1434  03d8 f7            	ld	(x),a
1435  03d9               L144:
1436                     ; 365 		if(isupper(tt/**(ptr+i)*/))
1438  03d9 7b0f          	ld	a,(OFST-1,sp)
1439  03db a141          	cp	a,#65
1440  03dd 2535          	jrult	L534
1442  03df 7b0f          	ld	a,(OFST-1,sp)
1443  03e1 a15b          	cp	a,#91
1444  03e3 242f          	jruge	L534
1445                     ; 367 		temp[i]=tt;
1447  03e5 96            	ldw	x,sp
1448  03e6 1c0005        	addw	x,#OFST-11
1449  03e9 9f            	ld	a,xl
1450  03ea 5e            	swapw	x
1451  03eb 1b10          	add	a,(OFST+0,sp)
1452  03ed 2401          	jrnc	L26
1453  03ef 5c            	incw	x
1454  03f0               L26:
1455  03f0 02            	rlwa	x,a
1456  03f1 7b0f          	ld	a,(OFST-1,sp)
1457  03f3 f7            	ld	(x),a
1458                     ; 368 		temp[i]-=/**(ptr+i)*/'A';
1460  03f4 96            	ldw	x,sp
1461  03f5 1c0005        	addw	x,#OFST-11
1462  03f8 9f            	ld	a,xl
1463  03f9 5e            	swapw	x
1464  03fa 1b10          	add	a,(OFST+0,sp)
1465  03fc 2401          	jrnc	L46
1466  03fe 5c            	incw	x
1467  03ff               L46:
1468  03ff 02            	rlwa	x,a
1469  0400 f6            	ld	a,(x)
1470  0401 a041          	sub	a,#65
1471  0403 f7            	ld	(x),a
1472                     ; 369 		temp[i]+=10;
1474  0404 96            	ldw	x,sp
1475  0405 1c0005        	addw	x,#OFST-11
1476  0408 9f            	ld	a,xl
1477  0409 5e            	swapw	x
1478  040a 1b10          	add	a,(OFST+0,sp)
1479  040c 2401          	jrnc	L66
1480  040e 5c            	incw	x
1481  040f               L66:
1482  040f 02            	rlwa	x,a
1483  0410 f6            	ld	a,(x)
1484  0411 ab0a          	add	a,#10
1485  0413 f7            	ld	(x),a
1486  0414               L534:
1487                     ; 351 for (i=0;i<len;i++)
1489  0414 0c10          	inc	(OFST+0,sp)
1490  0416               L134:
1493  0416 7b10          	ld	a,(OFST+0,sp)
1494  0418 1115          	cp	a,(OFST+5,sp)
1495  041a 2403          	jruge	L27
1496  041c cc0389        	jp	L524
1497  041f               L27:
1498                     ; 375 for(i=len;i;i--)
1500  041f 7b15          	ld	a,(OFST+5,sp)
1501  0421 6b10          	ld	(OFST+0,sp),a
1503  0423 2045          	jra	L154
1504  0425               L544:
1505                     ; 377 	temp_out+= ((int)pow(16,len-i))*temp[i-1]; 
1507  0425 7b15          	ld	a,(OFST+5,sp)
1508  0427 5f            	clrw	x
1509  0428 1010          	sub	a,(OFST+0,sp)
1510  042a 2401          	jrnc	L07
1511  042c 5a            	decw	x
1512  042d               L07:
1513  042d 02            	rlwa	x,a
1514  042e cd0000        	call	c_itof
1516  0431 be02          	ldw	x,c_lreg+2
1517  0433 89            	pushw	x
1518  0434 be00          	ldw	x,c_lreg
1519  0436 89            	pushw	x
1520  0437 ce001c        	ldw	x,L164+2
1521  043a 89            	pushw	x
1522  043b ce001a        	ldw	x,L164
1523  043e 89            	pushw	x
1524  043f cd0000        	call	_pow
1526  0442 5b08          	addw	sp,#8
1527  0444 cd0000        	call	c_ftoi
1529  0447 9096          	ldw	y,sp
1530  0449 72a90005      	addw	y,#OFST-11
1531  044d 1701          	ldw	(OFST-15,sp),y
1532  044f 7b10          	ld	a,(OFST+0,sp)
1533  0451 905f          	clrw	y
1534  0453 9097          	ld	yl,a
1535  0455 905a          	decw	y
1536  0457 72f901        	addw	y,(OFST-15,sp)
1537  045a 90f6          	ld	a,(y)
1538  045c 905f          	clrw	y
1539  045e 9097          	ld	yl,a
1540  0460 cd0000        	call	c_imul
1542  0463 72fb03        	addw	x,(OFST-13,sp)
1543  0466 1f03          	ldw	(OFST-13,sp),x
1544                     ; 375 for(i=len;i;i--)
1546  0468 0a10          	dec	(OFST+0,sp)
1547  046a               L154:
1550  046a 0d10          	tnz	(OFST+0,sp)
1551  046c 26b7          	jrne	L544
1552                     ; 382 return temp_out;
1554  046e 1e03          	ldw	x,(OFST-13,sp)
1557  0470 5b12          	addw	sp,#18
1558  0472 81            	ret
1586                     ; 386 void rx485_in_an(void)
1586                     ; 387 {
1587                     	switch	.text
1588  0473               _rx485_in_an:
1592                     ; 388 if(bRX485==1)
1594  0473 b603          	ld	a,_bRX485
1595  0475 a101          	cp	a,#1
1596  0477 2674          	jrne	L574
1597                     ; 390 	ascii2hex(&bat_mod_dump[0][0],&rx_buffer[13],40);
1599  0479 ae0028        	ldw	x,#40
1600  047c 89            	pushw	x
1601  047d ae003f        	ldw	x,#_rx_buffer+13
1602  0480 89            	pushw	x
1603  0481 ae0000        	ldw	x,#_bat_mod_dump
1604  0484 cd0330        	call	_ascii2hex
1606  0487 5b04          	addw	sp,#4
1607                     ; 391 	ascii2hex(&bat_mod_dump[1][0],&rx_buffer[13+40],40);
1609  0489 ae0028        	ldw	x,#40
1610  048c 89            	pushw	x
1611  048d ae0067        	ldw	x,#_rx_buffer+53
1612  0490 89            	pushw	x
1613  0491 ae0028        	ldw	x,#_bat_mod_dump+40
1614  0494 cd0330        	call	_ascii2hex
1616  0497 5b04          	addw	sp,#4
1617                     ; 392 	ascii2hex(&bat_mod_dump[2][0],&rx_buffer[13+80],40);
1619  0499 ae0028        	ldw	x,#40
1620  049c 89            	pushw	x
1621  049d ae008f        	ldw	x,#_rx_buffer+93
1622  04a0 89            	pushw	x
1623  04a1 ae0050        	ldw	x,#_bat_mod_dump+80
1624  04a4 cd0330        	call	_ascii2hex
1626  04a7 5b04          	addw	sp,#4
1627                     ; 393 	ascii2hex(&bat_mod_dump[3][0],&rx_buffer[13+120],40);
1629  04a9 ae0028        	ldw	x,#40
1630  04ac 89            	pushw	x
1631  04ad ae00b7        	ldw	x,#_rx_buffer+133
1632  04b0 89            	pushw	x
1633  04b1 ae0078        	ldw	x,#_bat_mod_dump+120
1634  04b4 cd0330        	call	_ascii2hex
1636  04b7 5b04          	addw	sp,#4
1637                     ; 394 	ascii2hex(&bat_mod_dump[4][0],&rx_buffer[13+160],40);
1639  04b9 ae0028        	ldw	x,#40
1640  04bc 89            	pushw	x
1641  04bd ae00df        	ldw	x,#_rx_buffer+173
1642  04c0 89            	pushw	x
1643  04c1 ae00a0        	ldw	x,#_bat_mod_dump+160
1644  04c4 cd0330        	call	_ascii2hex
1646  04c7 5b04          	addw	sp,#4
1647                     ; 395 	ascii2hex(&bat_mod_dump[5][0],&rx_buffer[13+200],40);
1649  04c9 ae0028        	ldw	x,#40
1650  04cc 89            	pushw	x
1651  04cd ae0107        	ldw	x,#_rx_buffer+213
1652  04d0 89            	pushw	x
1653  04d1 ae00c8        	ldw	x,#_bat_mod_dump+200
1654  04d4 cd0330        	call	_ascii2hex
1656  04d7 5b04          	addw	sp,#4
1657                     ; 396 	ascii2hex(&bat_mod_dump[6][0],&rx_buffer[13+240],40);
1659  04d9 ae0028        	ldw	x,#40
1660  04dc 89            	pushw	x
1661  04dd ae012f        	ldw	x,#_rx_buffer+253
1662  04e0 89            	pushw	x
1663  04e1 ae00f0        	ldw	x,#_bat_mod_dump+240
1664  04e4 cd0330        	call	_ascii2hex
1666  04e7 5b04          	addw	sp,#4
1667                     ; 400 	rs485_cnt=0;
1669  04e9 3f0c          	clr	_rs485_cnt
1671  04eb 2078          	jra	L774
1672  04ed               L574:
1673                     ; 404 else if(bRX485==2)
1675  04ed b603          	ld	a,_bRX485
1676  04ef a102          	cp	a,#2
1677  04f1 2672          	jrne	L774
1678                     ; 406 	ascii2hex(&bat_mod_dump[0][20],&rx_buffer[21],34);
1680  04f3 ae0022        	ldw	x,#34
1681  04f6 89            	pushw	x
1682  04f7 ae0047        	ldw	x,#_rx_buffer+21
1683  04fa 89            	pushw	x
1684  04fb ae0014        	ldw	x,#_bat_mod_dump+20
1685  04fe cd0330        	call	_ascii2hex
1687  0501 5b04          	addw	sp,#4
1688                     ; 407 	ascii2hex(&bat_mod_dump[1][20],&rx_buffer[21+34],34);
1690  0503 ae0022        	ldw	x,#34
1691  0506 89            	pushw	x
1692  0507 ae0069        	ldw	x,#_rx_buffer+55
1693  050a 89            	pushw	x
1694  050b ae003c        	ldw	x,#_bat_mod_dump+60
1695  050e cd0330        	call	_ascii2hex
1697  0511 5b04          	addw	sp,#4
1698                     ; 408 	ascii2hex(&bat_mod_dump[2][20],&rx_buffer[21+68],34);
1700  0513 ae0022        	ldw	x,#34
1701  0516 89            	pushw	x
1702  0517 ae008b        	ldw	x,#_rx_buffer+89
1703  051a 89            	pushw	x
1704  051b ae0064        	ldw	x,#_bat_mod_dump+100
1705  051e cd0330        	call	_ascii2hex
1707  0521 5b04          	addw	sp,#4
1708                     ; 409 	ascii2hex(&bat_mod_dump[3][20],&rx_buffer[21+102],34);
1710  0523 ae0022        	ldw	x,#34
1711  0526 89            	pushw	x
1712  0527 ae00ad        	ldw	x,#_rx_buffer+123
1713  052a 89            	pushw	x
1714  052b ae008c        	ldw	x,#_bat_mod_dump+140
1715  052e cd0330        	call	_ascii2hex
1717  0531 5b04          	addw	sp,#4
1718                     ; 410 	ascii2hex(&bat_mod_dump[4][20],&rx_buffer[21+136],34);
1720  0533 ae0022        	ldw	x,#34
1721  0536 89            	pushw	x
1722  0537 ae00cf        	ldw	x,#_rx_buffer+157
1723  053a 89            	pushw	x
1724  053b ae00b4        	ldw	x,#_bat_mod_dump+180
1725  053e cd0330        	call	_ascii2hex
1727  0541 5b04          	addw	sp,#4
1728                     ; 411 	ascii2hex(&bat_mod_dump[5][20],&rx_buffer[21+170],34);
1730  0543 ae0022        	ldw	x,#34
1731  0546 89            	pushw	x
1732  0547 ae00f1        	ldw	x,#_rx_buffer+191
1733  054a 89            	pushw	x
1734  054b ae00dc        	ldw	x,#_bat_mod_dump+220
1735  054e cd0330        	call	_ascii2hex
1737  0551 5b04          	addw	sp,#4
1738                     ; 412 	ascii2hex(&bat_mod_dump[6][20],&rx_buffer[21+204],34);
1740  0553 ae0022        	ldw	x,#34
1741  0556 89            	pushw	x
1742  0557 ae0113        	ldw	x,#_rx_buffer+225
1743  055a 89            	pushw	x
1744  055b ae0104        	ldw	x,#_bat_mod_dump+260
1745  055e cd0330        	call	_ascii2hex
1747  0561 5b04          	addw	sp,#4
1748                     ; 417 	rs485_cnt=0;	
1750  0563 3f0c          	clr	_rs485_cnt
1751  0565               L774:
1752                     ; 419 bRX485=0;	
1754  0565 3f03          	clr	_bRX485
1755                     ; 420 }
1758  0567 81            	ret
1781                     ; 423 void init_CAN(void) {
1782                     	switch	.text
1783  0568               _init_CAN:
1787                     ; 424 	CAN->MCR&=~CAN_MCR_SLEEP;					// CAN wake up request
1789  0568 72135420      	bres	21536,#1
1790                     ; 425 	CAN->MCR|= CAN_MCR_INRQ;					// CAN initialization request
1792  056c 72105420      	bset	21536,#0
1794  0570               L515:
1795                     ; 426 	while((CAN->MSR & CAN_MSR_INAK) == 0);	// waiting for CAN enter the init mode
1797  0570 c65421        	ld	a,21537
1798  0573 a501          	bcp	a,#1
1799  0575 27f9          	jreq	L515
1800                     ; 428 	CAN->MCR|= CAN_MCR_NART;					// no automatic retransmition
1802  0577 72185420      	bset	21536,#4
1803                     ; 430 	CAN->PSR= 2;							// *** FILTER 0 SETTINGS ***
1805  057b 35025427      	mov	21543,#2
1806                     ; 439 	CAN->Page.Filter01.F0R1= MY_MESS_STID>>3;			// 16 bits mode
1808  057f 35135428      	mov	21544,#19
1809                     ; 440 	CAN->Page.Filter01.F0R2= MY_MESS_STID<<5;
1811  0583 35c05429      	mov	21545,#192
1812                     ; 441 	CAN->Page.Filter01.F0R5= MY_MESS_STID_MASK>>3;
1814  0587 357f542c      	mov	21548,#127
1815                     ; 442 	CAN->Page.Filter01.F0R6= MY_MESS_STID_MASK<<5;
1817  058b 35e0542d      	mov	21549,#224
1818                     ; 445 	CAN->PSR= 6;									// set page 6
1820  058f 35065427      	mov	21543,#6
1821                     ; 450 	CAN->Page.Config.FMR1&=~3;								//mask mode
1823  0593 c65430        	ld	a,21552
1824  0596 a4fc          	and	a,#252
1825  0598 c75430        	ld	21552,a
1826                     ; 456 	CAN->Page.Config.FCR1= ((3<<1) & (CAN_FCR1_FSC00 | CAN_FCR1_FSC01));		//16 bit scale
1828  059b 35065432      	mov	21554,#6
1829                     ; 459 	CAN->Page.Config.FCR1|= CAN_FCR1_FACT0;	// filter 0 active
1831  059f 72105432      	bset	21554,#0
1832                     ; 462 	CAN->PSR= 6;								// *** BIT TIMING SETTINGS ***
1834  05a3 35065427      	mov	21543,#6
1835                     ; 464 	CAN->Page.Config.BTR1= 9;					// CAN_BTR1_BRP=9, 	tq= fcpu/(9+1)
1837  05a7 3509542c      	mov	21548,#9
1838                     ; 465 	CAN->Page.Config.BTR2= (1<<7)|(6<<4) | 7; 		// BS2=8, BS1=7, 		
1840  05ab 35e7542d      	mov	21549,#231
1841                     ; 467 	CAN->IER|=(1<<1);
1843  05af 72125425      	bset	21541,#1
1844                     ; 470 	CAN->MCR&=~CAN_MCR_INRQ;					// leave initialization request
1846  05b3 72115420      	bres	21536,#0
1848  05b7               L325:
1849                     ; 471 	while((CAN->MSR & CAN_MSR_INAK) != 0);	// waiting for CAN leave the init mode
1851  05b7 c65421        	ld	a,21537
1852  05ba a501          	bcp	a,#1
1853  05bc 26f9          	jrne	L325
1854                     ; 472 }
1857  05be 81            	ret
1965                     ; 475 void can_transmit(unsigned short id_st,char data0,char data1,char data2,char data3,char data4,char data5,char data6,char data7)
1965                     ; 476 {
1966                     	switch	.text
1967  05bf               _can_transmit:
1969  05bf 89            	pushw	x
1970       00000000      OFST:	set	0
1973                     ; 478 if((can_buff_wr_ptr<0)||(can_buff_wr_ptr>9))can_buff_wr_ptr=0;
1975  05c0 b629          	ld	a,_can_buff_wr_ptr
1976  05c2 a10a          	cp	a,#10
1977  05c4 2502          	jrult	L506
1980  05c6 3f29          	clr	_can_buff_wr_ptr
1981  05c8               L506:
1982                     ; 480 can_out_buff[can_buff_wr_ptr][0]=(char)(id_st>>6);
1984  05c8 b629          	ld	a,_can_buff_wr_ptr
1985  05ca 97            	ld	xl,a
1986  05cb a610          	ld	a,#16
1987  05cd 42            	mul	x,a
1988  05ce 1601          	ldw	y,(OFST+1,sp)
1989  05d0 a606          	ld	a,#6
1990  05d2               L201:
1991  05d2 9054          	srlw	y
1992  05d4 4a            	dec	a
1993  05d5 26fb          	jrne	L201
1994  05d7 909f          	ld	a,yl
1995  05d9 d7011d        	ld	(_can_out_buff,x),a
1996                     ; 481 can_out_buff[can_buff_wr_ptr][1]=(char)(id_st<<2);
1998  05dc b629          	ld	a,_can_buff_wr_ptr
1999  05de 97            	ld	xl,a
2000  05df a610          	ld	a,#16
2001  05e1 42            	mul	x,a
2002  05e2 7b02          	ld	a,(OFST+2,sp)
2003  05e4 48            	sll	a
2004  05e5 48            	sll	a
2005  05e6 d7011e        	ld	(_can_out_buff+1,x),a
2006                     ; 483 can_out_buff[can_buff_wr_ptr][2]=data0;
2008  05e9 b629          	ld	a,_can_buff_wr_ptr
2009  05eb 97            	ld	xl,a
2010  05ec a610          	ld	a,#16
2011  05ee 42            	mul	x,a
2012  05ef 7b05          	ld	a,(OFST+5,sp)
2013  05f1 d7011f        	ld	(_can_out_buff+2,x),a
2014                     ; 484 can_out_buff[can_buff_wr_ptr][3]=data1;
2016  05f4 b629          	ld	a,_can_buff_wr_ptr
2017  05f6 97            	ld	xl,a
2018  05f7 a610          	ld	a,#16
2019  05f9 42            	mul	x,a
2020  05fa 7b06          	ld	a,(OFST+6,sp)
2021  05fc d70120        	ld	(_can_out_buff+3,x),a
2022                     ; 485 can_out_buff[can_buff_wr_ptr][4]=data2;
2024  05ff b629          	ld	a,_can_buff_wr_ptr
2025  0601 97            	ld	xl,a
2026  0602 a610          	ld	a,#16
2027  0604 42            	mul	x,a
2028  0605 7b07          	ld	a,(OFST+7,sp)
2029  0607 d70121        	ld	(_can_out_buff+4,x),a
2030                     ; 486 can_out_buff[can_buff_wr_ptr][5]=data3;
2032  060a b629          	ld	a,_can_buff_wr_ptr
2033  060c 97            	ld	xl,a
2034  060d a610          	ld	a,#16
2035  060f 42            	mul	x,a
2036  0610 7b08          	ld	a,(OFST+8,sp)
2037  0612 d70122        	ld	(_can_out_buff+5,x),a
2038                     ; 487 can_out_buff[can_buff_wr_ptr][6]=data4;
2040  0615 b629          	ld	a,_can_buff_wr_ptr
2041  0617 97            	ld	xl,a
2042  0618 a610          	ld	a,#16
2043  061a 42            	mul	x,a
2044  061b 7b09          	ld	a,(OFST+9,sp)
2045  061d d70123        	ld	(_can_out_buff+6,x),a
2046                     ; 488 can_out_buff[can_buff_wr_ptr][7]=data5;
2048  0620 b629          	ld	a,_can_buff_wr_ptr
2049  0622 97            	ld	xl,a
2050  0623 a610          	ld	a,#16
2051  0625 42            	mul	x,a
2052  0626 7b0a          	ld	a,(OFST+10,sp)
2053  0628 d70124        	ld	(_can_out_buff+7,x),a
2054                     ; 489 can_out_buff[can_buff_wr_ptr][8]=data6;
2056  062b b629          	ld	a,_can_buff_wr_ptr
2057  062d 97            	ld	xl,a
2058  062e a610          	ld	a,#16
2059  0630 42            	mul	x,a
2060  0631 7b0b          	ld	a,(OFST+11,sp)
2061  0633 d70125        	ld	(_can_out_buff+8,x),a
2062                     ; 490 can_out_buff[can_buff_wr_ptr][9]=data7;
2064  0636 b629          	ld	a,_can_buff_wr_ptr
2065  0638 97            	ld	xl,a
2066  0639 a610          	ld	a,#16
2067  063b 42            	mul	x,a
2068  063c 7b0c          	ld	a,(OFST+12,sp)
2069  063e d70126        	ld	(_can_out_buff+9,x),a
2070                     ; 492 can_buff_wr_ptr++;
2072  0641 3c29          	inc	_can_buff_wr_ptr
2073                     ; 493 if(can_buff_wr_ptr>9)can_buff_wr_ptr=0;
2075  0643 b629          	ld	a,_can_buff_wr_ptr
2076  0645 a10a          	cp	a,#10
2077  0647 2502          	jrult	L706
2080  0649 3f29          	clr	_can_buff_wr_ptr
2081  064b               L706:
2082                     ; 494 } 
2085  064b 85            	popw	x
2086  064c 81            	ret
2115                     ; 497 void can_tx_hndl(void)
2115                     ; 498 {
2116                     	switch	.text
2117  064d               _can_tx_hndl:
2121                     ; 499 if(bTX_FREE)
2123  064d 3d07          	tnz	_bTX_FREE
2124  064f 2754          	jreq	L126
2125                     ; 501 	if(can_buff_rd_ptr!=can_buff_wr_ptr)
2127  0651 b628          	ld	a,_can_buff_rd_ptr
2128  0653 b129          	cp	a,_can_buff_wr_ptr
2129  0655 275c          	jreq	L726
2130                     ; 503 		bTX_FREE=0;
2132  0657 3f07          	clr	_bTX_FREE
2133                     ; 505 		CAN->PSR= 0;
2135  0659 725f5427      	clr	21543
2136                     ; 506 		CAN->Page.TxMailbox.MDLCR=8;
2138  065d 35085429      	mov	21545,#8
2139                     ; 507 		CAN->Page.TxMailbox.MIDR1=can_out_buff[can_buff_rd_ptr][0];
2141  0661 b628          	ld	a,_can_buff_rd_ptr
2142  0663 97            	ld	xl,a
2143  0664 a610          	ld	a,#16
2144  0666 42            	mul	x,a
2145  0667 d6011d        	ld	a,(_can_out_buff,x)
2146  066a c7542a        	ld	21546,a
2147                     ; 508 		CAN->Page.TxMailbox.MIDR2=can_out_buff[can_buff_rd_ptr][1];
2149  066d b628          	ld	a,_can_buff_rd_ptr
2150  066f 97            	ld	xl,a
2151  0670 a610          	ld	a,#16
2152  0672 42            	mul	x,a
2153  0673 d6011e        	ld	a,(_can_out_buff+1,x)
2154  0676 c7542b        	ld	21547,a
2155                     ; 510 		memcpy(&CAN->Page.TxMailbox.MDAR1, &can_out_buff[can_buff_rd_ptr][2],8);
2157  0679 b628          	ld	a,_can_buff_rd_ptr
2158  067b 97            	ld	xl,a
2159  067c a610          	ld	a,#16
2160  067e 42            	mul	x,a
2161  067f 1c011f        	addw	x,#_can_out_buff+2
2162  0682 bf00          	ldw	c_x,x
2163  0684 ae0008        	ldw	x,#8
2164  0687               L601:
2165  0687 5a            	decw	x
2166  0688 92d600        	ld	a,([c_x.w],x)
2167  068b d7542e        	ld	(21550,x),a
2168  068e 5d            	tnzw	x
2169  068f 26f6          	jrne	L601
2170                     ; 512 		can_buff_rd_ptr++;
2172  0691 3c28          	inc	_can_buff_rd_ptr
2173                     ; 513 		if(can_buff_rd_ptr>9)can_buff_rd_ptr=0;
2175  0693 b628          	ld	a,_can_buff_rd_ptr
2176  0695 a10a          	cp	a,#10
2177  0697 2502          	jrult	L526
2180  0699 3f28          	clr	_can_buff_rd_ptr
2181  069b               L526:
2182                     ; 515 		CAN->Page.TxMailbox.MCSR|= CAN_MCSR_TXRQ;
2184  069b 72105428      	bset	21544,#0
2185                     ; 516 		CAN->IER|=(1<<0);
2187  069f 72105425      	bset	21541,#0
2188  06a3 200e          	jra	L726
2189  06a5               L126:
2190                     ; 521 	tx_busy_cnt++;
2192  06a5 3c27          	inc	_tx_busy_cnt
2193                     ; 522 	if(tx_busy_cnt>=100)
2195  06a7 b627          	ld	a,_tx_busy_cnt
2196  06a9 a164          	cp	a,#100
2197  06ab 2506          	jrult	L726
2198                     ; 524 		tx_busy_cnt=0;
2200  06ad 3f27          	clr	_tx_busy_cnt
2201                     ; 525 		bTX_FREE=1;
2203  06af 35010007      	mov	_bTX_FREE,#1
2204  06b3               L726:
2205                     ; 528 }
2208  06b3 81            	ret
2241                     	switch	.const
2242  0016               L211:
2243  0016 00000100      	dc.l	256
2244                     ; 532 void can_in_an(void)
2244                     ; 533 {
2245                     	switch	.text
2246  06b4               _can_in_an:
2250                     ; 547 if((mess[6]==0xFF)&&(mess[7]==0xff)&&(mess[8]==MEM_KF))	
2252  06b4 b64e          	ld	a,_mess+6
2253  06b6 a1ff          	cp	a,#255
2254  06b8 266d          	jrne	L336
2256  06ba b64f          	ld	a,_mess+7
2257  06bc a1ff          	cp	a,#255
2258  06be 2667          	jrne	L336
2260  06c0 b650          	ld	a,_mess+8
2261  06c2 a162          	cp	a,#98
2262  06c4 2661          	jrne	L336
2263                     ; 549 	GPIOD->DDR|=(1<<7);
2265  06c6 721e5011      	bset	20497,#7
2266                     ; 550 	GPIOD->CR1|=(1<<7);
2268  06ca 721e5012      	bset	20498,#7
2269                     ; 551 	GPIOD->CR2&=~(1<<7);	
2271  06ce 721f5013      	bres	20499,#7
2272                     ; 552 	GPIOD->ODR^=(1<<7);
2274  06d2 c6500f        	ld	a,20495
2275  06d5 a880          	xor	a,	#128
2276  06d7 c7500f        	ld	20495,a
2277                     ; 553 	can_error_cnt=0;
2279  06da 3f26          	clr	_can_error_cnt
2280                     ; 555 	can_transmit(0x18e,MEM_KF,1,1,power_summary%256,power_summary/256,power_current%256,power_current/256,0);
2282  06dc 4b00          	push	#0
2283  06de be00          	ldw	x,_power_current
2284  06e0 90ae0100      	ldw	y,#256
2285  06e4 cd0000        	call	c_idiv
2287  06e7 9f            	ld	a,xl
2288  06e8 88            	push	a
2289  06e9 be00          	ldw	x,_power_current
2290  06eb 90ae0100      	ldw	y,#256
2291  06ef cd0000        	call	c_idiv
2293  06f2 51            	exgw	x,y
2294  06f3 9f            	ld	a,xl
2295  06f4 88            	push	a
2296  06f5 ae0000        	ldw	x,#_power_summary
2297  06f8 cd0000        	call	c_ltor
2299  06fb ae0016        	ldw	x,#L211
2300  06fe cd0000        	call	c_ldiv
2302  0701 b603          	ld	a,c_lreg+3
2303  0703 88            	push	a
2304  0704 ae0000        	ldw	x,#_power_summary
2305  0707 cd0000        	call	c_ltor
2307  070a ae0016        	ldw	x,#L211
2308  070d cd0000        	call	c_lmod
2310  0710 b603          	ld	a,c_lreg+3
2311  0712 88            	push	a
2312  0713 4b01          	push	#1
2313  0715 4b01          	push	#1
2314  0717 4b62          	push	#98
2315  0719 ae018e        	ldw	x,#398
2316  071c cd05bf        	call	_can_transmit
2318  071f 5b08          	addw	sp,#8
2319                     ; 557      link_cnt=0;
2321  0721 3f0c          	clr	_link_cnt
2322                     ; 558      link=ON;
2324  0723 3555000d      	mov	_link,#85
2325  0727               L336:
2326                     ; 566 can_in_an_end:
2326                     ; 567 bCAN_RX=0;
2328  0727 3f08          	clr	_bCAN_RX
2329                     ; 568 }   
2332  0729 81            	ret
2355                     ; 572 void t4_init(void){
2356                     	switch	.text
2357  072a               _t4_init:
2361                     ; 573 	TIM4->PSCR = 7;
2363  072a 35075345      	mov	21317,#7
2364                     ; 574 	TIM4->ARR= 77;
2366  072e 354d5346      	mov	21318,#77
2367                     ; 575 	TIM4->IER|= TIM4_IER_UIE;					// enable break interrupt
2369  0732 72105341      	bset	21313,#0
2370                     ; 577 	TIM4->CR1=(TIM4_CR1_URS | TIM4_CR1_CEN | TIM4_CR1_ARPE);	
2372  0736 35855340      	mov	21312,#133
2373                     ; 579 }
2376  073a 81            	ret
2412                     ; 585 @far @interrupt void TIM4_UPD_Interrupt (void) 
2412                     ; 586 {
2414                     	switch	.text
2415  073b               f_TIM4_UPD_Interrupt:
2419                     ; 587 TIM4->SR1&=~TIM4_SR1_UIF;
2421  073b 72115342      	bres	21314,#0
2422                     ; 590 if(++t0_cnt0>=10)
2424  073f 3c00          	inc	_t0_cnt0
2425  0741 b600          	ld	a,_t0_cnt0
2426  0743 a10a          	cp	a,#10
2427  0745 253e          	jrult	L176
2428                     ; 592 	t0_cnt0=0;
2430  0747 3f00          	clr	_t0_cnt0
2431                     ; 593 	b100Hz=1;
2433  0749 72100006      	bset	_b100Hz
2434                     ; 595 	if(++t0_cnt1>=10)
2436  074d 3c01          	inc	_t0_cnt1
2437  074f b601          	ld	a,_t0_cnt1
2438  0751 a10a          	cp	a,#10
2439  0753 2506          	jrult	L376
2440                     ; 597 		t0_cnt1=0;
2442  0755 3f01          	clr	_t0_cnt1
2443                     ; 598 		b10Hz=1;
2445  0757 72100005      	bset	_b10Hz
2446  075b               L376:
2447                     ; 601 	if(++t0_cnt2>=20)
2449  075b 3c02          	inc	_t0_cnt2
2450  075d b602          	ld	a,_t0_cnt2
2451  075f a114          	cp	a,#20
2452  0761 2506          	jrult	L576
2453                     ; 603 		t0_cnt2=0;
2455  0763 3f02          	clr	_t0_cnt2
2456                     ; 604 		b5Hz=1;
2458  0765 72100004      	bset	_b5Hz
2459  0769               L576:
2460                     ; 608 	if(++t0_cnt4>=50)
2462  0769 3c04          	inc	_t0_cnt4
2463  076b b604          	ld	a,_t0_cnt4
2464  076d a132          	cp	a,#50
2465  076f 2506          	jrult	L776
2466                     ; 610 		t0_cnt4=0;
2468  0771 3f04          	clr	_t0_cnt4
2469                     ; 611 		b2Hz=1;
2471  0773 72100003      	bset	_b2Hz
2472  0777               L776:
2473                     ; 614 	if(++t0_cnt3>=100)
2475  0777 3c03          	inc	_t0_cnt3
2476  0779 b603          	ld	a,_t0_cnt3
2477  077b a164          	cp	a,#100
2478  077d 2506          	jrult	L176
2479                     ; 616 		t0_cnt3=0;
2481  077f 3f03          	clr	_t0_cnt3
2482                     ; 617 		b1Hz=1;
2484  0781 72100002      	bset	_b1Hz
2485  0785               L176:
2486                     ; 620 if(delayCnt)delayCnt--;
2488  0785 be00          	ldw	x,_delayCnt
2489  0787 2707          	jreq	L307
2492  0789 be00          	ldw	x,_delayCnt
2493  078b 1d0001        	subw	x,#1
2494  078e bf00          	ldw	_delayCnt,x
2495  0790               L307:
2496                     ; 624 if(tx_stat_cnt)
2498  0790 725d01dd      	tnz	_tx_stat_cnt
2499  0794 270c          	jreq	L507
2500                     ; 626 	tx_stat_cnt--;
2502  0796 725a01dd      	dec	_tx_stat_cnt
2503                     ; 627 	if(tx_stat_cnt==0)tx_stat=tsOFF;
2505  079a 725d01dd      	tnz	_tx_stat_cnt
2506  079e 2602          	jrne	L507
2509  07a0 3f05          	clr	_tx_stat
2510  07a2               L507:
2511                     ; 642 }
2514  07a2 80            	iret
2539                     ; 645 @far @interrupt void CAN_RX_Interrupt (void) 
2539                     ; 646 {
2540                     	switch	.text
2541  07a3               f_CAN_RX_Interrupt:
2545                     ; 656 CAN->PSR= 7;
2547  07a3 35075427      	mov	21543,#7
2548                     ; 665 memcpy(&mess[0], &CAN->Page.RxFIFO.MFMI, 14); // compare the message content
2550  07a7 ae000e        	ldw	x,#14
2551  07aa               L221:
2552  07aa d65427        	ld	a,(21543,x)
2553  07ad e747          	ld	(_mess-1,x),a
2554  07af 5a            	decw	x
2555  07b0 26f8          	jrne	L221
2556                     ; 676 bCAN_RX=1;
2558  07b2 35010008      	mov	_bCAN_RX,#1
2559                     ; 677 CAN->RFR|=(1<<5);
2561  07b6 721a5424      	bset	21540,#5
2562                     ; 679 }
2565  07ba 80            	iret
2588                     ; 682 @far @interrupt void CAN_TX_Interrupt (void) 
2588                     ; 683 {
2589                     	switch	.text
2590  07bb               f_CAN_TX_Interrupt:
2594                     ; 684 	if((CAN->TSR)&(1<<0))
2596  07bb c65422        	ld	a,21538
2597  07be a501          	bcp	a,#1
2598  07c0 2708          	jreq	L137
2599                     ; 686 	bTX_FREE=1;	
2601  07c2 35010007      	mov	_bTX_FREE,#1
2602                     ; 688 	CAN->TSR|=(1<<0);
2604  07c6 72105422      	bset	21538,#0
2605  07ca               L137:
2606                     ; 690 }
2609  07ca 80            	iret
2647                     ; 694 @far @interrupt void UART1TxInterrupt (void) 
2647                     ; 695 {
2648                     	switch	.text
2649  07cb               f_UART1TxInterrupt:
2651       00000001      OFST:	set	1
2652  07cb 88            	push	a
2655                     ; 698 tx_status=UART1->SR;
2657  07cc c65230        	ld	a,21040
2658  07cf 6b01          	ld	(OFST+0,sp),a
2659                     ; 700 if (tx_status & (UART1_SR_TXE))
2661  07d1 7b01          	ld	a,(OFST+0,sp)
2662  07d3 a580          	bcp	a,#128
2663  07d5 272b          	jreq	L157
2664                     ; 702 	if (tx_counter1)
2666  07d7 3d33          	tnz	_tx_counter1
2667  07d9 271b          	jreq	L357
2668                     ; 704 		--tx_counter1;
2670  07db 3a33          	dec	_tx_counter1
2671                     ; 705 		UART1->DR=tx_buffer1[tx_rd_index1];
2673  07dd 5f            	clrw	x
2674  07de b631          	ld	a,_tx_rd_index1
2675  07e0 2a01          	jrpl	L031
2676  07e2 53            	cplw	x
2677  07e3               L031:
2678  07e3 97            	ld	xl,a
2679  07e4 d60000        	ld	a,(_tx_buffer1,x)
2680  07e7 c75231        	ld	21041,a
2681                     ; 706 		if (++tx_rd_index1 == TX_BUFFER_SIZE1) tx_rd_index1=0;
2683  07ea 3c31          	inc	_tx_rd_index1
2684  07ec b631          	ld	a,_tx_rd_index1
2685  07ee a132          	cp	a,#50
2686  07f0 2610          	jrne	L157
2689  07f2 3f31          	clr	_tx_rd_index1
2690  07f4 200c          	jra	L157
2691  07f6               L357:
2692                     ; 710 		tx_stat_cnt=3;
2694  07f6 350301dd      	mov	_tx_stat_cnt,#3
2695                     ; 711 			bOUT_FREE=1;
2697  07fa 3501002a      	mov	_bOUT_FREE,#1
2698                     ; 712 			UART1->CR2&= ~UART1_CR2_TIEN;
2700  07fe 721f5235      	bres	21045,#7
2701  0802               L157:
2702                     ; 716 if (tx_status & (UART1_SR_TC))
2704  0802 7b01          	ld	a,(OFST+0,sp)
2705  0804 a540          	bcp	a,#64
2706  0806 2708          	jreq	L167
2707                     ; 718 	GPIOB->ODR&=~(1<<7);
2709  0808 721f5005      	bres	20485,#7
2710                     ; 719 	UART1->SR&=~UART1_SR_TC;
2712  080c 721d5230      	bres	21040,#6
2713  0810               L167:
2714                     ; 721 }
2717  0810 84            	pop	a
2718  0811 80            	iret
2782                     ; 724 @far @interrupt void UART1RxInterrupt (void) 
2782                     ; 725 {
2783                     	switch	.text
2784  0812               f_UART1RxInterrupt:
2786       00000003      OFST:	set	3
2787  0812 5203          	subw	sp,#3
2790                     ; 728 rx_status=UART1->SR;
2792  0814 c65230        	ld	a,21040
2793  0817 6b02          	ld	(OFST-1,sp),a
2794                     ; 729 rx_data=UART1->DR;
2796  0819 c65231        	ld	a,21041
2797  081c 6b03          	ld	(OFST+0,sp),a
2798                     ; 739 if ((rx_status & (UART1_SR_RXNE))&&(tx_stat!=tsON))
2800  081e 7b02          	ld	a,(OFST-1,sp)
2801  0820 a520          	bcp	a,#32
2802  0822 2604          	jrne	L431
2803  0824 ac000a00      	jpf	L1101
2804  0828               L431:
2806  0828 b605          	ld	a,_tx_stat
2807  082a a101          	cp	a,#1
2808  082c 2604          	jrne	L631
2809  082e ac000a00      	jpf	L1101
2810  0832               L631:
2811                     ; 744 	temp=rx_data;
2813                     ; 745 	rx_buffer[rx_wr_index1]=rx_data;
2815  0832 7b03          	ld	a,(OFST+0,sp)
2816  0834 be2d          	ldw	x,_rx_wr_index1
2817  0836 d70032        	ld	(_rx_buffer,x),a
2818                     ; 748 	if(rx_read_power_cnt_phase==1)
2820  0839 b600          	ld	a,_rx_read_power_cnt_phase
2821  083b a101          	cp	a,#1
2822  083d 2625          	jrne	L3101
2823                     ; 750 		if((rx_buffer[rx_wr_index1]==0x0a)&&(rx_buffer[6]==0xc5))
2825  083f be2d          	ldw	x,_rx_wr_index1
2826  0841 d60032        	ld	a,(_rx_buffer,x)
2827  0844 a10a          	cp	a,#10
2828  0846 2704          	jreq	L041
2829  0848 acf909f9      	jpf	L7101
2830  084c               L041:
2832  084c c60038        	ld	a,_rx_buffer+6
2833  084f a1c5          	cp	a,#197
2834  0851 2704          	jreq	L241
2835  0853 acf909f9      	jpf	L7101
2836  0857               L241:
2837                     ; 752 			rx_read_power_cnt_phase=2;
2839  0857 35020000      	mov	_rx_read_power_cnt_phase,#2
2840                     ; 753 			delayCnt=10;
2842  085b ae000a        	ldw	x,#10
2843  085e bf00          	ldw	_delayCnt,x
2844  0860 acf909f9      	jpf	L7101
2845  0864               L3101:
2846                     ; 760 	else if(rx_read_power_cnt_phase==3)
2848  0864 b600          	ld	a,_rx_read_power_cnt_phase
2849  0866 a103          	cp	a,#3
2850  0868 2620          	jrne	L1201
2851                     ; 762 		if(/*(rx_wr_index1==6)/*&&*/
2851                     ; 763 		(rx_buffer[rx_wr_index1]==0x03)&&(rx_buffer[0]==0x81))
2853  086a be2d          	ldw	x,_rx_wr_index1
2854  086c d60032        	ld	a,(_rx_buffer,x)
2855  086f a103          	cp	a,#3
2856  0871 2704          	jreq	L441
2857  0873 acf909f9      	jpf	L7101
2858  0877               L441:
2860  0877 c60032        	ld	a,_rx_buffer
2861  087a a181          	cp	a,#129
2862  087c 2704          	jreq	L641
2863  087e acf909f9      	jpf	L7101
2864  0882               L641:
2865                     ; 765 			rx_read_power_cnt_phase=4;
2867  0882 35040000      	mov	_rx_read_power_cnt_phase,#4
2868  0886 acf909f9      	jpf	L7101
2869  088a               L1201:
2870                     ; 769 	else if(rx_read_power_cnt_phase==4)
2872  088a b600          	ld	a,_rx_read_power_cnt_phase
2873  088c a104          	cp	a,#4
2874  088e 260d          	jrne	L7201
2875                     ; 773 			rx_read_power_cnt_phase=5;
2877  0890 35050000      	mov	_rx_read_power_cnt_phase,#5
2878                     ; 774 			delayCnt=10;
2880  0894 ae000a        	ldw	x,#10
2881  0897 bf00          	ldw	_delayCnt,x
2883  0899 acf909f9      	jpf	L7101
2884  089d               L7201:
2885                     ; 778 	else if(rx_read_power_cnt_phase==6)
2887  089d b600          	ld	a,_rx_read_power_cnt_phase
2888  089f a106          	cp	a,#6
2889  08a1 2643          	jrne	L3301
2890                     ; 780 		if(((rx_buffer[rx_wr_index1]&0x7f)=='('))
2892  08a3 be2d          	ldw	x,_rx_wr_index1
2893  08a5 d60032        	ld	a,(_rx_buffer,x)
2894  08a8 a47f          	and	a,#127
2895  08aa a128          	cp	a,#40
2896  08ac 2704          	jreq	L051
2897  08ae acf909f9      	jpf	L7101
2898  08b2               L051:
2899                     ; 782 			rx_read_power_cnt_phase=7;
2901  08b2 35070000      	mov	_rx_read_power_cnt_phase,#7
2902                     ; 783 			tot_pow_buff_ptr=0;
2904  08b6 725f0000      	clr	_tot_pow_buff_ptr
2905                     ; 784 			tot_pow_buff[0]=0;
2907  08ba 725f0000      	clr	_tot_pow_buff
2908                     ; 785 			tot_pow_buff[1]=0;
2910  08be 725f0001      	clr	_tot_pow_buff+1
2911                     ; 786 			tot_pow_buff[2]=0;
2913  08c2 725f0002      	clr	_tot_pow_buff+2
2914                     ; 787 			tot_pow_buff[3]=0;
2916  08c6 725f0003      	clr	_tot_pow_buff+3
2917                     ; 788 			tot_pow_buff[4]=0;
2919  08ca 725f0004      	clr	_tot_pow_buff+4
2920                     ; 789 			tot_pow_buff[5]=0;
2922  08ce 725f0005      	clr	_tot_pow_buff+5
2923                     ; 790 			tot_pow_buff[6]=0;
2925  08d2 725f0006      	clr	_tot_pow_buff+6
2926                     ; 791 			tot_pow_buff[7]=0;
2928  08d6 725f0007      	clr	_tot_pow_buff+7
2929                     ; 792 			tot_pow_buff[8]=0;
2931  08da 725f0008      	clr	_tot_pow_buff+8
2932                     ; 793 			tot_pow_buff[9]=0;
2934  08de 725f0009      	clr	_tot_pow_buff+9
2935  08e2 acf909f9      	jpf	L7101
2936  08e6               L3301:
2937                     ; 799 	else if(rx_read_power_cnt_phase==7)
2939  08e6 b600          	ld	a,_rx_read_power_cnt_phase
2940  08e8 a107          	cp	a,#7
2941  08ea 2635          	jrne	L1401
2942                     ; 801 		if(((rx_buffer[rx_wr_index1]&0x7f)==')'))
2944  08ec be2d          	ldw	x,_rx_wr_index1
2945  08ee d60032        	ld	a,(_rx_buffer,x)
2946  08f1 a47f          	and	a,#127
2947  08f3 a129          	cp	a,#41
2948  08f5 2611          	jrne	L3401
2949                     ; 803 			rx_read_power_cnt_phase=8;
2951  08f7 35080000      	mov	_rx_read_power_cnt_phase,#8
2952                     ; 804 			tot_pow_buff_cnt=tot_pow_buff_ptr;
2954  08fb 5500000000    	mov	_tot_pow_buff_cnt,_tot_pow_buff_ptr
2955                     ; 805 			tot_pow_buff_ready=1;
2957  0900 35010000      	mov	_tot_pow_buff_ready,#1
2959  0904 acf909f9      	jpf	L7101
2960  0908               L3401:
2961                     ; 810 			tot_pow_buff[tot_pow_buff_ptr]=(rx_buffer[rx_wr_index1]&0x7f);
2963  0908 c60000        	ld	a,_tot_pow_buff_ptr
2964  090b 5f            	clrw	x
2965  090c 97            	ld	xl,a
2966  090d 90be2d        	ldw	y,_rx_wr_index1
2967  0910 90d60032      	ld	a,(_rx_buffer,y)
2968  0914 a47f          	and	a,#127
2969  0916 d70000        	ld	(_tot_pow_buff,x),a
2970                     ; 811 			tot_pow_buff_ptr++;
2972  0919 725c0000      	inc	_tot_pow_buff_ptr
2973  091d acf909f9      	jpf	L7101
2974  0921               L1401:
2975                     ; 815 	else if(rx_read_power_cnt_phase==8)
2977  0921 b600          	ld	a,_rx_read_power_cnt_phase
2978  0923 a108          	cp	a,#8
2979  0925 2617          	jrne	L1501
2980                     ; 817 		if(((rx_buffer[rx_wr_index1]&0x7f)==0x03))
2982  0927 be2d          	ldw	x,_rx_wr_index1
2983  0929 d60032        	ld	a,(_rx_buffer,x)
2984  092c a47f          	and	a,#127
2985  092e a103          	cp	a,#3
2986  0930 2704          	jreq	L251
2987  0932 acf909f9      	jpf	L7101
2988  0936               L251:
2989                     ; 819 			rx_read_power_cnt_phase=9;
2991  0936 35090000      	mov	_rx_read_power_cnt_phase,#9
2992  093a acf909f9      	jpf	L7101
2993  093e               L1501:
2994                     ; 822 	else if(rx_read_power_cnt_phase==9)
2996  093e b600          	ld	a,_rx_read_power_cnt_phase
2997  0940 a109          	cp	a,#9
2998  0942 260d          	jrne	L7501
2999                     ; 826 			rx_read_power_cnt_phase=10;
3001  0944 350a0000      	mov	_rx_read_power_cnt_phase,#10
3002                     ; 827 			delayCnt=10;
3004  0948 ae000a        	ldw	x,#10
3005  094b bf00          	ldw	_delayCnt,x
3007  094d acf909f9      	jpf	L7101
3008  0951               L7501:
3009                     ; 831 	else if(rx_read_power_cnt_phase==11)
3011  0951 b600          	ld	a,_rx_read_power_cnt_phase
3012  0953 a10b          	cp	a,#11
3013  0955 263d          	jrne	L3601
3014                     ; 833 		if(((rx_buffer[rx_wr_index1]&0x7f)=='('))
3016  0957 be2d          	ldw	x,_rx_wr_index1
3017  0959 d60032        	ld	a,(_rx_buffer,x)
3018  095c a47f          	and	a,#127
3019  095e a128          	cp	a,#40
3020  0960 26eb          	jrne	L7101
3021                     ; 835 			rx_read_power_cnt_phase=12;
3023  0962 350c0000      	mov	_rx_read_power_cnt_phase,#12
3024                     ; 836 			curr_pow_buff_ptr=0;
3026  0966 725f0000      	clr	_curr_pow_buff_ptr
3027                     ; 837 			curr_pow_buff[0]=0;
3029  096a 725f0000      	clr	_curr_pow_buff
3030                     ; 838 			curr_pow_buff[1]=0;
3032  096e 725f0001      	clr	_curr_pow_buff+1
3033                     ; 839 			curr_pow_buff[2]=0;
3035  0972 725f0002      	clr	_curr_pow_buff+2
3036                     ; 840 			curr_pow_buff[3]=0;
3038  0976 725f0003      	clr	_curr_pow_buff+3
3039                     ; 841 			curr_pow_buff[4]=0;
3041  097a 725f0004      	clr	_curr_pow_buff+4
3042                     ; 842 			curr_pow_buff[5]=0;
3044  097e 725f0005      	clr	_curr_pow_buff+5
3045                     ; 843 			curr_pow_buff[6]=0;
3047  0982 725f0006      	clr	_curr_pow_buff+6
3048                     ; 844 			curr_pow_buff[7]=0;
3050  0986 725f0007      	clr	_curr_pow_buff+7
3051                     ; 845 			curr_pow_buff[8]=0;
3053  098a 725f0008      	clr	_curr_pow_buff+8
3054                     ; 846 			curr_pow_buff[9]=0;
3056  098e 725f0009      	clr	_curr_pow_buff+9
3057  0992 2065          	jra	L7101
3058  0994               L3601:
3059                     ; 851 	else if(rx_read_power_cnt_phase==12)
3061  0994 b600          	ld	a,_rx_read_power_cnt_phase
3062  0996 a10c          	cp	a,#12
3063  0998 2631          	jrne	L1701
3064                     ; 853 		if(((rx_buffer[rx_wr_index1]&0x7f)==')'))
3066  099a be2d          	ldw	x,_rx_wr_index1
3067  099c d60032        	ld	a,(_rx_buffer,x)
3068  099f a47f          	and	a,#127
3069  09a1 a129          	cp	a,#41
3070  09a3 260f          	jrne	L3701
3071                     ; 855 			rx_read_power_cnt_phase=13;
3073  09a5 350d0000      	mov	_rx_read_power_cnt_phase,#13
3074                     ; 856 			curr_pow_buff_cnt=curr_pow_buff_ptr;
3076  09a9 5500000000    	mov	_curr_pow_buff_cnt,_curr_pow_buff_ptr
3077                     ; 857 			curr_pow_buff_ready=1;
3079  09ae 35010000      	mov	_curr_pow_buff_ready,#1
3081  09b2 2045          	jra	L7101
3082  09b4               L3701:
3083                     ; 861 			curr_pow_buff[curr_pow_buff_ptr]=(rx_buffer[rx_wr_index1]&0x7f);
3085  09b4 c60000        	ld	a,_curr_pow_buff_ptr
3086  09b7 5f            	clrw	x
3087  09b8 97            	ld	xl,a
3088  09b9 90be2d        	ldw	y,_rx_wr_index1
3089  09bc 90d60032      	ld	a,(_rx_buffer,y)
3090  09c0 a47f          	and	a,#127
3091  09c2 d70000        	ld	(_curr_pow_buff,x),a
3092                     ; 862 			curr_pow_buff_ptr++;
3094  09c5 725c0000      	inc	_curr_pow_buff_ptr
3095  09c9 202e          	jra	L7101
3096  09cb               L1701:
3097                     ; 867 	else if(rx_read_power_cnt_phase==13)
3099  09cb b600          	ld	a,_rx_read_power_cnt_phase
3100  09cd a10d          	cp	a,#13
3101  09cf 2628          	jrne	L7101
3102                     ; 869 		if(((rx_buffer[rx_wr_index1]&0x7f)==0x03))
3104  09d1 be2d          	ldw	x,_rx_wr_index1
3105  09d3 d60032        	ld	a,(_rx_buffer,x)
3106  09d6 a47f          	and	a,#127
3107  09d8 a103          	cp	a,#3
3108  09da 261d          	jrne	L7101
3109                     ; 871 			rx_read_power_cnt_phase=14;
3111  09dc 350e0000      	mov	_rx_read_power_cnt_phase,#14
3112                     ; 872 			delayCnt=10;
3114  09e0 ae000a        	ldw	x,#10
3115  09e3 bf00          	ldw	_delayCnt,x
3116                     ; 873 						GPIOD->DDR|=(1<<5);
3118  09e5 721a5011      	bset	20497,#5
3119                     ; 874 			GPIOD->CR1|=(1<<5);
3121  09e9 721a5012      	bset	20498,#5
3122                     ; 875 	GPIOD->CR2&=~(1<<5);
3124  09ed 721b5013      	bres	20499,#5
3125                     ; 876 	GPIOD->ODR&=~(1<<5);
3127  09f1 721b500f      	bres	20495,#5
3128                     ; 877 		GPIOD->ODR&=~(1<<5);
3130  09f5 721b500f      	bres	20495,#5
3131  09f9               L7101:
3132                     ; 881 	rx_wr_index1++;	
3134  09f9 be2d          	ldw	x,_rx_wr_index1
3135  09fb 1c0001        	addw	x,#1
3136  09fe bf2d          	ldw	_rx_wr_index1,x
3137  0a00               L1101:
3138                     ; 885 }
3141  0a00 5b03          	addw	sp,#3
3142  0a02 80            	iret
3236                     ; 894 main()
3236                     ; 895 {
3238                     	switch	.text
3239  0a03               _main:
3241  0a03 5214          	subw	sp,#20
3242       00000014      OFST:	set	20
3245                     ; 896 CLK->ECKR|=1;
3247  0a05 721050c1      	bset	20673,#0
3249  0a09               L7411:
3250                     ; 897 while((CLK->ECKR & 2) == 0);
3252  0a09 c650c1        	ld	a,20673
3253  0a0c a502          	bcp	a,#2
3254  0a0e 27f9          	jreq	L7411
3255                     ; 898 CLK->SWCR|=2;
3257  0a10 721250c5      	bset	20677,#1
3258                     ; 899 CLK->SWR=0xB4;
3260  0a14 35b450c4      	mov	20676,#180
3261                     ; 902 t4_init();
3263  0a18 cd072a        	call	_t4_init
3265                     ; 904 		GPIOG->DDR|=(1<<0);
3267  0a1b 72105020      	bset	20512,#0
3268                     ; 905 		GPIOG->CR1|=(1<<0);
3270  0a1f 72105021      	bset	20513,#0
3271                     ; 906 		GPIOG->CR2&=~(1<<0);	
3273  0a23 72115022      	bres	20514,#0
3274                     ; 909 		GPIOG->DDR&=~(1<<1);
3276  0a27 72135020      	bres	20512,#1
3277                     ; 910 		GPIOG->CR1|=(1<<1);
3279  0a2b 72125021      	bset	20513,#1
3280                     ; 911 		GPIOG->CR2&=~(1<<1);
3282  0a2f 72135022      	bres	20514,#1
3283                     ; 913 init_CAN();
3285  0a33 cd0568        	call	_init_CAN
3287                     ; 921 uart1_init();
3289  0a36 cd0213        	call	_uart1_init
3291                     ; 923 adress=19;
3293  0a39 35130119      	mov	_adress,#19
3294                     ; 925 bat_mod_dump[0][5]=1;
3296  0a3d 35010005      	mov	_bat_mod_dump+5,#1
3297                     ; 926 bat_mod_dump[1][5]=2;
3299  0a41 3502002d      	mov	_bat_mod_dump+45,#2
3300                     ; 927 bat_mod_dump[2][5]=3;
3302  0a45 35030055      	mov	_bat_mod_dump+85,#3
3303                     ; 928 bat_mod_dump[3][5]=4;
3305  0a49 3504007d      	mov	_bat_mod_dump+125,#4
3306                     ; 929 bat_mod_dump[4][5]=5;
3308  0a4d 350500a5      	mov	_bat_mod_dump+165,#5
3309                     ; 930 bat_mod_dump[5][5]=6;
3311  0a51 350600cd      	mov	_bat_mod_dump+205,#6
3312                     ; 931 bat_mod_dump[6][5]=7;
3314  0a55 350700f5      	mov	_bat_mod_dump+245,#7
3315                     ; 935 enableInterrupts();
3318  0a59 9a            rim
3320  0a5a               L3511:
3321                     ; 939 	if(bRX485)
3323  0a5a 3d03          	tnz	_bRX485
3324  0a5c 2703          	jreq	L7511
3325                     ; 941 		rx485_in_an();
3327  0a5e cd0473        	call	_rx485_in_an
3329  0a61               L7511:
3330                     ; 944 	if(bCAN_RX)
3332  0a61 3d08          	tnz	_bCAN_RX
3333  0a63 2705          	jreq	L1611
3334                     ; 946 		bCAN_RX=0;
3336  0a65 3f08          	clr	_bCAN_RX
3337                     ; 947 		can_in_an();
3339  0a67 cd06b4        	call	_can_in_an
3341  0a6a               L1611:
3342                     ; 956 	if(b100Hz)
3344                     	btst	_b100Hz
3345  0a6f 2404          	jruge	L3611
3346                     ; 958 		b100Hz=0;
3348  0a71 72110006      	bres	_b100Hz
3349  0a75               L3611:
3350                     ; 961 	if(b10Hz)
3352                     	btst	_b10Hz
3353  0a7a 2407          	jruge	L5611
3354                     ; 963 		b10Hz=0;
3356  0a7c 72110005      	bres	_b10Hz
3357                     ; 965 			can_tx_hndl();
3359  0a80 cd064d        	call	_can_tx_hndl
3361  0a83               L5611:
3362                     ; 970 	if(b1Hz)
3364                     	btst	_b1Hz
3365  0a88 2413          	jruge	L7611
3366                     ; 973 		b1Hz=0;
3368  0a8a 72110002      	bres	_b1Hz
3369                     ; 976 		power_net_cnt++;
3371  0a8e 3c0b          	inc	_power_net_cnt
3372                     ; 977 		if(power_net_cnt>=5)
3374  0a90 b60b          	ld	a,_power_net_cnt
3375  0a92 a105          	cp	a,#5
3376  0a94 2504          	jrult	L1711
3377                     ; 979 				power_net_cnt=0;
3379  0a96 3f0b          	clr	_power_net_cnt
3380                     ; 980 				rx_read_power_cnt_phase=0;
3382  0a98 3f00          	clr	_rx_read_power_cnt_phase
3383  0a9a               L1711:
3384                     ; 984 		matemath();
3386  0a9a cd003c        	call	_matemath
3388  0a9d               L7611:
3389                     ; 1010 	if (rx_read_power_cnt_phase==0)
3391  0a9d 3d00          	tnz	_rx_read_power_cnt_phase
3392  0a9f 2635          	jrne	L3711
3393                     ; 1014 GPIOD->DDR|=(1<<5);
3395  0aa1 721a5011      	bset	20497,#5
3396                     ; 1015 	GPIOD->CR1|=(1<<5);
3398  0aa5 721a5012      	bset	20498,#5
3399                     ; 1016 	GPIOD->CR2&=~(1<<5);
3401  0aa9 721b5013      	bres	20499,#5
3402                     ; 1017 	GPIOD->ODR|=(1<<5);	
3404  0aad 721a500f      	bset	20495,#5
3405                     ; 1020 		command_with_crc[0]=0xaf;  // /
3407  0ab1 a6af          	ld	a,#175
3408  0ab3 6b01          	ld	(OFST-19,sp),a
3409                     ; 1021 		command_with_crc[1]=0x3f;  // ?
3411  0ab5 a63f          	ld	a,#63
3412  0ab7 6b02          	ld	(OFST-18,sp),a
3413                     ; 1022 		command_with_crc[2]=0x21;  // !
3415  0ab9 a621          	ld	a,#33
3416  0abb 6b03          	ld	(OFST-17,sp),a
3417                     ; 1023 		command_with_crc[3]=0x8d;  // CR
3419  0abd a68d          	ld	a,#141
3420  0abf 6b04          	ld	(OFST-16,sp),a
3421                     ; 1024 		command_with_crc[4]=0x0a;  // LF
3423  0ac1 a60a          	ld	a,#10
3424  0ac3 6b05          	ld	(OFST-15,sp),a
3425                     ; 1026 		uart1_out_adr(command_with_crc,5);
3427  0ac5 4b05          	push	#5
3428  0ac7 96            	ldw	x,sp
3429  0ac8 1c0002        	addw	x,#OFST-18
3430  0acb cd029a        	call	_uart1_out_adr
3432  0ace 84            	pop	a
3433                     ; 1028 		rx_wr_index1=0;
3435  0acf 5f            	clrw	x
3436  0ad0 bf2d          	ldw	_rx_wr_index1,x
3437                     ; 1029 		rx_read_power_cnt_phase=1;
3439  0ad2 35010000      	mov	_rx_read_power_cnt_phase,#1
3440  0ad6               L3711:
3441                     ; 1031 	if ((rx_read_power_cnt_phase==2)&&(!delayCnt))
3443  0ad6 b600          	ld	a,_rx_read_power_cnt_phase
3444  0ad8 a102          	cp	a,#2
3445  0ada 262d          	jrne	L5711
3447  0adc be00          	ldw	x,_delayCnt
3448  0ade 2629          	jrne	L5711
3449                     ; 1035 		command_with_crc[0]=0x06;  //  
3451  0ae0 a606          	ld	a,#6
3452  0ae2 6b01          	ld	(OFST-19,sp),a
3453                     ; 1036 		command_with_crc[1]=0x30;  // 0
3455  0ae4 a630          	ld	a,#48
3456  0ae6 6b02          	ld	(OFST-18,sp),a
3457                     ; 1037 		command_with_crc[2]=0x35;  // 5
3459  0ae8 a635          	ld	a,#53
3460  0aea 6b03          	ld	(OFST-17,sp),a
3461                     ; 1038 		command_with_crc[3]=0xb1;  // 1
3463  0aec a6b1          	ld	a,#177
3464  0aee 6b04          	ld	(OFST-16,sp),a
3465                     ; 1039 		command_with_crc[4]=0x8d;  // CR
3467  0af0 a68d          	ld	a,#141
3468  0af2 6b05          	ld	(OFST-15,sp),a
3469                     ; 1040 		command_with_crc[5]=0x0a;  // LF
3471  0af4 a60a          	ld	a,#10
3472  0af6 6b06          	ld	(OFST-14,sp),a
3473                     ; 1042 		uart1_out_adr(command_with_crc,6);
3475  0af8 4b06          	push	#6
3476  0afa 96            	ldw	x,sp
3477  0afb 1c0002        	addw	x,#OFST-18
3478  0afe cd029a        	call	_uart1_out_adr
3480  0b01 84            	pop	a
3481                     ; 1044 		rx_wr_index1=0;
3483  0b02 5f            	clrw	x
3484  0b03 bf2d          	ldw	_rx_wr_index1,x
3485                     ; 1045 		rx_read_power_cnt_phase=3;
3487  0b05 35030000      	mov	_rx_read_power_cnt_phase,#3
3488  0b09               L5711:
3489                     ; 1064 	if ((rx_read_power_cnt_phase==5)&&(!delayCnt))
3491  0b09 b600          	ld	a,_rx_read_power_cnt_phase
3492  0b0b a105          	cp	a,#5
3493  0b0d 2649          	jrne	L7711
3495  0b0f be00          	ldw	x,_delayCnt
3496  0b11 2645          	jrne	L7711
3497                     ; 1068 				command_with_crc[0]=0x81;  //  
3499  0b13 a681          	ld	a,#129
3500  0b15 6b01          	ld	(OFST-19,sp),a
3501                     ; 1069 				command_with_crc[1]=0xD2;  // R
3503  0b17 a6d2          	ld	a,#210
3504  0b19 6b02          	ld	(OFST-18,sp),a
3505                     ; 1070 				command_with_crc[2]=0xb1;  // 1
3507  0b1b a6b1          	ld	a,#177
3508  0b1d 6b03          	ld	(OFST-17,sp),a
3509                     ; 1071 				command_with_crc[3]=0x82;  // 
3511  0b1f a682          	ld	a,#130
3512  0b21 6b04          	ld	(OFST-16,sp),a
3513                     ; 1072 				command_with_crc[4]=0xC5;  // E 
3515  0b23 a6c5          	ld	a,#197
3516  0b25 6b05          	ld	(OFST-15,sp),a
3517                     ; 1073 				command_with_crc[5]=0xD4;  // T
3519  0b27 a6d4          	ld	a,#212
3520  0b29 6b06          	ld	(OFST-14,sp),a
3521                     ; 1074 				command_with_crc[6]=0x30;  // 0
3523  0b2b a630          	ld	a,#48
3524  0b2d 6b07          	ld	(OFST-13,sp),a
3525                     ; 1075 				command_with_crc[7]=0x50;  // P
3527  0b2f a650          	ld	a,#80
3528  0b31 6b08          	ld	(OFST-12,sp),a
3529                     ; 1076 				command_with_crc[8]=0xC5;  // E 
3531  0b33 a6c5          	ld	a,#197
3532  0b35 6b09          	ld	(OFST-11,sp),a
3533                     ; 1077 				command_with_crc[9]=0x28;  // (
3535  0b37 a628          	ld	a,#40
3536  0b39 6b0a          	ld	(OFST-10,sp),a
3537                     ; 1078 				command_with_crc[10]=0xA9;  // )
3539  0b3b a6a9          	ld	a,#169
3540  0b3d 6b0b          	ld	(OFST-9,sp),a
3541                     ; 1079 				command_with_crc[11]=0x03;  // 
3543  0b3f a603          	ld	a,#3
3544  0b41 6b0c          	ld	(OFST-8,sp),a
3545                     ; 1080 				command_with_crc[12]=0xb7;  // bcc
3547  0b43 a6b7          	ld	a,#183
3548  0b45 6b0d          	ld	(OFST-7,sp),a
3549                     ; 1083 				uart1_out_adr(command_with_crc,13);
3551  0b47 4b0d          	push	#13
3552  0b49 96            	ldw	x,sp
3553  0b4a 1c0002        	addw	x,#OFST-18
3554  0b4d cd029a        	call	_uart1_out_adr
3556  0b50 84            	pop	a
3557                     ; 1085 				rx_wr_index1=0;
3559  0b51 5f            	clrw	x
3560  0b52 bf2d          	ldw	_rx_wr_index1,x
3561                     ; 1086 				rx_read_power_cnt_phase=6;
3563  0b54 35060000      	mov	_rx_read_power_cnt_phase,#6
3564  0b58               L7711:
3565                     ; 1089 	if ((rx_read_power_cnt_phase==10)&&(!delayCnt))
3567  0b58 b600          	ld	a,_rx_read_power_cnt_phase
3568  0b5a a10a          	cp	a,#10
3569  0b5c 2649          	jrne	L1021
3571  0b5e be00          	ldw	x,_delayCnt
3572  0b60 2645          	jrne	L1021
3573                     ; 1093 		command_with_crc[0]=0x81;  //  
3575  0b62 a681          	ld	a,#129
3576  0b64 6b01          	ld	(OFST-19,sp),a
3577                     ; 1094 		command_with_crc[1]=0xD2;  // R
3579  0b66 a6d2          	ld	a,#210
3580  0b68 6b02          	ld	(OFST-18,sp),a
3581                     ; 1095 		command_with_crc[2]=0xb1;  // 1
3583  0b6a a6b1          	ld	a,#177
3584  0b6c 6b03          	ld	(OFST-17,sp),a
3585                     ; 1096 		command_with_crc[3]=0x82;  // 
3587  0b6e a682          	ld	a,#130
3588  0b70 6b04          	ld	(OFST-16,sp),a
3589                     ; 1097 		command_with_crc[4]=0x50;  // P 
3591  0b72 a650          	ld	a,#80
3592  0b74 6b05          	ld	(OFST-15,sp),a
3593                     ; 1098 		command_with_crc[5]=0xCF;  // O
3595  0b76 a6cf          	ld	a,#207
3596  0b78 6b06          	ld	(OFST-14,sp),a
3597                     ; 1099 		command_with_crc[6]=0xd7;  // W
3599  0b7a a6d7          	ld	a,#215
3600  0b7c 6b07          	ld	(OFST-13,sp),a
3601                     ; 1100 		command_with_crc[7]=0xc5;  // E
3603  0b7e a6c5          	ld	a,#197
3604  0b80 6b08          	ld	(OFST-12,sp),a
3605                     ; 1101 		command_with_crc[8]=0x50;  // P 
3607  0b82 a650          	ld	a,#80
3608  0b84 6b09          	ld	(OFST-11,sp),a
3609                     ; 1102 		command_with_crc[9]=0x28;  // (
3611  0b86 a628          	ld	a,#40
3612  0b88 6b0a          	ld	(OFST-10,sp),a
3613                     ; 1103 		command_with_crc[10]=0xA9;  // )
3615  0b8a a6a9          	ld	a,#169
3616  0b8c 6b0b          	ld	(OFST-9,sp),a
3617                     ; 1104 		command_with_crc[11]=0x03;  // 
3619  0b8e a603          	ld	a,#3
3620  0b90 6b0c          	ld	(OFST-8,sp),a
3621                     ; 1105 		command_with_crc[12]=0xe4;  // bcc
3623  0b92 a6e4          	ld	a,#228
3624  0b94 6b0d          	ld	(OFST-7,sp),a
3625                     ; 1107 		uart1_out_adr(command_with_crc,13);
3627  0b96 4b0d          	push	#13
3628  0b98 96            	ldw	x,sp
3629  0b99 1c0002        	addw	x,#OFST-18
3630  0b9c cd029a        	call	_uart1_out_adr
3632  0b9f 84            	pop	a
3633                     ; 1109 				rx_wr_index1=0;
3635  0ba0 5f            	clrw	x
3636  0ba1 bf2d          	ldw	_rx_wr_index1,x
3637                     ; 1110 				rx_read_power_cnt_phase=11;
3639  0ba3 350b0000      	mov	_rx_read_power_cnt_phase,#11
3640  0ba7               L1021:
3641                     ; 1113 	if ((rx_read_power_cnt_phase==14)&&(!delayCnt))
3643  0ba7 b600          	ld	a,_rx_read_power_cnt_phase
3644  0ba9 a10e          	cp	a,#14
3645  0bab 2703          	jreq	L651
3646  0bad cc0a5a        	jp	L3511
3647  0bb0               L651:
3649  0bb0 be00          	ldw	x,_delayCnt
3650  0bb2 2703          	jreq	L061
3651  0bb4 cc0a5a        	jp	L3511
3652  0bb7               L061:
3653                     ; 1117 		command_with_crc[0]=0x81;  //  
3655  0bb7 a681          	ld	a,#129
3656  0bb9 6b01          	ld	(OFST-19,sp),a
3657                     ; 1118 		command_with_crc[1]=0x42;  // B
3659  0bbb a642          	ld	a,#66
3660  0bbd 6b02          	ld	(OFST-18,sp),a
3661                     ; 1119 		command_with_crc[2]=0x30;  // 0
3663  0bbf a630          	ld	a,#48
3664  0bc1 6b03          	ld	(OFST-17,sp),a
3665                     ; 1120 		command_with_crc[3]=0x03;  // 
3667  0bc3 a603          	ld	a,#3
3668  0bc5 6b04          	ld	(OFST-16,sp),a
3669                     ; 1121 		command_with_crc[4]=0xf5;  // u 
3671  0bc7 a6f5          	ld	a,#245
3672  0bc9 6b05          	ld	(OFST-15,sp),a
3673                     ; 1123 		uart1_out_adr(command_with_crc,5);
3675  0bcb 4b05          	push	#5
3676  0bcd 96            	ldw	x,sp
3677  0bce 1c0002        	addw	x,#OFST-18
3678  0bd1 cd029a        	call	_uart1_out_adr
3680  0bd4 84            	pop	a
3681                     ; 1125 				rx_wr_index1=0;
3683  0bd5 5f            	clrw	x
3684  0bd6 bf2d          	ldw	_rx_wr_index1,x
3685                     ; 1126 				rx_read_power_cnt_phase=20;
3687  0bd8 35140000      	mov	_rx_read_power_cnt_phase,#20
3688  0bdc ac5a0a5a      	jpf	L3511
4265                     	xdef	_main
4266                     	xdef	f_UART1RxInterrupt
4267                     	xdef	f_UART1TxInterrupt
4268                     	xdef	f_CAN_TX_Interrupt
4269                     	xdef	f_CAN_RX_Interrupt
4270                     	xdef	f_TIM4_UPD_Interrupt
4271                     	xdef	_t4_init
4272                     	xdef	_can_in_an
4273                     	xdef	_can_tx_hndl
4274                     	xdef	_can_transmit
4275                     	xdef	_init_CAN
4276                     	xdef	_rx485_in_an
4277                     	xdef	_str2int
4278                     	xdef	_ascii2hex
4279                     	xdef	_ascii2halFhex
4280                     	xdef	_uart1_out_adr
4281                     	xdef	_uart1_init
4282                     	xdef	_matemath
4283                     	xdef	_gran
4284                     	xdef	_gran_char
4285                     	switch	.ubsct
4286  0000               _delayCnt:
4287  0000 0000          	ds.b	2
4288                     	xdef	_delayCnt
4289                     	switch	.bss
4290  0000               _bat_mod_dump:
4291  0000 000000000000  	ds.b	280
4292                     	xdef	_bat_mod_dump
4293                     	switch	.ubsct
4294  0002               _transmit_cnt_number:
4295  0002 00            	ds.b	1
4296                     	xdef	_transmit_cnt_number
4297                     .bit:	section	.data,bit
4298  0000               _bRS485ERR:
4299  0000 00            	ds.b	1
4300                     	xdef	_bRS485ERR
4301                     	xdef	_rs485_cnt
4302                     	xdef	_power_net_cnt
4303                     	switch	.ubsct
4304  0003               _bRX485:
4305  0003 00            	ds.b	1
4306                     	xdef	_bRX485
4307  0004               _rs485_rx_cnt:
4308  0004 0000          	ds.b	2
4309                     	xdef	_rs485_rx_cnt
4310  0006               _plazma_int:
4311  0006 000000000000  	ds.b	6
4312                     	xdef	_plazma_int
4313  000c               _link_cnt:
4314  000c 00            	ds.b	1
4315                     	xdef	_link_cnt
4316  000d               _link:
4317  000d 00            	ds.b	1
4318                     	xdef	_link
4319                     	switch	.bss
4320  0118               _adress_error:
4321  0118 00            	ds.b	1
4322                     	xdef	_adress_error
4323  0119               _adress:
4324  0119 00            	ds.b	1
4325                     	xdef	_adress
4326  011a               _adr:
4327  011a 000000        	ds.b	3
4328                     	xdef	_adr
4329                     	xdef	_adr_drv_stat
4330                     	xdef	_led_ind
4331                     	switch	.ubsct
4332  000e               _led_ind_cnt:
4333  000e 00            	ds.b	1
4334                     	xdef	_led_ind_cnt
4335  000f               _adc_plazma:
4336  000f 000000000000  	ds.b	10
4337                     	xdef	_adc_plazma
4338  0019               _adc_plazma_short:
4339  0019 0000          	ds.b	2
4340                     	xdef	_adc_plazma_short
4341  001b               _adc_cnt:
4342  001b 00            	ds.b	1
4343                     	xdef	_adc_cnt
4344  001c               _adc_ch:
4345  001c 00            	ds.b	1
4346                     	xdef	_adc_ch
4347  001d               _T:
4348  001d 00            	ds.b	1
4349                     	xdef	_T
4350  001e               _Udb:
4351  001e 0000          	ds.b	2
4352                     	xdef	_Udb
4353  0020               _Ui:
4354  0020 0000          	ds.b	2
4355                     	xdef	_Ui
4356  0022               _Un:
4357  0022 0000          	ds.b	2
4358                     	xdef	_Un
4359  0024               _I:
4360  0024 0000          	ds.b	2
4361                     	xdef	_I
4362  0026               _can_error_cnt:
4363  0026 00            	ds.b	1
4364                     	xdef	_can_error_cnt
4365                     	xdef	_bCAN_RX
4366  0027               _tx_busy_cnt:
4367  0027 00            	ds.b	1
4368                     	xdef	_tx_busy_cnt
4369                     	xdef	_bTX_FREE
4370  0028               _can_buff_rd_ptr:
4371  0028 00            	ds.b	1
4372                     	xdef	_can_buff_rd_ptr
4373  0029               _can_buff_wr_ptr:
4374  0029 00            	ds.b	1
4375                     	xdef	_can_buff_wr_ptr
4376                     	switch	.bss
4377  011d               _can_out_buff:
4378  011d 000000000000  	ds.b	192
4379                     	xdef	_can_out_buff
4380                     	switch	.ubsct
4381  002a               _bOUT_FREE:
4382  002a 00            	ds.b	1
4383                     	xdef	_bOUT_FREE
4384                     	switch	.bss
4385  01dd               _tx_stat_cnt:
4386  01dd 00            	ds.b	1
4387                     	xdef	_tx_stat_cnt
4388                     	switch	.ubsct
4389  002b               _rx_rd_index1:
4390  002b 0000          	ds.b	2
4391                     	xdef	_rx_rd_index1
4392  002d               _rx_wr_index1:
4393  002d 0000          	ds.b	2
4394                     	xdef	_rx_wr_index1
4395  002f               _rx_counter1:
4396  002f 0000          	ds.b	2
4397                     	xdef	_rx_counter1
4398                     	xdef	_rx_buffer
4399  0031               _tx_rd_index1:
4400  0031 00            	ds.b	1
4401                     	xdef	_tx_rd_index1
4402  0032               _tx_wr_index1:
4403  0032 00            	ds.b	1
4404                     	xdef	_tx_wr_index1
4405  0033               _tx_counter1:
4406  0033 00            	ds.b	1
4407                     	xdef	_tx_counter1
4408                     	xdef	_tx_buffer1
4409  0034               _rs485_out_buff:
4410  0034 000000000000  	ds.b	20
4411                     	xdef	_rs485_out_buff
4412  0048               _mess:
4413  0048 000000000000  	ds.b	14
4414                     	xdef	_mess
4415                     	switch	.bit
4416  0001               _bBAT_REQ:
4417  0001 00            	ds.b	1
4418                     	xdef	_bBAT_REQ
4419  0002               _b1Hz:
4420  0002 00            	ds.b	1
4421                     	xdef	_b1Hz
4422  0003               _b2Hz:
4423  0003 00            	ds.b	1
4424                     	xdef	_b2Hz
4425  0004               _b5Hz:
4426  0004 00            	ds.b	1
4427                     	xdef	_b5Hz
4428  0005               _b10Hz:
4429  0005 00            	ds.b	1
4430                     	xdef	_b10Hz
4431  0006               _b100Hz:
4432  0006 00            	ds.b	1
4433                     	xdef	_b100Hz
4434                     	xdef	_t0_cnt4
4435                     	xdef	_t0_cnt3
4436                     	xdef	_t0_cnt2
4437                     	xdef	_t0_cnt1
4438                     	xdef	_t0_cnt0
4439                     	xdef	_putchar1
4440                     	xref	_curr_pow_buff_ready
4441                     	xref	_curr_pow_buff_cnt
4442                     	xref	_curr_pow_buff_ptr
4443                     	xref	_curr_pow_buff
4444                     	xref	_tot_pow_buff_ready
4445                     	xref	_tot_pow_buff_cnt
4446                     	xref	_tot_pow_buff_ptr
4447                     	xref	_tot_pow_buff
4448                     	xref.b	_power_current
4449                     	xref.b	_power_summary
4450                     	xref.b	_rx_read_power_cnt_phase
4451                     	xdef	_tx_wd_cnt
4452                     	xref	_pow
4453                     	xref	_isalnum
4454                     	xdef	_tx_stat
4455                     	switch	.const
4456  001a               L164:
4457  001a 41800000      	dc.w	16768,0
4458                     	xref.b	c_lreg
4459                     	xref.b	c_x
4460                     	xref.b	c_y
4480                     	xref	c_lmod
4481                     	xref	c_ldiv
4482                     	xref	c_ltor
4483                     	xref	c_idiv
4484                     	xref	c_imul
4485                     	xref	c_ftoi
4486                     	xref	c_itof
4487                     	xref	c_xymvx
4488                     	xref	c_sdivx
4489                     	xref	c_lmul
4490                     	xref	c_vmul
4491                     	xref	c_lgadd
4492                     	xref	c_itolx
4493                     	end
