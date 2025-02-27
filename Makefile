VERILATE := verilator
VERILATE_FLAGS := --binary --trace-fst

timer: src/timer.sv tb/tb_timer.sv
	$(VERILATE) $(VERILATE_FLAGS) $^
	cp obj_dir/Vtimer .

fsm: src/fsm.sv tb/tb_fsm.sv
	$(VERILATE) $(VERILATE_FLAGS) $^
	cp obj_dir/Vfsm .
