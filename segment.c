#include<stdio.h>

struct seg_desc_low_addr{
	unsigned int limit_low_addr:16;
	unsigned int base_low_addr:16;
};

struct seg_desc_high_addr{
	unsigned int base_mid_addr:8;
	unsigned int type:4;
	unsigned int s:1;
	unsigned int dpl:2;
	unsigned int p:1;
	unsigned int limit_high_addr:4;
	unsigned int avl:1;
	unsigned int l:1;
	unsigned int d_b:1;
	unsigned int g:1;
	unsigned int base_high_addr:8;
};

void pase_type(unsigned int type){
	if(type<=7){
		printf("数据段:");
	}else{
		printf("代码段:");
	}
	
	switch(type){
		case 0: 
		case 1:
			printf("只读\n");
			break;
		case 2:
		case 3:
			printf("可读可写\n");
			break;
		case 4:
		case 5:
			printf("向下拓展，只读\n");
			break;
		case 6:
		case 7:
			printf("向下拓展，可读可写\n");
			break;
		case 8:
		case 9:
			printf("仅执行\n");
			break;
		case 10:
		case 11:
			printf("可读，可执行\n");
			break; 
		case 12:
		case 13:
			printf("一致性段，仅执行\n");
			break;
		case 14:
		case 15:
			printf("一致性段，可读可执行\n");
			break;
		default:
			break;
	}
}

void pase_segment(struct seg_desc_low_addr* ssl,struct seg_desc_high_addr* ssh){
	unsigned int seg_base;
	seg_base = (ssh->base_high_addr<<24)|(ssh->base_mid_addr<<16)|ssl->base_low_addr;
	printf("segment base addr = %#X\n",seg_base);
	unsigned int seg_limit;
	seg_limit=(ssh->limit_high_addr<<16)|ssl->limit_low_addr;
	printf("segment limit addr = %#X\n",seg_limit);
	
	printf("s = %d\n",ssh->s);
	printf("dpl = %d\n",ssh->dpl);
	printf("g = %d\n",ssh->g);
	printf("d/b = %d\n",ssh->d_b);
	printf("type = %d\n",ssh->type);
	
	pase_type(ssh->type); 
}

int main(void){
	printf("input segment descriptor:");
	struct seg_desc_low_addr *low;
	struct seg_desc_high_addr *high;
	
	unsigned int low_word = 0;
	unsigned int high_word = 0;
	
	scanf("%x" "%x",&low_word,&high_word);
	low = (struct seg_desc_low_addr*)&low_word;
	high = (struct seg_desc_high_addr*)&high_word;
	pase_segment(low,high);
	
	return 0;
}
