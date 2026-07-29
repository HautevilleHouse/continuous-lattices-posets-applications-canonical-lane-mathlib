import ContinuousLatticesPosetsApplicationsCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ContinuousLatticeSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ContinuousLatticeAdmittedObject where
  space : ContinuousLatticeSpace
  completeLattice : Prop
  continuousLattice : Prop
  wayBelowModel : Type
  wayBelowTopology : TopologicalSpace wayBelowModel
  scottOpenSets : Prop
  conclusion : scottOpenSets

structure ContinuousLatticeEndgameState where
  object : ContinuousLatticeAdmittedObject

def ContinuousLatticeWitnessClosed (O : ContinuousLatticeAdmittedObject) : Prop :=
  O.scottOpenSets

end ContinuousLatticesPosetsApplicationsCanonicalLaneLean
end HautevilleHouse