import canonicalLaneMathlib.AdmissibleClass
import ContinuousLatticesPosetsApplicationsCanonicalLaneLean.ContinuousLatticeStructure

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsCanonicalLaneLean

def ScottOpen (X : Type u) [ContinuousLattice X] (U : Set X) : Prop :=
  IsUpperSet U ∧ ∀ (d : X → X), Directed (≤) (Set.range d) → (∀ x, x ∈ U → ∃ i, d i ∈ U)

theorem scott_open_is_open (X : Type u) [ContinuousLattice X] (U : Set X) (hU : ScottOpen X U) : IsOpen U := by
  rcases hU with ⟨hUpper, hLimit⟩
  rw [isOpen_scott_iff]
  exact hU

structure ScottContinuousFunction (X Y : Type u) [ContinuousLattice X] [ContinuousLattice Y] where
  f : X → Y
  preservesDirectedSup : ∀ (A : Set X), DirectedOn (· ≤ ·) A → f (sup A) = sup (f '' A)

theorem scott_continuous_iff (X Y : Type u) [ContinuousLattice X] [ContinuousLattice Y] (f : X → Y) :
    ScottContinuousFunction X Y := by
  have h : ∀ (A : Set X), DirectedOn (· ≤ ·) A → f (sup A) = sup (f '' A) := by
    intro A hA
    apply scottContinuous_iff.mp ?_
    exact hA
  exact { f := f, preservesDirectedSup := h }

end ContinuousLatticesPosetsApplicationsCanonicalLaneLean
end HautevilleHouse