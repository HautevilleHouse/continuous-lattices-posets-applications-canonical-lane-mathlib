import ContinuousLatticesPosetsApplicationsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsCanonicalLaneLean

structure ContinuousLatticeStructure where
  carrier : Type u
  partialOrder : PartialOrder carrier
  directedSup : (Set carrier) → carrier
  continuity : directedSup preserves directed joins

def ContinuousLatticeStructureClosed (L : ContinuousLatticeStructure) : Prop :=
  L.continuity

theorem continuous_lattice_structure_closed (L : ContinuousLatticeStructure) :
    ContinuousLatticeStructureClosed L := by
  exact L.continuity

end ContinuousLatticesPosetsApplicationsCanonicalLaneLean
end HautevilleHouse