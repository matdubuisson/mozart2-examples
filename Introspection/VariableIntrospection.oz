functor
import
  System
  Introspection at 'x-oz://boot/Introspection'
define
  {System.showInfo "Bound variables count: "#{Introspection.getBoundVariablesCount $}}
  {System.showInfo "Unbound variables count: "#{Introspection.getUnBoundVariablesCount $}}
  {System.showInfo "Variables count: "#{Introspection.getVariablesCount $}}
end