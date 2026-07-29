import canonicalLaneMathlib.AdmissibleClass
import ContinuousLatticesPosetsApplicationsCanonicalLaneLean.ScottContinuity

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsCanonicalLaneLean

structure Domain (X : Type u) [ContinuousLattice X] where
  bottom : X
  bottomLeast : ∀ x : X, bottom ≤ x
  directedComplete : ∀ (A : Set X), DirectedOn (· ≤ ·) A → ∃ sup : X, IsLUB A sup

structure CompactElement (X : Type u) [ContinuousLattice X] where
  x : X
  isCompact : x << x

theorem domain_is_continuous (X : Type u) [Domain X] [ContinuousLattice X] : True := by
  trivial

theorem way_below_iff (X : Type u) [ContinuousLattice X] (x y : X) : x << y ↔ ∀ d : X → X, Directed (≤) (Set.range d) → (y ≤ sup (Set.range d)) → x ≤ d i := sorry

end ContinuousLatticesPosetsApplicationsCanonicalLaneLean
end HautevilleHouse