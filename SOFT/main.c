//����� ��� �������� �������������� CE102M

#include "stm8s.h"
#include "string.h"
#include "main.h"
#include <ctype.h>
#include <math.h>
#include "power_cnt_st.h"

char t0_cnt0=0,t0_cnt1=0,t0_cnt2=0,t0_cnt3=0,t0_cnt4=0;
_Bool b100Hz, b10Hz, b5Hz, b2Hz, b1Hz,bBAT_REQ;

u8 mess[14];

#define MY_MESS_STID	0x009e
#define MY_MESS_STID_MASK	0x03ff


char rs485_out_buff[20];

#define TX_BUFFER_SIZE1 50
#define RX_BUFFER_SIZE1 300

@near char tx_buffer1[TX_BUFFER_SIZE1]={0};
signed char tx_counter1;
signed char tx_wr_index1,tx_rd_index1;
@near char rx_buffer[RX_BUFFER_SIZE1]={0};
signed short rx_counter1;
signed short rx_wr_index1,rx_rd_index1;
tx_stat_enum tx_stat=tsOFF;
@near char tx_stat_cnt;
char tx_wd_cnt=100;
char bOUT_FREE;

//���
@near char can_out_buff[12][16];
char can_buff_wr_ptr;
char can_buff_rd_ptr;
char bTX_FREE=1;
char tx_busy_cnt;
char bCAN_RX=0;
char can_error_cnt;

signed short I,Un,Ui,Udb;
signed char T;
//@eeprom signed short ee_K[4][2];


char adc_ch,adc_cnt;
signed short adc_plazma_short,adc_plazma[5];
char led_ind_cnt;
char led_ind=5;
char adr_drv_stat=0;
@near char adr[3],adress;
@near char adress_error;

char link,link_cnt;

#define BPS_MESS_STID	0x018e
#define BPS_MESS_STID_MASK	0x03ff
#define UKU_MESS_STID	0x009e
#define UKU_MESS_STID_MASK	0x03ff

#define XMAX 		25

#define CMND		0x16
#define MEM_KF 	0x62 
#define MEM_KF1 	0x26
#define MEM_KF4 	0x29
#define MEM_KF2 	0x27
#define ALRM_RES 	0x63
#define GETID 		0x90
#define PUTID 		0x91
#define PUTTM1 	0xDA
#define PUTTM2 	0xDB
#define PUTTM 		0xDE
#define GETTM 		0xED 
#define KLBR 		0xEE
#define PUT_LB_TM1 	0x18
#define PUT_LB_TM2 	0x78
#define PUT_LB_TM3 	0x38
#define PUT_LB_TM4 	0x48
#define PUT_LB_TM5 	0x58
#define PUT_LB_TM6 	0x68


#define ON 0x55
#define OFF 0xaa
signed short plazma_int[3];

short rs485_rx_cnt;
char bRX485;
char power_net_cnt=3;

//@near short max_cell_volt[7];
//@near short min_cell_volt[7];
//@near short max_cell_temp[7];
//@near short min_cell_temp[7];
//@near short tot_bat_volt[7];
//@near short ch_curr[7];
//@near short dsch_curr[7];
//@near short s_o_c[7];
//@near short rat_cap[7];
//@near short	r_b_t[7];
//@near short	c_c_l_v[7];
//short	s_o_h[7];
//short	b_p_ser_num[7];
//unsigned char flags_byte0[7],flags_byte1[7];
char rs485_cnt=0;
_Bool bRS485ERR;
//char plazma_cnt;
char transmit_cnt_number; 	//������� ������� �� ��������, ������� �� 0 �� 6 (7 �������)

@near char bat_mod_dump[7][40];
short delayCnt;



//-----------------------------------------------
void gran_char(signed char *adr, signed char min, signed char max)
{
if (*adr<min) *adr=min;
if (*adr>max)  *adr=max; 
}

//-----------------------------------------------
void gran(signed short *adr, signed short min, signed short max)
{
if (*adr<min) *adr=min;
if (*adr>max)  *adr=max; 
}



//-----------------------------------------------
void matemath(void)
{
unsigned long tempUL; 


if(tot_pow_buff_ready)
	{
	char i;
	signed long temp_SL_;

	temp_SL_=0;
	i=tot_pow_buff_cnt/*-1*/;

	i--;
	temp_SL_+=(1L*(signed long)(tot_pow_buff[i]-0x30));
	
	i--;
	temp_SL_+=(10L*(signed long)(tot_pow_buff[i]-0x30));
	
	i--;
	
	i--;
	temp_SL_+=(100L*(signed long)(tot_pow_buff[i]-0x30));
	
	if(i)
		{
		i--;
		temp_SL_+=(1000L*(signed long)(tot_pow_buff[i]-0x30));
		if(i)
			{
			i--;
			temp_SL_+=(10000L*(signed long)(tot_pow_buff[i]-0x30));
			if(i)
				{
				i--;
				temp_SL_+=(100000L*(signed long)(tot_pow_buff[i]-0x30));
				if(i)
					{
					i--;
					temp_SL_+=(1000000L*(signed long)(tot_pow_buff[i]-0x30));
					if(i)
						{
						i--;
						temp_SL_+=(10000000L*(signed long)(tot_pow_buff[i]-0x30));
						}						
					}
				}			
			}			
		}	

	power_summary=temp_SL_;
	tot_pow_buff_ready=0;
	}

if(curr_pow_buff_ready)
	{
	char i;
	signed long temp_SL_;

	temp_SL_=0;
	i=curr_pow_buff_cnt-3;

	i--;
	temp_SL_+=(1L*(signed long)(curr_pow_buff[i]-0x30));
	
	i--;
	temp_SL_+=(10L*(signed long)(curr_pow_buff[i]-0x30));
	
	i--;
	temp_SL_+=(100L*(signed long)(curr_pow_buff[i]-0x30));
	
	i--;
	
	i--;	 
	temp_SL_+=(1000L*(signed long)(curr_pow_buff[i]-0x30));
	
	if(i)
		{
		i--;
		temp_SL_+=(1000L*(signed long)(curr_pow_buff[i]-0x30));
		}
	power_current=(signed short)temp_SL_;
	curr_pow_buff_ready=0; 
	}
}



//-----------------------------------------------
void uart1_init (void)
{
//���� A4 - RX
GPIOA->DDR&=~(1<<4);
GPIOA->CR1|=(1<<4);
GPIOA->CR2&=~(1<<4);

//���� A5 - TX
GPIOA->DDR|=(1<<5);
GPIOA->CR1|=(1<<5);
GPIOA->CR2&=~(1<<5);	

//���� B6 - PV
GPIOB->DDR|=(1<<6);
GPIOB->CR1|=(1<<6);
GPIOB->CR2&=~(1<<6);
GPIOB->ODR|=(1<<6);		//����� � 1
	
//���� B7 - DE
GPIOB->DDR|=(1<<7);
GPIOB->CR1|=(1<<7);
GPIOB->CR2&=~(1<<7);
	
UART1->CR1&=~UART1_CR1_M;					
UART1->CR3|= (0<<4) & UART1_CR3_STOP;  	
UART1->BRR2= 0x02;
UART1->BRR1= 0x41;
UART1->CR2|= UART1_CR2_TEN | UART1_CR2_REN | UART1_CR2_RIEN/*| UART2_CR2_TIEN*/ ;	
}

//-----------------------------------------------
void putchar1(char c)
{
while (tx_counter1 == TX_BUFFER_SIZE1);
///#asm("cli")
if (tx_counter1 || ((UART1->SR & UART1_SR_TXE)==0))
   {
   tx_buffer1[tx_wr_index1]=c;
   if (++tx_wr_index1 == TX_BUFFER_SIZE1) tx_wr_index1=0;
   ++tx_counter1;
   }
else UART1->DR=c;

UART1->CR2|= UART1_CR2_TIEN | UART1_CR2_TCIEN;
}


//-----------------------------------------------
void uart1_out_adr(char *ptr, char len)
{
@near char UOB1[30];
@near char i,t=0;
@near short ii;

//for(ii=0;ii<10;ii++)
GPIOB->ODR|=(1<<7);


for(i=0;i<len;i++)
	{
	UOB1[i]=ptr[i];
	}
	



tx_stat=tsON;

for (i=0;i<len;i++)
	{
	putchar1(UOB1[i]);
	} 

//rs485_cnt++;
}





//-----------------------------------------------
char ascii2halFhex(char in)
{
if(isalnum(in))
	{
	if(isdigit(in))
		{
		return in-'0';
		}
	if(islower(in))
		{
		return in-'a'+10;
		}
	if(isupper(in))
		{
		return in-'A'+10;
		}
	}
}


//-----------------------------------------------
void ascii2hex(char *ptr_dst, char *ptr_src, short len)
{
short i;

for(i=0;i<len/2;i++)
	{
	ptr_dst[i]=((ascii2halFhex(ptr_src[i*2]))<<4)+((ascii2halFhex(ptr_src[(i*2)+1])));
	
	}

}


//-----------------------------------------------
int str2int(char *ptr, char len)
{


@near char i;
@near char temp[10]={0,0,0,0,0,0,0,0,0};
@near int temp_out=0;
@near char tt;
//i=3;
//disableInterrupts();
for (i=0;i<len;i++)
{
	tt=*(ptr+i);
	
	if(isalnum(tt/**(ptr+i)*/))
	{
		if(isdigit(tt/**(ptr+i)*/))
		{
		temp[i]=tt/**(ptr+i)*/-'0';
		}
		if(islower(tt/**(ptr+i)*/))
		{
		temp[i]=tt/**(ptr+i)*/-'a'+10;
		}
		if(isupper(tt/**(ptr+i)*/))
		{
		temp[i]=tt;
		temp[i]-=/**(ptr+i)*/'A';
		temp[i]+=10;
		}
		//temp_out=temp[i];
	}
}

for(i=len;i;i--)
{
	temp_out+= ((int)pow(16,len-i))*temp[i-1]; 
}

//temp_out+= temp[3]+(temp[2]*16)+(temp[1]*256);
//enableInterrupts();
return temp_out;
}

//-----------------------------------------------
void rx485_in_an(void)
{
if(bRX485==1)
	{
	ascii2hex(&bat_mod_dump[0][0],&rx_buffer[13],40);
	ascii2hex(&bat_mod_dump[1][0],&rx_buffer[13+40],40);
	ascii2hex(&bat_mod_dump[2][0],&rx_buffer[13+80],40);
	ascii2hex(&bat_mod_dump[3][0],&rx_buffer[13+120],40);
	ascii2hex(&bat_mod_dump[4][0],&rx_buffer[13+160],40);
	ascii2hex(&bat_mod_dump[5][0],&rx_buffer[13+200],40);
	ascii2hex(&bat_mod_dump[6][0],&rx_buffer[13+240],40);
		

		
	rs485_cnt=0;
//	bRS485ERR=0;

	}
else if(bRX485==2)
	{
	ascii2hex(&bat_mod_dump[0][20],&rx_buffer[21],34);
	ascii2hex(&bat_mod_dump[1][20],&rx_buffer[21+34],34);
	ascii2hex(&bat_mod_dump[2][20],&rx_buffer[21+68],34);
	ascii2hex(&bat_mod_dump[3][20],&rx_buffer[21+102],34);
	ascii2hex(&bat_mod_dump[4][20],&rx_buffer[21+136],34);
	ascii2hex(&bat_mod_dump[5][20],&rx_buffer[21+170],34);
	ascii2hex(&bat_mod_dump[6][20],&rx_buffer[21+204],34);
	

	
	
	rs485_cnt=0;	
	}
bRX485=0;	
}

/* -------------------------------------------------------------------------- */
void init_CAN(void) {
	CAN->MCR&=~CAN_MCR_SLEEP;					// CAN wake up request
	CAN->MCR|= CAN_MCR_INRQ;					// CAN initialization request
	while((CAN->MSR & CAN_MSR_INAK) == 0);	// waiting for CAN enter the init mode
	
	CAN->MCR|= CAN_MCR_NART;					// no automatic retransmition
	
	CAN->PSR= 2;							// *** FILTER 0 SETTINGS ***
	


//#ifdef ID_SCALE_8					// accepted range of IDs on filter 0
//	CAN->Page.Filter01.F0R1= MY_MESS_STID>>3;			// 8 bits mode
//	CAN->Page.Filter01.F0R2= MY_MESS_STID_MASK>>3;
//#endif
//#ifdef ID_SCALE_16
	CAN->Page.Filter01.F0R1= MY_MESS_STID>>3;			// 16 bits mode
	CAN->Page.Filter01.F0R2= MY_MESS_STID<<5;
	CAN->Page.Filter01.F0R5= MY_MESS_STID_MASK>>3;
	CAN->Page.Filter01.F0R6= MY_MESS_STID_MASK<<5;
//#endif

	CAN->PSR= 6;									// set page 6
//#ifdef ID_LIST_MODE
//	CAN->Page.Config.FMR1|= 3;								//list mode
//#endif
//#ifdef ID_MASK_MODE
	CAN->Page.Config.FMR1&=~3;								//mask mode
//#endif
//#ifdef ID_SCALE_8
//	CAN->Page.Config.FCR1&= ~(CAN_FCR1_FSC00 | CAN_FCR1_FSC01);			//8 bit scale 
//#endif
//#ifdef ID_SCALE_16
	CAN->Page.Config.FCR1= ((3<<1) & (CAN_FCR1_FSC00 | CAN_FCR1_FSC01));		//16 bit scale
//#endif

	CAN->Page.Config.FCR1|= CAN_FCR1_FACT0;	// filter 0 active
	
	
	CAN->PSR= 6;								// *** BIT TIMING SETTINGS ***
	
	CAN->Page.Config.BTR1= 9;					// CAN_BTR1_BRP=9, 	tq= fcpu/(9+1)
	CAN->Page.Config.BTR2= (1<<7)|(6<<4) | 7; 		// BS2=8, BS1=7, 		
	
	CAN->IER|=(1<<1);
	
	
	CAN->MCR&=~CAN_MCR_INRQ;					// leave initialization request
	while((CAN->MSR & CAN_MSR_INAK) != 0);	// waiting for CAN leave the init mode
}

//-----------------------------------------------
void can_transmit(unsigned short id_st,char data0,char data1,char data2,char data3,char data4,char data5,char data6,char data7)
{

if((can_buff_wr_ptr<0)||(can_buff_wr_ptr>9))can_buff_wr_ptr=0;

can_out_buff[can_buff_wr_ptr][0]=(char)(id_st>>6);
can_out_buff[can_buff_wr_ptr][1]=(char)(id_st<<2);

can_out_buff[can_buff_wr_ptr][2]=data0;
can_out_buff[can_buff_wr_ptr][3]=data1;
can_out_buff[can_buff_wr_ptr][4]=data2;
can_out_buff[can_buff_wr_ptr][5]=data3;
can_out_buff[can_buff_wr_ptr][6]=data4;
can_out_buff[can_buff_wr_ptr][7]=data5;
can_out_buff[can_buff_wr_ptr][8]=data6;
can_out_buff[can_buff_wr_ptr][9]=data7;

can_buff_wr_ptr++;
if(can_buff_wr_ptr>9)can_buff_wr_ptr=0;
} 

//-----------------------------------------------
void can_tx_hndl(void)
{
if(bTX_FREE)
	{
	if(can_buff_rd_ptr!=can_buff_wr_ptr)
		{
		bTX_FREE=0;

		CAN->PSR= 0;
		CAN->Page.TxMailbox.MDLCR=8;
		CAN->Page.TxMailbox.MIDR1=can_out_buff[can_buff_rd_ptr][0];
		CAN->Page.TxMailbox.MIDR2=can_out_buff[can_buff_rd_ptr][1];

		memcpy(&CAN->Page.TxMailbox.MDAR1, &can_out_buff[can_buff_rd_ptr][2],8);

		can_buff_rd_ptr++;
		if(can_buff_rd_ptr>9)can_buff_rd_ptr=0;

		CAN->Page.TxMailbox.MCSR|= CAN_MCSR_TXRQ;
		CAN->IER|=(1<<0);
		}
	}
else 
	{
	tx_busy_cnt++;
	if(tx_busy_cnt>=100)
		{
		tx_busy_cnt=0;
		bTX_FREE=1;
		}
	}
}


//-----------------------------------------------
void can_in_an(void)
{
char temp,i;
signed temp_S;
int tempI;

	/*GPIOD->DDR|=(1<<7);
	GPIOD->CR1|=(1<<7);
	GPIOD->CR2&=~(1<<7);	
	GPIOD->ODR^=(1<<7);*/

//if((mess[0]==1)&&(mess[1]==2)&&(mess[2]==3)&&(mess[3]==4)&&(mess[4]==5)&&(mess[5]==6)&&(mess[6]==7)&&(mess[7]==8))can_transmit1(1,2,3,4,5,6,7//,8);

//adress=1;

if((mess[6]==0xFF)&&(mess[7]==0xff)&&(mess[8]==MEM_KF))	
	{ 
	GPIOD->DDR|=(1<<7);
	GPIOD->CR1|=(1<<7);
	GPIOD->CR2&=~(1<<7);	
	GPIOD->ODR^=(1<<7);
	can_error_cnt=0;
	
	can_transmit(0x18e,MEM_KF,1,1,power_summary%256,power_summary/256,power_current%256,power_current/256,0);
		
     link_cnt=0;
     link=ON;
	
	}





can_in_an_end:
bCAN_RX=0;
}   


//-----------------------------------------------
void t4_init(void){
	TIM4->PSCR = 7;
	TIM4->ARR= 77;
	TIM4->IER|= TIM4_IER_UIE;					// enable break interrupt
	
	TIM4->CR1=(TIM4_CR1_URS | TIM4_CR1_CEN | TIM4_CR1_ARPE);	
	
}

//***********************************************
//***********************************************
//***********************************************
//***********************************************
@far @interrupt void TIM4_UPD_Interrupt (void) 
{
TIM4->SR1&=~TIM4_SR1_UIF;


if(++t0_cnt0>=10)
	{
	t0_cnt0=0;
	b100Hz=1;

	if(++t0_cnt1>=10)
		{
		t0_cnt1=0;
		b10Hz=1;
		}
		
	if(++t0_cnt2>=20)
		{
		t0_cnt2=0;
		b5Hz=1;

		}
		
	if(++t0_cnt4>=50)
		{
		t0_cnt4=0;
		b2Hz=1;
		}
		
	if(++t0_cnt3>=100)
		{
		t0_cnt3=0;
		b1Hz=1;
		}
	}
if(delayCnt)delayCnt--;
			// disable break interrupt
//GPIOA->ODR&=~(1<<4);	

if(tx_stat_cnt)
	{
	tx_stat_cnt--;
	if(tx_stat_cnt==0)tx_stat=tsOFF;
	
	}
/*
if(tx_wd_cnt)
	{
	tx_wd_cnt--;

	}
else 
	{
	GPIOB->ODR&=~(1<<7);
	}
*/

}

//***********************************************
@far @interrupt void CAN_RX_Interrupt (void) 
{

			

		/*GPIOB->DDR|=(1<<1);
		GPIOB->CR1|=(1<<1);
		GPIOB->CR2&=~(1<<1);	
		GPIOB->ODR^=(1<<1);	*/
		
	
CAN->PSR= 7;

/*GPIOD->DDR|=(1<<7);
		GPIOD->CR1|=(1<<7);
		GPIOD->CR2&=~(1<<7);	
		GPIOD->ODR^=(1<<7);*/

// page 7 - read messsage
//while (CAN->RFR & CAN_RFR_FMP01) {				// make up all received messages
memcpy(&mess[0], &CAN->Page.RxFIFO.MFMI, 14); // compare the message content
//				for(i=5; i<MY_MESS_DLC+5; ++i)
//					if(mess[i+1]!=MY_MESS[i]) { tout= 0; break;	};
//				if(tout)
//					set_Rx_LEDs();
//				CAN->RFR|= CAN_RFR_RFOM;				// release received message
//				while(CAN->RFR & CAN_RFR_RFOM);		// wait until the current message is released

//adress=30;
//if((mess[8]==0xeD)&&(mess[6]==adress)) GPIOA->ODR^=(1<<5);	

bCAN_RX=1;
CAN->RFR|=(1<<5);

}

//***********************************************
@far @interrupt void CAN_TX_Interrupt (void) 
{
	if((CAN->TSR)&(1<<0))
	{
	bTX_FREE=1;	
	//GPIOA->ODR^=(1<<5);
	CAN->TSR|=(1<<0);
	}
}


//***********************************************
@far @interrupt void UART1TxInterrupt (void) 
{
@near char tx_status;

tx_status=UART1->SR;

if (tx_status & (UART1_SR_TXE))
{
	if (tx_counter1)
		{
		--tx_counter1;
		UART1->DR=tx_buffer1[tx_rd_index1];
		if (++tx_rd_index1 == TX_BUFFER_SIZE1) tx_rd_index1=0;
		}
	else 
		{
		tx_stat_cnt=3;
			bOUT_FREE=1;
			UART1->CR2&= ~UART1_CR2_TIEN;
			
		}
}
if (tx_status & (UART1_SR_TC))
	{		
	GPIOB->ODR&=~(1<<7);
	UART1->SR&=~UART1_SR_TC;
	}
}

//***********************************************
@far @interrupt void UART1RxInterrupt (void) 
{
@near char temp,rx_status,rx_data;

rx_status=UART1->SR;
rx_data=UART1->DR;

/*if(rx_data==0x0a)
	{
GPIOD->DDR|=(1<<5);
GPIOD->CR1|=(1<<5);
GPIOD->CR2&=~(1<<5);
GPIOD->ODR^=(1<<5);	
	}*/

if ((rx_status & (UART1_SR_RXNE))&&(tx_stat!=tsON))
	{
	
	/**/
	
	temp=rx_data;
	rx_buffer[rx_wr_index1]=rx_data;
	
	
	if(rx_read_power_cnt_phase==1)
		{
		if((rx_buffer[rx_wr_index1]==0x0a)&&(rx_buffer[6]==0xc5))
			{
			rx_read_power_cnt_phase=2;
			delayCnt=10;
/*GPIOD->DDR|=(1<<5);
	GPIOD->CR1|=(1<<5);
	GPIOD->CR2&=~(1<<5);
	GPIOD->ODR|=(1<<5);*/
			}
		}
	else if(rx_read_power_cnt_phase==3)
		{
		if(/*(rx_wr_index1==6)/*&&*/
		(rx_buffer[rx_wr_index1]==0x03)&&(rx_buffer[0]==0x81))
			{
			rx_read_power_cnt_phase=4;
			
			}
		}
	else if(rx_read_power_cnt_phase==4)
		{
		//if((rx_buffer[rx_wr_index]==0x03)&&(rx_buffer[0]==0x81))
			{
			rx_read_power_cnt_phase=5;
			delayCnt=10;
			}
		}

	else if(rx_read_power_cnt_phase==6)
		{
		if(((rx_buffer[rx_wr_index1]&0x7f)=='('))
			{
			rx_read_power_cnt_phase=7;
			tot_pow_buff_ptr=0;
			tot_pow_buff[0]=0;
			tot_pow_buff[1]=0;
			tot_pow_buff[2]=0;
			tot_pow_buff[3]=0;
			tot_pow_buff[4]=0;
			tot_pow_buff[5]=0;
			tot_pow_buff[6]=0;
			tot_pow_buff[7]=0;
			tot_pow_buff[8]=0;
			tot_pow_buff[9]=0;
			
			
			
			}
		}	
	else if(rx_read_power_cnt_phase==7)
		{
		if(((rx_buffer[rx_wr_index1]&0x7f)==')'))
			{
			rx_read_power_cnt_phase=8;
			tot_pow_buff_cnt=tot_pow_buff_ptr;
			tot_pow_buff_ready=1;

			}
		else 
			{
			tot_pow_buff[tot_pow_buff_ptr]=(rx_buffer[rx_wr_index1]&0x7f);
			tot_pow_buff_ptr++;
			}
		}
		
	else if(rx_read_power_cnt_phase==8)
		{
		if(((rx_buffer[rx_wr_index1]&0x7f)==0x03))
			{
			rx_read_power_cnt_phase=9;
			}
		}
	else if(rx_read_power_cnt_phase==9)
		{
		//if((rx_buffer[rx_wr_index]==0x03)&&(rx_buffer[0]==0x81))
			{
			rx_read_power_cnt_phase=10;
			delayCnt=10;
			}
		}
		
	else if(rx_read_power_cnt_phase==11)
		{
		if(((rx_buffer[rx_wr_index1]&0x7f)=='('))
			{
			rx_read_power_cnt_phase=12;
			curr_pow_buff_ptr=0;
			curr_pow_buff[0]=0;
			curr_pow_buff[1]=0;
			curr_pow_buff[2]=0;
			curr_pow_buff[3]=0;
			curr_pow_buff[4]=0;
			curr_pow_buff[5]=0;
			curr_pow_buff[6]=0;
			curr_pow_buff[7]=0;
			curr_pow_buff[8]=0;
			curr_pow_buff[9]=0;
			

			}
		}	
	else if(rx_read_power_cnt_phase==12)
		{
		if(((rx_buffer[rx_wr_index1]&0x7f)==')'))
			{
			rx_read_power_cnt_phase=13;
			curr_pow_buff_cnt=curr_pow_buff_ptr;
			curr_pow_buff_ready=1;
			}
		else 
			{
			curr_pow_buff[curr_pow_buff_ptr]=(rx_buffer[rx_wr_index1]&0x7f);
			curr_pow_buff_ptr++;
			}

		}
		
	else if(rx_read_power_cnt_phase==13)
		{
		if(((rx_buffer[rx_wr_index1]&0x7f)==0x03))
			{
			rx_read_power_cnt_phase=14;
			delayCnt=10;
						GPIOD->DDR|=(1<<5);
			GPIOD->CR1|=(1<<5);
	GPIOD->CR2&=~(1<<5);
	GPIOD->ODR&=~(1<<5);
		GPIOD->ODR&=~(1<<5);
			}
		}			

	rx_wr_index1++;	
	}


}



//===============================================
//===============================================
//===============================================
//===============================================

main()
{
CLK->ECKR|=1;
while((CLK->ECKR & 2) == 0);
CLK->SWCR|=2;
CLK->SWR=0xB4;


t4_init();

		GPIOG->DDR|=(1<<0);
		GPIOG->CR1|=(1<<0);
		GPIOG->CR2&=~(1<<0);	
		//GPIOG->ODR^=(1<<0);

		GPIOG->DDR&=~(1<<1);
		GPIOG->CR1|=(1<<1);
		GPIOG->CR2&=~(1<<1);

init_CAN();

//CAN->DGR&=0xfc;

/*GPIOA->DDR|=(1<<5);
GPIOA->CR1|=(1<<5);
GPIOA->CR2&=~(1<<5);*/

uart1_init();

adress=19;

bat_mod_dump[0][5]=1;
bat_mod_dump[1][5]=2;
bat_mod_dump[2][5]=3;
bat_mod_dump[3][5]=4;
bat_mod_dump[4][5]=5;
bat_mod_dump[5][5]=6;
bat_mod_dump[6][5]=7;



enableInterrupts();
	while (1)
	{
	
	if(bRX485)
	{
		rx485_in_an();
	}

	if(bCAN_RX)
		{
		bCAN_RX=0;
		can_in_an();

/*GPIOD->DDR|=(1<<7);
		GPIOD->CR1|=(1<<7);
		GPIOD->CR2&=~(1<<7);	
		GPIOD->ODR^=(1<<7);*/
		}
	

	if(b100Hz)
		{
		b100Hz=0;
      	}  
      	
	if(b10Hz)
		{
		b10Hz=0;
	
			can_tx_hndl();
			
	
			
      	}
	if(b1Hz)
		{
		static _1hz_cnt;
		b1Hz=0;
 			
		//if(rx_read_power_cnt_phase>20)
		power_net_cnt++;
		if(power_net_cnt>=5)
			{
				power_net_cnt=0;
				rx_read_power_cnt_phase=0;
			}
			
		//putchar1(0x35);
		matemath();

          }
//AF 3F 21 8D 0A AF C5 4B D4 35 C3 C5 B1 30 B2 4D F6 30 B1 8D 0A 
//AF 3F 21 8D 0A AF C5 4B D4 35 C3 C5 B1 30 B2 4D F6 30 B1 8D 0A
//AF 3F 21 8D 0A AF C5 4B D4 35 C3 C5 B1 30 B2 4D F6 30 B1 8D 06 30 35 B1 8D 0A
//AF 3F 21 8D 0A AF C5 4B D4 35 C3 C5 B1 30 B2 4D F6 30 B1 8D 06 30 35 B1 8D 0A AF 3F 21 8D 0A 
//AF 3F 21 8D 0A 82 28 C5 D2 D2 B1 B1 A9 03 9F

//AF 3F 21 8D 0A AF C5 4B D4 35 C3 C5 B1 30 B2 4D F6 30 B1 8D 0A 
//06 30 35 B1 8D 0A 
//81 50 30 82 28 30 B8 B8 30 30 B4 B7 B1 B2 A9 03 24 AF 3F 21 8D 0A 82 28 C5 D2 D2 B1 B1 A9 03 9F 

//AF 3F 21 8D 0A 
//AF C5 4B D4 35 C3 C5 B1 30 B2 4D F6 30 B1 8D 0A AF 3F 21 8D 0A 
//AF 3F 21 8D 0A 
//AF C5 4B D4 35 C3 C5 B1 30 B2 4D F6 30 B1 8D 0A 
//06 30 35 B1 8D 0A 
//81 50 30 82 28 30 B8 B8 30 30 B4 B7 B1 B2 A9 03 24 
//AF 3F 21 8D 0A 
//82 28 C5 D2 D2 B1 B1 A9 03 9F AF 3F 21 8D 0A 82 28 C5 D2 D2 B1 B1 A9 03 9F 


//AF 3F 21 8D 0A AF C5 4B D4 35 C3 C5 B1 30 B2 4D F6 30 B1 8D 0A AF 3F 21 8D 0A AF 3F 21 8D 0A AF C5 4B D4 35 C3 C5 B1 30 B2 4D F6 30 B1 8D 0A 06 30 35 B1 8D 0A 81 50 30 82 28 30 B8 B8 30 30 B4 B7 B1 B2 A9 03 24 AF 3F 21 8D 0A 82 28 C5 D2 D2 B1 B1 A9 03 9F AF 3F 21 8D 0A 


	if (rx_read_power_cnt_phase==0)
		{
		char command_with_crc[20];

GPIOD->DDR|=(1<<5);
	GPIOD->CR1|=(1<<5);
	GPIOD->CR2&=~(1<<5);
	GPIOD->ODR|=(1<<5);	


		command_with_crc[0]=0xaf;  // /
		command_with_crc[1]=0x3f;  // ?
		command_with_crc[2]=0x21;  // !
		command_with_crc[3]=0x8d;  // CR
		command_with_crc[4]=0x0a;  // LF

		uart1_out_adr(command_with_crc,5);

		rx_wr_index1=0;
		rx_read_power_cnt_phase=1;
		}
	if ((rx_read_power_cnt_phase==2)&&(!delayCnt))
		{
		char command_with_crc[20];
	
		command_with_crc[0]=0x06;  //  
		command_with_crc[1]=0x30;  // 0
		command_with_crc[2]=0x35;  // 5
		command_with_crc[3]=0xb1;  // 1
		command_with_crc[4]=0x8d;  // CR
		command_with_crc[5]=0x0a;  // LF
	
		uart1_out_adr(command_with_crc,6);
	
		rx_wr_index1=0;
		rx_read_power_cnt_phase=3;
		}  

/*	if (rx_read_power_cnt_phase==2)
		{
				char command_with_crc[20];

				command_with_crc[0]=0x06;  //  
				command_with_crc[1]=0x30;  // 0
				command_with_crc[2]=0x35;  // 5
				command_with_crc[3]=0xb1;  // 1
				command_with_crc[4]=0x8d;  // CR
				command_with_crc[5]=0x0a;  // LF

				uart_out_adr1(command_with_crc,6);

				rx_wr_index1=0;
				rx_read_power_cnt_phase=3;
		} */
	if ((rx_read_power_cnt_phase==5)&&(!delayCnt))
		{
				char command_with_crc[20];

				command_with_crc[0]=0x81;  //  
				command_with_crc[1]=0xD2;  // R
				command_with_crc[2]=0xb1;  // 1
				command_with_crc[3]=0x82;  // 
				command_with_crc[4]=0xC5;  // E 
				command_with_crc[5]=0xD4;  // T
				command_with_crc[6]=0x30;  // 0
				command_with_crc[7]=0x50;  // P
				command_with_crc[8]=0xC5;  // E 
				command_with_crc[9]=0x28;  // (
				command_with_crc[10]=0xA9;  // )
				command_with_crc[11]=0x03;  // 
				command_with_crc[12]=0xb7;  // bcc


				uart1_out_adr(command_with_crc,13);

				rx_wr_index1=0;
				rx_read_power_cnt_phase=6;
		}

	if ((rx_read_power_cnt_phase==10)&&(!delayCnt))
		{
				char command_with_crc[20];

		command_with_crc[0]=0x81;  //  
		command_with_crc[1]=0xD2;  // R
		command_with_crc[2]=0xb1;  // 1
		command_with_crc[3]=0x82;  // 
		command_with_crc[4]=0x50;  // P 
		command_with_crc[5]=0xCF;  // O
		command_with_crc[6]=0xd7;  // W
		command_with_crc[7]=0xc5;  // E
		command_with_crc[8]=0x50;  // P 
		command_with_crc[9]=0x28;  // (
		command_with_crc[10]=0xA9;  // )
		command_with_crc[11]=0x03;  // 
		command_with_crc[12]=0xe4;  // bcc
	
		uart1_out_adr(command_with_crc,13);

				rx_wr_index1=0;
				rx_read_power_cnt_phase=11;
		}

	if ((rx_read_power_cnt_phase==14)&&(!delayCnt))
		{
		char command_with_crc[20];

		command_with_crc[0]=0x81;  //  
		command_with_crc[1]=0x42;  // B
		command_with_crc[2]=0x30;  // 0
		command_with_crc[3]=0x03;  // 
		command_with_crc[4]=0xf5;  // u 
	
		uart1_out_adr(command_with_crc,5);

				rx_wr_index1=0;
				rx_read_power_cnt_phase=20;

//		ppp=3;
		}
	}	
}