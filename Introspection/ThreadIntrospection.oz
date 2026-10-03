functor
import
  System
  Introspection at 'x-oz://boot/Introspection'
define
  W X Y Z 

  thread
    {Wait W}
    X = 1
  end

  thread
    {Wait W}
    Y = 1
  end

  proc {DisplayThreads}
    Ids = {Introspection.getThreadIds 0 1000 $}

    proc {ForEachThread Threads}
      case Threads of nil then skip
      [] Th|NextThreads then
        {System.printInfo "\t=> Thread "#{Thread.getId Th $}#": "}
        {System.show {Introspection.getThreadState Th $}}
        {ForEachThread NextThreads}
      end
    end
  in
    {System.showInfo "There are "#{List.length Ids $}#" threads: "}
    {System.show Ids}

    if {List.length Ids $} > 0 then
      FirstThread = {Introspection.getThread Ids.1 $}
    in
      {System.showInfo "First thread status: "}
      {System.show {Introspection.getThreadStatus FirstThread $}}
    end

    {System.showInfo "Active threads count: "#{Introspection.getActiveThreadsCount $}}
    {System.showInfo "Passive threads count: "#{Introspection.getPassiveThreadsCount $}}
    {System.showInfo "Threads count: "#{Introspection.getThreadsCount $}}

    {ForEachThread {Introspection.getThreads 0 1000 $}}
  end
in
  {DisplayThreads}
  W = 1
  Z = X + Y
  {Wait Z}
  {System.show Z}
  {DisplayThreads}
end