/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_318(char*, char *);
extern void execute_319(char*, char *);
extern void execute_317(char*, char *);
extern void execute_21(char*, char *);
extern void execute_24(char*, char *);
extern void execute_25(char*, char *);
extern void execute_26(char*, char *);
extern void execute_27(char*, char *);
extern void execute_28(char*, char *);
extern void execute_29(char*, char *);
extern void execute_30(char*, char *);
extern void execute_31(char*, char *);
extern void execute_50(char*, char *);
extern void execute_33(char*, char *);
extern void execute_34(char*, char *);
extern void execute_35(char*, char *);
extern void execute_36(char*, char *);
extern void execute_37(char*, char *);
extern void execute_38(char*, char *);
extern void execute_39(char*, char *);
extern void execute_40(char*, char *);
extern void execute_99(char*, char *);
extern void execute_106(char*, char *);
extern void execute_107(char*, char *);
extern void execute_108(char*, char *);
extern void execute_109(char*, char *);
extern void execute_164(char*, char *);
extern void execute_165(char*, char *);
extern void execute_166(char*, char *);
extern void execute_101(char*, char *);
extern void execute_111(char*, char *);
extern void execute_113(char*, char *);
extern void execute_114(char*, char *);
extern void execute_115(char*, char *);
extern void execute_116(char*, char *);
extern void execute_117(char*, char *);
extern void execute_118(char*, char *);
extern void execute_119(char*, char *);
extern void execute_120(char*, char *);
extern void execute_121(char*, char *);
extern void execute_122(char*, char *);
extern void execute_123(char*, char *);
extern void execute_124(char*, char *);
extern void execute_125(char*, char *);
extern void execute_126(char*, char *);
extern void execute_163(char*, char *);
extern void execute_315(char*, char *);
extern void execute_316(char*, char *);
extern void execute_175(char*, char *);
extern void execute_201(char*, char *);
extern void execute_221(char*, char *);
extern void execute_235(char*, char *);
extern void execute_312(char*, char *);
extern void execute_177(char*, char *);
extern void execute_179(char*, char *);
extern void execute_181(char*, char *);
extern void execute_183(char*, char *);
extern void execute_185(char*, char *);
extern void execute_187(char*, char *);
extern void execute_189(char*, char *);
extern void execute_191(char*, char *);
extern void execute_193(char*, char *);
extern void execute_195(char*, char *);
extern void execute_197(char*, char *);
extern void execute_199(char*, char *);
extern void execute_203(char*, char *);
extern void execute_205(char*, char *);
extern void execute_207(char*, char *);
extern void execute_209(char*, char *);
extern void execute_211(char*, char *);
extern void execute_213(char*, char *);
extern void execute_215(char*, char *);
extern void execute_217(char*, char *);
extern void execute_219(char*, char *);
extern void execute_223(char*, char *);
extern void execute_225(char*, char *);
extern void execute_227(char*, char *);
extern void execute_229(char*, char *);
extern void execute_231(char*, char *);
extern void execute_233(char*, char *);
extern void execute_237(char*, char *);
extern void execute_239(char*, char *);
extern void execute_241(char*, char *);
extern void execute_244(char*, char *);
extern void execute_246(char*, char *);
extern void execute_248(char*, char *);
extern void execute_250(char*, char *);
extern void execute_252(char*, char *);
extern void execute_254(char*, char *);
extern void execute_256(char*, char *);
extern void execute_258(char*, char *);
extern void execute_260(char*, char *);
extern void execute_262(char*, char *);
extern void execute_264(char*, char *);
extern void execute_266(char*, char *);
extern void execute_268(char*, char *);
extern void execute_270(char*, char *);
extern void execute_272(char*, char *);
extern void execute_274(char*, char *);
extern void execute_276(char*, char *);
extern void execute_278(char*, char *);
extern void execute_280(char*, char *);
extern void execute_282(char*, char *);
extern void execute_284(char*, char *);
extern void execute_286(char*, char *);
extern void execute_288(char*, char *);
extern void execute_290(char*, char *);
extern void execute_292(char*, char *);
extern void execute_294(char*, char *);
extern void execute_296(char*, char *);
extern void execute_298(char*, char *);
extern void execute_300(char*, char *);
extern void execute_302(char*, char *);
extern void execute_304(char*, char *);
extern void execute_306(char*, char *);
extern void execute_308(char*, char *);
extern void execute_310(char*, char *);
extern void execute_314(char*, char *);
extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_2(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_8(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_12(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_13(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_14(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_15(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_17(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_48(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_49(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_50(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_51(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_87(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[132] = {(funcp)execute_318, (funcp)execute_319, (funcp)execute_317, (funcp)execute_21, (funcp)execute_24, (funcp)execute_25, (funcp)execute_26, (funcp)execute_27, (funcp)execute_28, (funcp)execute_29, (funcp)execute_30, (funcp)execute_31, (funcp)execute_50, (funcp)execute_33, (funcp)execute_34, (funcp)execute_35, (funcp)execute_36, (funcp)execute_37, (funcp)execute_38, (funcp)execute_39, (funcp)execute_40, (funcp)execute_99, (funcp)execute_106, (funcp)execute_107, (funcp)execute_108, (funcp)execute_109, (funcp)execute_164, (funcp)execute_165, (funcp)execute_166, (funcp)execute_101, (funcp)execute_111, (funcp)execute_113, (funcp)execute_114, (funcp)execute_115, (funcp)execute_116, (funcp)execute_117, (funcp)execute_118, (funcp)execute_119, (funcp)execute_120, (funcp)execute_121, (funcp)execute_122, (funcp)execute_123, (funcp)execute_124, (funcp)execute_125, (funcp)execute_126, (funcp)execute_163, (funcp)execute_315, (funcp)execute_316, (funcp)execute_175, (funcp)execute_201, (funcp)execute_221, (funcp)execute_235, (funcp)execute_312, (funcp)execute_177, (funcp)execute_179, (funcp)execute_181, (funcp)execute_183, (funcp)execute_185, (funcp)execute_187, (funcp)execute_189, (funcp)execute_191, (funcp)execute_193, (funcp)execute_195, (funcp)execute_197, (funcp)execute_199, (funcp)execute_203, (funcp)execute_205, (funcp)execute_207, (funcp)execute_209, (funcp)execute_211, (funcp)execute_213, (funcp)execute_215, (funcp)execute_217, (funcp)execute_219, (funcp)execute_223, (funcp)execute_225, (funcp)execute_227, (funcp)execute_229, (funcp)execute_231, (funcp)execute_233, (funcp)execute_237, (funcp)execute_239, (funcp)execute_241, (funcp)execute_244, (funcp)execute_246, (funcp)execute_248, (funcp)execute_250, (funcp)execute_252, (funcp)execute_254, (funcp)execute_256, (funcp)execute_258, (funcp)execute_260, (funcp)execute_262, (funcp)execute_264, (funcp)execute_266, (funcp)execute_268, (funcp)execute_270, (funcp)execute_272, (funcp)execute_274, (funcp)execute_276, (funcp)execute_278, (funcp)execute_280, (funcp)execute_282, (funcp)execute_284, (funcp)execute_286, (funcp)execute_288, (funcp)execute_290, (funcp)execute_292, (funcp)execute_294, (funcp)execute_296, (funcp)execute_298, (funcp)execute_300, (funcp)execute_302, (funcp)execute_304, (funcp)execute_306, (funcp)execute_308, (funcp)execute_310, (funcp)execute_314, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_2, (funcp)transaction_8, (funcp)transaction_12, (funcp)transaction_13, (funcp)transaction_14, (funcp)transaction_15, (funcp)transaction_17, (funcp)transaction_48, (funcp)transaction_49, (funcp)transaction_50, (funcp)transaction_51, (funcp)transaction_87};
const int NumRelocateId= 132;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/test_top_behav/xsim.reloc",  (void **)funcTab, 132);
	iki_vhdl_file_variable_register(dp + 31192);
	iki_vhdl_file_variable_register(dp + 31248);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/test_top_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/test_top_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/test_top_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/test_top_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/test_top_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
