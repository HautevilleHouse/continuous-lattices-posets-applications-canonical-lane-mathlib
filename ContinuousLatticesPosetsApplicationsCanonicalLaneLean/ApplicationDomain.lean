import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsCanonicalLaneLean

/-- An application domain is a continuous lattice equipped with a notion of approximation and a Scott topology. -/
structure ApplicationDomain where
  lattice : ContinuousLattice
  way_below : lattice.carrier → lattice.carrier → Prop
  approximating : ∀ a : lattice.carrier, ∃ (D : Set lattice.carrier), DirectedOn (fun x y => lattice.le x y) D ∧
    (∀ d ∈ D, way_below d a) ∧ a = lattice.sup D
  scott_open : Set lattice.carrier → Prop
  scott_topology_axioms : ∀ (U : Set lattice.carrier), scott_open U ↔ (IsUpperSet U ∧ ∀ (D : Set lattice.carrier) (hD : DirectedOn (fun x y => lattice.le x y) D),
    (lattice.sup D) ∈ U → ∃ d ∈ D, d ∈ U)

theorem way_below_implies_le (A : ApplicationDomain) (x y : A.lattice.carrier) (h : A.way_below x y) : A.lattice.le x y := by
  have h' : A.lattice.way_below x y := h
  exact A.lattice.way_below_le x y h'

end ContinuousLatticesPosetsApplicationsCanonicalLaneLean
end HautevilleHouse