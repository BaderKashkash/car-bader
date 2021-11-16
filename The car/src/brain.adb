with MicroBit.IOsForTasking;
with Ada.Real_Time; use Ada.Real_Time;
with ada.Text_IO; use ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

package body brain is
   x : integer := 0;
   L : Boolean;
   C : Boolean;
   R : Boolean;
   readPot : MicroBit.IOsForTasking.Analog_Value;
   time_now: Ada.Real_Time.Time;

   function RightTurn(var : in out Integer; L : in out Boolean;
                      C : in out Boolean; R : in out Boolean) return Integer is
   begin
      while (var < 75 and L = False
             and C = False and R = True) loop
         MicroBit.IOsForTasking.Set(0, True);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Milliseconds (2);
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, True);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Milliseconds (2);
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, True);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Milliseconds (2);
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, True);
         delay until Clock + Milliseconds (2);
         R := MicroBit.IOsForTasking.Set(7);
         C := MicroBit.IOsForTasking.Set(6);
         L := MicroBit.IOsForTasking.Set(5);
         var := var + 1;
      end loop;
      return var;
   end RightTurn;

   function LeftTurn(var : in out Integer; L : in out Boolean;
                      C : in out Boolean; R : in out Boolean) return Integer is
   begin
      while (var > -75 and L = True
             and C = False and R = False) loop
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, True);
         delay until Clock + Milliseconds (2);
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, True);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Milliseconds (2);
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, True);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Milliseconds (2);
         MicroBit.IOsForTasking.Set(0, True);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Milliseconds (2);
         R := MicroBit.IOsForTasking.Set(7);
         C := MicroBit.IOsForTasking.Set(6);
         L := MicroBit.IOsForTasking.Set(5);
         var := var - 1;
      end loop;
      return var;
   end LeftTurn;

   function CorrectDirection(var : in out Integer) return Integer is
   begin
      while var < 0 loop
         MicroBit.IOsForTasking.Set(0, True);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Milliseconds (2);
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, True);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Milliseconds (2);
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, True);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Milliseconds (2);
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, True);
         delay until Clock + Milliseconds (2);
         var := var + 1;
      end loop;
      while var > 0 loop
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, True);
         delay until Clock + Milliseconds (2);
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, True);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Milliseconds (2);
         MicroBit.IOsForTasking.Set(0, False);
         MicroBit.IOsForTasking.Set(1, True);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Milliseconds (2);
         MicroBit.IOsForTasking.Set(0, True);
         MicroBit.IOsForTasking.Set(1, False);
         MicroBit.IOsForTasking.Set(2, False);
         MicroBit.IOsForTasking.Set(3, False);
         delay until Clock + Milliseconds (2);
         var := var - 1;
      end loop;
      return var;
   end CorrectDirection;

   function ReadRight(R : in out Boolean) return Boolean is
   begin
      return MicroBit.IOsForTasking.Set(7);
   end ReadRight;

   function ReadCenter(C : in out Boolean) return Boolean is
   begin
      return MicroBit.IOsForTasking.Set(6);
   end ReadCenter;

   function ReadLeft(L : in out Boolean) return Boolean is
   begin
      return MicroBit.IOsForTasking.Set(5);
   end ReadLeft;

   Task body ReadSensors is
   begin
      loop
         R := ReadRight(R);
         C := ReadCenter(C);
         L := ReadLeft(L);
         delay until time_now + Ada.Real_Time.Milliseconds(200);
      end loop;
   end ReadSensors;

   Task body Drive is
   begin
      MicroBit.IOsForTasking.Set_Analog_Period_Us(20_000);
      loop
         readPot := MicroBit.IOsForTasking.Analog(4);
         MicroBit.IOsForTasking.Write(10, readPot);
         delay until time_now + Ada.Real_Time.Milliseconds(600);
      end loop;
   end Drive;

   Task body TurnRight is
   begin
      if (L = False and C = False and R = True) then
         x := LeftTurn(x, L, C, R);
      end if;
      delay until time_now + Ada.Real_Time.Milliseconds(300);
      x := CorrectDirection(x);
      delay until time_now + Ada.Real_Time.Milliseconds(200);
   end TurnRight;

   Task body TurnLeft is
   begin
      if (L = True and C = False and R = False) then
         x := RightTurn(x, L, C, R);
      end if;
      delay until time_now + Ada.Real_Time.Milliseconds(300);
      x := CorrectDirection(x);
      delay until time_now + Ada.Real_Time.Milliseconds(200);
   end TurnLeft;
end brain;
