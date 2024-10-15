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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Admin/Desktop/ALU/AND_8bit.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1605435078_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_0232550851_1181938964_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    int t5;
    int t6;
    char *t7;
    char *t8;
    int t9;
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    unsigned char t15;
    char *t16;
    char *t17;
    int t18;
    int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    unsigned char t24;
    unsigned char t25;
    char *t26;
    char *t27;
    int t28;
    int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;

LAB0:    xsi_set_current_line(18, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3112);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(19, ng0);
    t3 = (t0 + 4917);
    *((int *)t3) = 0;
    t4 = (t0 + 4921);
    *((int *)t4) = 7;
    t5 = 0;
    t6 = 7;

LAB5:    if (t5 <= t6)
        goto LAB6;

LAB8:    xsi_set_current_line(22, ng0);
    t1 = (t0 + 1808U);
    t3 = *((char **)t1);
    t1 = (t0 + 3192);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t14 = *((char **)t8);
    memcpy(t14, t3, 8U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB6:    xsi_set_current_line(20, ng0);
    t7 = (t0 + 1192U);
    t8 = *((char **)t7);
    t7 = (t0 + 4917);
    t9 = *((int *)t7);
    t10 = (t9 - 7);
    t11 = (t10 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t7));
    t12 = (1U * t11);
    t13 = (0 + t12);
    t14 = (t8 + t13);
    t15 = *((unsigned char *)t14);
    t16 = (t0 + 1352U);
    t17 = *((char **)t16);
    t16 = (t0 + 4917);
    t18 = *((int *)t16);
    t19 = (t18 - 7);
    t20 = (t19 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t16));
    t21 = (1U * t20);
    t22 = (0 + t21);
    t23 = (t17 + t22);
    t24 = *((unsigned char *)t23);
    t25 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t15, t24);
    t26 = (t0 + 1808U);
    t27 = *((char **)t26);
    t26 = (t0 + 4917);
    t28 = *((int *)t26);
    t29 = (t28 - 7);
    t30 = (t29 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t26));
    t31 = (1U * t30);
    t32 = (0 + t31);
    t33 = (t27 + t32);
    *((unsigned char *)t33) = t25;

LAB7:    t1 = (t0 + 4917);
    t5 = *((int *)t1);
    t3 = (t0 + 4921);
    t6 = *((int *)t3);
    if (t5 == t6)
        goto LAB8;

LAB9:    t9 = (t5 + 1);
    t5 = t9;
    t4 = (t0 + 4917);
    *((int *)t4) = t5;
    goto LAB5;

}


extern void work_a_0232550851_1181938964_init()
{
	static char *pe[] = {(void *)work_a_0232550851_1181938964_p_0};
	xsi_register_didat("work_a_0232550851_1181938964", "isim/ALU_isim_beh.exe.sim/work/a_0232550851_1181938964.didat");
	xsi_register_executes(pe);
}
