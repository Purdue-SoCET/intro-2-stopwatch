// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtimer.h for the primary calling header

#include "Vtimer__pch.h"
#include "Vtimer___024root.h"

VlCoroutine Vtimer___024root___eval_initial__TOP__Vtiming__0(Vtimer___024root* vlSelf);

void Vtimer___024root___eval_initial(Vtimer___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtimer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtimer___024root___eval_initial\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vtimer___024root___eval_initial__TOP__Vtiming__0(vlSelf);
    vlSelfRef.__Vtrigprevexpr___TOP__tb_timer__DOT__clk__0 
        = vlSelfRef.tb_timer__DOT__clk;
}

VL_INLINE_OPT VlCoroutine Vtimer___024root___eval_initial__TOP__Vtiming__0(Vtimer___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtimer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtimer___024root___eval_initial__TOP__Vtiming__0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.tb_timer__DOT__enable = 1U;
    vlSelfRef.tb_timer__DOT__unnamedblk1__DOT__i = 0U;
    while (VL_GTS_III(32, 0x98964eU, vlSelfRef.tb_timer__DOT__unnamedblk1__DOT__i)) {
        co_await vlSelfRef.__VdlySched.delay(1ULL, 
                                             nullptr, 
                                             "testbench/tb_timer.sv", 
                                             17);
        vlSelfRef.tb_timer__DOT__clk = 1U;
        co_await vlSelfRef.__VdlySched.delay(1ULL, 
                                             nullptr, 
                                             "testbench/tb_timer.sv", 
                                             19);
        vlSelfRef.tb_timer__DOT__clk = 0U;
        vlSelfRef.tb_timer__DOT__unnamedblk1__DOT__i 
            = ((IData)(1U) + vlSelfRef.tb_timer__DOT__unnamedblk1__DOT__i);
    }
    vlSelfRef.tb_timer__DOT__unnamedblk2__DOT__a = 0U;
    while (VL_GTS_III(32, 0x64U, vlSelfRef.tb_timer__DOT__unnamedblk2__DOT__a)) {
        co_await vlSelfRef.__VdlySched.delay(1ULL, 
                                             nullptr, 
                                             "testbench/tb_timer.sv", 
                                             17);
        vlSelfRef.tb_timer__DOT__clk = 1U;
        co_await vlSelfRef.__VdlySched.delay(1ULL, 
                                             nullptr, 
                                             "testbench/tb_timer.sv", 
                                             19);
        vlSelfRef.tb_timer__DOT__clk = 0U;
        if (vlSelfRef.tb_timer__DOT__second_tick) {
            VL_WRITEF_NX("%11d tick!\n",0,32,((IData)(0x98964eU) 
                                              + vlSelfRef.tb_timer__DOT__unnamedblk2__DOT__a));
        } else {
            VL_WRITEF_NX("%11d tock!\n",0,32,((IData)(0x98964eU) 
                                              + vlSelfRef.tb_timer__DOT__unnamedblk2__DOT__a));
        }
        vlSelfRef.tb_timer__DOT__unnamedblk2__DOT__a 
            = ((IData)(1U) + vlSelfRef.tb_timer__DOT__unnamedblk2__DOT__a);
    }
}

void Vtimer___024root___eval_act(Vtimer___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtimer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtimer___024root___eval_act\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
}

void Vtimer___024root___nba_sequent__TOP__0(Vtimer___024root* vlSelf);

void Vtimer___024root___eval_nba(Vtimer___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtimer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtimer___024root___eval_nba\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vtimer___024root___nba_sequent__TOP__0(vlSelf);
    }
}

VL_INLINE_OPT void Vtimer___024root___nba_sequent__TOP__0(Vtimer___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtimer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtimer___024root___nba_sequent__TOP__0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*25:0*/ __Vdly__tb_timer__DOT__DUT__DOT__cycles;
    __Vdly__tb_timer__DOT__DUT__DOT__cycles = 0;
    // Body
    __Vdly__tb_timer__DOT__DUT__DOT__cycles = vlSelfRef.tb_timer__DOT__DUT__DOT__cycles;
    if (vlSelfRef.tb_timer__DOT__enable) {
        if ((0x989680U == vlSelfRef.tb_timer__DOT__DUT__DOT__cycles)) {
            vlSelfRef.tb_timer__DOT__second_tick = 1U;
            __Vdly__tb_timer__DOT__DUT__DOT__cycles = 0U;
        } else {
            vlSelfRef.tb_timer__DOT__second_tick = 0U;
        }
        __Vdly__tb_timer__DOT__DUT__DOT__cycles = (0x3ffffffU 
                                                   & ((IData)(1U) 
                                                      + vlSelfRef.tb_timer__DOT__DUT__DOT__cycles));
    }
    vlSelfRef.tb_timer__DOT__DUT__DOT__cycles = __Vdly__tb_timer__DOT__DUT__DOT__cycles;
}

void Vtimer___024root___timing_resume(Vtimer___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtimer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtimer___024root___timing_resume\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((2ULL & vlSelfRef.__VactTriggered.word(0U))) {
        vlSelfRef.__VdlySched.resume();
    }
}

void Vtimer___024root___eval_triggers__act(Vtimer___024root* vlSelf);

bool Vtimer___024root___eval_phase__act(Vtimer___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtimer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtimer___024root___eval_phase__act\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlTriggerVec<2> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    Vtimer___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelfRef.__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelfRef.__VactTriggered, vlSelfRef.__VnbaTriggered);
        vlSelfRef.__VnbaTriggered.thisOr(vlSelfRef.__VactTriggered);
        Vtimer___024root___timing_resume(vlSelf);
        Vtimer___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Vtimer___024root___eval_phase__nba(Vtimer___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtimer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtimer___024root___eval_phase__nba\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelfRef.__VnbaTriggered.any();
    if (__VnbaExecute) {
        Vtimer___024root___eval_nba(vlSelf);
        vlSelfRef.__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtimer___024root___dump_triggers__nba(Vtimer___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vtimer___024root___dump_triggers__act(Vtimer___024root* vlSelf);
#endif  // VL_DEBUG

void Vtimer___024root___eval(Vtimer___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtimer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtimer___024root___eval\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
            Vtimer___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("testbench/tb_timer.sv", 1, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelfRef.__VactIterCount = 0U;
        vlSelfRef.__VactContinue = 1U;
        while (vlSelfRef.__VactContinue) {
            if (VL_UNLIKELY((0x64U < vlSelfRef.__VactIterCount))) {
#ifdef VL_DEBUG
                Vtimer___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("testbench/tb_timer.sv", 1, "", "Active region did not converge.");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactContinue = 0U;
            if (Vtimer___024root___eval_phase__act(vlSelf)) {
                vlSelfRef.__VactContinue = 1U;
            }
        }
        if (Vtimer___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void Vtimer___024root___eval_debug_assertions(Vtimer___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtimer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtimer___024root___eval_debug_assertions\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
}
#endif  // VL_DEBUG
