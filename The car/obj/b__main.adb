pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E124 : Short_Integer; pragma Import (Ada, E124, "ada__text_io_E");
   E105 : Short_Integer; pragma Import (Ada, E105, "ada__tags_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "ada__strings__text_buffers_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "system__bb__timing_events_E");
   E022 : Short_Integer; pragma Import (Ada, E022, "ada__exceptions_E");
   E047 : Short_Integer; pragma Import (Ada, E047, "system__soft_links_E");
   E045 : Short_Integer; pragma Import (Ada, E045, "system__exception_table_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "ada__streams_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "system__finalization_root_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "ada__finalization_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "system__storage_pools_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "system__finalization_masters_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__real_time_E");
   E160 : Short_Integer; pragma Import (Ada, E160, "system__pool_global_E");
   E218 : Short_Integer; pragma Import (Ada, E218, "system__tasking__protected_objects_E");
   E225 : Short_Integer; pragma Import (Ada, E225, "system__tasking__restricted__stages_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "hal__gpio_E");
   E183 : Short_Integer; pragma Import (Ada, E183, "hal__i2c_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "hal__spi_E");
   E187 : Short_Integer; pragma Import (Ada, E187, "hal__uart_E");
   E214 : Short_Integer; pragma Import (Ada, E214, "memory_barriers_E");
   E212 : Short_Integer; pragma Import (Ada, E212, "cortex_m__nvic_E");
   E205 : Short_Integer; pragma Import (Ada, E205, "nrf__events_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "nrf__gpio_E");
   E207 : Short_Integer; pragma Import (Ada, E207, "nrf__gpio__tasks_and_events_E");
   E209 : Short_Integer; pragma Import (Ada, E209, "nrf__interrupts_E");
   E171 : Short_Integer; pragma Import (Ada, E171, "nrf__rtc_E");
   E174 : Short_Integer; pragma Import (Ada, E174, "nrf__spi_master_E");
   E193 : Short_Integer; pragma Import (Ada, E193, "nrf__tasks_E");
   E191 : Short_Integer; pragma Import (Ada, E191, "nrf__adc_E");
   E216 : Short_Integer; pragma Import (Ada, E216, "nrf__ppi_E");
   E178 : Short_Integer; pragma Import (Ada, E178, "nrf__timers_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "nrf__twi_E");
   E185 : Short_Integer; pragma Import (Ada, E185, "nrf__uart_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "nrf__device_E");
   E189 : Short_Integer; pragma Import (Ada, E189, "microbit__iosfortasking_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "brain_E");

   Sec_Default_Sized_Stacks : array (1 .. 5) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := 0;
      WC_Encoding := 'b';
      Locking_Policy := 'C';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := 'F';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 1;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 5;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Ada.Text_Io'Elab_Body;
      E124 := E124 + 1;
      Ada.Strings.Text_Buffers'Elab_Spec;
      E096 := E096 + 1;
      System.Bb.Timing_Events'Elab_Spec;
      E094 := E094 + 1;
      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      Ada.Tags'Elab_Body;
      E105 := E105 + 1;
      System.Exception_Table'Elab_Body;
      E045 := E045 + 1;
      E047 := E047 + 1;
      E022 := E022 + 1;
      Ada.Streams'Elab_Spec;
      E149 := E149 + 1;
      System.Finalization_Root'Elab_Spec;
      E156 := E156 + 1;
      Ada.Finalization'Elab_Spec;
      E154 := E154 + 1;
      System.Storage_Pools'Elab_Spec;
      E158 := E158 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E153 := E153 + 1;
      Ada.Real_Time'Elab_Body;
      E006 := E006 + 1;
      System.Pool_Global'Elab_Spec;
      E160 := E160 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E218 := E218 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E225 := E225 + 1;
      HAL.GPIO'ELAB_SPEC;
      E151 := E151 + 1;
      HAL.I2C'ELAB_SPEC;
      E183 := E183 + 1;
      HAL.SPI'ELAB_SPEC;
      E176 := E176 + 1;
      HAL.UART'ELAB_SPEC;
      E187 := E187 + 1;
      E214 := E214 + 1;
      E212 := E212 + 1;
      E205 := E205 + 1;
      Nrf.Gpio'Elab_Spec;
      Nrf.Gpio'Elab_Body;
      E142 := E142 + 1;
      E207 := E207 + 1;
      E209 := E209 + 1;
      E171 := E171 + 1;
      Nrf.Spi_Master'Elab_Spec;
      Nrf.Spi_Master'Elab_Body;
      E174 := E174 + 1;
      E193 := E193 + 1;
      E191 := E191 + 1;
      E216 := E216 + 1;
      Nrf.Timers'Elab_Spec;
      Nrf.Timers'Elab_Body;
      E178 := E178 + 1;
      Nrf.Twi'Elab_Spec;
      Nrf.Twi'Elab_Body;
      E181 := E181 + 1;
      Nrf.Uart'Elab_Spec;
      Nrf.Uart'Elab_Body;
      E185 := E185 + 1;
      Nrf.Device'Elab_Spec;
      Nrf.Device'Elab_Body;
      E132 := E132 + 1;
      Microbit.Iosfortasking'Elab_Spec;
      Microbit.Iosfortasking'Elab_Body;
      E189 := E189 + 1;
      brain'elab_spec;
      brain'elab_body;
      E126 := E126 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   procedure main is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
   end;

--  BEGIN Object file/option list
   --   C:\Users\black\Desktop\The car\obj\brain.o
   --   C:\Users\black\Desktop\The car\obj\main.o
   --   -LC:\Users\black\Desktop\The car\obj\
   --   -LC:\Users\black\Desktop\The car\obj\
   --   -LC:\Users\black\Documents\GitHub\Ada_Drivers_Library\boards\MicroBit_v2\obj\full_lib_Debug\
   --   -LC:\gnat\2021-arm-elf\arm-eabi\lib\gnat\ravenscar-full-nrf52833\adalib\
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
