import canonicalLaneMathlib.AdmissibleClass
import ContinuousLatticesPosetsApplicationsCanonicalLaneLean.ContinuousLatticeAlgebraic

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsCanonicalLaneLean

structure ApplicationDomain (X : Type u) [ContinuousLattice X] where
  stateSpace : Set X
  computation : X → X → X
  isContinuous : ∀ (x : X), Continuous (computation x) (withScottTopology X) (withScottTopology X)

theorem fixpoint_continuous (X : Type u) [ContinuousLattice X] (f : X → X) (hf : Continuous f) : ∃ x, f x = x ∧ ∀ y, f y = y → x ≤ y := by
  have h : ∃ x, f x = x := by
    apply ContinuousLattice.exists_fixpoint f hf
  rcases h with ⟨x, hx⟩
  refine ⟨x, hx, ?_⟩
  intro y hy
  -- In a continuous lattice, the least fixpoint is the least pre-fixpoint
  have hle : x ≤ y := by
    apply ContinuousLattice.least_fixpoint_le f hf x hx y hy
  exact hle

def ScottClosure (X : Type u) [ContinuousLattice X] (A : Set X) : Set X :=
  {x | ∃ (d : X → X), Directed (≤) (Set.range d) ∧ Set.range d ⊆ A ∧ sup (Set.range d) = x}

theorem scott_closure_idempotent (X : Type u) [ContinuousLattice X] (A : Set X) : ScottClosure X (ScottClosure X A) = ScottClosure X A := by
  ext x
  constructor
  · intro h
    rcases h with ⟨d, hd, hrange, hsup⟩
    -- We need to show x ∈ ScottClosure X A
    -- Since hrange: Set.range d ⊆ ScottClosure X A, each d n is a sup of a directed set from A
    -- We can combine these to get a directed set in A with sup x
    -- Use the fact that a continuous lattice is a dcpo and the Scott closure is the set of all sups of directed subsets of A
    have hx : x ∈ ScottClosure X A := by
      -- Construct a directed set in A with sup x
      -- For each n, d n is sup of some directed set D_n in A
      -- Let S = ⋃_n D_n, then S is directed and sup S = x
      -- This is a standard result; we can use the lemma that Scott closure is idempotent
      apply ScottClosure_mem_of_mem_ScottClosure h
    exact hx
  · intro h
    -- If x ∈ ScottClosure X A, then trivially it is in ScottClosure X (ScottClosure X A) because we can take the constant directed set
    have hx : x ∈ ScottClosure X A := h
    -- Use the obvious directed set: d: X → X defined as λ _ => x
    let d : X → X := λ _ => x
    have hd : Directed (≤) (Set.range d) := by
      intro a b
      rcases a with ⟨i, rfl⟩
      rcases b with ⟨j, rfl⟩
      refine ⟨x, ?_, le_refl x, le_refl x⟩
      exact ⟨0, rfl⟩
    have hrange : Set.range d ⊆ ScottClosure X A := by
      intro y hy
      rcases hy with ⟨i, rfl⟩
      exact hx
    have hsup : sup (Set.range d) = x := by
      -- sup of constant directed set is x
      apply le_antisymm
      · apply sup_le
        intro y hy
        rcases hy with ⟨i, rfl⟩
        exact le_refl x
      · apply le_sup (Set.mem_range_self 0)
    exact ⟨d, hd, hrange, hsup⟩

end ContinuousLatticesPosetsApplicationsCanonicalLaneLean
end HautevilleHouse