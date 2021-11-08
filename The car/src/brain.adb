with MicroBit.IOsForTasking;
with ada.Text_IO; use ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

package body brain is
   x : integer := 0;
   L : Boolean;
   C : Boolean;
   R : Boolean;
   readPot : MicroBit.IOsForTasking.Analog_Value;

   function RightTurn(var : in out Integer) return integer is
   begin
      while var < 100 loop
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
      return var;
   end RightTurn;

   function LeftTurn(var : in out Integer) return integer is
   begin
      while var > -100 loop
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

   Task body ReadSensors is
   begin
      loop
         L := MicroBit.IOsForTasking.Set(5);
         C := MicroBit.IOsForTasking.Set(6);
         R := MicroBit.IOsForTasking.Set(7);
      end loop;
   end ReadSensors;

   Task body Drive is
   begin
      loop
         readPot := MicroBit.IOsForTasking.Analog(4);
         MicroBit.IOsForTasking.Write(10, readPot);
      end loop;
   end Drive;

   Task body TurnRight is
   begin
      while L = False and C = False and R = True loop
         x := LeftTurn(x);
      end loop;
      x := CorrectDirection(x);
   end TurnRight;

   Task body TurnLeft is
   begin
      while L = True and C = False and R = False loop
         x := RightTurn(x);
      end loop;
      x := CorrectDirection(x);
   end TurnLeft;
end brain;
