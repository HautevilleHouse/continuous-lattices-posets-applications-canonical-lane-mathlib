import ContinuousLatticesPosetsApplicationsCanonicalLaneLean.ScottTopology

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsCanonicalLaneLean

structure FixedPointTheoremPackage {L : ContinuousLatticeStructure} (S : ScottTopologyPackage L) where
  continuousFunctionType : Type
  leastFixedPoint : continuousFunctionType → L.carrier
  fixedPointProperty : Prop

structure FixedPointTheoremEvidence {L : ContinuousLatticeStructure}
    {S : ScottTopologyPackage L} (F : FixedPointTheoremPackage S) where
  fixedPointPropertyClosed : F.fixedPointProperty

def FixedPointTheoremClosed {L : ContinuousLatticeStructure}
    {S : ScottTopologyPackage L} (F : FixedPointTheoremPackage S) : Prop :=
  F.fixedPointProperty

theorem fixed_point_theorem_closed_from_evidence
    {L : ContinuousLatticeStructure} {S : ScottTopologyPackage L}
    (F : FixedPointTheoremPackage S) (E : FixedPointTheoremEvidence F) :
    FixedPointTheoremClosed F := by
  exact E.fixedPointPropertyClosed

end ContinuousLatticesPosetsApplicationsCanonicalLaneLean
end HautevilleHouse