/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xc3576ebc */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/C15Travis.Schriner/Documents/2dig/ECE383/Lab1_VGAController/Lab1_VGAController/v_sync_test.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );
unsigned char ieee_p_1242562249_sub_2110375371_1035706684(char *, char *, char *, char *, char *);


static void work_a_0285803740_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 4064);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 2448U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3240);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 4064);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 2448U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3240);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_0285803740_2372691052_p_1(char *t0)
{
    char t11[16];
    char *t1;
    char *t2;
    int64 t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;
    unsigned char t16;
    unsigned char t17;
    char *t18;
    unsigned char t19;
    unsigned char t20;
    int64 t22;

LAB0:    t1 = (t0 + 3680U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(71, ng0);
    t3 = (100 * 1000LL);
    t2 = (t0 + 3488);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 4128);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 2448U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t2 = (t0 + 3488);
    xsi_process_wait(t2, t3);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 2152U);
    t4 = *((char **)t2);
    t2 = (t0 + 7132U);
    t5 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t11, 0, 11);
    t12 = ieee_p_1242562249_sub_2110375371_1035706684(IEEE_P_1242562249, t4, t2, t5, t11);
    if (t12 == 1)
        goto LAB20;

LAB21:    t10 = (unsigned char)0;

LAB22:    if (t10 == 1)
        goto LAB17;

LAB18:    t9 = (unsigned char)0;

LAB19:    if (t9 == 1)
        goto LAB14;

LAB15:    t8 = (unsigned char)0;

LAB16:    if (t8 == 0)
        goto LAB12;

LAB13:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 4128);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(79, ng0);
    t2 = (t0 + 2448U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t22 = (t3 * 480);
    t2 = (t0 + 3488);
    xsi_process_wait(t2, t22);

LAB25:    *((char **)t1) = &&LAB26;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    t6 = (t0 + 7188);
    xsi_report(t6, 11U, 2);
    goto LAB13;

LAB14:    t6 = (t0 + 1992U);
    t18 = *((char **)t6);
    t19 = *((unsigned char *)t18);
    t20 = (t19 == (unsigned char)2);
    t8 = t20;
    goto LAB16;

LAB17:    t6 = (t0 + 1672U);
    t15 = *((char **)t6);
    t16 = *((unsigned char *)t15);
    t17 = (t16 == (unsigned char)3);
    t9 = t17;
    goto LAB19;

LAB20:    t6 = (t0 + 1832U);
    t7 = *((char **)t6);
    t13 = *((unsigned char *)t7);
    t14 = (t13 == (unsigned char)2);
    t10 = t14;
    goto LAB22;

LAB23:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 2152U);
    t4 = *((char **)t2);
    t2 = (t0 + 7132U);
    t5 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t11, 300, 11);
    t12 = ieee_p_1242562249_sub_2110375371_1035706684(IEEE_P_1242562249, t4, t2, t5, t11);
    if (t12 == 1)
        goto LAB35;

LAB36:    t10 = (unsigned char)0;

LAB37:    if (t10 == 1)
        goto LAB32;

LAB33:    t9 = (unsigned char)0;

LAB34:    if (t9 == 1)
        goto LAB29;

LAB30:    t8 = (unsigned char)0;

LAB31:    if (t8 == 0)
        goto LAB27;

LAB28:    xsi_set_current_line(83, ng0);
    t2 = (t0 + 2448U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t22 = (t3 * 10);
    t2 = (t0 + 3488);
    xsi_process_wait(t2, t22);

LAB40:    *((char **)t1) = &&LAB41;
    goto LAB1;

LAB24:    goto LAB23;

LAB26:    goto LAB24;

LAB27:    t6 = (t0 + 7199);
    xsi_report(t6, 19U, 2);
    goto LAB28;

LAB29:    t6 = (t0 + 1992U);
    t18 = *((char **)t6);
    t19 = *((unsigned char *)t18);
    t20 = (t19 == (unsigned char)2);
    t8 = t20;
    goto LAB31;

LAB32:    t6 = (t0 + 1672U);
    t15 = *((char **)t6);
    t16 = *((unsigned char *)t15);
    t17 = (t16 == (unsigned char)3);
    t9 = t17;
    goto LAB34;

LAB35:    t6 = (t0 + 1832U);
    t7 = *((char **)t6);
    t13 = *((unsigned char *)t7);
    t14 = (t13 == (unsigned char)2);
    t10 = t14;
    goto LAB37;

LAB38:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 2152U);
    t4 = *((char **)t2);
    t2 = (t0 + 7132U);
    t5 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t11, 0, 11);
    t12 = ieee_p_1242562249_sub_2110375371_1035706684(IEEE_P_1242562249, t4, t2, t5, t11);
    if (t12 == 1)
        goto LAB50;

LAB51:    t10 = (unsigned char)0;

LAB52:    if (t10 == 1)
        goto LAB47;

LAB48:    t9 = (unsigned char)0;

LAB49:    if (t9 == 1)
        goto LAB44;

LAB45:    t8 = (unsigned char)0;

LAB46:    if (t8 == 0)
        goto LAB42;

LAB43:    xsi_set_current_line(87, ng0);
    t2 = (t0 + 2448U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t22 = (t3 * 2);
    t2 = (t0 + 3488);
    xsi_process_wait(t2, t22);

LAB55:    *((char **)t1) = &&LAB56;
    goto LAB1;

LAB39:    goto LAB38;

LAB41:    goto LAB39;

LAB42:    t6 = (t0 + 7218);
    xsi_report(t6, 17U, 2);
    goto LAB43;

LAB44:    t6 = (t0 + 1992U);
    t18 = *((char **)t6);
    t19 = *((unsigned char *)t18);
    t20 = (t19 == (unsigned char)2);
    t8 = t20;
    goto LAB46;

LAB47:    t6 = (t0 + 1672U);
    t15 = *((char **)t6);
    t16 = *((unsigned char *)t15);
    t17 = (t16 == (unsigned char)3);
    t9 = t17;
    goto LAB49;

LAB50:    t6 = (t0 + 1832U);
    t7 = *((char **)t6);
    t13 = *((unsigned char *)t7);
    t14 = (t13 == (unsigned char)3);
    t10 = t14;
    goto LAB52;

LAB53:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 2152U);
    t4 = *((char **)t2);
    t2 = (t0 + 7132U);
    t5 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t11, 0, 11);
    t12 = ieee_p_1242562249_sub_2110375371_1035706684(IEEE_P_1242562249, t4, t2, t5, t11);
    if (t12 == 1)
        goto LAB65;

LAB66:    t10 = (unsigned char)0;

LAB67:    if (t10 == 1)
        goto LAB62;

LAB63:    t9 = (unsigned char)0;

LAB64:    if (t9 == 1)
        goto LAB59;

LAB60:    t8 = (unsigned char)0;

LAB61:    if (t8 == 0)
        goto LAB57;

LAB58:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 2448U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t22 = (t3 * 33);
    t2 = (t0 + 3488);
    xsi_process_wait(t2, t22);

LAB70:    *((char **)t1) = &&LAB71;
    goto LAB1;

LAB54:    goto LAB53;

LAB56:    goto LAB54;

LAB57:    t6 = (t0 + 7235);
    xsi_report(t6, 16U, 2);
    goto LAB58;

LAB59:    t6 = (t0 + 1992U);
    t18 = *((char **)t6);
    t19 = *((unsigned char *)t18);
    t20 = (t19 == (unsigned char)2);
    t8 = t20;
    goto LAB61;

LAB62:    t6 = (t0 + 1672U);
    t15 = *((char **)t6);
    t16 = *((unsigned char *)t15);
    t17 = (t16 == (unsigned char)2);
    t9 = t17;
    goto LAB64;

LAB65:    t6 = (t0 + 1832U);
    t7 = *((char **)t6);
    t13 = *((unsigned char *)t7);
    t14 = (t13 == (unsigned char)3);
    t10 = t14;
    goto LAB67;

LAB68:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 2152U);
    t4 = *((char **)t2);
    t2 = (t0 + 7132U);
    t5 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t11, 0, 11);
    t12 = ieee_p_1242562249_sub_2110375371_1035706684(IEEE_P_1242562249, t4, t2, t5, t11);
    if (t12 == 1)
        goto LAB80;

LAB81:    t10 = (unsigned char)0;

LAB82:    if (t10 == 1)
        goto LAB77;

LAB78:    t9 = (unsigned char)0;

LAB79:    if (t9 == 1)
        goto LAB74;

LAB75:    t8 = (unsigned char)0;

LAB76:    if (t8 == 0)
        goto LAB72;

LAB73:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 2448U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t22 = (t3 * 48);
    t2 = (t0 + 3488);
    xsi_process_wait(t2, t22);

LAB85:    *((char **)t1) = &&LAB86;
    goto LAB1;

LAB69:    goto LAB68;

LAB71:    goto LAB69;

LAB72:    t6 = (t0 + 7251);
    xsi_report(t6, 16U, 2);
    goto LAB73;

LAB74:    t6 = (t0 + 1992U);
    t18 = *((char **)t6);
    t19 = *((unsigned char *)t18);
    t20 = (t19 == (unsigned char)2);
    t8 = t20;
    goto LAB76;

LAB77:    t6 = (t0 + 1672U);
    t15 = *((char **)t6);
    t16 = *((unsigned char *)t15);
    t17 = (t16 == (unsigned char)3);
    t9 = t17;
    goto LAB79;

LAB80:    t6 = (t0 + 1832U);
    t7 = *((char **)t6);
    t13 = *((unsigned char *)t7);
    t14 = (t13 == (unsigned char)3);
    t10 = t14;
    goto LAB82;

LAB83:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 2152U);
    t4 = *((char **)t2);
    t2 = (t0 + 7132U);
    t5 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t11, 0, 11);
    t12 = ieee_p_1242562249_sub_2110375371_1035706684(IEEE_P_1242562249, t4, t2, t5, t11);
    if (t12 == 1)
        goto LAB95;

LAB96:    t10 = (unsigned char)0;

LAB97:    if (t10 == 1)
        goto LAB92;

LAB93:    t9 = (unsigned char)0;

LAB94:    if (t9 == 1)
        goto LAB89;

LAB90:    t8 = (unsigned char)0;

LAB91:    if (t8 == 0)
        goto LAB87;

LAB88:    xsi_set_current_line(100, ng0);
    t2 = (t0 + 2448U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t22 = (t3 * 48);
    t2 = (t0 + 3488);
    xsi_process_wait(t2, t22);

LAB100:    *((char **)t1) = &&LAB101;
    goto LAB1;

LAB84:    goto LAB83;

LAB86:    goto LAB84;

LAB87:    t6 = (t0 + 7267);
    xsi_report(t6, 22U, 2);
    goto LAB88;

LAB89:    t6 = (t0 + 1992U);
    t18 = *((char **)t6);
    t19 = *((unsigned char *)t18);
    t20 = (t19 == (unsigned char)3);
    t8 = t20;
    goto LAB91;

LAB92:    t6 = (t0 + 1672U);
    t15 = *((char **)t6);
    t16 = *((unsigned char *)t15);
    t17 = (t16 == (unsigned char)3);
    t9 = t17;
    goto LAB94;

LAB95:    t6 = (t0 + 1832U);
    t7 = *((char **)t6);
    t13 = *((unsigned char *)t7);
    t14 = (t13 == (unsigned char)3);
    t10 = t14;
    goto LAB97;

LAB98:    xsi_set_current_line(101, ng0);

LAB104:    *((char **)t1) = &&LAB105;
    goto LAB1;

LAB99:    goto LAB98;

LAB101:    goto LAB99;

LAB102:    goto LAB2;

LAB103:    goto LAB102;

LAB105:    goto LAB103;

}


extern void work_a_0285803740_2372691052_init()
{
	static char *pe[] = {(void *)work_a_0285803740_2372691052_p_0,(void *)work_a_0285803740_2372691052_p_1};
	xsi_register_didat("work_a_0285803740_2372691052", "isim/v_sync_test_isim_beh.exe.sim/work/a_0285803740_2372691052.didat");
	xsi_register_executes(pe);
}
