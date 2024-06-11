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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/code/UART/uart_rx.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static int ng3[] = {7, 0};
static int ng4[] = {15, 0};



static void Initial_48_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(48, ng0);

LAB2:    xsi_set_current_line(49, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2928);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 8, 0LL);
    xsi_set_current_line(50, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3728);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 8, 0LL);
    xsi_set_current_line(51, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2608);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);
    xsi_set_current_line(52, ng0);
    t1 = (t0 + 608);
    t2 = *((char **)t1);
    t1 = (t0 + 2768);
    xsi_vlogvar_wait_assign_value(t1, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(53, ng0);
    t1 = (t0 + 608);
    t2 = *((char **)t1);
    t1 = (t0 + 3408);
    xsi_vlogvar_wait_assign_value(t1, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(54, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3888);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);
    xsi_set_current_line(55, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 4048);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);
    xsi_set_current_line(56, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 4208);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);
    xsi_set_current_line(57, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3088);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 4, 0LL);
    xsi_set_current_line(58, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3248);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 4, 0LL);
    xsi_set_current_line(59, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3568);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 4, 0LL);

LAB1:    return;
}

static void Always_62_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;

LAB0:    t1 = (t0 + 5368U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 6928);
    *((int *)t2) = 1;
    t3 = (t0 + 5400);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(62, ng0);

LAB5:    xsi_set_current_line(63, ng0);
    t4 = (t0 + 2048U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(63, ng0);

LAB9:    xsi_set_current_line(64, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 2928);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 8, 0LL);
    xsi_set_current_line(65, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2608);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(67, ng0);
    t2 = (t0 + 608);
    t3 = *((char **)t2);
    t2 = (t0 + 2768);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 0LL);
    xsi_set_current_line(68, ng0);
    t2 = (t0 + 608);
    t3 = *((char **)t2);
    t2 = (t0 + 3408);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 0LL);
    xsi_set_current_line(69, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3888);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(72, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(73, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(74, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    goto LAB8;

}

static void Always_78_2(char *t0)
{
    char t10[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int t9;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char *t35;

LAB0:    t1 = (t0 + 5616U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 6944);
    *((int *)t2) = 1;
    t3 = (t0 + 5648);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(78, ng0);

LAB5:    xsi_set_current_line(79, ng0);
    t4 = (t0 + 2768);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = (t0 + 608);
    t8 = *((char **)t7);
    t9 = xsi_vlog_unsigned_case_compare(t6, 2, t8, 32);
    if (t9 == 1)
        goto LAB7;

LAB8:
LAB9:    goto LAB2;

LAB7:    xsi_set_current_line(80, ng0);

LAB10:    xsi_set_current_line(81, ng0);
    t7 = (t0 + 2208U);
    t11 = *((char **)t7);
    memset(t10, 0, 8);
    t7 = (t11 + 4);
    t12 = *((unsigned int *)t7);
    t13 = (~(t12));
    t14 = *((unsigned int *)t11);
    t15 = (t14 & t13);
    t16 = (t15 & 1U);
    if (t16 != 0)
        goto LAB14;

LAB12:    if (*((unsigned int *)t7) == 0)
        goto LAB11;

LAB13:    t17 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t17) = 1;

LAB14:    t18 = (t10 + 4);
    t19 = (t11 + 4);
    t20 = *((unsigned int *)t11);
    t21 = (~(t20));
    *((unsigned int *)t10) = t21;
    *((unsigned int *)t18) = 0;
    if (*((unsigned int *)t19) != 0)
        goto LAB16;

LAB15:    t26 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t26 & 1U);
    t27 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t27 & 1U);
    t28 = (t10 + 4);
    t29 = *((unsigned int *)t28);
    t30 = (~(t29));
    t31 = *((unsigned int *)t10);
    t32 = (t31 & t30);
    t33 = (t32 != 0);
    if (t33 > 0)
        goto LAB17;

LAB18:
LAB19:    goto LAB9;

LAB11:    *((unsigned int *)t10) = 1;
    goto LAB14;

LAB16:    t22 = *((unsigned int *)t10);
    t23 = *((unsigned int *)t19);
    *((unsigned int *)t10) = (t22 | t23);
    t24 = *((unsigned int *)t18);
    t25 = *((unsigned int *)t19);
    *((unsigned int *)t18) = (t24 | t25);
    goto LAB15;

LAB17:    xsi_set_current_line(81, ng0);

LAB20:    xsi_set_current_line(82, ng0);
    t34 = (t0 + 744);
    t35 = *((char **)t34);
    t34 = (t0 + 3408);
    xsi_vlogvar_wait_assign_value(t34, t35, 0, 0, 2, 0LL);
    xsi_set_current_line(83, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3888);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB19;

}

static void Always_89_3(char *t0)
{
    char t13[8];
    char t37[8];
    char t47[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    char *t11;
    char *t12;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    char *t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    char *t46;
    char *t48;
    char *t49;
    char *t50;
    char *t51;
    char *t52;
    char *t53;
    char *t54;
    unsigned int t55;
    int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;

LAB0:    t1 = (t0 + 5864U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 6960);
    *((int *)t2) = 1;
    t3 = (t0 + 5896);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(89, ng0);

LAB5:    xsi_set_current_line(90, ng0);
    t4 = (t0 + 2768);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = (t0 + 744);
    t8 = *((char **)t7);
    t9 = xsi_vlog_unsigned_case_compare(t6, 2, t8, 32);
    if (t9 == 1)
        goto LAB7;

LAB8:    t2 = (t0 + 880);
    t3 = *((char **)t2);
    t9 = xsi_vlog_unsigned_case_compare(t6, 2, t3, 32);
    if (t9 == 1)
        goto LAB9;

LAB10:    t2 = (t0 + 1016);
    t3 = *((char **)t2);
    t9 = xsi_vlog_unsigned_case_compare(t6, 2, t3, 32);
    if (t9 == 1)
        goto LAB11;

LAB12:
LAB13:    goto LAB2;

LAB7:    xsi_set_current_line(91, ng0);

LAB14:    xsi_set_current_line(92, ng0);
    t7 = (t0 + 3088);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    t12 = ((char*)((ng3)));
    memset(t13, 0, 8);
    t14 = (t11 + 4);
    t15 = (t12 + 4);
    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB18;

LAB15:    if (t25 != 0)
        goto LAB17;

LAB16:    *((unsigned int *)t13) = 1;

LAB18:    t29 = (t13 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (~(t30));
    t32 = *((unsigned int *)t13);
    t33 = (t32 & t31);
    t34 = (t33 != 0);
    if (t34 > 0)
        goto LAB19;

LAB20:    xsi_set_current_line(98, ng0);
    t2 = (t0 + 3088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t4, 4, t5, 32);
    t7 = (t0 + 3088);
    xsi_vlogvar_wait_assign_value(t7, t13, 0, 0, 4, 0LL);

LAB21:    goto LAB13;

LAB9:    xsi_set_current_line(100, ng0);

LAB23:    xsi_set_current_line(101, ng0);
    t2 = (t0 + 3248);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng3)));
    memset(t13, 0, 8);
    t8 = (t5 + 4);
    if (*((unsigned int *)t8) != 0)
        goto LAB25;

LAB24:    t10 = (t7 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB25;

LAB28:    if (*((unsigned int *)t5) < *((unsigned int *)t7))
        goto LAB26;

LAB27:    t12 = (t13 + 4);
    t16 = *((unsigned int *)t12);
    t17 = (~(t16));
    t18 = *((unsigned int *)t13);
    t19 = (t18 & t17);
    t20 = (t19 != 0);
    if (t20 > 0)
        goto LAB29;

LAB30:
LAB31:    xsi_set_current_line(112, ng0);
    t2 = (t0 + 3248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t13, 0, 8);
    t7 = (t4 + 4);
    t8 = (t5 + 4);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t7);
    t20 = *((unsigned int *)t8);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t7);
    t24 = *((unsigned int *)t8);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB46;

LAB43:    if (t25 != 0)
        goto LAB45;

LAB44:    *((unsigned int *)t13) = 1;

LAB46:    t11 = (t13 + 4);
    t30 = *((unsigned int *)t11);
    t31 = (~(t30));
    t32 = *((unsigned int *)t13);
    t33 = (t32 & t31);
    t34 = (t33 != 0);
    if (t34 > 0)
        goto LAB47;

LAB48:
LAB49:    goto LAB13;

LAB11:    xsi_set_current_line(126, ng0);

LAB61:    xsi_set_current_line(127, ng0);
    t2 = (t0 + 3088);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng4)));
    memset(t13, 0, 8);
    t8 = (t5 + 4);
    t10 = (t7 + 4);
    t16 = *((unsigned int *)t5);
    t17 = *((unsigned int *)t7);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t8);
    t20 = *((unsigned int *)t10);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t8);
    t24 = *((unsigned int *)t10);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB65;

LAB62:    if (t25 != 0)
        goto LAB64;

LAB63:    *((unsigned int *)t13) = 1;

LAB65:    t12 = (t13 + 4);
    t30 = *((unsigned int *)t12);
    t31 = (~(t30));
    t32 = *((unsigned int *)t13);
    t33 = (t32 & t31);
    t34 = (t33 != 0);
    if (t34 > 0)
        goto LAB66;

LAB67:    xsi_set_current_line(134, ng0);
    t2 = (t0 + 3088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t4, 4, t5, 32);
    t7 = (t0 + 3088);
    xsi_vlogvar_wait_assign_value(t7, t13, 0, 0, 4, 0LL);

LAB68:    goto LAB13;

LAB17:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB18;

LAB19:    xsi_set_current_line(92, ng0);

LAB22:    xsi_set_current_line(93, ng0);
    t35 = (t0 + 880);
    t36 = *((char **)t35);
    t35 = (t0 + 3408);
    xsi_vlogvar_wait_assign_value(t35, t36, 0, 0, 2, 0LL);
    xsi_set_current_line(94, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3888);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(95, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    goto LAB21;

LAB25:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB27;

LAB26:    *((unsigned int *)t13) = 1;
    goto LAB27;

LAB29:    xsi_set_current_line(101, ng0);

LAB32:    xsi_set_current_line(102, ng0);
    t14 = (t0 + 3088);
    t15 = (t14 + 56U);
    t28 = *((char **)t15);
    t29 = ((char*)((ng4)));
    memset(t37, 0, 8);
    t35 = (t28 + 4);
    t36 = (t29 + 4);
    t21 = *((unsigned int *)t28);
    t22 = *((unsigned int *)t29);
    t23 = (t21 ^ t22);
    t24 = *((unsigned int *)t35);
    t25 = *((unsigned int *)t36);
    t26 = (t24 ^ t25);
    t27 = (t23 | t26);
    t30 = *((unsigned int *)t35);
    t31 = *((unsigned int *)t36);
    t32 = (t30 | t31);
    t33 = (~(t32));
    t34 = (t27 & t33);
    if (t34 != 0)
        goto LAB36;

LAB33:    if (t32 != 0)
        goto LAB35;

LAB34:    *((unsigned int *)t37) = 1;

LAB36:    t39 = (t37 + 4);
    t40 = *((unsigned int *)t39);
    t41 = (~(t40));
    t42 = *((unsigned int *)t37);
    t43 = (t42 & t41);
    t44 = (t43 != 0);
    if (t44 > 0)
        goto LAB37;

LAB38:    xsi_set_current_line(110, ng0);
    t2 = (t0 + 3088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t4, 4, t5, 32);
    t7 = (t0 + 3088);
    xsi_vlogvar_wait_assign_value(t7, t13, 0, 0, 4, 0LL);

LAB39:    goto LAB31;

LAB35:    t38 = (t37 + 4);
    *((unsigned int *)t37) = 1;
    *((unsigned int *)t38) = 1;
    goto LAB36;

LAB37:    xsi_set_current_line(102, ng0);

LAB40:    xsi_set_current_line(103, ng0);
    t45 = (t0 + 2208U);
    t46 = *((char **)t45);
    t45 = (t0 + 3728);
    t48 = (t0 + 3728);
    t49 = (t48 + 72U);
    t50 = *((char **)t49);
    t51 = (t0 + 3248);
    t52 = (t51 + 56U);
    t53 = *((char **)t52);
    xsi_vlog_generic_convert_bit_index(t47, t50, 2, t53, 4, 2);
    t54 = (t47 + 4);
    t55 = *((unsigned int *)t54);
    t56 = (!(t55));
    if (t56 == 1)
        goto LAB41;

LAB42:    xsi_set_current_line(104, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(105, ng0);
    t2 = (t0 + 3248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t4, 4, t5, 32);
    t7 = (t0 + 3568);
    xsi_vlogvar_wait_assign_value(t7, t13, 0, 0, 4, 0LL);
    xsi_set_current_line(106, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(107, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    goto LAB39;

LAB41:    xsi_vlogvar_wait_assign_value(t45, t46, 0, *((unsigned int *)t47), 1, 0LL);
    goto LAB42;

LAB45:    t10 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB46;

LAB47:    xsi_set_current_line(112, ng0);

LAB50:    xsi_set_current_line(113, ng0);
    t12 = (t0 + 3088);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    t28 = ((char*)((ng4)));
    memset(t37, 0, 8);
    t29 = (t15 + 4);
    t35 = (t28 + 4);
    t40 = *((unsigned int *)t15);
    t41 = *((unsigned int *)t28);
    t42 = (t40 ^ t41);
    t43 = *((unsigned int *)t29);
    t44 = *((unsigned int *)t35);
    t55 = (t43 ^ t44);
    t57 = (t42 | t55);
    t58 = *((unsigned int *)t29);
    t59 = *((unsigned int *)t35);
    t60 = (t58 | t59);
    t61 = (~(t60));
    t62 = (t57 & t61);
    if (t62 != 0)
        goto LAB54;

LAB51:    if (t60 != 0)
        goto LAB53;

LAB52:    *((unsigned int *)t37) = 1;

LAB54:    t38 = (t37 + 4);
    t63 = *((unsigned int *)t38);
    t64 = (~(t63));
    t65 = *((unsigned int *)t37);
    t66 = (t65 & t64);
    t67 = (t66 != 0);
    if (t67 > 0)
        goto LAB55;

LAB56:    xsi_set_current_line(123, ng0);
    t2 = (t0 + 3088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t4, 4, t5, 32);
    t7 = (t0 + 3088);
    xsi_vlogvar_wait_assign_value(t7, t13, 0, 0, 4, 0LL);

LAB57:    goto LAB49;

LAB53:    t36 = (t37 + 4);
    *((unsigned int *)t37) = 1;
    *((unsigned int *)t36) = 1;
    goto LAB54;

LAB55:    xsi_set_current_line(113, ng0);

LAB58:    xsi_set_current_line(114, ng0);
    t39 = (t0 + 2208U);
    t45 = *((char **)t39);
    t39 = (t0 + 3728);
    t46 = (t0 + 3728);
    t48 = (t46 + 72U);
    t49 = *((char **)t48);
    t50 = (t0 + 3248);
    t51 = (t50 + 56U);
    t52 = *((char **)t51);
    xsi_vlog_generic_convert_bit_index(t47, t49, 2, t52, 4, 2);
    t53 = (t47 + 4);
    t68 = *((unsigned int *)t53);
    t9 = (!(t68));
    if (t9 == 1)
        goto LAB59;

LAB60:    xsi_set_current_line(115, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(116, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(117, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(118, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(119, ng0);
    t2 = (t0 + 1016);
    t3 = *((char **)t2);
    t2 = (t0 + 3408);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 0LL);
    xsi_set_current_line(120, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3888);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB57;

LAB59:    xsi_vlogvar_wait_assign_value(t39, t45, 0, *((unsigned int *)t47), 1, 0LL);
    goto LAB60;

LAB64:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB65;

LAB66:    xsi_set_current_line(127, ng0);

LAB69:    xsi_set_current_line(128, ng0);
    t14 = ((char*)((ng1)));
    t15 = (t0 + 3088);
    xsi_vlogvar_wait_assign_value(t15, t14, 0, 0, 4, 0LL);
    xsi_set_current_line(129, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2608);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(130, ng0);
    t2 = (t0 + 608);
    t3 = *((char **)t2);
    t2 = (t0 + 3408);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 0LL);
    xsi_set_current_line(131, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3888);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB68;

}

static void Always_139_4(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    t1 = (t0 + 6112U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(139, ng0);
    t2 = (t0 + 6976);
    *((int *)t2) = 1;
    t3 = (t0 + 6144);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(139, ng0);

LAB5:    xsi_set_current_line(140, ng0);
    t4 = (t0 + 3888);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB6;

LAB7:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(140, ng0);

LAB9:    xsi_set_current_line(141, ng0);
    t13 = (t0 + 3408);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t0 + 2768);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 2, 0LL);
    xsi_set_current_line(142, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3888);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB8;

}

static void Always_146_5(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    t1 = (t0 + 6360U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(146, ng0);
    t2 = (t0 + 6992);
    *((int *)t2) = 1;
    t3 = (t0 + 6392);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(146, ng0);

LAB5:    xsi_set_current_line(147, ng0);
    t4 = (t0 + 4048);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB6;

LAB7:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(147, ng0);

LAB9:    xsi_set_current_line(148, ng0);
    t13 = (t0 + 3568);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t0 + 3248);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 4, 0LL);
    xsi_set_current_line(149, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB8;

}

static void Always_153_6(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    t1 = (t0 + 6608U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(153, ng0);
    t2 = (t0 + 7008);
    *((int *)t2) = 1;
    t3 = (t0 + 6640);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(153, ng0);

LAB5:    xsi_set_current_line(154, ng0);
    t4 = (t0 + 4208);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB6;

LAB7:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(154, ng0);

LAB9:    xsi_set_current_line(155, ng0);
    t13 = (t0 + 3728);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t0 + 2928);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 8, 0LL);
    xsi_set_current_line(156, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB8;

}


extern void work_m_13644953323724594242_4213641838_init()
{
	static char *pe[] = {(void *)Initial_48_0,(void *)Always_62_1,(void *)Always_78_2,(void *)Always_89_3,(void *)Always_139_4,(void *)Always_146_5,(void *)Always_153_6};
	xsi_register_didat("work_m_13644953323724594242_4213641838", "isim/uart_rx_test_isim_beh.exe.sim/work/m_13644953323724594242_4213641838.didat");
	xsi_register_executes(pe);
}
