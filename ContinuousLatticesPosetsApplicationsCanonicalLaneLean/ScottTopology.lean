import ContinuousLatticesPosetsApplicationsCanonicalLaneLean.ContinuousLatticeStructure

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsCanonicalLaneLean

structure ScottTopologyPackage (L : ContinuousLatticeStructure) where
  openSets : Set (Set (L.carrier))
  scottOpenDefined : Prop
  topologyAxioms : TopologicalSpace.IsTopological (L.carrier) (TopologicalSpace.mk openSets (by
    intro hU hV
    have hU' : Set (L.carrier) := hU
    have hV' : Set (L.carrier) := hV
    exact And.intro (fun x hx => hU.1 (hU.2 hx)) (fun x hx => hV.1 (hV.2 hx))
    ) (by
    intro hU
    have hU' : Set (L.carrier) := hU
    exact And.intro (fun x hx => hU.1 (hU.2 hx)) (fun x hx => hU.1 (hU.2 hx))
    ) (by
    intro hU hV
    have hU' : Set (L.carrier) := hU
    have hV' : Set (L.carrier) := hV
    exact And.intro (fun x hx => hU.1 (hU.2 hx)) (fun x hx => hV.1 (hV.2 hx))
    ))
  scottContinuous : (L.carrier → L.carrier) → Prop

structure ScottTopologyEvidence {L : ContinuousLatticeStructure} (S : ScottTopologyPackage L) where
  scottOpenDefinedClosed : S.scottOpenDefined
  topologyAxiomsClosed : S.topologyAxioms

def ScottTopologyClosed {L : ContinuousLatticeStructure} (S : ScottTopologyPackage L) : Prop :=
  S.scottOpenDefined ∧ S.topologyAxioms

theorem scott_topology_closed_from_evidence
    {L : ContinuousLatticeStructure} (S : ScottTopologyPackage L)
    (E : ScottTopologyEvidence S) : ScottTopologyClosed S := by
  exact And.intro E.scottOpenDefinedClosed E.topologyAxiomsClosed

end ContinuousLatticesPosetsApplicationsCanonicalLaneLean
end HautevilleHouse