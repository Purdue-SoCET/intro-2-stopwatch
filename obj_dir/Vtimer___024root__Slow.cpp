// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtimer.h for the primary calling header

#include "Vtimer__pch.h"
#include "Vtimer__Syms.h"
#include "Vtimer___024root.h"

void Vtimer___024root___ctor_var_reset(Vtimer___024root* vlSelf);

Vtimer___024root::Vtimer___024root(Vtimer__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , __VdlySched{*symsp->_vm_contextp__}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vtimer___024root___ctor_var_reset(this);
}

void Vtimer___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vtimer___024root::~Vtimer___024root() {
}
