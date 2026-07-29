import canonicalLaneMathlib.AdmissibleClass
import ContinuousLatticesPosetsApplicationsCanonicalLaneLean.DomainTheory

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsCanonicalLaneLean

structure AlgebraicLattice (X : Type u) [ContinuousLattice X] where
  compactBasis : Set X
  isBasis : ∀ x : X, x = sup {c ∈ compactBasis | c ≤ x}
  compactCondition : ∀ (c : X), c ∈ compactBasis → c << c

theorem algebraic_lattice_is_continuous (X : Type u) [AlgebraicLattice X] : ContinuousLattice X := by
  infer_instance

structure LatticeWithScottTopology (X : Type u) [ContinuousLattice X] where
  carrier : X
  topology : TopologicalSpace X := inferInstance
  scottCondition : IsOpen (Set.Ici carrier) ↔ ScottOpen X (Set.Ici carrier) := by
    refine ⟨?_, ?_⟩
    · intro h
      exact scottOpen_of_isOpen h
    · intro h
      exact isOpen_of_scottOpen h

end ContinuousLatticesPosetsApplicationsCanonicalLaneLean
end HautevilleHouse