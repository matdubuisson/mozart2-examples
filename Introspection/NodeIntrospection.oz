functor
import
  System
  Introspection at 'x-oz://boot/Introspection'
define
  proc {DisplayNodesCounts}
    ThisThread = {Thread.this $}
  in
    {System.showInfo "Nodes count: "#{Introspection.getNodesCount $}}
    {System.showInfo "Variable Nodes count: "#{Introspection.getVariableNodesCount $}}
    {System.showInfo "Value Nodes count: "#{Introspection.getValueNodesCount $}}
    {System.showInfo "Structural Nodes count: "#{Introspection.getStructuralNodesCount $}}
    {System.showInfo "Token Nodes count: "#{Introspection.getTokenNodesCount $}}
    {System.showInfo "X Nodes count: "#{Introspection.getXNodesCount $}}
    {System.showInfo "Y Nodes count: "#{Introspection.getYNodesCount $}}
    {System.showInfo "G Nodes count: "#{Introspection.getGNodesCount $}}
    {System.showInfo "K Nodes count: "#{Introspection.getKNodesCount $}}
    {System.showInfo "Stable Nodes count: "#{Introspection.getStableNodesCount $}}
    {System.showInfo "Unstable Nodes count: "#{Introspection.getUnstableNodesCount $}}
    {System.showInfo "Stack depth (sum for all threads): "#{Introspection.getStackDepth $}}

    {System.printInfo "As a record: "}
    {System.show {Introspection.getNodesCounts $}}
    
    {System.showInfo "Specific at the current thread...."}
    {System.showInfo "Nodes count: "#{Introspection.getThreadNodesCount ThisThread $}}
    {System.showInfo "Variable Nodes count: "#{Introspection.getThreadVariableNodesCount ThisThread $}}
    {System.showInfo "Value Nodes count: "#{Introspection.getThreadValueNodesCount ThisThread $}}
    {System.showInfo "Structural Nodes count: "#{Introspection.getThreadStructuralNodesCount ThisThread $}}
    {System.showInfo "Token Nodes count: "#{Introspection.getThreadTokenNodesCount ThisThread $}}
    {System.showInfo "X Nodes count: "#{Introspection.getThreadXNodesCount ThisThread $}}
    {System.showInfo "Y Nodes count: "#{Introspection.getThreadYNodesCount ThisThread $}}
    {System.showInfo "G Nodes count: "#{Introspection.getThreadGNodesCount ThisThread $}}
    {System.showInfo "K Nodes count: "#{Introspection.getThreadKNodesCount ThisThread $}}
    {System.showInfo "Stable Nodes count: "#{Introspection.getThreadStableNodesCount ThisThread $}}
    {System.showInfo "Unstable Nodes count: "#{Introspection.getThreadUnstableNodesCount ThisThread $}}
    {System.showInfo "Stack depth: "#{Introspection.getThreadStackDepth ThisThread $}}

    % Plus more methods about registers and getters for their nodes but not referenced as they are meant to be used by the debugger only
  end
in
  {DisplayNodesCounts}
end