import ContinuousLatticesPosetsApplicationsCanonicalLaneLean.ContinuousLatticeStructure

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsCanonicalLaneLean

structure WayBelowRelationPackage (L : ContinuousLatticeStructure) where
  wayBelow : L.carrier → L.carrier → Prop
  approximationProperty : Prop

structure WayBelowRelationEvidence {L : ContinuousLatticeStructure} (W : WayBelowRelationPackage L) where
  approximationPropertyClosed : W.approximationProperty

def WayBelowRelationClosed {L : ContinuousLatticeStructure} (W : WayBelowRelationPackage L) : Prop :=
  W.approximationProperty

theorem way_below_relation_closed_from_evidence
    {L : ContinuousLatticeStructure} (W : WayBelowRelationPackage L)
    (E : WayBelowRelationEvidence W) : WayBelowRelationClosed W := by
  exact E.approximationPropertyClosed

end ContinuousLatticesPosetsApplicationsCanonicalLaneLean
end HautevilleHouse