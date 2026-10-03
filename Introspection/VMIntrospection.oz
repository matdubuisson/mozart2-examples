functor
import
  System
  Introspection at 'x-oz://boot/Introspection'
define
  proc {DisplayVMStatus}
    {System.showInfo "Schedules count: "#{Introspection.getSchedulesCount $}}
    {System.showInfo "Operations count: "#{Introspection.getOperationsCount $}}
    {System.showInfo "Schedules count (executed by system threads): "#{Introspection.getSystemSchedulesCount $}}
    {System.showInfo "Operations count (executed by system threads): "#{Introspection.getSystemOperationsCount $}}
    {System.showInfo "GC Schedules count: "#{Introspection.getGCSchedulesCount $}}

    local
      NextThread = {Introspection.getNextScheduledThread false $}
      NextSystemThread = {Introspection.getNextScheduledThread true $}
    in
      if NextThread == none then
        {System.showInfo "No next thread"}
      else
        {System.showInfo "Next scheduled thread is: "#{Thread.getId NextThread $}}
      end

      if NextSystemThread == none then
        {System.showInfo "No next system thread"}
      else
        {System.showInfo "Next system scheduled thread is: "#{Thread.getId NextSystemThread $}}
      end
    end

    local
      NextOperationExecutedByNextThread = {Introspection.getNextOperation false $}
      NextOperationExecutedByNextSystemThread = {Introspection.getNextOperation true $}
    in
      {System.showInfo "Next operation executed by next thread: "}
      {System.show NextOperationExecutedByNextThread}
      {System.showInfo "Next operation executed by next system thread: "}
      {System.show NextOperationExecutedByNextSystemThread}
    end
  end

  fun {DoStuff I N Acc}
    if I < N then
      thread {DoStuff I+1 N Acc+1} end
    else Acc end
  end
in
  {DisplayVMStatus}
  local Res = {DoStuff 0 8 0} in
    {Wait Res}
    {System.show Res}
    {DisplayVMStatus}
  end
end