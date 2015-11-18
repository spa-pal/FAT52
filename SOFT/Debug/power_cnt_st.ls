   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32.1 - 30 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     .const:	section	.text
  16  0000               _crc8tab:
  17  0000 00            	dc.b	0
  18  0001 b5            	dc.b	181
  19  0002 df            	dc.b	223
  20  0003 6a            	dc.b	106
  21  0004 0b            	dc.b	11
  22  0005 be            	dc.b	190
  23  0006 d4            	dc.b	212
  24  0007 61            	dc.b	97
  25  0008 16            	dc.b	22
  26  0009 a3            	dc.b	163
  27  000a c9            	dc.b	201
  28  000b 7c            	dc.b	124
  29  000c 1d            	dc.b	29
  30  000d a8            	dc.b	168
  31  000e c2            	dc.b	194
  32  000f 77            	dc.b	119
  33  0010 2c            	dc.b	44
  34  0011 99            	dc.b	153
  35  0012 f3            	dc.b	243
  36  0013 46            	dc.b	70
  37  0014 27            	dc.b	39
  38  0015 92            	dc.b	146
  39  0016 f8            	dc.b	248
  40  0017 4d            	dc.b	77
  41  0018 3a            	dc.b	58
  42  0019 8f            	dc.b	143
  43  001a e5            	dc.b	229
  44  001b 50            	dc.b	80
  45  001c 31            	dc.b	49
  46  001d 84            	dc.b	132
  47  001e ee            	dc.b	238
  48  001f 5b            	dc.b	91
  49  0020 58            	dc.b	88
  50  0021 ed            	dc.b	237
  51  0022 87            	dc.b	135
  52  0023 32            	dc.b	50
  53  0024 53            	dc.b	83
  54  0025 e6            	dc.b	230
  55  0026 8c            	dc.b	140
  56  0027 39            	dc.b	57
  57  0028 4e            	dc.b	78
  58  0029 fb            	dc.b	251
  59  002a 91            	dc.b	145
  60  002b 24            	dc.b	36
  61  002c 45            	dc.b	69
  62  002d f0            	dc.b	240
  63  002e 9a            	dc.b	154
  64  002f 2f            	dc.b	47
  65  0030 74            	dc.b	116
  66  0031 c1            	dc.b	193
  67  0032 ab            	dc.b	171
  68  0033 1e            	dc.b	30
  69  0034 7f            	dc.b	127
  70  0035 ca            	dc.b	202
  71  0036 a0            	dc.b	160
  72  0037 15            	dc.b	21
  73  0038 62            	dc.b	98
  74  0039 d7            	dc.b	215
  75  003a bd            	dc.b	189
  76  003b 08            	dc.b	8
  77  003c 69            	dc.b	105
  78  003d dc            	dc.b	220
  79  003e b6            	dc.b	182
  80  003f 03            	dc.b	3
  81  0040 b0            	dc.b	176
  82  0041 05            	dc.b	5
  83  0042 6f            	dc.b	111
  84  0043 da            	dc.b	218
  85  0044 bb            	dc.b	187
  86  0045 0e            	dc.b	14
  87  0046 64            	dc.b	100
  88  0047 d1            	dc.b	209
  89  0048 a6            	dc.b	166
  90  0049 13            	dc.b	19
  91  004a 79            	dc.b	121
  92  004b cc            	dc.b	204
  93  004c ad            	dc.b	173
  94  004d 18            	dc.b	24
  95  004e 72            	dc.b	114
  96  004f c7            	dc.b	199
  97  0050 9c            	dc.b	156
  98  0051 29            	dc.b	41
  99  0052 43            	dc.b	67
 100  0053 f6            	dc.b	246
 101  0054 97            	dc.b	151
 102  0055 22            	dc.b	34
 103  0056 48            	dc.b	72
 104  0057 fd            	dc.b	253
 105  0058 8a            	dc.b	138
 106  0059 3f            	dc.b	63
 107  005a 55            	dc.b	85
 108  005b e0            	dc.b	224
 109  005c 81            	dc.b	129
 110  005d 34            	dc.b	52
 111  005e 5e            	dc.b	94
 112  005f eb            	dc.b	235
 113  0060 e8            	dc.b	232
 114  0061 5d            	dc.b	93
 115  0062 37            	dc.b	55
 116  0063 82            	dc.b	130
 117  0064 e3            	dc.b	227
 118  0065 56            	dc.b	86
 119  0066 3c            	dc.b	60
 120  0067 89            	dc.b	137
 121  0068 fe            	dc.b	254
 122  0069 4b            	dc.b	75
 123  006a 21            	dc.b	33
 124  006b 94            	dc.b	148
 125  006c f5            	dc.b	245
 126  006d 40            	dc.b	64
 127  006e 2a            	dc.b	42
 128  006f 9f            	dc.b	159
 129  0070 c4            	dc.b	196
 130  0071 71            	dc.b	113
 131  0072 1b            	dc.b	27
 132  0073 ae            	dc.b	174
 133  0074 cf            	dc.b	207
 134  0075 7a            	dc.b	122
 135  0076 10            	dc.b	16
 136  0077 a5            	dc.b	165
 137  0078 d2            	dc.b	210
 138  0079 67            	dc.b	103
 139  007a 0d            	dc.b	13
 140  007b b8            	dc.b	184
 141  007c d9            	dc.b	217
 142  007d 6c            	dc.b	108
 143  007e 06            	dc.b	6
 144  007f b3            	dc.b	179
 145  0080 d5            	dc.b	213
 146  0081 60            	dc.b	96
 147  0082 0a            	dc.b	10
 148  0083 bf            	dc.b	191
 149  0084 de            	dc.b	222
 150  0085 6b            	dc.b	107
 151  0086 01            	dc.b	1
 152  0087 b4            	dc.b	180
 153  0088 c3            	dc.b	195
 154  0089 76            	dc.b	118
 155  008a 1c            	dc.b	28
 156  008b a9            	dc.b	169
 157  008c c8            	dc.b	200
 158  008d 7d            	dc.b	125
 159  008e 17            	dc.b	23
 160  008f a2            	dc.b	162
 161  0090 f9            	dc.b	249
 162  0091 4c            	dc.b	76
 163  0092 26            	dc.b	38
 164  0093 93            	dc.b	147
 165  0094 f2            	dc.b	242
 166  0095 47            	dc.b	71
 167  0096 2d            	dc.b	45
 168  0097 98            	dc.b	152
 169  0098 ef            	dc.b	239
 170  0099 5a            	dc.b	90
 171  009a 30            	dc.b	48
 172  009b 85            	dc.b	133
 173  009c e4            	dc.b	228
 174  009d 51            	dc.b	81
 175  009e 3b            	dc.b	59
 176  009f 8e            	dc.b	142
 177  00a0 8d            	dc.b	141
 178  00a1 38            	dc.b	56
 179  00a2 52            	dc.b	82
 180  00a3 e7            	dc.b	231
 181  00a4 86            	dc.b	134
 182  00a5 33            	dc.b	51
 183  00a6 59            	dc.b	89
 184  00a7 ec            	dc.b	236
 185  00a8 9b            	dc.b	155
 186  00a9 2e            	dc.b	46
 187  00aa 44            	dc.b	68
 188  00ab f1            	dc.b	241
 189  00ac 90            	dc.b	144
 190  00ad 25            	dc.b	37
 191  00ae 4f            	dc.b	79
 192  00af fa            	dc.b	250
 193  00b0 a1            	dc.b	161
 194  00b1 14            	dc.b	20
 195  00b2 7e            	dc.b	126
 196  00b3 cb            	dc.b	203
 197  00b4 aa            	dc.b	170
 198  00b5 1f            	dc.b	31
 199  00b6 75            	dc.b	117
 200  00b7 c0            	dc.b	192
 201  00b8 b7            	dc.b	183
 202  00b9 02            	dc.b	2
 203  00ba 68            	dc.b	104
 204  00bb dd            	dc.b	221
 205  00bc bc            	dc.b	188
 206  00bd 09            	dc.b	9
 207  00be 63            	dc.b	99
 208  00bf d6            	dc.b	214
 209  00c0 65            	dc.b	101
 210  00c1 d0            	dc.b	208
 211  00c2 ba            	dc.b	186
 212  00c3 0f            	dc.b	15
 213  00c4 6e            	dc.b	110
 214  00c5 db            	dc.b	219
 215  00c6 b1            	dc.b	177
 216  00c7 04            	dc.b	4
 217  00c8 73            	dc.b	115
 218  00c9 c6            	dc.b	198
 219  00ca ac            	dc.b	172
 220  00cb 19            	dc.b	25
 221  00cc 78            	dc.b	120
 222  00cd cd            	dc.b	205
 223  00ce a7            	dc.b	167
 224  00cf 12            	dc.b	18
 225  00d0 49            	dc.b	73
 226  00d1 fc            	dc.b	252
 227  00d2 96            	dc.b	150
 228  00d3 23            	dc.b	35
 229  00d4 42            	dc.b	66
 230  00d5 f7            	dc.b	247
 231  00d6 9d            	dc.b	157
 232  00d7 28            	dc.b	40
 233  00d8 5f            	dc.b	95
 234  00d9 ea            	dc.b	234
 235  00da 80            	dc.b	128
 236  00db 35            	dc.b	53
 237  00dc 54            	dc.b	84
 238  00dd e1            	dc.b	225
 239  00de 8b            	dc.b	139
 240  00df 3e            	dc.b	62
 241  00e0 3d            	dc.b	61
 242  00e1 88            	dc.b	136
 243  00e2 e2            	dc.b	226
 244  00e3 57            	dc.b	87
 245  00e4 36            	dc.b	54
 246  00e5 83            	dc.b	131
 247  00e6 e9            	dc.b	233
 248  00e7 5c            	dc.b	92
 249  00e8 2b            	dc.b	43
 250  00e9 9e            	dc.b	158
 251  00ea f4            	dc.b	244
 252  00eb 41            	dc.b	65
 253  00ec 20            	dc.b	32
 254  00ed 95            	dc.b	149
 255  00ee ff            	dc.b	255
 256  00ef 4a            	dc.b	74
 257  00f0 11            	dc.b	17
 258  00f1 a4            	dc.b	164
 259  00f2 ce            	dc.b	206
 260  00f3 7b            	dc.b	123
 261  00f4 1a            	dc.b	26
 262  00f5 af            	dc.b	175
 263  00f6 c5            	dc.b	197
 264  00f7 70            	dc.b	112
 265  00f8 07            	dc.b	7
 266  00f9 b2            	dc.b	178
 267  00fa d8            	dc.b	216
 268  00fb 6d            	dc.b	109
 269  00fc 0c            	dc.b	12
 270  00fd b9            	dc.b	185
 271  00fe d3            	dc.b	211
 272  00ff 66            	dc.b	102
 273                     	bsct
 274  0000               _UART1TxEmpty:
 275  0000 0001          	dc.w	1
 276  0002               _UART1Count:
 277  0002 0000          	dc.w	0
 278  0004               _rx_read_power_cnt_phase:
 279  0004 00            	dc.b	0
 280  0005               _power_summary:
 281  0005 00000000      	dc.l	0
 282  0009               _power_current:
 283  0009 0000          	dc.w	0
 323                     ; 65 unsigned int UARTInit( unsigned int PortNum, unsigned int baudrate )
 323                     ; 66 {
 325                     	switch	.text
 326  0000               _UARTInit:
 330                     ; 68 return( 0 ); 
 332  0000 5f            	clrw	x
 335  0001 81            	ret
 358                     ; 80 void UART1_IRQHandler (void) 
 358                     ; 81 {
 359                     	switch	.text
 360  0002               _UART1_IRQHandler:
 364                     ; 84 }
 367  0002 81            	ret
 430                     ; 92 char power_cnt_crc(char* adr, char len)
 430                     ; 93 {
 431                     	switch	.text
 432  0003               _power_cnt_crc:
 434  0003 89            	pushw	x
 435  0004 89            	pushw	x
 436       00000002      OFST:	set	2
 439                     ; 97 r=0;
 441  0005 0f01          	clr	(OFST-1,sp)
 442                     ; 98 for(j=1;j<len;j++)
 444  0007 a601          	ld	a,#1
 445  0009 6b02          	ld	(OFST+0,sp),a
 447  000b 2017          	jra	L57
 448  000d               L17:
 449                     ; 100 	r=crc8tab[r^adr[j]];
 451  000d 7b03          	ld	a,(OFST+1,sp)
 452  000f 97            	ld	xl,a
 453  0010 7b04          	ld	a,(OFST+2,sp)
 454  0012 1b02          	add	a,(OFST+0,sp)
 455  0014 2401          	jrnc	L21
 456  0016 5c            	incw	x
 457  0017               L21:
 458  0017 02            	rlwa	x,a
 459  0018 f6            	ld	a,(x)
 460  0019 1801          	xor	a,(OFST-1,sp)
 461  001b 5f            	clrw	x
 462  001c 97            	ld	xl,a
 463  001d d60000        	ld	a,(_crc8tab,x)
 464  0020 6b01          	ld	(OFST-1,sp),a
 465                     ; 98 for(j=1;j<len;j++)
 467  0022 0c02          	inc	(OFST+0,sp)
 468  0024               L57:
 471  0024 7b02          	ld	a,(OFST+0,sp)
 472  0026 1107          	cp	a,(OFST+5,sp)
 473  0028 25e3          	jrult	L17
 474                     ; 114 return r;	
 476  002a 7b01          	ld	a,(OFST-1,sp)
 479  002c 5b04          	addw	sp,#4
 480  002e 81            	ret
 552                     ; 132 char sleep_coding(char* adr_src,char* adr_dst,char str_len)
 552                     ; 133 {
 553                     	switch	.text
 554  002f               _sleep_coding:
 556  002f 89            	pushw	x
 557  0030 89            	pushw	x
 558       00000002      OFST:	set	2
 561                     ; 136 new_len=str_len;
 563  0031 7b09          	ld	a,(OFST+7,sp)
 564  0033 6b02          	ld	(OFST+0,sp),a
 565                     ; 138 *adr_dst=*adr_src;
 567  0035 f6            	ld	a,(x)
 568  0036 1e07          	ldw	x,(OFST+5,sp)
 569  0038 f7            	ld	(x),a
 570                     ; 139 adr_dst++;
 572  0039 1e07          	ldw	x,(OFST+5,sp)
 573  003b 1c0001        	addw	x,#1
 574  003e 1f07          	ldw	(OFST+5,sp),x
 575                     ; 140 adr_src++;
 577  0040 1e03          	ldw	x,(OFST+1,sp)
 578  0042 1c0001        	addw	x,#1
 579  0045 1f03          	ldw	(OFST+1,sp),x
 580                     ; 142 for(i=1;i<(str_len-1);i++)
 582  0047 a601          	ld	a,#1
 583  0049 6b01          	ld	(OFST-1,sp),a
 585  004b 205c          	jra	L341
 586  004d               L731:
 587                     ; 144      if(*adr_src==0xc0)
 589  004d 1e03          	ldw	x,(OFST+1,sp)
 590  004f f6            	ld	a,(x)
 591  0050 a1c0          	cp	a,#192
 592  0052 261c          	jrne	L741
 593                     ; 146           *adr_dst=0xdb;
 595  0054 1e07          	ldw	x,(OFST+5,sp)
 596  0056 a6db          	ld	a,#219
 597  0058 f7            	ld	(x),a
 598                     ; 147           adr_dst++;
 600  0059 1e07          	ldw	x,(OFST+5,sp)
 601  005b 1c0001        	addw	x,#1
 602  005e 1f07          	ldw	(OFST+5,sp),x
 603                     ; 148           *adr_dst=0xdc;
 605  0060 1e07          	ldw	x,(OFST+5,sp)
 606  0062 a6dc          	ld	a,#220
 607  0064 f7            	ld	(x),a
 608                     ; 149           adr_dst++;
 610  0065 1e07          	ldw	x,(OFST+5,sp)
 611  0067 1c0001        	addw	x,#1
 612  006a 1f07          	ldw	(OFST+5,sp),x
 613                     ; 150           new_len++;
 615  006c 0c02          	inc	(OFST+0,sp)
 617  006e 2030          	jra	L151
 618  0070               L741:
 619                     ; 152      else if(*adr_src==0xdb)
 621  0070 1e03          	ldw	x,(OFST+1,sp)
 622  0072 f6            	ld	a,(x)
 623  0073 a1db          	cp	a,#219
 624  0075 261c          	jrne	L351
 625                     ; 154           *adr_dst=0xdb;
 627  0077 1e07          	ldw	x,(OFST+5,sp)
 628  0079 a6db          	ld	a,#219
 629  007b f7            	ld	(x),a
 630                     ; 155           adr_dst++;
 632  007c 1e07          	ldw	x,(OFST+5,sp)
 633  007e 1c0001        	addw	x,#1
 634  0081 1f07          	ldw	(OFST+5,sp),x
 635                     ; 156           *adr_dst=0xdd;
 637  0083 1e07          	ldw	x,(OFST+5,sp)
 638  0085 a6dd          	ld	a,#221
 639  0087 f7            	ld	(x),a
 640                     ; 157           adr_dst++;
 642  0088 1e07          	ldw	x,(OFST+5,sp)
 643  008a 1c0001        	addw	x,#1
 644  008d 1f07          	ldw	(OFST+5,sp),x
 645                     ; 158           new_len++;
 647  008f 0c02          	inc	(OFST+0,sp)
 649  0091 200d          	jra	L151
 650  0093               L351:
 651                     ; 162           *adr_dst=*adr_src;
 653  0093 1e03          	ldw	x,(OFST+1,sp)
 654  0095 f6            	ld	a,(x)
 655  0096 1e07          	ldw	x,(OFST+5,sp)
 656  0098 f7            	ld	(x),a
 657                     ; 163           adr_dst++;
 659  0099 1e07          	ldw	x,(OFST+5,sp)
 660  009b 1c0001        	addw	x,#1
 661  009e 1f07          	ldw	(OFST+5,sp),x
 662  00a0               L151:
 663                     ; 165      adr_src++;
 665  00a0 1e03          	ldw	x,(OFST+1,sp)
 666  00a2 1c0001        	addw	x,#1
 667  00a5 1f03          	ldw	(OFST+1,sp),x
 668                     ; 142 for(i=1;i<(str_len-1);i++)
 670  00a7 0c01          	inc	(OFST-1,sp)
 671  00a9               L341:
 674  00a9 9c            	rvf
 675  00aa 7b09          	ld	a,(OFST+7,sp)
 676  00ac 5f            	clrw	x
 677  00ad 97            	ld	xl,a
 678  00ae 5a            	decw	x
 679  00af 7b01          	ld	a,(OFST-1,sp)
 680  00b1 905f          	clrw	y
 681  00b3 9097          	ld	yl,a
 682  00b5 90bf00        	ldw	c_y,y
 683  00b8 b300          	cpw	x,c_y
 684  00ba 2c91          	jrsgt	L731
 685                     ; 168 *adr_dst=*adr_src;
 687  00bc 1e03          	ldw	x,(OFST+1,sp)
 688  00be f6            	ld	a,(x)
 689  00bf 1e07          	ldw	x,(OFST+5,sp)
 690  00c1 f7            	ld	(x),a
 691                     ; 170 return new_len;
 693  00c2 7b02          	ld	a,(OFST+0,sp)
 696  00c4 5b04          	addw	sp,#4
 697  00c6 81            	ret
 765                     ; 174 void sleep_an(void)
 765                     ; 175 {
 766                     	switch	.text
 767  00c7               _sleep_an:
 769  00c7 5239          	subw	sp,#57
 770       00000039      OFST:	set	57
 773                     ; 181 ptr = sleep_pure_buff;
 775  00c9 96            	ldw	x,sp
 776  00ca 1c0005        	addw	x,#OFST-52
 777  00cd 1f37          	ldw	(OFST-2,sp),x
 778                     ; 182 len_=sleep_len;
 780  00cf c6001d        	ld	a,_sleep_len
 781  00d2 6b04          	ld	(OFST-53,sp),a
 782                     ; 186 for(i=0;i<sleep_len;i++)
 784  00d4 0f39          	clr	(OFST+0,sp)
 786  00d6 2058          	jra	L512
 787  00d8               L112:
 788                     ; 188      if(sleep_buff[i]==0xdb)
 790  00d8 7b39          	ld	a,(OFST+0,sp)
 791  00da 5f            	clrw	x
 792  00db 97            	ld	xl,a
 793  00dc d6001f        	ld	a,(_sleep_buff,x)
 794  00df a1db          	cp	a,#219
 795  00e1 263a          	jrne	L122
 796                     ; 190           if(sleep_buff[i+1]==0xdc)
 798  00e3 7b39          	ld	a,(OFST+0,sp)
 799  00e5 5f            	clrw	x
 800  00e6 97            	ld	xl,a
 801  00e7 d60020        	ld	a,(_sleep_buff+1,x)
 802  00ea a1dc          	cp	a,#220
 803  00ec 2612          	jrne	L322
 804                     ; 192                *ptr=0x0c;
 806  00ee 1e37          	ldw	x,(OFST-2,sp)
 807  00f0 a60c          	ld	a,#12
 808  00f2 f7            	ld	(x),a
 809                     ; 193                i++;
 811  00f3 0c39          	inc	(OFST+0,sp)
 812                     ; 194                ptr++;
 814  00f5 1e37          	ldw	x,(OFST-2,sp)
 815  00f7 1c0001        	addw	x,#1
 816  00fa 1f37          	ldw	(OFST-2,sp),x
 817                     ; 195                len_--;
 819  00fc 0a04          	dec	(OFST-53,sp)
 821  00fe 202e          	jra	L132
 822  0100               L322:
 823                     ; 197           else if(sleep_buff[i+1]==0xdd)
 825  0100 7b39          	ld	a,(OFST+0,sp)
 826  0102 5f            	clrw	x
 827  0103 97            	ld	xl,a
 828  0104 d60020        	ld	a,(_sleep_buff+1,x)
 829  0107 a1dd          	cp	a,#221
 830  0109 2623          	jrne	L132
 831                     ; 199                *ptr=0xdb;
 833  010b 1e37          	ldw	x,(OFST-2,sp)
 834  010d a6db          	ld	a,#219
 835  010f f7            	ld	(x),a
 836                     ; 200                i++;
 838  0110 0c39          	inc	(OFST+0,sp)
 839                     ; 201                ptr++;
 841  0112 1e37          	ldw	x,(OFST-2,sp)
 842  0114 1c0001        	addw	x,#1
 843  0117 1f37          	ldw	(OFST-2,sp),x
 844                     ; 202                len_--;
 846  0119 0a04          	dec	(OFST-53,sp)
 847  011b 2011          	jra	L132
 848  011d               L122:
 849                     ; 207           *ptr=sleep_buff[i];
 851  011d 7b39          	ld	a,(OFST+0,sp)
 852  011f 5f            	clrw	x
 853  0120 97            	ld	xl,a
 854  0121 d6001f        	ld	a,(_sleep_buff,x)
 855  0124 1e37          	ldw	x,(OFST-2,sp)
 856  0126 f7            	ld	(x),a
 857                     ; 208           ptr++;
 859  0127 1e37          	ldw	x,(OFST-2,sp)
 860  0129 1c0001        	addw	x,#1
 861  012c 1f37          	ldw	(OFST-2,sp),x
 862  012e               L132:
 863                     ; 186 for(i=0;i<sleep_len;i++)
 865  012e 0c39          	inc	(OFST+0,sp)
 866  0130               L512:
 869  0130 7b39          	ld	a,(OFST+0,sp)
 870  0132 c1001d        	cp	a,_sleep_len
 871  0135 25a1          	jrult	L112
 872                     ; 215 if(sleep_pure_buff[len_-2]==power_cnt_crc(sleep_pure_buff,len_-2))
 874  0137 7b04          	ld	a,(OFST-53,sp)
 875  0139 a002          	sub	a,#2
 876  013b 88            	push	a
 877  013c 96            	ldw	x,sp
 878  013d 1c0006        	addw	x,#OFST-51
 879  0140 cd0003        	call	_power_cnt_crc
 881  0143 5b01          	addw	sp,#1
 882  0145 6b03          	ld	(OFST-54,sp),a
 883  0147 96            	ldw	x,sp
 884  0148 1c0005        	addw	x,#OFST-52
 885  014b 1f01          	ldw	(OFST-56,sp),x
 886  014d 7b04          	ld	a,(OFST-53,sp)
 887  014f 5f            	clrw	x
 888  0150 97            	ld	xl,a
 889  0151 5a            	decw	x
 890  0152 5a            	decw	x
 891  0153 72fb01        	addw	x,(OFST-56,sp)
 892  0156 f6            	ld	a,(x)
 893  0157 1103          	cp	a,(OFST-54,sp)
 894  0159 2658          	jrne	L332
 895                     ; 217      if   (
 895                     ; 218           (sleep_pure_buff[1]==0x48)&&
 895                     ; 219           (sleep_pure_buff[2]==0)&&
 895                     ; 220           (sleep_pure_buff[3]==0)//&&
 895                     ; 221 ///          (sleep_pure_buff[4]==power_cnt_adrl)&&
 895                     ; 222 ///          (sleep_pure_buff[5]==power_cnt_adrh)
 895                     ; 223           )
 897  015b 7b06          	ld	a,(OFST-51,sp)
 898  015d a148          	cp	a,#72
 899  015f 2652          	jrne	L332
 901  0161 0d07          	tnz	(OFST-50,sp)
 902  0163 264e          	jrne	L332
 904  0165 0d08          	tnz	(OFST-49,sp)
 905  0167 264a          	jrne	L332
 906                     ; 226           if   (
 906                     ; 227                (sleep_pure_buff[7]==0x01)&&
 906                     ; 228                (sleep_pure_buff[8]==0x32)
 906                     ; 229                )
 908  0169 7b0c          	ld	a,(OFST-45,sp)
 909  016b a101          	cp	a,#1
 910  016d 2620          	jrne	L732
 912  016f 7b0d          	ld	a,(OFST-44,sp)
 913  0171 a132          	cp	a,#50
 914  0173 261a          	jrne	L732
 915                     ; 233                power_current=(((short)sleep_pure_buff[9]) + (((short)sleep_pure_buff[10])<<8))*10 ;
 917  0175 7b0f          	ld	a,(OFST-42,sp)
 918  0177 5f            	clrw	x
 919  0178 97            	ld	xl,a
 920  0179 4f            	clr	a
 921  017a 02            	rlwa	x,a
 922  017b 1f02          	ldw	(OFST-55,sp),x
 923  017d 7b0e          	ld	a,(OFST-43,sp)
 924  017f 5f            	clrw	x
 925  0180 97            	ld	xl,a
 926  0181 72fb02        	addw	x,(OFST-55,sp)
 927  0184 90ae000a      	ldw	y,#10
 928  0188 cd0000        	call	c_imul
 930  018b bf09          	ldw	_power_current,x
 932  018d 2024          	jra	L332
 933  018f               L732:
 934                     ; 236           else if   (
 934                     ; 237                (sleep_pure_buff[7]==0x01)&&
 934                     ; 238                (sleep_pure_buff[8]==0x31)
 934                     ; 239                )
 936  018f 7b0c          	ld	a,(OFST-45,sp)
 937  0191 a101          	cp	a,#1
 938  0193 261e          	jrne	L332
 940  0195 7b0d          	ld	a,(OFST-44,sp)
 941  0197 a131          	cp	a,#49
 942  0199 2618          	jrne	L332
 943                     ; 243                power_summary= (
 943                     ; 244                               ((unsigned)sleep_pure_buff[9]) + 
 943                     ; 245                               (((unsigned)sleep_pure_buff[10])<<8)+ 
 943                     ; 246                               (((unsigned)sleep_pure_buff[11])<<16)+ 
 943                     ; 247                               (((unsigned)sleep_pure_buff[12])<<32)
 943                     ; 248                               ) ;
 945  019b 7b0f          	ld	a,(OFST-42,sp)
 946  019d 5f            	clrw	x
 947  019e 97            	ld	xl,a
 948  019f 4f            	clr	a
 949  01a0 02            	rlwa	x,a
 950  01a1 1f02          	ldw	(OFST-55,sp),x
 951  01a3 7b0e          	ld	a,(OFST-43,sp)
 952  01a5 5f            	clrw	x
 953  01a6 97            	ld	xl,a
 954  01a7 72fb02        	addw	x,(OFST-55,sp)
 955  01aa cd0000        	call	c_uitolx
 957  01ad ae0005        	ldw	x,#_power_summary
 958  01b0 cd0000        	call	c_rtol
 960  01b3               L332:
 961                     ; 256 }
 964  01b3 5b39          	addw	sp,#57
 965  01b5 81            	ret
1241                     	switch	.ubsct
1242  0000               _cur_pow_102m:
1243  0000 00000000      	ds.b	4
1244                     	xdef	_cur_pow_102m
1245  0004               _bCP:
1246  0004 00            	ds.b	1
1247                     	xdef	_bCP
1248  0005               _cur_pow_dig_cnt:
1249  0005 00            	ds.b	1
1250                     	xdef	_cur_pow_dig_cnt
1251  0006               _cur_pow_dig:
1252  0006 000000000000  	ds.b	20
1253                     	xdef	_cur_pow_dig
1254  001a               _sum_pow_102m:
1255  001a 00000000      	ds.b	4
1256                     	xdef	_sum_pow_102m
1257  001e               _bSP:
1258  001e 00            	ds.b	1
1259                     	xdef	_bSP
1260  001f               _sum_pow_dig_cnt:
1261  001f 00            	ds.b	1
1262                     	xdef	_sum_pow_dig_cnt
1263  0020               _sum_pow_dig:
1264  0020 000000000000  	ds.b	20
1265                     	xdef	_sum_pow_dig
1266                     	xdef	_UART1Count
1267  0034               _UART1Buffer:
1268  0034 000000000000  	ds.b	200
1269                     	xdef	_UART1Buffer
1270                     	xdef	_UART1TxEmpty
1271                     	switch	.bss
1272  0000               _UART1Status:
1273  0000 0000          	ds.b	2
1274                     	xdef	_UART1Status
1275                     	xdef	_power_cnt_crc
1276                     	xdef	_UARTInit
1277                     	xdef	_UART1_IRQHandler
1278                     	xdef	_sleep_coding
1279                     	xdef	_sleep_an
1280  0002               _ppp:
1281  0002 00            	ds.b	1
1282                     	xdef	_ppp
1283  0003               _curr_pow_buff_ready:
1284  0003 00            	ds.b	1
1285                     	xdef	_curr_pow_buff_ready
1286  0004               _curr_pow_buff_cnt:
1287  0004 00            	ds.b	1
1288                     	xdef	_curr_pow_buff_cnt
1289  0005               _curr_pow_buff_ptr:
1290  0005 00            	ds.b	1
1291                     	xdef	_curr_pow_buff_ptr
1292  0006               _curr_pow_buff:
1293  0006 000000000000  	ds.b	10
1294                     	xdef	_curr_pow_buff
1295  0010               _tot_pow_buff_ready:
1296  0010 00            	ds.b	1
1297                     	xdef	_tot_pow_buff_ready
1298  0011               _tot_pow_buff_cnt:
1299  0011 00            	ds.b	1
1300                     	xdef	_tot_pow_buff_cnt
1301  0012               _tot_pow_buff_ptr:
1302  0012 00            	ds.b	1
1303                     	xdef	_tot_pow_buff_ptr
1304  0013               _tot_pow_buff:
1305  0013 000000000000  	ds.b	10
1306                     	xdef	_tot_pow_buff
1307                     	xdef	_power_current
1308                     	xdef	_power_summary
1309                     	xdef	_rx_read_power_cnt_phase
1310  001d               _sleep_len:
1311  001d 00            	ds.b	1
1312                     	xdef	_sleep_len
1313  001e               _sleep_in:
1314  001e 00            	ds.b	1
1315                     	xdef	_sleep_in
1316  001f               _sleep_buff:
1317  001f 000000000000  	ds.b	50
1318                     	xdef	_sleep_buff
1319                     	xdef	_crc8tab
1320                     	xref.b	c_x
1321                     	xref.b	c_y
1341                     	xref	c_rtol
1342                     	xref	c_uitolx
1343                     	xref	c_imul
1344                     	end
