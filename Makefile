VERILATE := verilator
VERILATE_FLAGS := --binary --trace-fst

timer: source/timer.sv testbench/tb_timer.sv
	$(VERILATE) $(VERILATE_FLAGS) $^
	cp obj_dir/Vtimer .

fsm: source/fsm.sv testbench/tb_fsm.sv
	$(VERILATE) $(VERILATE_FLAGS) $^
	cp obj_dir/Vfsm .
