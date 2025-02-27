// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_fst_c.h"
#include "Vtimer__Syms.h"


void Vtimer___024root__trace_chg_0_sub_0(Vtimer___024root* vlSelf, VerilatedFst::Buffer* bufp);

void Vtimer___024root__trace_chg_0(void* voidSelf, VerilatedFst::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtimer___024root__trace_chg_0\n"); );
    // Init
    Vtimer___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vtimer___024root*>(voidSelf);
    Vtimer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    Vtimer___024root__trace_chg_0_sub_0((&vlSymsp->TOP), bufp);
}

void Vtimer___024root__trace_chg_0_sub_0(Vtimer___024root* vlSelf, VerilatedFst::Buffer* bufp) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtimer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtimer___024root__trace_chg_0_sub_0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 1);
    // Body
    bufp->chgBit(oldp+0,(vlSelfRef.tb_timer__DOT__clk));
    bufp->chgBit(oldp+1,(vlSelfRef.tb_timer__DOT__enable));
    bufp->chgBit(oldp+2,(vlSelfRef.tb_timer__DOT__second_tick));
    bufp->chgIData(oldp+3,(vlSelfRef.tb_timer__DOT__DUT__DOT__cycles),26);
    bufp->chgIData(oldp+4,(vlSelfRef.tb_timer__DOT__unnamedblk1__DOT__i),32);
    bufp->chgIData(oldp+5,(vlSelfRef.tb_timer__DOT__unnamedblk2__DOT__a),32);
}

void Vtimer___024root__trace_cleanup(void* voidSelf, VerilatedFst* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtimer___024root__trace_cleanup\n"); );
    // Init
    Vtimer___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vtimer___024root*>(voidSelf);
    Vtimer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VlUnpacked<CData/*0:0*/, 1> __Vm_traceActivity;
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        __Vm_traceActivity[__Vi0] = 0;
    }
    // Body
    vlSymsp->__Vm_activity = false;
    __Vm_traceActivity[0U] = 0U;
}
