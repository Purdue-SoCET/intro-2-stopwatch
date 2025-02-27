// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtimer.h for the primary calling header

#ifndef VERILATED_VTIMER___024ROOT_H_
#define VERILATED_VTIMER___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vtimer__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vtimer___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ tb_timer__DOT__clk;
    CData/*0:0*/ tb_timer__DOT__enable;
    CData/*0:0*/ tb_timer__DOT__second_tick;
    CData/*0:0*/ __Vtrigprevexpr___TOP__tb_timer__DOT__clk__0;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ tb_timer__DOT__unnamedblk1__DOT__i;
    IData/*31:0*/ tb_timer__DOT__unnamedblk2__DOT__a;
    IData/*25:0*/ tb_timer__DOT__DUT__DOT__cycles;
    IData/*31:0*/ __VactIterCount;
    VlDelayScheduler __VdlySched;
    VlTriggerVec<2> __VactTriggered;
    VlTriggerVec<2> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vtimer__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vtimer___024root(Vtimer__Syms* symsp, const char* v__name);
    ~Vtimer___024root();
    VL_UNCOPYABLE(Vtimer___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
